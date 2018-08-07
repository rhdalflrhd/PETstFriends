package model;

import java.sql.Date;

public class FreeBoard {
	private int FreeBoard_boaedname;
	private String FreeBoard_userId;
	private String FreeBoard_nickname;	
	private String FreeBoard_title;
	private String FreeBoard_file;
	private String FreeBoard_content;
	private int FreeBoard_readCount;
	private String FreeBoard_YoutubeUrl;
	private Date FreeBoard_WriteDate;
	private String FreeBoard_contentPic1;
	private String FreeBoard_contentPic2;
	private String FreeBoard_contentPic3;
	private String FreeBoard_contentPic4;
	private String FreeBoard_contentPic5;
	private int FreeBoard_LikeCount;
	
	public int getFreeBoard_boaedname() {
		return FreeBoard_boaedname;
	}
	public void setFreeBoard_boaedname(int freeBoard_boaedname) {
		FreeBoard_boaedname = freeBoard_boaedname;
	}
	public String getFreeBoard_userid() {
		return FreeBoard_userId;
	}
	public void setFreeBoard_userid(String freeBoard_userid) {
		FreeBoard_userId = freeBoard_userid;
	}
	public String getFreeBoard_title() {
		return FreeBoard_title;
	}
	public void setFreeBoard_title(String freeBoard_title) {
		FreeBoard_title = freeBoard_title;
	}
	public String getFreeBoard_file() {
		return FreeBoard_file;
	}
	public void setFreeBoard_file(String freeBoard_file) {
		FreeBoard_file = freeBoard_file;
	}
	public int getFreeBoard_readCount() {
		return FreeBoard_readCount;
	}
	public void setFreeBoard_readCount(int freeBoard_readCount) {
		FreeBoard_readCount = freeBoard_readCount;
	}
	public Date getFreeBoard_writeDate() {
		return FreeBoard_WriteDate;
	}
	public void setFreeBoard_writeDate(Date freeBoard_writeDate) {
		FreeBoard_WriteDate = freeBoard_writeDate;
	}
	public String getFreeBoard_contentPic1() {
		return FreeBoard_contentPic1;
	}
	public void setFreeBoard_contentPic1(String freeBoard_contentPic1) {
		FreeBoard_contentPic1 = freeBoard_contentPic1;
	}
	public String getFreeBoard_contentPic2() {
		return FreeBoard_contentPic2;
	}
	public void setFreeBoard_contentPic2(String freeBoard_contentPic2) {
		FreeBoard_contentPic2 = freeBoard_contentPic2;
	}
	public String getFreeBoard_contentPic3() {
		return FreeBoard_contentPic3;
	}
	public void setFreeBoard_contentPic3(String freeBoard_contentPic3) {
		FreeBoard_contentPic3 = freeBoard_contentPic3;
	}
	public String getFreeBoard_contentPic4() {
		return FreeBoard_contentPic4;
	}
	public void setFreeBoard_contentPic4(String freeBoard_contentPic4) {
		FreeBoard_contentPic4 = freeBoard_contentPic4;
	}
	public String getFreeBoard_contentPic5() {
		return FreeBoard_contentPic5;
	}
	public void setFreeBoard_contentPic5(String freeBoard_contentPic5) {
		FreeBoard_contentPic5 = freeBoard_contentPic5;
	}
	
	
	public String getFreeBoard_userId() {
		return FreeBoard_userId;
	}
	public void setFreeBoard_userId(String freeBoard_userId) {
		FreeBoard_userId = freeBoard_userId;
	}
	public String getFreeBoard_nickname() {
		return FreeBoard_nickname;
	}
	public void setFreeBoard_nickname(String freeBoard_nickname) {
		FreeBoard_nickname = freeBoard_nickname;
	}
	public String getFreeBoard_content() {
		return FreeBoard_content;
	}
	public void setFreeBoard_content(String freeBoard_content) {
		FreeBoard_content = freeBoard_content;
	}
	public String getFreeBoard_YoutubeUrl() {
		return FreeBoard_YoutubeUrl;
	}
	public void setFreeBoard_YoutubeUrl(String freeBoard_YoutubeUrl) {
		FreeBoard_YoutubeUrl = freeBoard_YoutubeUrl;
	}
	public Date getFreeBoard_WriteDate() {
		return FreeBoard_WriteDate;
	}
	public void setFreeBoard_WriteDate(Date freeBoard_WriteDate) {
		FreeBoard_WriteDate = freeBoard_WriteDate;
	}
	public int getFreeBoard_LikeCount() {
		return FreeBoard_LikeCount;
	}
	public void setFreeBoard_LikeCount(int freeBoard_LikeCount) {
		FreeBoard_LikeCount = freeBoard_LikeCount;
	}
	@Override
	public String toString() {
		return "FreeBoard [FreeBoard_boaedname=" + FreeBoard_boaedname + ", FreeBoard_userId=" + FreeBoard_userId
				+ ", FreeBoard_nickname=" + FreeBoard_nickname + ", FreeBoard_title=" + FreeBoard_title
				+ ", FreeBoard_file=" + FreeBoard_file + ", FreeBoard_content=" + FreeBoard_content
				+ ", FreeBoard_readCount=" + FreeBoard_readCount + ", FreeBoard_YoutubeUrl=" + FreeBoard_YoutubeUrl
				+ ", FreeBoard_WriteDate=" + FreeBoard_WriteDate + ", FreeBoard_contentPic1=" + FreeBoard_contentPic1
				+ ", FreeBoard_contentPic2=" + FreeBoard_contentPic2 + ", FreeBoard_contentPic3="
				+ FreeBoard_contentPic3 + ", FreeBoard_contentPic4=" + FreeBoard_contentPic4
				+ ", FreeBoard_contentPic5=" + FreeBoard_contentPic5 + ", FreeBoard_LikeCount=" + FreeBoard_LikeCount
				+ "]";
	}

	
	
	
}
