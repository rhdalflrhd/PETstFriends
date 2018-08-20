package service;

import java.util.HashMap;

import model.Pet;
import model.User;

public interface UserService {
	
	public boolean joinUser(HashMap<String, Object> params);
	public boolean loginUser(String user_id, String user_pass);
	public boolean getUserbyId(String user_id);
	public boolean getUserbyNn(String user_nickname);
	public boolean getUserbyEmail(String user_email);

	public boolean getUserFindbyId(HashMap<String, Object> params);
	public User getUserFindbyPw(HashMap<String, Object> params);
	
	
	

	
}
