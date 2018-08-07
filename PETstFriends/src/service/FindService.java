package service;

import java.util.HashMap;

import model.MeetingBoard;
import model.QnA;

public interface FindService  {

	public HashMap<String, Object> FindmyWrites(int boardno, int boardname);
	public QnA FindmyInquiry(int boardno, int boardname);
	public HashMap<String, Object > FindmyLikes(int boardno, int boardname);
	public MeetingBoard FindmyMeeting(int boardno, int boardname);
	
	
	
	
}
