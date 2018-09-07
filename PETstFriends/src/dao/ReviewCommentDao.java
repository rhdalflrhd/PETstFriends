package dao;

import java.util.HashMap;
import java.util.List;

import model.MeetingComment;
import model.ReviewComment;

public interface ReviewCommentDao {
	public boolean insertReviewComment(ReviewComment rComment);
	public boolean updateReviewComment(ReviewComment rComment);
	public boolean deleteReviewComment(HashMap<String, Object> param);
	public ReviewComment selectReviewCommentOne(HashMap<String, Object> param);
	public List<ReviewComment> selectReviewCommentAll(HashMap<String, Object> param);
	public ReviewComment getReviewCommentCount(HashMap<String, Object> param);
	public int getReviewCommentCount2(HashMap<String, Object> param);

}
