package model;

import java.util.Date;

public class QnA {
	private int qnA_boardname;
	private int num;
	private String qnA_adminId;
	private String qnA_userId;
	private String qnA_title;
	private String qnA_content;
	private String qnA_contentPic;
	private String qnA_reply;
	private Date qnA_writeDate;
	
	
	
	
	
	public int getQnA_boardname() {
		return qnA_boardname;
	}





	public void setQnA_boardname(int qnA_boardname) {
		this.qnA_boardname = qnA_boardname;
	}





	public int getNum() {
		return num;
	}





	public void setNum(int num) {
		this.num = num;
	}





	public String getQnA_adminId() {
		return qnA_adminId;
	}





	public void setQnA_adminId(String qnA_adminId) {
		this.qnA_adminId = qnA_adminId;
	}





	public String getQnA_userId() {
		return qnA_userId;
	}





	public void setQnA_userId(String qnA_userId) {
		this.qnA_userId = qnA_userId;
	}





	public String getQnA_title() {
		return qnA_title;
	}





	public void setQnA_title(String qnA_title) {
		this.qnA_title = qnA_title;
	}





	public String getQnA_content() {
		return qnA_content;
	}





	public void setQnA_content(String qnA_content) {
		this.qnA_content = qnA_content;
	}





	public String getQnA_contentPic() {
		return qnA_contentPic;
	}





	public void setQnA_contentPic(String qnA_contentPic) {
		this.qnA_contentPic = qnA_contentPic;
	}





	public String getQnA_reply() {
		return qnA_reply;
	}





	public void setQnA_reply(String qnA_reply) {
		this.qnA_reply = qnA_reply;
	}





	public Date getQnA_writeDate() {
		return qnA_writeDate;
	}





	public void setQnA_writeDate(Date qnA_writeDate) {
		this.qnA_writeDate = qnA_writeDate;
	}





	@Override
	public String toString() {
		return "QnA [qnA_boardname=" + qnA_boardname + ", num=" + num + ", qnA_adminId=" + qnA_adminId + ", qnA_userId="
				+ qnA_userId + ", qnA_title=" + qnA_title + ", qnA_content=" + qnA_content + ", qnA_contentPic="
				+ qnA_contentPic + ", qnA_reply=" + qnA_reply + ", qnA_writeDate=" + qnA_writeDate + "]";
	}
	
	
	
}
