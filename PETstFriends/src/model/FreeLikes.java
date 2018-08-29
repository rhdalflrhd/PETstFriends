package model;

import java.sql.Date;

public class FreeLikes {
	private int freeBoard_boardname;
	private int freeBoard_boardno;
	private String freeLikes_userId;
	private String freeLikes_nickname;
	private Date freeLikes_date;
	public int getFreeBoard_boardname() {
		return freeBoard_boardname;
	}
	public void setFreeBoard_boardname(int freeBoard_boardname) {
		this.freeBoard_boardname = freeBoard_boardname;
	}
	public int getFreeBoard_boardno() {
		return freeBoard_boardno;
	}
	public void setFreeBoard_boardno(int freeBoard_boardno) {
		this.freeBoard_boardno = freeBoard_boardno;
	}
	public String getFreeLikes_userId() {
		return freeLikes_userId;
	}
	public void setFreeLikes_userId(String freeLikes_userId) {
		this.freeLikes_userId = freeLikes_userId;
	}
	public String getFreeLikes_nickname() {
		return freeLikes_nickname;
	}
	public void setFreeLikes_nickname(String freeLikes_nickname) {
		this.freeLikes_nickname = freeLikes_nickname;
	}
	public Date getFreeLikes_date() {
		return freeLikes_date;
	}
	public void setFreeLikes_date(Date freeLikes_date) {
		this.freeLikes_date = freeLikes_date;
	}
	@Override
	public String toString() {
		return "FreeLikes [freeBoard_boardname=" + freeBoard_boardname + ", freeBoard_boardno=" + freeBoard_boardno
				+ ", freeLikes_userId=" + freeLikes_userId + ", freeLikes_nickname=" + freeLikes_nickname
				+ ", freeLikes_date=" + freeLikes_date + "]";
	}

}
