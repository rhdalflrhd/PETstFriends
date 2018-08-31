package model;

import java.util.Date;

public class TipLikes {
	//
	private int tipLikes_likeno;
	private int tipLikes_boardname;
	private int tipLikes_boardno;
	private String tipLikes_userId;
	private int tipLikes_likeCheck;
	private Date tipLikes_date;
	public int getTipLikes_likeno() {
		return tipLikes_likeno;
	}
	public void setTipLikes_likeno(int tipLikes_likeno) {
		this.tipLikes_likeno = tipLikes_likeno;
	}
	public int getTipLikes_boardname() {
		return tipLikes_boardname;
	}
	public void setTipLikes_boardname(int tipLikes_boardname) {
		this.tipLikes_boardname = tipLikes_boardname;
	}
	public int getTipLikes_boardno() {
		return tipLikes_boardno;
	}
	public void setTipLikes_boardno(int tipLikes_boardno) {
		this.tipLikes_boardno = tipLikes_boardno;
	}
	public String getTipLikes_userId() {
		return tipLikes_userId;
	}
	public void setTipLikes_userId(String tipLikes_userId) {
		this.tipLikes_userId = tipLikes_userId;
	}
	public int getTipLikes_likeCheck() {
		return tipLikes_likeCheck;
	}
	public void setTipLikes_likeCheck(int tipLikes_likeCheck) {
		this.tipLikes_likeCheck = tipLikes_likeCheck;
	}
	public Date getTipLikes_date() {
		return tipLikes_date;
	}
	public void setTipLikes_date(Date tipLikes_date) {
		this.tipLikes_date = tipLikes_date;
	}
	@Override
	public String toString() {
		return "TipLikes [tipLikes_likeno=" + tipLikes_likeno + ", tipLikes_boardname=" + tipLikes_boardname
				+ ", tipLikes_boardno=" + tipLikes_boardno + ", tipLikes_userId=" + tipLikes_userId
				+ ", tipLikes_likeCheck=" + tipLikes_likeCheck + ", tipLikes_date=" + tipLikes_date + "]";
	}
	
	
}
