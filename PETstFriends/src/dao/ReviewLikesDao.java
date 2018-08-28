package dao;

import java.util.HashMap;
import java.util.List;

import model.MeetingLikes;

public interface ReviewLikesDao {
	public boolean insertReviewLikes(MeetingLikes rLikes);
	public boolean deleteReviewLikes(HashMap<String, Object> param);
	public List<MeetingLikes> selectAllReviewLikes(HashMap<String, Object> param);
	public List<MeetingLikes> selectOneReviewLikes(HashMap<String, Object> param);
	public int getReviewLikesCount(HashMap<String, Object> param);

}
