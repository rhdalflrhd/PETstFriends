package model;

import java.sql.Date;

public class FreeComment {
	private int FreeBoard_boardname;
	private int FreeComments_commentno;
	private String FreeComments_nickname;
	private String FreeComments_userId;
	private String FreeComments_content;
	private Date FreeComments_writeDate;
	public int getFreeBoard_boardname() {
		return FreeBoard_boardname;
	}
	public void setFreeBoard_boardname(int freeBoard_boardname) {
		FreeBoard_boardname = freeBoard_boardname;
	}
	public int getFreeComments_commentno() {
		return FreeComments_commentno;
	}
	public void setFreeComments_commentno(int freeComments_commentno) {
		FreeComments_commentno = freeComments_commentno;
	}
	public String getFreeComments_nickname() {
		return FreeComments_nickname;
	}
	public void setFreeComments_nickname(String freeComments_nickname) {
		FreeComments_nickname = freeComments_nickname;
	}
	public String getFreeComments_userId() {
		return FreeComments_userId;
	}
	public void setFreeComments_userId(String freeComments_userId) {
		FreeComments_userId = freeComments_userId;
	}
	public String getFreeComments_content() {
		return FreeComments_content;
	}
	public void setFreeComments_content(String freeComments_content) {
		FreeComments_content = freeComments_content;
	}
	public Date getFreeComments_writeDate() {
		return FreeComments_writeDate;
	}
	public void setFreeComments_writeDate(Date freeComments_writeDate) {
		FreeComments_writeDate = freeComments_writeDate;
	}
	@Override
	public String toString() {
		return "FreeComment [FreeBoard_boardname=" + FreeBoard_boardname + ", FreeComments_commentno="
				+ FreeComments_commentno + ", FreeComments_nickname=" + FreeComments_nickname + ", FreeComments_userId="
				+ FreeComments_userId + ", FreeComments_content=" + FreeComments_content + ", FreeComments_writeDate="
				+ FreeComments_writeDate + "]";
	}

	

}
