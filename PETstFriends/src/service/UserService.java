package service;

import java.util.HashMap;

import model.MeetingBoard;
import model.Pet;
import model.QnA;
import model.User;

public interface UserService {
	

	public boolean updateUserPet(HashMap<String, Object> params);

    public void deleteUserPet(String user_id);
	public HashMap<String, Object> selectUserPet(String user_id);
	public HashMap<String, Object> infoForUpdate(int user_no);
	public boolean getUserNn(String user_nickname);
	public boolean getUserEmail(String user_email);
	public User selectUser(String user_id);
	 public boolean getUserbyId(String user_id);
	
	
}
