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


	public HashMap<String, Object> selectUserPet(String user_id) {
	
		return udao.selectUserPet(user_id);
	}

	@Override
	public boolean getUserNn(String user_nickname) {
		// TODO Auto-generated method stub
		if(udao.selectUserNn(user_nickname) == null)
			return true;
		else 
			return false;
	}

	@Override
	public boolean getUserEmail(String user_email) {
		// TODO Auto-generated method stub
		if (udao.selectUserEmail(user_email)==null) {
			return true;
		}
		else 
		return false;
	}
	@Override
	public boolean getUserPass(String user_pass) {
		
		if (udao.selectUserPw(user_pass)==null) {
			return true;
		}
		else 
		return false;
	}




	@Override
	public HashMap<String, Object> infoForUpdate(int user_no) {
		// TODO Auto-generated method stub
		return udao.infoForUpdate(user_no);
	}

	@Override
	public User selectUser(String user_id) {
		// TODO Auto-generated method stub
		return udao.selectOne(user_id);
	}

	@Override
	public boolean updateUserPet(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
	if (params != null) {
		udao.updateUserPet(params);
		return true;
	}
	else
		 return false;
	}

	@Override
	public void deleteUserPet(String user_id) {
	
		
		udao.deleteUserPet(user_id);
		
	}





	
}







