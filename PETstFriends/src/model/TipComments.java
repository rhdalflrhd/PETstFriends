package model;

import java.util.Date;

public class TipComments {

	private int TipComments_no;
	private int TipComments_groupno;
	private String TipComments_id;
	private String TipComments_nickname;
	private String TipComments_content;
	private Date TipComments_writeDate;
	
	public int getTipComments_no() {
		return TipComments_no;
	}
	public void setTipComments_no(int tipComments_no) {
		TipComments_no = tipComments_no;
	}
	public int getTipComments_groupno() {
		return TipComments_groupno;
	}
	public void setTipComments_groupno(int tipComments_groupno) {
		TipComments_groupno = tipComments_groupno;
	}
	public String getTipComments_id() {
		return TipComments_id;
	}
	public void setTipComments_id(String tipComments_id) {
		TipComments_id = tipComments_id;
	}
	public String getTipComments_nickname() {
		return TipComments_nickname;
	}
	public void setTipComments_nickname(String tipComments_nickname) {
		TipComments_nickname = tipComments_nickname;
	}
	public String getTipComments_content() {
		return TipComments_content;
	}
	public void setTipComments_content(String tipComments_content) {
		TipComments_content = tipComments_content;
	}
	public Date getTipComments_writeDate() {
		return TipComments_writeDate;
	}
	public void setTipComments_writeDate(Date tipComments_writeDate) {
		TipComments_writeDate = tipComments_writeDate;
	}
	@Override
	public String toString() {
		return "TipComments [TipComments_no=" + TipComments_no + ", TipComments_groupno=" + TipComments_groupno
				+ ", TipComments_id=" + TipComments_id + ", TipComments_nickname=" + TipComments_nickname
				+ ", TipComments_content=" + TipComments_content + ", TipComments_writeDate=" + TipComments_writeDate
				+ "]";
	}
	

}
