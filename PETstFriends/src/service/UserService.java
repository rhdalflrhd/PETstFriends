package service;

import java.util.HashMap;

import model.Pet;
import model.User;

public interface UserService {
	
	public boolean joinUser(HashMap<String, Object> params);
	public boolean loginUser(String user_id, String user_pw);
	public boolean getUserbyId(String user_id);
	public boolean getUserbyNn(String user_nickname);
	public boolean getUserbyEmail(String user_email);

	public User getUserFindbyId(String user_name, String user_email);
	public User getUserFindbyPw(String user_id,String user_name, String user_email);
	
	
	

	
}
