package service;

import java.util.HashMap;
import java.util.List;

import model.Pet;
import model.QnA;
import model.User;

public interface UserService {
	public boolean joinUser(HashMap<String, Object> params);
	public boolean joinNaverUser(HashMap<String, Object> params);
	public boolean getUserbyNn(String user_nickname);
	public boolean getUserbyId(String user_id);
	public boolean loginUser(String user_id, String user_pass);
	public boolean getUserbyEmail(String user_email);
	public boolean getUserbyName(String user_name);
	public int updateUser_pass(HashMap<String, Object> params);
	public String getUserFindbyId(HashMap<String, Object> params);
	public boolean getUserFindbyPw(HashMap<String, Object> params);
	public HashMap<String, Object> showUserList(HashMap<String, Object> params);
	public int stopUser(String user_id, int stopdate);
	
	public void deletePet(int pet_no);
	public int updateUser(HashMap<String, Object> params);
	public boolean updatePet(HashMap<String, Object> params);
	public boolean insertPet(HashMap<String, Object> params);
	public void deleteUser(String user_id);
	public HashMap<String, Object> selectUserPet(String user_id);
	public boolean getUserPass(String user_pass);
	public User selectUser(String user_id);
	public List<Pet> selectPetAll(String user_id);
	public QnA viewmyInquiry(int qnA_boardno);
	public HashMap<String, Object> myInquiry(HashMap<String, Object> params, String user_id, int page);
	public HashMap<String, Object> myWrites(String user_id, int page, HashMap<String, Object> params);
	public HashMap<String, Object> selectmyLikes(HashMap<String, Object> params, String user_id, int page);
	public HashMap<String, Object> selectMyMeetingApply(HashMap<String, Object> params, String user_id, int page);
	public int getStartPage(int page);
	public int getEndPage(int page);
	public int getMyWriteLastPage(String user_id);
	public int getMyInquiryLastPage(String user_id);
	public int getMyMeetingLastPage(String user_id);
	public int getMyLikesLastPage(String user_id);
	public int getSkip(int page);
}