package model;

import java.sql.Date;

public class User {
	private int user_no;
	private String user_name;
	private String user_id;
	private String user_nickname;
	private String user_pass;
	private String user_email;
	private String user_phone;
	private String user_proPic;
	private int user_score;
	private Date user_joinDate;
	private int user_adminCheck;
	private Date user_state;
	private String user_pan_date;
	private int user_havePet;
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
	public int getUser_adminCheck() {
		return user_adminCheck;
	}
	public void setUser_adminCheck(int user_adminCheck) {
		this.user_adminCheck = user_adminCheck;
	}
	public Date getUser_state() {
		return user_state;
	}
	public void setUser_state(Date user_state) {
		this.user_state = user_state;
	}
	public String getUser_pan_date() {
		return user_pan_date;
	}
	public void setUser_pan_date(String user_pan_date) {
		this.user_pan_date = user_pan_date;
	}
	public int getUser_havePet() {
		return user_havePet;
	}
	public void setUser_havePet(int user_havePet) {
		this.user_havePet = user_havePet;
	}
	@Override
	public String toString() {
		return "User [user_no=" + user_no + ", user_name=" + user_name + ", user_id=" + user_id + ", user_nickname="
				+ user_nickname + ", user_pass=" + user_pass + ", user_email=" + user_email + ", user_phone="
				+ user_phone + ", user_proPic=" + user_proPic + ", user_score=" + user_score + ", user_joinDate="
				+ user_joinDate + ", user_adminCheck=" + user_adminCheck + ", user_state=" + user_state
				+ ", user_pan_date=" + user_pan_date + ", user_havePet=" + user_havePet + "]";
	}
	

}
