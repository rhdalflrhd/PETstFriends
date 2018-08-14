package service;



import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Locale;

import org.apache.tomcat.util.security.MD5Encoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mysql.fabric.xmlrpc.base.Value;

import dao.FreeBoardDao;
import dao.UserDao;

import model.Pet;
import model.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao uDao;


	@Override
	public boolean joinUser(HashMap<String, Object> params) {
		
		//user
		String user_id = (String) params.get("user_id");
		
		String user_pass = (String) params.get("user_pass");
	
		User user = new User();
		
			user.setUser_id(user_id);
		user.setUser_name((String)params.get("user_name"));
			user.setUser_nickname((String) params.get("user_nickname"));
			user.setUser_email((String) params.get("user_email"));
			user.setUser_phone((String) params.get("user_phone"));
			user.setUser_phone((String) params.get("user_proPic"));
			user.setUser_pass(user_pass);
			
			SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd");
			
			user.setUser_joinDate(sim.format(new Date()));
			user.setUser_adminCheck(0); //0=일반 1=관리자
			user.setUser_score(0);  //회원가입하자마자 점수는 0점 
			Calendar cal = new GregorianCalendar(Locale.KOREA);
			cal.setTime(new java.util.Date());
			cal.add(Calendar.DAY_OF_YEAR, -1);
			
			String strDate = sim.format(cal.getTime());
			user.setUser_pan_date(strDate);
			user.setUser_state(0); //0=정상 1=정지

			Integer.parseInt((String) params.get("user_havePet"));
			
//			user.setUser_havePet(0);
//			System.out.println(user.getUser_name());

				uDao.insertUser(user);
		

			
			//pet
			if(user.getUser_havePet() == 1) {
			Pet pet = new Pet();
			pet.setPet_name((String) params.get("pet_name"));
			pet.setPet_species((String) params.get("pet_species"));
			pet.setPet_gender((int) params.get("pet_gender"));
			pet.setPet_age((int) params.get("pet_age"));
			uDao.insertPet(pet);
			
			}
			return true;
	}

	

	@Override
	public boolean loginUser(String user_id, String user_pw) {
		// TODO Auto-generated method stub
	
		return false;
		
	}

	@Override
	
	public User getUserFindbyId(String user_name, String user_email) {
		// TODO Auto-generated method stub
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("user_name", user_name);
		param.put("user_email", user_email);
		return uDao.selectUserFindId(param);
	}

	@Override
	public User getUserFindbyPw(String user_id, String user_name, String user_email) {
		// TODO Auto-generated method stub
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("user_id", user_id);
		param.put("user_name", user_name);
		param.put("user_email", user_email);
				
		return uDao.selectUserFindPw(param);
	}



	@Override
	public boolean getUserbyId(String user_id) {
		// TODO Auto-generated method stub
		if(uDao.selectUserbyId(user_id) == null)
			return true;
		else
		return false;
	}



	@Override
	public boolean getUserbyNn(String user_nickname) {
		// TODO Auto-generated method stub
		if(uDao.selectUserbyNn(user_nickname) == null)
			return true;
		else
		return false;
		
	}



	@Override
	public boolean getUserbyEmail(String user_email) {
		// TODO Auto-generated method stub
		if (uDao.selectUserbyEmail(user_email)==null) {
			return true;
		}
		else 
		return false;
	}
	




}//서비스





