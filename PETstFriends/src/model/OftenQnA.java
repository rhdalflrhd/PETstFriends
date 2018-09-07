package model;

public class OftenQnA {
	private int oftenQnA_boardno;
	private String oftenQnA_title;
	private int oftenQnA_readCount;
	private String oftenQnA_content;
	private String oftenQnA_adminId;
	private String oftenQnA_writeDate;
	public int getOftenQnA_boardno() {
		return oftenQnA_boardno;
	}
	public void setOftenQnA_boardno(int oftenQnA_boardno) {
		this.oftenQnA_boardno = oftenQnA_boardno;
	}
	public String getOftenQnA_title() {
		return oftenQnA_title;
	}
	public void setOftenQnA_title(String oftenQnA_title) {
		this.oftenQnA_title = oftenQnA_title;
	}
	public int getOftenQnA_readCount() {
		return oftenQnA_readCount;
	}
	public void setOftenQnA_readCount(int oftenQnA_readCount) {
		this.oftenQnA_readCount = oftenQnA_readCount;
	}
	public String getOftenQnA_content() {
		return oftenQnA_content;
	}
	public void setOftenQnA_content(String oftenQnA_content) {
		this.oftenQnA_content = oftenQnA_content;
	}
	public String getOftenQnA_adminId() {
		return oftenQnA_adminId;
	}
	public void setOftenQnA_adminId(String oftenQnA_adminId) {
		this.oftenQnA_adminId = oftenQnA_adminId;
	}
	public String getOftenQnA_writeDate() {
		return oftenQnA_writeDate;
	}
	public void setOftenQnA_writeDate(String oftenQnA_writeDate) {
		this.oftenQnA_writeDate = oftenQnA_writeDate;
	}
	@Override
	public String toString() {
		return "OftenQnA [oftenQnA_boardno=" + oftenQnA_boardno + ", oftenQnA_title=" + oftenQnA_title
				+ ", oftenQnA_readCount=" + oftenQnA_readCount + ", oftenQnA_content=" + oftenQnA_content
				+ ", oftenQnA_adminId=" + oftenQnA_adminId + ", oftenQnA_writeDate=" + oftenQnA_writeDate + "]";
	}
	
}
