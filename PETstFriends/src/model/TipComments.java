package model;

import java.util.Date;

public class TipComments {
	//
	private int tipComments_boardname;
	private int tipComments_boardno;
	private int tipComments_commentno;
	private String tipComments_nickname;
	private String tipComments_userId;
	private String tipComments_content;
	private String tipComments_writeDate;
	private int tipComments_parent;
	
	public int getTipComments_boardname() {
		return tipComments_boardname;
	}
	public void setTipComments_boardname(int tipComments_boardname) {
		this.tipComments_boardname = tipComments_boardname;
	}
	public int getTipComments_boardno() {
		return tipComments_boardno;
	}
	public void setTipComments_boardno(int tipComments_boardno) {
		this.tipComments_boardno = tipComments_boardno;
	}
	public int getTipComments_commentno() {
		return tipComments_commentno;
	}
	public void setTipComments_commentno(int tipComments_commentno) {
		this.tipComments_commentno = tipComments_commentno;
	}
	public String getTipComments_nickname() {
		return tipComments_nickname;
	}
	public void setTipComments_nickname(String tipComments_nickname) {
		this.tipComments_nickname = tipComments_nickname;
	}
	public String getTipComments_userId() {
		return tipComments_userId;
	}
	public void setTipComments_userId(String tipComments_userId) {
		this.tipComments_userId = tipComments_userId;
	}
	public String getTipComments_content() {
		return tipComments_content;
	}
	public void setTipComments_content(String tipComments_content) {
		this.tipComments_content = tipComments_content;
	}
	public String getTipComments_writeDate() {
		return tipComments_writeDate;
	}
	public void setTipComments_writeDate(String tipComments_writeDate) {
		this.tipComments_writeDate = tipComments_writeDate;
	}
	public int getTipComments_parent() {
		return tipComments_parent;
	}
	public void setTipComments_parent(int tipComments_parent) {
		this.tipComments_parent = tipComments_parent;
	}
	@Override
	public String toString() {
		return "TipComments [tipComments_boardname=" + tipComments_boardname + ", tipComments_boardno="
				+ tipComments_boardno + ", tipComments_commentno=" + tipComments_commentno + ", tipComments_nickname="
				+ tipComments_nickname + ", tipComments_userId=" + tipComments_userId + ", tipComments_content="
				+ tipComments_content + ", tipComments_writeDate=" + tipComments_writeDate + ", tipComments_parent="
				+ tipComments_parent + "]";
	}


}
