package dao;

import java.util.HashMap;
import java.util.List;

import model.MeetingLikes;

public interface ReviewLikesDao {
	public boolean insertReviewLikes(MeetingLikes rLikes);
	public boolean deleteReviewLikes(HashMap<String, Object> param);
	public boolean deleteReviewLikes2(HashMap<String, Object> param);
	public List<MeetingLikes> selectAllReviewLikes(HashMap<String, Object> param);
	public List<MeetingLikes> selectAllReviewLikes2();
	public List<MeetingLikes> selectOneReviewLikes(HashMap<String, Object> param);
	public MeetingLikes selectcount(HashMap<String, Object> param);

}
