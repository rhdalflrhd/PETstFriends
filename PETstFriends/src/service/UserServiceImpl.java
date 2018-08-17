package service;

import java.util.HashMap;
import java.util.List;

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
	public HashMap<String, Object>selectUser(String user_id) {
		// TODO Auto-generated method stub
		return udao.selectOne(user_id);
	}

	@Override
	public boolean updateUser(HashMap<String, Object> params) {
		String user_id = (String) params.get("user_id");

//       User user = new User();
//     user.setUser_no(user.getUser_no());
//     user.setUser_name(user.getUser_name());
//     user.setUser_id(user_id);
//    
//		user.setUser_nickname((String) params.get("user_nickname"));
//		user.setUser_pass((	String)params.get("user_pass"));
//		user.setUser_email((String) params.get("user_email"));
//		user.setUser_phone((String) params.get("user_phone"));
//		 user.setUser_proPic(user.getUser_proPic());
//		 user.setUser_score(user.getUser_score());
//		 user.setUser_joinDate(user.getUser_joinDate());
//		 user.setUser_adminCheck(user.getUser_adminCheck());
//		 user.setUser_state(user.getUser_state());
//		 user.setUser_pan_date(user.getUser_pan_date());
//		user.setUser_havePet(Integer.parseInt((String) params.get("user_havePet")));

	
	System.out.println(params);
	System.out.println(udao.updateUser(params));	
	System.out.println("dao에 값 들어있나 확인용 이 메세지 위에가 dao값");
	
	udao.updateUser(params);
	return true;

	}

	@Override
	public void deleteUserPet(String user_id) {
	
		
		udao.deleteUserPet(user_id);
		
	}

	@Override
	public HashMap<String, Object> selectPetAll(String user_id) {
		return udao.selectPetAll(user_id);
	}

	@Override
	public boolean updatePet(HashMap<String, Object> params) {
	  
		String user_id = (String) params.get("user_id");
		Pet pet = new Pet();
	     
	  pet.setUser_id((String) params.get("user_id"));
	  pet.setPet_name((String)params.get("pet_name"));
	  pet.setPet_species(Integer.parseInt((String) params.get("pet_species")));
	  pet.setPet_age(Integer.parseInt((String) params.get("pet_age")));
	  pet.setPet_file((String) params.get("pet_file"));
			udao.updatePet(pet);
		
		return false;
	}

	@Override
	public boolean insertPet(HashMap<String, Object> params) {
		String user_id = (String) params.get("user_id");
		if (params.get("user_havePet").equals("1")) {
			Pet pet = new Pet();
			pet.setUser_id((String) params.get("user_id"));
			pet.setPet_name((String) params.get("pet_name"));
			pet.setPet_species(Integer.parseInt((String) params.get("pet_species")));
			pet.setPet_gender(Integer.parseInt((String) params.get("pet_gender")));
			pet.setPet_age(Integer.parseInt((String) params.get("pet_age")));
			pet.setPet_file((String) params.get("pet_file"));
			udao.insertPet(pet);

		}
		return true;
	}





	
}







