package service;

import model.Pet;
import model.User;

public interface UserService {
	
	public boolean joinUser(User user, Pet pet);
	public boolean getUserbyNn(String user_nickname);
	public boolean getUserbyId(String user_id);

	
}
