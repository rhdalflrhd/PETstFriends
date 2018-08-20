package service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Locale;

import org.apache.tomcat.util.security.MD5Encoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.mysql.fabric.xmlrpc.base.Value;

import dao.FreeBoardDao;
import dao.UserDao;

import model.Pet;
import model.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao uDao;

	@Override
	public boolean joinUser(HashMap<String, Object> params) {

		// user
		String user_id = (String) params.get("user_id");
		String user_pass = (String) params.get("user_pass");
		
		User user = new User();

		user.setUser_id(user_id);
		user.setUser_name((String) params.get("user_name"));
		user.setUser_nickname((String) params.get("user_nickname"));
		user.setUser_email((String) params.get("user_email"));
		user.setUser_phone((String) params.get("user_phone"));
		user.setUser_phone((String) params.get("user_proPic"));
		user.setUser_pass(user_pass);

		SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd");
		user.setUser_joinDate(sim.format(new Date()));
		user.setUser_adminCheck(0); // 0=일반 1=관리자
		user.setUser_score(0); // 회원가입하자마자 점수는 0점
		
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.setTime(new java.util.Date());
		cal.add(Calendar.DAY_OF_YEAR, -1);

		String strDate = sim.format(cal.getTime());
		user.setUser_pan_date(strDate);
		user.setUser_state(0); // 0=정상 1=정지

		user.setUser_havePet(Integer.parseInt((String) params.get("user_havePet")));

		uDao.insertUser(user);

		// pet
		
		String jsonStr = (String) params.get("jsonData");
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(jsonStr);
		JsonArray jArray = element.getAsJsonArray();
		JsonObject jOb = new JsonObject();

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
				uDao.insertPet(pet);
			}
		}
		
		
		
//		if (user.getUser_havePet() == 1) {
//			Pet pet = new Pet();
//			pet.setUser_id((String) params.get("user_id"));
//			pet.setPet_name((String) params.get("pet_name"));
//			pet.setPet_species(Integer.parseInt((String) params.get("pet_species")));
//			pet.setPet_gender(Integer.parseInt((String) params.get("pet_gender")));
//			pet.setPet_age(Integer.parseInt((String) params.get("pet_age")));
//			pet.setPet_file((String) params.get("pet_file"));
//			uDao.insertPet(pet);
//
//		}
		return true;
	}

	@Override
	public boolean loginUser(String user_id, String user_pass) {
		// TODO Auto-generated method stub
		if (uDao.selectUserbyId(user_id) != null && uDao.selectUserbyId(user_id).getUser_pass().equals(user_pass)) {
			System.out.println("로그인유저서비스");
			return true;
		} else
			return false;
	}

	@Override

	public boolean getUserFindbyId(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
	
		String user_name = (String) params.get("user_name");
		String user_email = (String) params.get("user_email");
		
		return uDao.selectUserFindId(params);
	}

	@Override
	public User getUserFindbyPw(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		String user_id = (String) params.get("user_id");
		String user_name = (String) params.get("user_name");
		String user_email = (String) params.get("user_email");
		
		return uDao.selectUserFindPw(params);
	}

	@Override
	public boolean getUserbyId(String user_id) {
		// TODO Auto-generated method stub
		if (uDao.selectUserbyId(user_id) == null)
			return true;
		else
			return false;
	}

	@Override
	public boolean getUserbyNn(String user_nickname) {
		// TODO Auto-generated method stub
		if (uDao.selectUserbyNn(user_nickname) == null)
			return true;
		else
			return false;

	}

	@Override
	public boolean getUserbyEmail(String user_email) {
		// TODO Auto-generated method stub
		if (uDao.selectUserbyEmail(user_email) == null) {
			return true;
		} else
			return false;
	}


}// 서비스
