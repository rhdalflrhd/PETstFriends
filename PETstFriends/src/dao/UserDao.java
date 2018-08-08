package dao;

import model.Pet;
import model.User;

public interface UserDao {
	//오경 - 회원가입,id/pw찾기
	public int insertUser(User user); //회원가입
	public int insertPet(Pet pet); //회원가입
	public User selectUserFindId(String user_name,String user_email); //id찾기
	public User selectUserFindPw(String User_id, String user_name,String user_email); //pw찾기
	
	//얘네 쓰는거 맞나 아디, 닉넴, 이멜 중복체크할때 쓸껀데
	public User getUserbyId(String user_id);
	public User getUserbyNn(String user_nickname);
	public User getUserbyEmail(String user_email);
	

	//이게끝인가???????ㅎ
	
	
	
	

}
