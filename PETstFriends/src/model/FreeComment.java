package model;

import java.sql.Date;

public class FreeComment {
	private int freeBoard_boardname;
	private int freeComments_commentno;
	private String freeComments_nickname;
	private String freeComments_userId;
	private String freeComments_content;
	private Date freeComments_writeDate;
	public int getFreeBoard_boardname() {
		return freeBoard_boardname;
	}
	public void setFreeBoard_boardname(int freeBoard_boardname) {
		this.freeBoard_boardname = freeBoard_boardname;
	}
	public int getFreeComments_commentno() {
		return freeComments_commentno;
	}
	public void setFreeComments_commentno(int freeComments_commentno) {
		this.freeComments_commentno = freeComments_commentno;
	}
	public String getFreeComments_nickname() {
		return freeComments_nickname;
	}
	public void setFreeComments_nickname(String freeComments_nickname) {
		this.freeComments_nickname = freeComments_nickname;
	}
	public String getFreeComments_userId() {
		return freeComments_userId;
	}
	public void setFreeComments_userId(String freeComments_userId) {
		this.freeComments_userId = freeComments_userId;
	}
	public String getFreeComments_content() {
		return freeComments_content;
	}
	public void setFreeComments_content(String freeComments_content) {
		this.freeComments_content = freeComments_content;
	}
	public Date getFreeComments_writeDate() {
		return freeComments_writeDate;
	}
	public void setFreeComments_writeDate(Date freeComments_writeDate) {
		this.freeComments_writeDate = freeComments_writeDate;
	}
	

}
