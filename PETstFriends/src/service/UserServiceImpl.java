package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import dao.UserDao;
import model.MeetingBoard;
import model.Pet;
import model.QnA;
import model.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao udao;

	

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
	public int updateUser(HashMap<String, Object> params) {
		String user_id = (String) params.get("user_id");
//		int a = Integer.parseInt((String)params.get("user_havePet"));
//		params.put("user_havePet", a);
   return udao.updateUser(params);
	

	}


	@Override
	public List<Pet> selectPetAll(String user_id) {

		return udao.selectPetAll(user_id);
		
	}

	@Override
	public boolean updatePet(HashMap<String, Object> params) {
	  
		String jsonStr = (String) params.get("jsonData");

		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(jsonStr);
	
		JsonArray jArray = element.getAsJsonArray();
		JsonObject jOb = new JsonObject();
		User user = new User();
		Pet pet = new Pet();
		user = (User) params.get("user");
		for (int i = 0; i < jArray.size(); i++) {
			
			jOb = jArray.get(i).getAsJsonObject();
			if (jOb.get("pet_no").getAsInt() !=0 ) {
			    pet.setPet_no(jOb.get("pet_no").getAsInt());
			    pet.setPet_name(jOb.get("pet_name").getAsString());
			    pet.setUser_id((String)(params.get("user_id")));
		        pet.setPet_gender(jOb.get("pet_gender").getAsInt());
				pet.setPet_species(jOb.get("pet_species").getAsInt());
				pet.setPet_age(jOb.get("pet_age").getAsInt());
				pet.setPet_file(jOb.get("pet_file").getAsString());
		
				udao.updatePet(pet);
			}
			
			}
		return true;
	
		
		
	}

	@Override
	public boolean insertPet(HashMap<String, Object> params) {
		String jsonStr = (String) params.get("jsonData");

		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(jsonStr);
	
		JsonArray jArray = element.getAsJsonArray();
		JsonObject jOb = new JsonObject();
		User user = new User();
		Pet pet = new Pet();
		user = (User) params.get("user");
		for (int i = 0; i < jArray.size(); i++) {
			
			jOb = jArray.get(i).getAsJsonObject();   
			
			if ( jOb.get("pet_no").getAsInt() ==0) {
				
			 pet.setUser_id((String)(params.get("user_id")));
			
			 pet.setPet_name(jOb.get("pet_name").getAsString());
				pet.setPet_gender(jOb.get("pet_gender").getAsInt());
				pet.setPet_species(jOb.get("pet_species").getAsInt());
				pet.setPet_age(jOb.get("pet_age").getAsInt());
				pet.setPet_file(jOb.get("pet_file").getAsString());
			
				udao.insertPet(pet);
			
			}
			
		}			
		return true;
	}

	@Override
	public boolean deleteUser(String user_id, String user_pass) {
	
  String user_passch = (String) udao.selectOne(user_id).get("user_pass");

  
  if (user_pass.equals(user_passch)) {
		udao.deleteUser(user_id,user_pass);
		return true;
  }
  else 
	  return false;
	}

	@Override
	public HashMap<String, Object> myWrites(String user_id) {
		
		return udao.selectmyWrite("yoo");
	}

	@Override
	public void deletePet(String pet_name) {
		
		udao.deletePet(pet_name);
		
	}


	@Override
	public int getStartPageS(int page) {
		// TODO Auto-generated method stub
		return (page- 1) / 10 * 10 + 1;
	}

	@Override
	public int getEndPageS(int page) {
		// TODO Auto-generated method stub
		return ((page-1) / 10 + 1) * 10;
	}

	@Override
	public int getMyWriteLastPage(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return (udao.getWriteCount(params) - 1 ) / 10 + 1;
	}

	@Override
	public int getSkipS(int page) {
		// TODO Auto-generated method stub
		return (page - 1) * 10;
	}

	@Override
	public int getMyInquiryLastPage(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return (udao.getMyQnACount(params) - 1 ) / 10 + 1;
	}

	@Override
	public int getMyMeetingLastPage(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return (udao.getMymeetingCount(params) - 1 ) / 10 + 1;
	}

	@Override
	public int getMyLikesLastPage(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return (udao.getLikesCount(params) - 1 ) / 10 + 1;
	}





	
}







