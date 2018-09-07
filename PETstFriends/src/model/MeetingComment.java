package model;

import java.util.Date;

public class MeetingComment {
	int boardname;
	int meeting_boardno;
	int meetingComment_commentno;
	String meetingComment_nickname;
	String meetingComment_content;
	String meetingComment_userId;
	Date meetingComment_writeDate;
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
	public int getMeetingComment_commentno() {
		return meetingComment_commentno;
	}
	public void setMeetingComment_commentno(int meetingComment_commentno) {
		this.meetingComment_commentno = meetingComment_commentno;
	}
	public String getMeetingComment_nickname() {
		return meetingComment_nickname;
	}
	public void setMeetingComment_nickname(String meetingComment_nickname) {
		this.meetingComment_nickname = meetingComment_nickname;
	}
	public String getMeetingComment_content() {
		return meetingComment_content;
	}
	public void setMeetingComment_content(String meetingComment_content) {
		this.meetingComment_content = meetingComment_content;
	}
	public String getMeetingComment_userId() {
		return meetingComment_userId;
	}
	public void setMeetingComment_userId(String meetingComment_userId) {
		this.meetingComment_userId = meetingComment_userId;
	}
	public Date getMeetingComment_writeDate() {
		return meetingComment_writeDate;
	}
	public void setMeetingComment_writeDate(Date meetingComment_writeDate) {
		this.meetingComment_writeDate = meetingComment_writeDate;
	}
	@Override
	public String toString() {
		return "MeetingComment [boardname=" + boardname + ", meeting_boardno=" + meeting_boardno
				+ ", meetingComment_commentno=" + meetingComment_commentno + ", meetingComment_nickname="
				+ meetingComment_nickname + ", meetingComment_content=" + meetingComment_content
				+ ", meetingComment_userId=" + meetingComment_userId + ", meetingComment_writeDate="
				+ meetingComment_writeDate + "]";
	}

}
