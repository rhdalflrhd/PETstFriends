package service;

import java.util.HashMap;

import model.MeetingBoard;
import model.Pet;
import model.QnA;
import model.User;

public interface UserService {
	

	public boolean updateUser(HashMap<String, Object> params);
	public boolean updatePet(HashMap<String, Object> params);
    public void deleteUser(String user_id);
	public User infoForUpdate(int user_no);


	
}
