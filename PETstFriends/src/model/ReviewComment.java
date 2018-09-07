package model;

public class ReviewComment {
	int boardname;
	int meeting_boardno;
	int reviewno;
	int reviewComment_commentno;
	String reviewComment_nickname;
	String reviewComment_content;
	String reviewComment_userId;
	String reviewComment_writeDate;
	public int getBoardname() {
		return boardname;
	}
	public void setBoardname(int boardname) {
		this.boardname = boardname;
	}
	

	public int getMeeting_boardno() {
		return meeting_boardno;
	}
	public void setMeeting_boardno(int meeting_boardno) {
		this.meeting_boardno = meeting_boardno;
	}
	public int getReviewno() {
		return reviewno;
	}
	public void setReviewno(int reviewno) {
		this.reviewno = reviewno;
	}
	public int getReviewComment_commentno() {
		return reviewComment_commentno;
	}
	public void setReviewComment_commentno(int reviewComment_commentno) {
		this.reviewComment_commentno = reviewComment_commentno;
	}
	public String getReviewComment_nickname() {
		return reviewComment_nickname;
	}
	public void setReviewComment_nickname(String reviewComment_nickname) {
		this.reviewComment_nickname = reviewComment_nickname;
	}
	public String getReviewComment_content() {
		return reviewComment_content;
	}
	public void setReviewComment_content(String reviewComment_content) {
		this.reviewComment_content = reviewComment_content;
	}
	public String getReviewComment_userId() {
		return reviewComment_userId;
	}
	public void setReviewComment_userId(String reviewComment_userId) {
		this.reviewComment_userId = reviewComment_userId;
	}

	public String getReviewComment_writeDate() {
		return reviewComment_writeDate;
	}
	public void setReviewComment_writeDate(String reviewComment_writeDate) {
		this.reviewComment_writeDate = reviewComment_writeDate;
	}
	@Override
	public String toString() {
		return "ReviewComment [boardname=" + boardname + ", meeting_boardno=" + meeting_boardno + ", reviewno="
				+ reviewno + ", reviewComment_commentno=" + reviewComment_commentno + ", reviewComment_nickname="
				+ reviewComment_nickname + ", reviewComment_content=" + reviewComment_content
				+ ", reviewComment_userId=" + reviewComment_userId + ", reviewComment_writeDate="
				+ reviewComment_writeDate + "]";
	}


}
