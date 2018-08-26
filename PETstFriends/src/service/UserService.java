package service;

import java.util.HashMap;

import model.Pet;
import model.User;

public interface UserService {
	public boolean joinUser(HashMap<String, Object> params);
	public boolean getUserbyNn(String user_nickname);
	public boolean getUserbyId(String user_id);
	public HashMap<String, Object> showUserList(HashMap<String, Object> params);
	public int stopUser(String user_id, int stopdate);
	
}
