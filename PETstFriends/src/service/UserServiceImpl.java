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
	public int updateUser(HashMap<String, Object> params) {
		String user_id = (String) params.get("user_id");

System.out.println(params);
		int a = Integer.parseInt((String)params.get("user_havePet"));
		params.put("user_havePet", a);

	udao.updateUser(params);

return 1;
	

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
		System.out.println(element);
		JsonArray jArray = element.getAsJsonArray();
		JsonObject jOb = new JsonObject();
		User user = new User();
		Pet pet = new Pet();
		user = (User) params.get("user");
		for (int i = 0; i < jArray.size(); i++) {
			
			jOb = jArray.get(i).getAsJsonObject();
			if (!(jOb.get("pet_name").getAsString().equals(""))) {
				System.out.println(jOb.get("pet_name").getAsString());
				String a = jOb.get("pet_name").getAsString();
			
				pet.setUser_id((String)(params.get("user_id")));
			pet.setPet_name(jOb.get("pet_name").getAsString());
				pet.setPet_gender(jOb.get("pet_gender").getAsInt());
				pet.setPet_species(jOb.get("pet_species").getAsInt());
				pet.setPet_age(jOb.get("pet_age").getAsInt());
				pet.setPet_file(jOb.get("pet_file").getAsString());
			//펫 테이블에 insertSerive부르기
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
			if (!(jOb.get("pet_name").getAsString().equals(""))) {
				System.out.println(jOb.get("pet_name").getAsString());
				String a = jOb.get("pet_name").getAsString();
			
				pet.setUser_id((String)(params.get("user_id")));
			pet.setPet_name(jOb.get("pet_name").getAsString());
				pet.setPet_gender(jOb.get("pet_gender").getAsInt());
				pet.setPet_species(jOb.get("pet_species").getAsInt());
				pet.setPet_age(jOb.get("pet_age").getAsInt());
				pet.setPet_file(jOb.get("pet_file").getAsString());
			//펫 테이블에 insertSerive부르기
				udao.insertPet(pet);
			}
			
			}
		return true;
	}

	@Override
	public void deleteUser(String user_id) {
		udao.deleteUser(user_id);
		
		
	}

	@Override
	public HashMap<String, Object> myWrites(String user_id) {
		
		return udao.selectmyWrite(user_id);
	}

	@Override
	public void deletePet(String pet_name) {
		System.out.println(pet_name);
		udao.deletePet(pet_name);
		
	}






	
}







