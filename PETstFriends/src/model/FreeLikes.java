package model;

import java.sql.Date;

public class FreeLikes {
	private int freeLikes_likeno;
	private int freeLikes_boardname;
	private int freeLikes_boardno;
	private String freeLikes_userId;
	private int freeLikes_likeCheck;
	private String freeLikes_date;
	public int getFreeLikes_likeno() {
		return freeLikes_likeno;
	}
	public void setFreeLikes_likeno(int freeLikes_likeno) {
		this.freeLikes_likeno = freeLikes_likeno;
	}
	public int getFreeLikes_boardname() {
		return freeLikes_boardname;
	}
	public void setFreeLikes_boardname(int freeLikes_boardname) {
		this.freeLikes_boardname = freeLikes_boardname;
	}
	public int getFreeLikes_boardno() {
		return freeLikes_boardno;
	}
	public void setFreeLikes_boardno(int freeLikes_boardno) {
		this.freeLikes_boardno = freeLikes_boardno;
	}
	public String getFreeLikes_userId() {
		return freeLikes_userId;
	}
	public void setFreeLikes_userId(String freeLikes_userId) {
		this.freeLikes_userId = freeLikes_userId;
	}
	public int getFreeLikes_likeCheck() {
		return freeLikes_likeCheck;
	}
	public void setFreeLikes_likeCheck(int freeLikes_likeCheck) {
		this.freeLikes_likeCheck = freeLikes_likeCheck;
	}
	public String getFreeLikes_date() {
		return freeLikes_date;
	}
	public void setFreeLikes_date(String freeLikes_date) {
		this.freeLikes_date = freeLikes_date;
	}
	@Override
	public String toString() {
		return "FreeLikes [freeLikes_likeno=" + freeLikes_likeno + ", freeLikes_boardname=" + freeLikes_boardname
				+ ", freeLikes_boardno=" + freeLikes_boardno + ", freeLikes_userId=" + freeLikes_userId
				+ ", freeLikes_likeCheck=" + freeLikes_likeCheck + ", freeLikes_date=" + freeLikes_date + "]";
	}
	

}