package model;

import java.util.Date;

public class TipBoard {

	private int TipBoard_boardname;
	private int TipBoard_boardno;
	private String TipBoard_userId;
	private String TipBoard_nickname;
	private String TipBoard_title;
	private String TipBoard_file;
	private String TipBoard_content;
	private int TipBoard_readCount;
	private Date TipBoard_writeDate;
	private String TipBoard_YoutubeUrl;
	private String TipBoard_contentPic;
	private int TipBoard__LikeCount;
	
	
	public int getTipBoard_boardname() {
		return TipBoard_boardname;
	}
	public void setTipBoard_boardname(int tipBoard_boardname) {
		TipBoard_boardname = tipBoard_boardname;
	}
	public int getTipBoard_boardno() {
		return TipBoard_boardno;
	}
	public void setTipBoard_boardno(int tipBoard_boardno) {
		TipBoard_boardno = tipBoard_boardno;
	}
	public String getTipBoard_userId() {
		return TipBoard_userId;
	}
	public void setTipBoard_userId(String tipBoard_userId) {
		TipBoard_userId = tipBoard_userId;
	}
	public String getTipBoard_nickname() {
		return TipBoard_nickname;
	}
	public void setTipBoard_nickname(String tipBoard_nickname) {
		TipBoard_nickname = tipBoard_nickname;
	}
	public String getTipBoard_title() {
		return TipBoard_title;
	}
	public void setTipBoard_title(String tipBoard_title) {
		TipBoard_title = tipBoard_title;
	}
	public String getTipBoard_file() {
		return TipBoard_file;
	}
	public void setTipBoard_file(String tipBoard_file) {
		TipBoard_file = tipBoard_file;
	}
	public String getTipBoard_content() {
		return TipBoard_content;
	}
	public void setTipBoard_content(String tipBoard_content) {
		TipBoard_content = tipBoard_content;
	}
	public int getTipBoard_readCount() {
		return TipBoard_readCount;
	}
	public void setTipBoard_readCount(int tipBoard_readCount) {
		TipBoard_readCount = tipBoard_readCount;
	}
	public Date getTipBoard_writeDate() {
		return TipBoard_writeDate;
	}
	public void setTipBoard_writeDate(Date tipBoard_writeDate) {
		TipBoard_writeDate = tipBoard_writeDate;
	}
	public String getTipBoard_YoutubeUrl() {
		return TipBoard_YoutubeUrl;
	}
	public void setTipBoard_YoutubeUrl(String tipBoard_YoutubeUrl) {
		TipBoard_YoutubeUrl = tipBoard_YoutubeUrl;
	}
	public String getTipBoard_contentPic() {
		return TipBoard_contentPic;
	}
	public void setTipBoard_contentPic(String tipBoard_contentPic) {
		TipBoard_contentPic = tipBoard_contentPic;
	}
	public int getTipBoard__LikeCount() {
		return TipBoard__LikeCount;
	}
	public void setTipBoard__LikeCount(int tipBoard__LikeCount) {
		TipBoard__LikeCount = tipBoard__LikeCount;
	}
	@Override
	public String toString() {
		return "TipBoard [TipBoard_boardname=" + TipBoard_boardname + ", TipBoard_boardno=" + TipBoard_boardno
				+ ", TipBoard_userId=" + TipBoard_userId + ", TipBoard_nickname=" + TipBoard_nickname
				+ ", TipBoard_title=" + TipBoard_title + ", TipBoard_file=" + TipBoard_file + ", TipBoard_content="
				+ TipBoard_content + ", TipBoard_readCount=" + TipBoard_readCount + ", TipBoard_writeDate="
				+ TipBoard_writeDate + ", TipBoard_YoutubeUrl=" + TipBoard_YoutubeUrl + ", TipBoard_contentPic="
				+ TipBoard_contentPic + ", TipBoard__LikeCount=" + TipBoard__LikeCount + "]";
	}

	
}
