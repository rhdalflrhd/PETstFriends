package model;

import java.sql.Date;

public class FreeBoard {
	private int FreeBoard_boardno;
	private int FreeBoard_boardname;
	private String FreeBoard_userid;
	private String FreeBoard_nickname;	
	private String FreeBoard_title;
	private String FreeBoard_file;
	private String FreeBoard_content;
	private int FreeBoard_readCount;
	private String FreeBoard_YoutubeUrl;
	private Date FreeBoard_WriteDate;
	private String FreeBoard_contentPic;
	private int FreeBoard_LikeCount;
	public int getFreeBoard_boardno() {
		return FreeBoard_boardno;
	}
	public void setFreeBoard_boardno(int freeBoard_boardno) {
		FreeBoard_boardno = freeBoard_boardno;
	}
	public int getFreeBoard_boardname() {
		return FreeBoard_boardname;
	}
	public void setFreeBoard_boardname(int freeBoard_boardname) {
		FreeBoard_boardname = freeBoard_boardname;
	}
	public String getFreeBoard_userid() {
		return FreeBoard_userid;
	}
	public void setFreeBoard_userid(String freeBoard_userid) {
		FreeBoard_userid = freeBoard_userid;
	}
	public String getFreeBoard_nickname() {
		return FreeBoard_nickname;
	}
	public void setFreeBoard_nickname(String freeBoard_nickname) {
		FreeBoard_nickname = freeBoard_nickname;
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
	public String getFreeBoard_content() {
		return FreeBoard_content;
	}
	public void setFreeBoard_content(String freeBoard_content) {
		FreeBoard_content = freeBoard_content;
	}
	public int getFreeBoard_readCount() {
		return FreeBoard_readCount;
	}
	public void setFreeBoard_readCount(int freeBoard_readCount) {
		FreeBoard_readCount = freeBoard_readCount;
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
	public String getFreeBoard_contentPic() {
		return FreeBoard_contentPic;
	}
	public void setFreeBoard_contentPic(String freeBoard_contentPic) {
		FreeBoard_contentPic = freeBoard_contentPic;
	}
	public int getFreeBoard_LikeCount() {
		return FreeBoard_LikeCount;
	}
	public void setFreeBoard_LikeCount(int freeBoard_LikeCount) {
		FreeBoard_LikeCount = freeBoard_LikeCount;
	}
	@Override
	public String toString() {
		return "FreeBoard [FreeBoard_boardno=" + FreeBoard_boardno + ", FreeBoard_boardname=" + FreeBoard_boardname
				+ ", FreeBoard_userid=" + FreeBoard_userid + ", FreeBoard_nickname=" + FreeBoard_nickname
				+ ", FreeBoard_title=" + FreeBoard_title + ", FreeBoard_file=" + FreeBoard_file + ", FreeBoard_content="
				+ FreeBoard_content + ", FreeBoard_readCount=" + FreeBoard_readCount + ", FreeBoard_YoutubeUrl="
				+ FreeBoard_YoutubeUrl + ", FreeBoard_WriteDate=" + FreeBoard_WriteDate + ", FreeBoard_contentPic="
				+ FreeBoard_contentPic + ", FreeBoard_LikeCount=" + FreeBoard_LikeCount + "]";
	}
	


	
	
	
}
