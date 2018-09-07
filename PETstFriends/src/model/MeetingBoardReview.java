package model;

public class MeetingBoardReview {
	int boardname;
	int meeting_boardno;
	int meetingReview_no;
	String meetingReview_title;
	String meetingReview_pic;
	String meetingReview_content;
	String meetingReview_userid;
	String meetingReview_writeDate;
	String meetingReview_nickname;
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
	public int getMeetingReview_no() {
		return meetingReview_no;
	}
	public void setMeetingReview_no(int meetingReview_no) {
		this.meetingReview_no = meetingReview_no;
	}
	public String getMeetingReview_title() {
		return meetingReview_title;
	}
	public void setMeetingReview_title(String meetingReview_title) {
		this.meetingReview_title = meetingReview_title;
	}
	public String getMeetingReview_pic() {
		return meetingReview_pic;
	}
	public void setMeetingReview_pic(String meetingReview_pic) {
		this.meetingReview_pic = meetingReview_pic;
	}
	public String getMeetingReview_content() {
		return meetingReview_content;
	}
	public void setMeetingReview_content(String meetingReview_content) {
		this.meetingReview_content = meetingReview_content;
	}
	public String getMeetingReview_userid() {
		return meetingReview_userid;
	}
	public void setMeetingReview_userid(String meetingReview_userid) {
		this.meetingReview_userid = meetingReview_userid;
	}

	public String getMeetingReview_writeDate() {
		return meetingReview_writeDate;
	}
	public void setMeetingReview_writeDate(String meetingReview_writeDate) {
		this.meetingReview_writeDate = meetingReview_writeDate;
	}
	public String getMeetingReview_nickname() {
		return meetingReview_nickname;
	}
	public void setMeetingReview_nickname(String meetingReview_nickname) {
		this.meetingReview_nickname = meetingReview_nickname;
	}
	@Override
	public String toString() {
		return "MeetingBoardReview [boardname=" + boardname + ", meeting_boardno=" + meeting_boardno
				+ ", meetingReview_no=" + meetingReview_no + ", meetingReview_title=" + meetingReview_title
				+ ", meetingReview_pic=" + meetingReview_pic + ", meetingReview_content=" + meetingReview_content
				+ ", meetingReview_userid=" + meetingReview_userid + ", meetingReview_writeDate="
				+ meetingReview_writeDate + ", meetingReview_nickname=" + meetingReview_nickname + "]";
	}

}
