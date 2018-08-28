package dao;

import java.util.HashMap;
import java.util.List;

import model.MeetingComment;

public interface MeetingCommentDao {
	public boolean insertComment(MeetingComment mComment);
	public boolean updateComment(MeetingComment mComment);
	public boolean deleteComment(HashMap<String, Object> params);
	public MeetingComment selectCommentOne(HashMap<String, Object> params);
	public List<MeetingComment> selectCommentAll(int meeting_boardno);

	
}
