package service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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

	@Override // 수정함??????????
	public boolean joinUser(MultipartHttpServletRequest multi) {

		// user
		User user = new User();
		user.setUser_id(multi.getParameter("user_id"));
		user.setUser_email(multi.getParameter("user_email"));
		user.setUser_havePet(Integer.parseInt(String.valueOf(multi.getParameter("user_havePet"))));
		user.setUser_name(multi.getParameter("user_name"));
		user.setUser_nickname(multi.getParameter("user_nickname"));
		user.setUser_pass(multi.getParameter("user_pass"));
		user.setUser_phone(multi.getParameter("user_phone"));

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

		// 프로필사진 저장
		String path = "C:/BitCamp/image/";
		String newFileName = ""; // 업로드 되는 파일명

		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}
		Iterator<String> files = multi.getFileNames();
		while (files.hasNext()) {
			String uploadFile = files.next();
			MultipartFile mFile = multi.getFile(uploadFile);
			String fileName = mFile.getOriginalFilename();
			newFileName = System.currentTimeMillis() + "." + fileName.substring(fileName.lastIndexOf(".") + 1);
			user.setUser_proPic(newFileName);
			try {
				if (!(fileName.equals(""))) {
					mFile.transferTo(new File(path + newFileName));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		udao.insertUser(user);
		return true;
	}

	@Override // 수정함???????
	public boolean joinUserPet(HashMap<String, Object> params) {
		// pet

		String jsonStr = (String) params.get("jsonData");
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(jsonStr);
		JsonArray jArray = element.getAsJsonArray();
		JsonObject jOb = new JsonObject();

		for (int i = 0; i < jArray.size(); i++) {
			jOb = jArray.get(i).getAsJsonObject();
			if (!(jOb.get("pet_name").getAsString().equals(""))) {
				Pet pet = new Pet();
				pet.setUser_id((String) params.get("user_id"));
				pet.setPet_name(jOb.get("pet_name").getAsString());
				pet.setPet_gender(jOb.get("pet_gender").getAsInt());
				pet.setPet_species(jOb.get("pet_species").getAsString());
				pet.setPet_age(jOb.get("pet_age").getAsInt());
				pet.setPet_file(jOb.get("pet_file").getAsString());
				// 펫 테이블에 insertSerive부르기
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
				// 펫 테이블에 insertSerive부르기
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
		if (udao.selectUserbyNn(user_nickname) == null)
			return true;
		else
			return false;
	}

	@Override
	public boolean getUserbyId(String user_id) {
		// TODO Auto-generated method stub
		if (udao.selectUserbyId(user_id) == null) {
			return true;
		} else
			return false;
	}

	@Override
	public HashMap<String, Object> showUserList(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		int page = Integer.parseInt(String.valueOf(params.get("page")));
		if (page == 0)
			page = 1;
		int numb = Integer.parseInt(String.valueOf(params.get("numb")));
		if (numb == 0)
			numb = 10;
		int skip = getSkip(page, numb);
		params.put("skip", skip);
		params.put("userList", udao.selectUserAll(params));
		params.put("current", page);
		params.put("start", getStartPage(page, numb));
		if (getEndPage(page, numb) <= getLastPage(params)) {
			params.put("end", getEndPage(page, numb));
		} else {
			params.put("end", getLastPage(params));
		}
		params.put("last", getLastPage(params));
		return params;
	}

	public int getStartPage(int page, int numb) { // 시작페이지
		return (page - 1) / numb * numb + 1;
	}

	public int getEndPage(int page, int numb) { // 10단위로
		return ((page - 1) / numb + 1) * numb;
	}

	public int getLastPage(HashMap<String, Object> params) {// 목록의 끝 번호
		int numb = Integer.parseInt(String.valueOf(params.get("numb")));
		return (udao.getCount(params) - 1) / numb + 1;
	}

	public int getSkip(int page, int numb) {// 앞에 지나간 갯수
		return (page - 1) * numb;
	}

	@Override
	public int stopUser(int user_no, int stopdate) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("user_no", user_no);
		if (stopdate == 1) {// 취소클릭시
			params.put("user_state", 0);
		} else {// 정지클릭시
			params.put("user_state", 1);
		}
		return udao.updateUserState(params);
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
		if (udao.selectUserFindPw(params) == null)
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

		return udao.updateUser_pass(params);
	}

	// 소현

	@Override
	public String getUserPass(String user_id) { // 유저 비밀번호 체크 //9월 7일

			return udao.selectUserPw(user_id);
	}

	@Override
	public User selectUser(String user_id) {   // 회원 한명 찾아오기 
		// TODO Auto-generated method stub
		return udao.selectOne(user_id);
	}

	@Override
	public int updateUser(HashMap<String, Object> params)  {   // 회원수정하기 
		String user_id = (String) params.get("user_id");

		return udao.updateUser(params);

	}

	@Override
	public List<Pet> selectPetAll(String user_id) { // 펫 리스트 뽑아오기

		return udao.selectPetAll(user_id);

	}

	@Override
	public boolean updatePet(HashMap<String, Object> params) { // 펫 수정하기

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
	public boolean insertPet(HashMap<String, Object> params) { // 펫 추가하기
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
	public void deleteUser(String user_id) { // 회원삭제 ★9월6일자 변경된 부분★

		udao.deleteUser(user_id);

	}

	@Override
	public void deletePet(int pet_no) { // 펫 삭제 ★9월6일자 변경된 부분★

		udao.deletePet(pet_no);

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

	@Override // ★ 9월6일 변경된 함수★(소현)
	public HashMap<String, Object> myInquiry(HashMap<String, Object> params, String user_id, int page) { // 내가 쓴 문의글

		HashMap<String, Object> result = new HashMap<String, Object>();

		int getEndPage = getEndPage(page);
		int getLastPage = getMyInquiryLastPage(user_id);

		if (getEndPage >= getLastPage)
			result.put("end", getMyInquiryLastPage(user_id));
		else
			result.put("end", getEndPage(page));

		result.put("current", page);
		result.put("start", getStartPage(page));
		result.put("last", getMyInquiryLastPage(user_id));

		params.put("skip", getSkip(page));
		params.put("qty", 10);
		params.put("qnA_userId", user_id);

		// System.out.println("겟카운트:" + tipDao.getCount(params));
		int size = qdao.getMyQnACount(user_id);

		result.put("qnaList", qdao.myInquiry(params));

		result.put("qna", size);

		return result;

	}

	@Override // ★ 9월6일 변경된 함수★(소현)
	public HashMap<String, Object> myWrites(String user_id, int page, HashMap<String, Object> params) { // 내가 쓴 게시글
		HashMap<String, Object> result = new HashMap<String, Object>();

		int getEndPage = getEndPage(page);
		int getLastPage = getMyWriteLastPage(user_id);

		if (getEndPage >= getLastPage)
			result.put("end", getMyWriteLastPage(user_id));
		else
			result.put("end", getEndPage(page));

		result.put("current", page);
		result.put("start", getStartPage(page));
		result.put("last", getMyWriteLastPage(user_id));

		params.put("skip", getSkip(page));
		params.put("qty", 10);
		params.put("user_id", user_id);

		int size = udao.getWriteCount(user_id);

		result.put("myWriteList", udao.selectmyWrite(params));
		result.put("myWrite", size);

		return result;
	}

	@Override // ★ 9월6일 변경된 함수★(소현)
	public HashMap<String, Object> selectmyLikes(HashMap<String, Object> params, String user_id, int page) { // 내가 좋아요한
																												// 글
		HashMap<String, Object> result = new HashMap<String, Object>();

		int getEndPage = getEndPage(page);
		int getLastPage = getMyLikesLastPage(user_id);

		if (getEndPage >= getLastPage)
			result.put("end", getMyLikesLastPage(user_id));
		else
			result.put("end", getEndPage(page));

		result.put("current", page);
		result.put("start", getStartPage(page));
		result.put("last", getMyLikesLastPage(user_id));

		params.put("skip", getSkip(page));
		params.put("qty", 10);
		params.put("user_id", user_id);

		int size = udao.getLikesCount(user_id);

		result.put("myLikesList", udao.selectmyLikes(params));
		result.put("myWrite", size);

		return result;
	}

	@Override // ★ 9월6일 변경된 함수★(소현)
	public HashMap<String, Object> selectMyMeetingApply(HashMap<String, Object> params, String user_id, int page) { // 내가
																													// 참여한
																													// 모임
		HashMap<String, Object> result = new HashMap<String, Object>();

		int getEndPage = getEndPage(page);
		int getLastPage = getMyMeetingLastPage(user_id);

		if (getEndPage >= getLastPage)
			result.put("end", getMyMeetingLastPage(user_id));
		else
			result.put("end", getEndPage(page));

		result.put("current", page);
		result.put("start", getStartPage(page));
		result.put("last", getMyMeetingLastPage(user_id));

		params.put("skip", getSkip(page));
		params.put("qty", 10);
		params.put("user_id", user_id);

		int size = udao.getMymeetingCount(user_id);

		result.put("myMeetingApplyList", udao.selectMyMeetingApply(params));
		result.put("myWrite", size);

		return result;
	}

	@Override // ★ 9월6일 추가된 함수★(소현)
	public File getAttachFile(String user_id) {
		// TODO Auto-generated method stub
		String fileName = udao.selectUserbyId(user_id).getUser_proPic();
		String path = "C:/BitCamp/image/";
		return new File(path + fileName);
	}

	@Override // ★ 9월6일 추가된 함수★(소현)
	public int updateUserPropic(MultipartHttpServletRequest multi) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		System.out.println((String) multi.getParameter("user_id") + "유저아이디 멀티");
		params.put("user_id", (String) multi.getParameter("user_id"));
		String path = "C:/BitCamp/image/";
		String newFileName = ""; // 업로드 되는 파일명
		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}
		Iterator<String> files = multi.getFileNames();
		while (files.hasNext()) {
			String uploadFile = files.next();
			MultipartFile mFile = multi.getFile(uploadFile);
			String fileName = mFile.getOriginalFilename();
			newFileName = System.currentTimeMillis() + "." + fileName.substring(fileName.lastIndexOf(".") + 1);
			params.put("user_proPic", newFileName);
			try {
				if (!(fileName.equals(""))) {
					mFile.transferTo(new File(path + newFileName));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println(params.get("user_proPic") + "vmfhvlf");
		System.out.println(params.get("user_id") + "아이디");// 여기 왜 안오지????????????
		return udao.updatePropic(params);
	}

	public int deletePetAll(String user_id) { // ★ 9월6일 추가된 함수★(소현)
		return udao.deletePetAll(user_id);
	}

}