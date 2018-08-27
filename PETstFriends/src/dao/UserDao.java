package dao;

import java.util.HashMap;
import java.util.List;

import model.Pet;
import model.QnA;
import model.User;

public interface UserDao {
public void deleteUser(String user_id, String user_pass);
	
	public void deletePet(String pet_name);
	
	public int insertPet(Pet pet);

	public int updateUser(HashMap<String, Object> params);

	public int updatePet(Pet pet);

	public HashMap<String, Object> selectUserPet(String user_id);

	public HashMap<String, Object> infoForUpdate(int user_no);

	public User selectUserbyId(String user_id);

	public User selectUserPw(String user_pass);

	public User selectUserNn(String user_nickname);
  
	public User selectUserEmail(String user_email);


	public HashMap<String, Object> selectOne(String user_id);

	public  List<Pet> selectPetAll(String user_id);
	
	public List<Object> selectmyWrite(HashMap<String, Object> params);
	
	public List<Object> selectmyLikes(HashMap<String, Object> params);
	
	public List<Object> selectMyMeetingApply (HashMap<String, Object> params);
	
	public int getWriteCount(String user_id);
	
	public int getLikesCount(String user_id);
	
	public int getMymeetingCount(String user_id);
	
	
	
	
}
