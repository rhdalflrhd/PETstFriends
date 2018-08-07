package model;

import java.sql.Date;

public class FreeLikes {
	private int FreeBoard_boardname;
	private int FreeBoard_boardno;
	private String FreeLikes_userId;
	private String FreeLikes_nickname;
	private Date FreeLikes_date;
	public int getFreeBoard_boardname() {
		return FreeBoard_boardname;
	}
	public void setFreeBoard_boardname(int freeBoard_boardname) {
		FreeBoard_boardname = freeBoard_boardname;
	}
	public int getFreeBoard_boardno() {
		return FreeBoard_boardno;
	}
	public void setFreeBoard_boardno(int freeBoard_boardno) {
		FreeBoard_boardno = freeBoard_boardno;
	}
	public String getFreeLikes_userId() {
		return FreeLikes_userId;
	}
	public void setFreeLikes_userId(String freeLikes_userId) {
		FreeLikes_userId = freeLikes_userId;
	}
	public String getFreeLikes_nickname() {
		return FreeLikes_nickname;
	}
	public void setFreeLikes_nickname(String freeLikes_nickname) {
		FreeLikes_nickname = freeLikes_nickname;
	}
	public Date getFreeLikes_date() {
		return FreeLikes_date;
	}
	public void setFreeLikes_date(Date freeLikes_date) {
		FreeLikes_date = freeLikes_date;
	}
	@Override
	public String toString() {
		return "FreeLikes [FreeBoard_boardname=" + FreeBoard_boardname + ", FreeBoard_boardno=" + FreeBoard_boardno
				+ ", FreeLikes_userId=" + FreeLikes_userId + ", FreeLikes_nickname=" + FreeLikes_nickname
				+ ", FreeLikes_date=" + FreeLikes_date + "]";
	}
	
	
	

}
