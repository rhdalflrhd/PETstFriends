package service;

import java.util.HashMap;
import java.util.List;

import model.MeetingBoard;
import model.Pet;
import model.QnA;
import model.User;

public interface UserService {

	public void deletePet(String pet_name);

	public int updateUser(HashMap<String, Object> params);

	public boolean updatePet(HashMap<String, Object> params);

	public boolean insertPet(HashMap<String, Object> params);

	public boolean deleteUser(String user_id, String user_pass);

	public HashMap<String, Object> selectUserPet(String user_id);

	public HashMap<String, Object> infoForUpdate(int user_no);

	public boolean getUserNn(String user_nickname);

	public boolean getUserEmail(String user_email);

	public boolean getUserPass(String user_pass);

	public HashMap<String, Object> selectUser(String user_id);

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
