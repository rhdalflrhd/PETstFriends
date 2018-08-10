package dao;

import model.Pet;
import model.User;

public interface UserDao {
	
//	public boolean insertUser(User user);
//	public boolean insertPet(Pet pet);
	public User selectUserNn(String user_nickname);
	

}
