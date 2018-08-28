package dao;

import java.util.HashMap;
import java.util.List;

import model.Pet;
import model.User;

public interface UserDao {
	
	public User selectUserNn(String user_nickname);
	public User selectUserId(String user_id);
	public int insertPet(Pet pet); //회원가입
	public int insertUser(User user); //회원가입
	public List<User> selectUserAll(HashMap<String, Object> params);
	public int getCount(String keyword);
	public int updateUser(User user);
	
}