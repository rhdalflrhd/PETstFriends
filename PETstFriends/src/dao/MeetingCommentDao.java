package dao;

import java.util.List;

import model.MeetingComment;

public interface MeetingCommentDao {
	public boolean insertComment(MeetingComment mComment);
	public boolean updateComment(MeetingComment mComment);
	public boolean deleteComment(int meetingComment_commentno, int meeting_boardno);
	public MeetingComment selectCommentOne(int meetingComment_commentno, int meeting_boardno);
	public List<MeetingComment> selectCommentAll(int meeting_boardno);

	
}
