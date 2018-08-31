package model;

import java.util.Date;

public class TipComments {

	private String tipComments_boardname;
	private String tipComments_boardno;
	private String tipComments_commentno;
	private String tipComments_groupno;
	private String tipComments_depth;
	private String tipComments_id;
	private String tipComments_nickname;
	private String tipComments_content;
	private String tipComments_writeDate;
	public String getTipComments_boardname() {
		return tipComments_boardname;
	}
	public void setTipComments_boardname(String tipComments_boardname) {
		this.tipComments_boardname = tipComments_boardname;
	}
	public String getTipComments_boardno() {
		return tipComments_boardno;
	}
	public void setTipComments_boardno(String tipComments_boardno) {
		this.tipComments_boardno = tipComments_boardno;
	}
	public String getTipComments_commentno() {
		return tipComments_commentno;
	}
	public void setTipComments_commentno(String tipComments_commentno) {
		this.tipComments_commentno = tipComments_commentno;
	}
	public String getTipComments_groupno() {
		return tipComments_groupno;
	}
	public void setTipComments_groupno(String tipComments_groupno) {
		this.tipComments_groupno = tipComments_groupno;
	}
	public String getTipComments_depth() {
		return tipComments_depth;
	}
	public void setTipComments_depth(String tipComments_depth) {
		this.tipComments_depth = tipComments_depth;
	}
	public String getTipComments_id() {
		return tipComments_id;
	}
	public void setTipComments_id(String tipComments_id) {
		this.tipComments_id = tipComments_id;
	}
	public String getTipComments_nickname() {
		return tipComments_nickname;
	}
	public void setTipComments_nickname(String tipComments_nickname) {
		this.tipComments_nickname = tipComments_nickname;
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
	@Override
	public String toString() {
		return "TipComments [tipComments_boardname=" + tipComments_boardname + ", tipComments_boardno="
				+ tipComments_boardno + ", tipComments_commentno=" + tipComments_commentno + ", tipComments_groupno="
				+ tipComments_groupno + ", tipComments_depth=" + tipComments_depth + ", tipComments_id="
				+ tipComments_id + ", tipComments_nickname=" + tipComments_nickname + ", tipComments_content="
				+ tipComments_content + ", tipComments_writeDate=" + tipComments_writeDate + "]";
	}
	
	
}
