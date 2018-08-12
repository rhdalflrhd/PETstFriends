package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDao;
import model.Pet;
import model.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDao udao;

	@Override
	public boolean joinUser(User user, Pet pet) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean getUserbyNn(String user_nickname) {
		// TODO Auto-generated method stub
		if(udao.selectUserNn(user_nickname) == null)
			return true;
		else 
			return false;
	}

	@Override
	public boolean getUserbyId(String user_id) {
		// TODO Auto-generated method stub
		return false;
	}
	
	

	
}
