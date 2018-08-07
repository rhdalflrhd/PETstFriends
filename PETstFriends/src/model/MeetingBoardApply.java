package model;

public class MeetingBoardApply {
	int boardname;
	int meeting_boardno;
	String meetingBoardApply_userId;
	String meetingBoardApply_email;
	int meetingBoardApply_count;
	String meetingBoardApply_nickname;
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
	public String getMeetingBoardApply_userId() {
		return meetingBoardApply_userId;
	}
	public void setMeetingBoardApply_userId(String meetingBoardApply_userId) {
		this.meetingBoardApply_userId = meetingBoardApply_userId;
	}
	public String getMeetingBoardApply_email() {
		return meetingBoardApply_email;
	}
	public void setMeetingBoardApply_email(String meetingBoardApply_email) {
		this.meetingBoardApply_email = meetingBoardApply_email;
	}
	public int getMeetingBoardApply_count() {
		return meetingBoardApply_count;
	}
	public void setMeetingBoardApply_count(int meetingBoardApply_count) {
		this.meetingBoardApply_count = meetingBoardApply_count;
	}
	public String getMeetingBoardApply_nickname() {
		return meetingBoardApply_nickname;
	}
	public void setMeetingBoardApply_nickname(String meetingBoardApply_nickname) {
		this.meetingBoardApply_nickname = meetingBoardApply_nickname;
	}
	@Override
	public String toString() {
		return "MeetingBoardApply [boardname=" + boardname + ", meeting_boardno=" + meeting_boardno
				+ ", meetingBoardApply_userId=" + meetingBoardApply_userId + ", meetingBoardApply_email="
				+ meetingBoardApply_email + ", meetingBoardApply_count=" + meetingBoardApply_count
				+ ", meetingBoardApply_nickname=" + meetingBoardApply_nickname + "]";
	}

}
