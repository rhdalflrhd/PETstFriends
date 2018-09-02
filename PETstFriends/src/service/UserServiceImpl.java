package service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import dao.QnADao;
import dao.UserDao;
import model.Pet;
import model.QnA;
import model.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDao udao;
	
	@Autowired
	private QnADao qdao;
	
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

		System.out.println(udao.insertUser(user)+"udao.insertUser(user)");
		udao.insertUser(user);

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
				udao.insertPet(pet);
			}
		}
		return true;
	}
	@Override
	public boolean joinNaverUser(HashMap<String, Object> params) {
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
		user.setUser_havePet(Integer.parseInt(String.valueOf(params.get("user_havePet"))));
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
		if(udao.selectUserbyNn(user_nickname) == null)
			return true;
		else 
			return false;
	}

	@Override
	public boolean getUserbyId(String user_id) {
		// TODO Auto-generated method stub
		if(udao.selectUserbyId(user_id) ==null) {
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
			HashMap<String, Object> params = new HashMap<String, Object>();
			params.put("user_id", user_id);
			if(stopdate==1) {
				params.put("stopdate", 1);//취소
			}else {
				params.put("stopdate", 0);//정지
			}
			return udao.updateUser(params);
		}
		@Override
		public boolean loginUser(String user_id, String user_pass) {
			// TODO Auto-generated method stub
			if (udao.selectUserbyId(user_id) != null && udao.selectUserbyId(user_id).getUser_pass().equals(user_pass)) {
				System.out.println("로그인유저서비스");
				return true;
			} else
				return false;
		}

		@Override

		public String getUserFindbyId(HashMap<String, Object> params) {
			// TODO Auto-generated method stub
		
			
			String user_name = (String) params.get("user_name");
			String user_email = (String) params.get("user_email");
			
			return udao.selectUserFindId(params);
		}

		@Override
		public boolean getUserFindbyPw(HashMap<String, Object> params) {
			// TODO Auto-generated method stub
			if(  udao.selectUserFindPw(params) == null)
			return false;
			else
				return true;
					
		}
		@Override
		public boolean getUserbyEmail(String user_email) {
			// TODO Auto-generated method stub
			if (udao.selectUserbyEmail(user_email) == null) {
				return true;
			} else
				return false;
		}

		@Override
		public boolean getUserbyName(String user_name) {
			if (udao.selectUserbyName(user_name) == null) {
				return true;
			} else
				return false;
		}

		@Override
		public int updateUser_pass(HashMap<String, Object> params) {
			// TODO Auto-generated method stub
		
			return udao.updateUser_pass(params );
		}
		
		
		//소현

		@Override
		public boolean getUserPass(String user_pass) {   // 유저 비밀번호 체크 

			if (udao.selectUserPw(user_pass) == null) {
				return true;
			} else
				return false;
		}

//		@Override
//		public HashMap<String, Object> infoForUpdate(int user_no) {      // 회원이랑 펫 정보 보여주기 
//			// TODO Auto-generated method stub
//			return udao.infoForUpdate(user_no);
//		}

		@Override
		public HashMap<String, Object> selectUser(String user_id) {   // 회원 한명 찾아오기 
			// TODO Auto-generated method stub
			return udao.selectOne(user_id);
		}

		@Override
		public int updateUser(HashMap<String, Object> params) {   // 회원수정하기 
			String user_id = (String) params.get("user_id");
			// int a = Integer.parseInt((String)params.get("user_havePet"));
			// params.put("user_havePet", a);
			return udao.updateUser(params);

		}

		@Override
		public List<Pet> selectPetAll(String user_id) {  // 펫 리스트 뽑아오기 

			return udao.selectPetAll(user_id);

		}

		@Override
		public boolean updatePet(HashMap<String, Object> params) {   // 펫 수정하기 

			String jsonStr = (String) params.get("jsonData");

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(jsonStr);

			JsonArray jArray = element.getAsJsonArray();
			JsonObject jOb = new JsonObject();
			User user = new User();
			Pet pet = new Pet();
			user = (User) params.get("user");
			for (int i = 0; i < jArray.size(); i++) {

				jOb = jArray.get(i).getAsJsonObject();
				if (jOb.get("pet_no").getAsInt() != 0) {
					pet.setPet_no(jOb.get("pet_no").getAsInt());
					pet.setPet_name(jOb.get("pet_name").getAsString());
					pet.setUser_id((String) (params.get("user_id")));
					pet.setPet_gender(jOb.get("pet_gender").getAsInt());
					pet.setPet_species(jOb.get("pet_species").getAsString());
					pet.setPet_age(jOb.get("pet_age").getAsInt());
					pet.setPet_file(jOb.get("pet_file").getAsString());

					udao.updatePet(pet);
				}

			}
			return true;

		}

		@Override
		public boolean insertPet(HashMap<String, Object> params) {  // 펫 추가하기 
			String jsonStr = (String) params.get("jsonData");

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(jsonStr);

			JsonArray jArray = element.getAsJsonArray();
			JsonObject jOb = new JsonObject();
			User user = new User();
			Pet pet = new Pet();
			user = (User) params.get("user");
			for (int i = 0; i < jArray.size(); i++) {

				jOb = jArray.get(i).getAsJsonObject();

				if (jOb.get("pet_no").getAsInt() == 0) {

					pet.setUser_id((String) (params.get("user_id")));

					pet.setPet_name(jOb.get("pet_name").getAsString());
					pet.setPet_gender(jOb.get("pet_gender").getAsInt());
					pet.setPet_species(jOb.get("pet_species").getAsString());
					pet.setPet_age(jOb.get("pet_age").getAsInt());
					pet.setPet_file(jOb.get("pet_file").getAsString());

					udao.insertPet(pet);

				}

			}
			return true;
		}

		@Override
		public boolean deleteUser(String user_id, String user_pass) { // 회원삭제 

			String user_passch = (String) udao.selectOne(user_id).get("user_pass");

			if (user_pass.equals(user_passch)) {
				udao.deleteUser(user_id, user_pass);
				return true;
			} else
				return false;
		}

		@Override
		public void deletePet(String pet_name) {  //펫 삭제 

			udao.deletePet(pet_name);

		}

		@Override
		public int getStartPage(int page) {
			// TODO Auto-generated method stub
			return (page - 1) / 10 * 10 + 1;
		}

		@Override
		public int getEndPage(int page) {
			// TODO Auto-generated method stub
			return ((page - 1) / 10 + 1) * 10;
		}

		@Override
		public int getMyWriteLastPage(String user_id) {
			// TODO Auto-generated method stub
			return (udao.getWriteCount(user_id) - 1) / 10 + 1;
		}

		@Override
		public int getSkip(int page) {
			// TODO Auto-generated method stub
			return (page - 1) * 10;
		}

		@Override
		public int getMyInquiryLastPage(String user_id) {
			// TODO Auto-generated method stub
			return (qdao.getMyQnACount(user_id) - 1) / 10 + 1;
		}

		@Override
		public int getMyMeetingLastPage(String user_id) {
			// TODO Auto-generated method stub
			return (udao.getMymeetingCount(user_id) - 1) / 10 + 1;
		}

		@Override
		public int getMyLikesLastPage(String user_id) {
			// TODO Auto-generated method stub
			return (udao.getLikesCount(user_id) - 1) / 10 + 1;
		}

		@Override
		public HashMap<String, Object> myInquiry(HashMap<String, Object> params, String user_id, int page) {  // 내가 쓴 문의글 

			HashMap<String, Object> result = new HashMap<String, Object>();

			int getEndPage = getEndPage(page);
			int getLastPage = getMyInquiryLastPage("sohyun");

			if (getEndPage >= getLastPage)
				result.put("end", getMyInquiryLastPage("sohyun"));
			else
				result.put("end", getEndPage(page));

			result.put("current", page);
			result.put("start", getStartPage(page));
			result.put("last", getMyInquiryLastPage("sohyun"));

			params.put("skip", getSkip(page));
			params.put("qty", 10);
			params.put("qnA_userId", "sohyun");

			// System.out.println("겟카운트:" + tipDao.getCount(params));
			int size = qdao.getMyQnACount("sohyun");

			result.put("qnaList", qdao.myInquiry(params));

			result.put("qna", size);

			return result;

		}

		@Override
		public QnA viewmyInquiry(int qnA_boardno) {  // 내가 쓴 문의글에서 제목 클릭시 해당 게시글 보여주기 
			return qdao.viewmyInquiry(qnA_boardno);

		}

		@Override
		public HashMap<String, Object> myWrites(String user_id, int page, HashMap<String, Object> params) {  // 내가 쓴 게시글 
			HashMap<String, Object> result = new HashMap<String, Object>();

			int getEndPage = getEndPage(page);
			int getLastPage = getMyWriteLastPage("sohyun");

			if (getEndPage >= getLastPage)
				result.put("end", getMyWriteLastPage("sohyun"));
			else
				result.put("end", getEndPage(page));

			result.put("current", page);
			result.put("start", getStartPage(page));
			result.put("last", getMyWriteLastPage("sohyun"));

			params.put("skip", getSkip(page));
			params.put("qty", 10);
			params.put("user_id", "sohyun");

			int size = udao.getWriteCount("sohyun");

			result.put("myWriteList", udao.selectmyWrite(params));
			result.put("myWrite", size);

			return result;
		}

		@Override
		public HashMap<String, Object> selectmyLikes(HashMap<String, Object> params, String user_id, int page) { // 내가 좋아요한 글 
			HashMap<String, Object> result = new HashMap<String, Object>();

			int getEndPage = getEndPage(page);
			int getLastPage = getMyLikesLastPage("sohyun");

			if (getEndPage >= getLastPage)
				result.put("end", getMyLikesLastPage("sohyun"));
			else
				result.put("end", getEndPage(page));

			result.put("current", page);
			result.put("start", getStartPage(page));
			result.put("last", getMyLikesLastPage("sohyun"));

			params.put("skip", getSkip(page));
			params.put("qty", 10);
			params.put("user_id", "sohyun");

			int size = udao.getLikesCount("sohyun");

			result.put("myLikesList", udao.selectmyLikes(params));
			result.put("myWrite", size);

			return result;
		}

		@Override
		public HashMap<String, Object> selectMyMeetingApply(HashMap<String, Object> params, String user_id, int page) { // 내가 참여한 모임 
			HashMap<String, Object> result = new HashMap<String, Object>();

			int getEndPage = getEndPage(page);
			int getLastPage = getMyMeetingLastPage("sohyun");

			if (getEndPage >= getLastPage)
				result.put("end", getMyMeetingLastPage("sohyun"));
			else
				result.put("end", getEndPage(page));

			result.put("current", page);
			result.put("start", getStartPage(page));
			result.put("last", getMyMeetingLastPage("sohyun"));

			params.put("skip", getSkip(page));
			params.put("qty", 10);
			params.put("user_id", "sohyun");

			int size = udao.getMymeetingCount("sohyun");

			result.put("myMeetingApplyList", udao.selectMyMeetingApply(params));
			result.put("myWrite", size);
	  
			return result;
		}
		@Override
		public HashMap<String, Object> selectUserPet(String user_id) {
			// TODO Auto-generated method stub
			return null;
		}
	
}