package model;

import java.sql.Date;

public class FreeBoard {
	private int freeBoard_boardno;
	private int freeBoard_boardname;
	private String freeBoard_userid;
	private String freeBoard_nickname;	
	private String freeBoard_title;
	private String freeBoard_file;
	private String freeBoard_content;
	private int freeBoard_readCount;
	private String freeBoard_YoutubeUrl;
	private Date freeBoard_WriteDate;
	private String freeBoard_contentPic;
	private int freeBoard_LikeCount;
	public int getFreeBoard_boardno() {
		return freeBoard_boardno;
	}
	public void setFreeBoard_boardno(int freeBoard_boardno) {
		this.freeBoard_boardno = freeBoard_boardno;
	}
	public int getFreeBoard_boardname() {
		return freeBoard_boardname;
	}
	public void setFreeBoard_boardname(int freeBoard_boardname) {
		this.freeBoard_boardname = freeBoard_boardname;
	}
	public String getFreeBoard_userid() {
		return freeBoard_userid;
	}
	public void setFreeBoard_userid(String freeBoard_userid) {
		this.freeBoard_userid = freeBoard_userid;
	}
	public String getFreeBoard_nickname() {
		return freeBoard_nickname;
	}
	public void setFreeBoard_nickname(String freeBoard_nickname) {
		this.freeBoard_nickname = freeBoard_nickname;
	}
	public String getFreeBoard_title() {
		return freeBoard_title;
	}
	public void setFreeBoard_title(String freeBoard_title) {
		this.freeBoard_title = freeBoard_title;
	}
	public String getFreeBoard_file() {
		return freeBoard_file;
	}
	public void setFreeBoard_file(String freeBoard_file) {
		this.freeBoard_file = freeBoard_file;
	}
	public String getFreeBoard_content() {
		return freeBoard_content;
	}
	public void setFreeBoard_content(String freeBoard_content) {
		this.freeBoard_content = freeBoard_content;
	}
	public int getFreeBoard_readCount() {
		return freeBoard_readCount;
	}
	public void setFreeBoard_readCount(int freeBoard_readCount) {
		this.freeBoard_readCount = freeBoard_readCount;
	}
	public String getFreeBoard_YoutubeUrl() {
		return freeBoard_YoutubeUrl;
	}
	public void setFreeBoard_YoutubeUrl(String freeBoard_YoutubeUrl) {
		this.freeBoard_YoutubeUrl = freeBoard_YoutubeUrl;
	}
	public Date getFreeBoard_WriteDate() {
		return freeBoard_WriteDate;
	}
	public void setFreeBoard_WriteDate(Date freeBoard_WriteDate) {
		this.freeBoard_WriteDate = freeBoard_WriteDate;
	}
	public String getFreeBoard_contentPic() {
		return freeBoard_contentPic;
	}
	public void setFreeBoard_contentPic(String freeBoard_contentPic) {
		this.freeBoard_contentPic = freeBoard_contentPic;
	}
	public int getFreeBoard_LikeCount() {
		return freeBoard_LikeCount;
	}
	public void setFreeBoard_LikeCount(int freeBoard_LikeCount) {
		this.freeBoard_LikeCount = freeBoard_LikeCount;
	}
	@Override
	public String toString() {
		return "FreeBoard [freeBoard_boardno=" + freeBoard_boardno + ", freeBoard_boardname=" + freeBoard_boardname
				+ ", freeBoard_userid=" + freeBoard_userid + ", freeBoard_nickname=" + freeBoard_nickname
				+ ", freeBoard_title=" + freeBoard_title + ", freeBoard_file=" + freeBoard_file + ", freeBoard_content="
				+ freeBoard_content + ", freeBoard_readCount=" + freeBoard_readCount + ", freeBoard_YoutubeUrl="
				+ freeBoard_YoutubeUrl + ", freeBoard_WriteDate=" + freeBoard_WriteDate + ", freeBoard_contentPic="
				+ freeBoard_contentPic + ", freeBoard_LikeCount=" + freeBoard_LikeCount + "]";
	}
	
	


	
	
	
}
