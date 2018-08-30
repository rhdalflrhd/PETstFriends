package model;

import java.sql.Date;

public class FreeComment {
	private int freeBoard_boardname;
	private int freeComments_commentno;
	private String freeComments_nickname;
	private String freeComments_userId;
	private String freeComments_content;
	private Date freeComments_writeDate;
	public int getfreeBoard_boardname() {
		return freeBoard_boardname;
	}
	public void setfreeBoard_boardname(int freeBoard_boardname) {
		freeBoard_boardname = freeBoard_boardname;
	}
	public int getfreeComments_commentno() {
		return freeComments_commentno;
	}
	public void setfreeComments_commentno(int freeComments_commentno) {
		freeComments_commentno = freeComments_commentno;
	}
	public String getfreeComments_nickname() {
		return freeComments_nickname;
	}
	public void setfreeComments_nickname(String freeComments_nickname) {
		freeComments_nickname = freeComments_nickname;
	}
	public String getfreeComments_userId() {
		return freeComments_userId;
	}
	public void setfreeComments_userId(String freeComments_userId) {
		freeComments_userId = freeComments_userId;
	}
	public String getfreeComments_content() {
		return freeComments_content;
	}
	public void setfreeComments_content(String freeComments_content) {
		freeComments_content = freeComments_content;
	}
	public Date getfreeComments_writeDate() {
		return freeComments_writeDate;
	}
	public void setfreeComments_writeDate(Date freeComments_writeDate) {
		freeComments_writeDate = freeComments_writeDate;
	}
	@Override
	public String toString() {
		return "freeComment [freeBoard_boardname=" + freeBoard_boardname + ", freeComments_commentno="
				+ freeComments_commentno + ", freeComments_nickname=" + freeComments_nickname + ", freeComments_userId="
				+ freeComments_userId + ", freeComments_content=" + freeComments_content + ", freeComments_writeDate="
				+ freeComments_writeDate + "]";
	}

	

}
