package dao;

import java.util.HashMap;
import java.util.List;

import model.Pet;
import model.User;

public interface UserDao {
	
	public int insertPet(Pet pet);
	public int updateUser(HashMap<String, Object>params);
	public int updatePet(Pet pet);
	
	public HashMap<String, Object>  selectUserPet(String user_id);
	public HashMap<String, Object> infoForUpdate(int user_no);
	
	
	public User selectUserbyId(String user_id);
public User selectUserPw(String user_pass);
	
	public User selectUserNn(String user_nickname);
public User selectUserEmail(String user_email);
 public void deleteUserPet (String user_id);
public HashMap<String, Object> selectOne(String user_id);

public HashMap<String, Object> selectPetAll(String user_id);
}
