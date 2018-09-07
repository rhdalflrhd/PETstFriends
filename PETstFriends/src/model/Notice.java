package model;

public class Notice {
	private int notice_boardno;
	private String notice_title;
	private String notice_writeDate;
	private int notice_readCount;
	private String notice_content;
	private String notice_contentPic;
	private String notice_adminId;
	
	public int getNotice_boardno() {
		return notice_boardno;
	}

	public void setNotice_boardno(int notice_boardno) {
		this.notice_boardno = notice_boardno;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_writeDate() {
		return notice_writeDate;
	}

	public void setNotice_writeDate(String notice_writeDate) {
		this.notice_writeDate = notice_writeDate;
	}

	public int getNotice_readCount() {
		return notice_readCount;
	}

	public void setNotice_readCount(int notice_readCount) {
		this.notice_readCount = notice_readCount;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_contentPic() {
		return notice_contentPic;
	}

	public void setNotice_contentPic(String notice_contentPic) {
		this.notice_contentPic = notice_contentPic;
	}

	public String getNotice_adminId() {
		return notice_adminId;
	}

	public void setNotice_adminId(String notice_adminId) {
		this.notice_adminId = notice_adminId;
	}

	@Override
	public String toString() {
		return "Notice [notice_boardno=" + notice_boardno + ", notice_title=" + notice_title + ", notice_writeDate="
				+ notice_writeDate + ", notice_readCount=" + notice_readCount + ", notice_content=" + notice_content
				+ ", notice_contentPic=" + notice_contentPic + ", notice_adminId=" + notice_adminId + "]";
	}

	
}
