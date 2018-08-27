package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import dao.QnADao;
import dao.UserDao;
import model.MeetingBoard;
import model.Pet;
import model.QnA;
import model.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao udao;
	@Autowired
	private QnADao qdao;

	public HashMap<String, Object> selectUserPet(String user_id) {    

		return udao.selectUserPet(user_id);
	}

	@Override
	public boolean getUserNn(String user_nickname) {   // 유저 닉네임 중복 체크 
		// TODO Auto-generated method stub
		if (udao.selectUserNn(user_nickname) == null)
			return true;
		else
			return false;
	}

	@Override
	public boolean getUserEmail(String user_email) {   // 유저 이메일 중복체크 
		// TODO Auto-generated method stub
		if (udao.selectUserEmail(user_email) == null) {
			return true;
		} else
			return false;
	}

	@Override
	public boolean getUserPass(String user_pass) {   // 유저 비밀번호 체크 

		if (udao.selectUserPw(user_pass) == null) {
			return true;
		} else
			return false;
	}

	@Override
	public HashMap<String, Object> infoForUpdate(int user_no) {      // 회원이랑 펫 정보 보여주기 
		// TODO Auto-generated method stub
		return udao.infoForUpdate(user_no);
	}

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
				pet.setPet_species(jOb.get("pet_species").getAsInt());
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
				pet.setPet_species(jOb.get("pet_species").getAsInt());
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

}
