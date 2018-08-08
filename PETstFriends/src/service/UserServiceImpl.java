package service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDao;
import model.MeetingBoard;
import model.Pet;
import model.QnA;
import model.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDao udao;

	@Override
	public boolean updateUser(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updatePet(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public User infoForUpdate(int user_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteUser(String user_id) {
		// TODO Auto-generated method stub
		
	}

	
}
