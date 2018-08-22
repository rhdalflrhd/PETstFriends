package dao;

import java.util.HashMap;
import java.util.List;

import model.Pet;
import model.User;

public interface UserDao {
public void deleteUser(String user_id, String user_pass);
	
	public void deletePet(int pet_no);
	
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
	
	public HashMap<String, Object> selectmyWrite(String user_id);
	
	public int getWriteCount(HashMap<String, Object> params);
	
	public int getLikesCount(HashMap<String, Object> params);
	public int getMymeetingCount(HashMap<String, Object> params);
	public int getMyQnACount(HashMap<String, Object> params);
	
}
