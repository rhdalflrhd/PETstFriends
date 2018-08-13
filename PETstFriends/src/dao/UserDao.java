package dao;

import model.Pet;
import model.User;

public interface UserDao {
	
	public User selectUserNn(String user_nickname);
	public User selectUserId(String user_id);
	public int insertPet(Pet pet); //회원가입
	public int insertUser(User user); //회원가입
}
