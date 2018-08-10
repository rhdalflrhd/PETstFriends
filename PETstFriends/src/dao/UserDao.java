package dao;

import java.util.HashMap;

import model.Pet;
import model.User;

public interface UserDao {
	//오경 - 회원가입,id/pw찾기
	public int insertUser(User user); //회원가입
	public int insertPet(Pet pet); //회원가입
	public User selectUserFindId(HashMap<String, Object>params); //id찾기
	public User selectUserFindPw(HashMap<String, Object>params); //pw찾기
	
	//얘네 쓰는거 맞나 아디, 닉넴, 이멜 중복체크할때 쓸껀데
	public User selectUserbyId(String user_id);
	public User selectUserbyNn(String user_nickname);
//	public UserselectUserbyEmail(String user_email);


	

	//이게끝인가???????ㅎ
	
	
	
	

}
