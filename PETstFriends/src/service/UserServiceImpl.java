package service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import dao.UserDao;
import model.Pet;
import model.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDao udao;
	
	

	@Override
	public boolean joinUser(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		String jsonStr = (String) params.get("jsonData");
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(jsonStr);
		JsonArray jArray = element.getAsJsonArray();
		JsonObject jOb = new JsonObject();
		User user = new User();
		user = (User) params.get("user");
		
		for (int i = 0; i < jArray.size(); i++) {
			jOb = jArray.get(i).getAsJsonObject();
			if (!(jOb.get("pet_name").getAsString().equals(""))) {
				Pet pet = new Pet();
				pet.setUser_id(user.getUser_id());
				pet.setPet_name(jOb.get("pet_name").getAsString());
				pet.setPet_gender(jOb.get("pet_gender").getAsInt());
				pet.setPet_species(jOb.get("pet_species").getAsString());
				pet.setPet_age(jOb.get("pet_age").getAsInt());
				pet.setPet_file(jOb.get("pet_file").getAsString());
			//펫 테이블에 insertSerive부르기
				udao.insertPet(pet);
			}
		}
		
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");

		user.setUser_adminCheck(0);
		user.setUser_havePet(Integer.parseInt((String) params.get("user_havePet")));
		user.setUser_joinDate(simple.format(new Date()));
		user.setUser_nickname((String) params.get("user_nickname"));
		user.setUser_pass("123");
		user.setUser_phone((String) params.get("user_phone"));
		user.setUser_score(0);
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.add(Calendar.DAY_OF_YEAR, -1);
		user.setUser_state(0);
		user.setUser_pan_date(simple.format(cal.getTime()));
		udao.insertUser(user);
	
		return true;
	}

	@Override
	public boolean getUserbyNn(String user_nickname) {
		// TODO Auto-generated method stub
		if(udao.selectUserNn(user_nickname) == null)
			return true;
		else 
			return false;
	}

	@Override
	public boolean getUserbyId(String user_id) {
		// TODO Auto-generated method stub
		if(udao.selectUserId(user_id) ==null) {
			return true;
	}
		else
			return false;
	}

	@Override
	public HashMap<String, Object> showUserList(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		int page = Integer.parseInt(String.valueOf(params.get("page")));
		int numb = Integer.parseInt(String.valueOf(params.get("numb")));
		String keyword = String.valueOf(params.get("keyword"));
		int skip = getSkip(page, numb);
		params.put("userList", udao.selectUserAll(params));
		params.put("current", page);
		params.put("start", getStartPage(page, numb));
		if(getEndPage(page, numb)<=getLastPage(keyword, numb)) {
		params.put("end", getEndPage(page, numb));
		}else {
		params.put("end", getLastPage(keyword,numb));
		}
		params.put("last", getLastPage(keyword,numb));
		return null;
	}
	
	public int getStartPage(int page, int numb) { //시작페이지
		return (page- 1) / numb * numb + 1;
	}
		public int getEndPage(int page, int numb) { //10단위로
		return ((page-1) / numb + 1) * numb;
		}
		public int getLastPage(String keyword, int numb) {//목록의 끝 번호
		return (udao.getCount(keyword) - 1 ) / numb + 1;}
		
		public int getSkip(int page, int numb) {//앞에 지나간 갯수
		return (page - 1) * numb;
		}

		@Override
		public int stopUser(String user_id, int stopdate) {
			// TODO Auto-generated method stub
			User user = udao.selectUserId(user_id);
			if(stopdate==1) {
				user.setUser_state(1);//취소
			}else {
				user.setUser_state(0);//정지
			}
			return udao.updateUser(user);
		}


	
}