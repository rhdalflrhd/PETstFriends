package dao;

import java.util.HashMap;
import java.util.List;

import model.Pet;
import model.User;

public interface UserDao {
	//오경
	public User selectUserbyNn(String user_nickname);//d
	public User selectUserbyId(String user_id);//d
	public int insertPet(Pet pet); //회원가입//d
	public int insertUser(User user); //회원가입//d
	public String selectUserFindId(HashMap<String, Object>params); //id찾기/dd
	public User selectUserFindPw(HashMap<String, Object>params); //pw찾기/dd
	public int updateUser_pass(HashMap<String, Object>params);//d
	public User selectUserbyEmail(String user_email);//d
	public User selectUserbyName(String user_name); //비번찾기할때 이름 있는지 확인할거//d

	//소현
	public void deleteUser(String user_id, String user_pass);//d
	public void deletePet(String pet_name);//dd
	public int updateUser(HashMap<String, Object> params);//d
	public int updatePet(Pet pet);//d
	public HashMap<String, Object> selectUserPet(String user_id);//d
	public User selectUserPw(String user_pass);//d
	public HashMap<String, Object> selectOne(String user_id);//d
	public  List<Pet> selectPetAll(String user_id);//d
	public List<Object> selectmyWrite(HashMap<String, Object> params);//d
	public List<Object> selectmyLikes(HashMap<String, Object> params);//d
	public List<Object> selectMyMeetingApply (HashMap<String, Object> params);//d
	public int getWriteCount(String user_id);//d
	public int getLikesCount(String user_id);//d
	public int getMymeetingCount(String user_id);//d
	
	//업데이트
	   public int updateScore(User user);
	
	//회원관리-가은
	public List<User> selectUserAll(HashMap<String, Object> params);//d
	public int getCount(String keyword);//d
	
}