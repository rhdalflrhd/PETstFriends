package dao;

import java.util.HashMap;
import java.util.List;

import model.Pet;
import model.User;

public interface UserDao {

	public User selectUserbyId2(HashMap<String, Object> params);// d
	// 오경

	public User selectUserbyNn(String user_nickname);// d

	public User selectUserbyId(String user_id);// d

	public int insertPet(Pet pet); // 회원가입//d

	public int insertUser(User user); // 회원가입//d

	public String selectUserFindId(HashMap<String, Object> params); // id찾기/dd

	public User selectUserFindPw(HashMap<String, Object> params); // pw찾기/dd

	public int updateUser_pass(HashMap<String, Object> params);// d

	public User selectUserbyEmail(String user_email);// d

	public User selectUserbyName(String user_name); //

	// 소현
	public void deleteUser(String user_id);// d
public HashMap<String, Object>selectUser (String user_id); //★ 9월7일자 추가된 부분(소현)★
	public void deletePet(int pet_no); // 

	public int updateUser(HashMap<String, Object> params);// d

	public int updatePet(Pet pet);// d

	public String selectUserPw(String user_pass);// d

	public User selectOne(String user_id);//d

	public List<Pet> selectPetAll(String user_id);// d

	public List<Object> selectmyWrite(HashMap<String, Object> params);// d

	public List<Object> selectmyLikes(HashMap<String, Object> params);// d

	public List<Object> selectMyMeetingApply(HashMap<String, Object> params);// d

	public int getWriteCount(String user_id);// d

	public int getLikesCount(String user_id);// d

	public int getMymeetingCount(String user_id);// d

	// 업데이트
	public int updateScore(User user); // 

	public int updatePropic(HashMap<String, Object> params); // 

	public int deletePetAll(String user_id); // 

	// 회원관리-가은
	public List<User> selectUserAll(HashMap<String, Object> params);// d

	public int getCount(HashMap<String, Object> params);// d

	public int updateUserState(HashMap<String, Object> params);// d

}