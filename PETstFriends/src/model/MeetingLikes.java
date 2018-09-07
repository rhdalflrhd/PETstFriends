package model;

import java.util.Date;

public class MeetingLikes {
	int boardname;
	int meeting_boardno;
	int reviewno;
	String meetingLikes_userId;
	Date meetingLikes_date;
	int meetingLikes_count;
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
	public String getMeetingLikes_userId() {
		return meetingLikes_userId;
	}
	public void setMeetingLikes_userId(String meetingLikes_userId) {
		this.meetingLikes_userId = meetingLikes_userId;
	}
	public Date getMeetingLikes_date() {
		return meetingLikes_date;
	}
	public void setMeetingLikes_date(Date meetingLikes_date) {
		this.meetingLikes_date = meetingLikes_date;
	}
	public int getMeetingLikes_count() {
		return meetingLikes_count;
	}
	public void setMeetingLikes_count(int meetingLikes_count) {
		this.meetingLikes_count = meetingLikes_count;
	}
	@Override
	public String toString() {
		return "MeetingLikes [boardname=" + boardname + ", meeting_boardno=" + meeting_boardno + ", reviewno="
				+ reviewno + ", meetingLikes_userId=" + meetingLikes_userId + ", meetingLikes_date=" + meetingLikes_date
				+ ", meetingLikes_count=" + meetingLikes_count + "]";
	}

	

}
