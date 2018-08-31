package model;

import java.util.Date;

public class TipBoard {
//
	private int tipBoard_boardname;
	private int tipBoard_boardno;
	private String tipBoard_userId;
	private String tipBoard_nickname;
	private String tipBoard_title;
	private String tipBoard_file;
	private String tipBoard_content;
	private int tipBoard_readCount;
	private Date tipBoard_writeDate;
	private String tipBoard_YoutubeUrl;
	private String tipBoard_contentPic;
	private int tipBoard_LikeCount;
	public int getTipBoard_boardname() {
		return tipBoard_boardname;
	}
	public void setTipBoard_boardname(int tipBoard_boardname) {
		this.tipBoard_boardname = tipBoard_boardname;
	}
	public int getTipBoard_boardno() {
		return tipBoard_boardno;
	}
	public void setTipBoard_boardno(int tipBoard_boardno) {
		this.tipBoard_boardno = tipBoard_boardno;
	}
	public String getTipBoard_userId() {
		return tipBoard_userId;
	}
	public void setTipBoard_userId(String tipBoard_userId) {
		this.tipBoard_userId = tipBoard_userId;
	}
	public String getTipBoard_nickname() {
		return tipBoard_nickname;
	}
	public void setTipBoard_nickname(String tipBoard_nickname) {
		this.tipBoard_nickname = tipBoard_nickname;
	}
	public String getTipBoard_title() {
		return tipBoard_title;
	}
	public void setTipBoard_title(String tipBoard_title) {
		this.tipBoard_title = tipBoard_title;
	}
	public String getTipBoard_file() {
		return tipBoard_file;
	}
	public void setTipBoard_file(String tipBoard_file) {
		this.tipBoard_file = tipBoard_file;
	}
	public String getTipBoard_content() {
		return tipBoard_content;
	}
	public void setTipBoard_content(String tipBoard_content) {
		this.tipBoard_content = tipBoard_content;
	}
	public int getTipBoard_readCount() {
		return tipBoard_readCount;
	}
	public void setTipBoard_readCount(int tipBoard_readCount) {
		this.tipBoard_readCount = tipBoard_readCount;
	}
	public Date getTipBoard_writeDate() {
		return tipBoard_writeDate;
	}
	public void setTipBoard_writeDate(Date tipBoard_writeDate) {
		this.tipBoard_writeDate = tipBoard_writeDate;
	}
	public String getTipBoard_YoutubeUrl() {
		return tipBoard_YoutubeUrl;
	}
	public void setTipBoard_YoutubeUrl(String tipBoard_YoutubeUrl) {
		this.tipBoard_YoutubeUrl = tipBoard_YoutubeUrl;
	}
	public String getTipBoard_contentPic() {
		return tipBoard_contentPic;
	}
	public void setTipBoard_contentPic(String tipBoard_contentPic) {
		this.tipBoard_contentPic = tipBoard_contentPic;
	}
	public int getTipBoard_LikeCount() {
		return tipBoard_LikeCount;
	}
	public void setTipBoard_LikeCount(int tipBoard_LikeCount) {
		this.tipBoard_LikeCount = tipBoard_LikeCount;
	}
	@Override
	public String toString() {
		return "TipBoard [tipBoard_boardname=" + tipBoard_boardname + ", tipBoard_boardno=" + tipBoard_boardno
				+ ", tipBoard_userId=" + tipBoard_userId + ", tipBoard_nickname=" + tipBoard_nickname
				+ ", tipBoard_title=" + tipBoard_title + ", tipBoard_file=" + tipBoard_file + ", tipBoard_content="
				+ tipBoard_content + ", tipBoard_readCount=" + tipBoard_readCount + ", tipBoard_writeDate="
				+ tipBoard_writeDate + ", tipBoard_YoutubeUrl=" + tipBoard_YoutubeUrl + ", tipBoard_contentPic="
				+ tipBoard_contentPic + ", tipBoard_LikeCount=" + tipBoard_LikeCount + "]";
	}
	

	
}
