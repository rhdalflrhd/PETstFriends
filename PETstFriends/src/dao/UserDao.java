package dao;

import java.util.HashMap;

import model.Pet;
import model.User;

public interface UserDao {
	
	public boolean updateUserPet(HashMap<String, Object> params);
	public HashMap<String, Object>  selectUserPet(String user_id);
	public HashMap<String, Object> infoForUpdate(int user_no);
	
	
	public User selectUserbyId(String user_id);

	
	public User selectUserNn(String user_nickname);
public User selectUserEmail(String user_email);
 public void deleteUserPet (String user_id);
public User selectOne(String user_id);
}
