package service;

import java.util.HashMap;

import org.apache.tomcat.util.security.MD5Encoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.FreeBoardDao;
import dao.UserDao;

import model.Pet;
import model.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao uDao;
	@Autowired
	private FreeBoardDao bDao;

	@Override
	public boolean joinUser(HashMap<String, Object> params) {
		
		//user
		String user_id = (String) params.get("user_id");
		
		String user_pw = (String) params.get("user_pw");
		String user_pwc = (String) params.get("user_pwc");
		User user = new User();
			user.setUser_id(user_id);
			user.setUser_name((String) params.get("user_name"));
			user.setUser_email((String) params.get("user_email"));
			user.setUser_phone((String) params.get("user_phone"));
			user.setUser_pass(user_pw);
//			user.setAdmin(Integer.parseInt((String) params.get("admin")));
			user.setUser_havePet((boolean) params.get("user_havePet"));
			uDao.insertUser(user);
			
			//pet
			if(user.isUser_havePet() == true) {
			Pet pet = new Pet();
			pet.setPet_name((String) params.get("pet_name"));
			pet.setPet_species((String) params.get("pet_species"));
			pet.setPet_gender(pet.isPet_gender());
			pet.setPet_age((int) params.get("pet_age"));
			
			}
			return true;
	}

	
	@Override
	public boolean loginuser(String user_id, String user_pw) {
		
		return false;
	}

	@Override
	public User getUserFindbyId(String user_name, String user_email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getUserFindbyPw(String user_id, String user_name, String user_email) {
		// TODO Auto-generated method stub
		return null;
	}



	
}
