package model;

import java.sql.Date;

public class FreeComment {
	private int freeBoard_boardname;
	private int freeBoard_boardno;
	private int freeComments_commentno;
	private String freeComments_nickname;
	private String freeComments_userId;
	private String freeComments_content;
	private String freeComments_writeDate;
	private int freeComments_parent;
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
	public String getFreeComments_writeDate() {
		return freeComments_writeDate;
	}
	public void setFreeComments_writeDate(String freeComments_writeDate) {
		this.freeComments_writeDate = freeComments_writeDate;
	}
	public int getFreeComments_parent() {
		return freeComments_parent;
	}
	public void setFreeComments_parent(int freeComments_parent) {
		this.freeComments_parent = freeComments_parent;
	}
	@Override
	public String toString() {
		return "FreeComment [freeBoard_boardname=" + freeBoard_boardname + ", freeBoard_boardno=" + freeBoard_boardno
				+ ", freeComments_commentno=" + freeComments_commentno + ", freeComments_nickname="
				+ freeComments_nickname + ", freeComments_userId=" + freeComments_userId + ", freeComments_content="
				+ freeComments_content + ", freeComments_writeDate=" + freeComments_writeDate + ", freeComments_parent="
				+ freeComments_parent + "]";
	}
	
	

}
