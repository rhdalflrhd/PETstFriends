package dao;

import java.util.HashMap;

import model.Pet;
import model.User;

public interface UserDao {
	//오경 - 회원가입,id/pw찾기
	public int insertUser(User user); //회원가입
	public int insertPet(Pet pet); //회원가입
	public String selectUserFindId(HashMap<String, Object>params); //id찾기
	public User selectUserFindPw(HashMap<String, Object>params); //pw찾기
	public int updateUser_pass(HashMap<String, Object>params);
	
	//얘네 쓰는거 맞나 아디, 닉넴, 이멜 중복체크할때 쓸껀데
	public User selectUserbyId(String user_id);
	public User selectUserbyNn(String user_nickname);
	public User selectUserbyEmail(String user_email);
	public User selectUserbyName(String user_name); //비번찾기할때 이름 있는지 확인할거


	

	//이게끝인가???????ㅎ
	
	
	
	

}
