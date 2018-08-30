package model;

import java.sql.Date;

public class FreeLikes {
	private int freeBoard_boardname;
	private int freeBoard_boardno;
	private String freeLikes_userId;
	private String freeLikes_nickname;
	private Date freeLikes_date;
	public int getfreeBoard_boardname() {
		return freeBoard_boardname;
	}
	public void setfreeBoard_boardname(int freeBoard_boardname) {
		freeBoard_boardname = freeBoard_boardname;
	}
	public int getfreeBoard_boardno() {
		return freeBoard_boardno;
	}
	public void setfreeBoard_boardno(int freeBoard_boardno) {
		freeBoard_boardno = freeBoard_boardno;
	}
	public String getfreeLikes_userId() {
		return freeLikes_userId;
	}
	public void setfreeLikes_userId(String freeLikes_userId) {
		freeLikes_userId = freeLikes_userId;
	}
	public String getfreeLikes_nickname() {
		return freeLikes_nickname;
	}
	public void setfreeLikes_nickname(String freeLikes_nickname) {
		freeLikes_nickname = freeLikes_nickname;
	}
	public Date getfreeLikes_date() {
		return freeLikes_date;
	}
	public void setfreeLikes_date(Date freeLikes_date) {
		freeLikes_date = freeLikes_date;
	}
	@Override
	public String toString() {
		return "freeLikes [freeBoard_boardname=" + freeBoard_boardname + ", freeBoard_boardno=" + freeBoard_boardno
				+ ", freeLikes_userId=" + freeLikes_userId + ", freeLikes_nickname=" + freeLikes_nickname
				+ ", freeLikes_date=" + freeLikes_date + "]";
	}
	
	
	

}
