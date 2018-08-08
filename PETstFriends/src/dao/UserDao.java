package dao;

import model.User;

public interface UserDao {

	public boolean updateUser(User user);
	
	public User selectUserId(String user_id);
}
