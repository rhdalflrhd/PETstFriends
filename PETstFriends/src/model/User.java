package model;

import java.util.Date;

public class User {
	int user_no;          
	String user_name;
	String user_id;        
	String user_nickname;        
	String user_pass;
	String user_email;      
	String user_phone;
	String user_proPic;
	int user_score; 
	Date user_joinDate;
	boolean user_adminCheck;
	Date user_state;
	boolean user_havePet;
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public String getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_proPic() {
		return user_proPic;
	}
	public void setUser_proPic(String user_proPic) {
		this.user_proPic = user_proPic;
	}
	public int getUser_score() {
		return user_score;
	}
	public void setUser_score(int user_score) {
		this.user_score = user_score;
	}
	public Date getUser_joinDate() {
		return user_joinDate;
	}
	public void setUser_joinDate(Date user_joinDate) {
		this.user_joinDate = user_joinDate;
	}
	public boolean isUser_adminCheck() {
		return user_adminCheck;
	}
	public void setUser_adminCheck(boolean user_adminCheck) {
		this.user_adminCheck = user_adminCheck;
	}
	public Date getUser_state() {
		return user_state;
	}
	public void setUser_state(Date user_state) {
		this.user_state = user_state;
	}
	public boolean isUser_havePet() {
		return user_havePet;
	}
	public void setUser_havePet(boolean user_havePet) {
		this.user_havePet = user_havePet;
	}
	@Override
	public String toString() {
		return "User [user_no=" + user_no + ", user_name=" + user_name + ", user_id=" + user_id + ", user_nickname="
				+ user_nickname + ", user_pass=" + user_pass + ", user_email=" + user_email + ", user_phone="
				+ user_phone + ", user_proPic=" + user_proPic + ", user_score=" + user_score + ", user_joinDate="
				+ user_joinDate + ", user_adminCheck=" + user_adminCheck + ", user_state=" + user_state
				+ ", user_havePet=" + user_havePet + "]";
	}

	
	
}
