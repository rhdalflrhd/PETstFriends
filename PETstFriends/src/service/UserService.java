package service;

import java.util.HashMap;
import java.util.List;

import model.MeetingBoard;
import model.Pet;
import model.QnA;
import model.User;

public interface UserService {
	

	public boolean updateUser(HashMap<String, Object> params);
	public boolean updatePet(HashMap<String, Object> params);
public boolean insertPet(HashMap<String, Object> params);

    public void deleteUserPet(String user_id);
	public HashMap<String, Object> selectUserPet(String user_id);
	public HashMap<String, Object> infoForUpdate(int user_no);
	public boolean getUserNn(String user_nickname);
	public boolean getUserEmail(String user_email);
	public boolean getUserPass(String user_pass);
	public HashMap<String, Object>selectUser(String user_id);
	public HashMap<String, Object>selectPetAll(String user_id);
	
	
}
