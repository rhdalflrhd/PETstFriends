package service;

import java.util.HashMap;

import model.Pet;
import model.User;

public interface UserService {
	
	public boolean joinUser(HashMap<String, Object> params);
	
	public boolean loginuser(String user_id, String user_pw);
	public User getUserFindbyId(String user_name, String user_email);
	public User getUserFindbyPw(String user_id,String user_name, String user_email);
	
	
	

	
}
