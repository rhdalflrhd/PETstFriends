package model;

import java.util.Date;

public class TipLikes {

	private int TipBoard_boardname;
	private int TipBoard_boardno;
	private String TipLikes_userId;
	private String TipLikes_nickname;
	private Date TipLikes_date;
	
	public int getTipBoard_boardname() {
		return TipBoard_boardname;
	}
	public void setTipBoard_boardname(int tipBoard_boardname) {
		TipBoard_boardname = tipBoard_boardname;
	}
	public int getTipBoard_boardno() {
		return TipBoard_boardno;
	}
	public void setTipBoard_boardno(int tipBoard_boardno) {
		TipBoard_boardno = tipBoard_boardno;
	}
	public String getTipLikes_userId() {
		return TipLikes_userId;
	}
	public void setTipLikes_userId(String tipLikes_userId) {
		TipLikes_userId = tipLikes_userId;
	}
	public String getTipLikes_nickname() {
		return TipLikes_nickname;
	}
	public void setTipLikes_nickname(String tipLikes_nickname) {
		TipLikes_nickname = tipLikes_nickname;
	}
	public Date getTipLikes_date() {
		return TipLikes_date;
	}
	public void setTipLikes_date(Date tipLikes_date) {
		TipLikes_date = tipLikes_date;
	}
	@Override
	public String toString() {
		return "TipLikes [TipBoard_boardname=" + TipBoard_boardname + ", TipBoard_boardno=" + TipBoard_boardno
				+ ", TipLikes_userId=" + TipLikes_userId + ", TipLikes_nickname=" + TipLikes_nickname
				+ ", TipLikes_date=" + TipLikes_date + "]";
	}
	
	
	
}
