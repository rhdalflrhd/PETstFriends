package model;

import java.util.Date;

public class MeetingLikes {
	int boardname;
	int reviewno;
	String meetingLikes_userId;
	Date meetingLikes_date;
	public int getBoardname() {
		return boardname;
	}
	public void setBoardname(int boardname) {
		this.boardname = boardname;
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
	@Override
	public String toString() {
		return "MeetingLikes [boardname=" + boardname + ", reviewno=" + reviewno + ", meetingLikes_userId="
				+ meetingLikes_userId + ", meetingLikes_date=" + meetingLikes_date + "]";
	}

}
