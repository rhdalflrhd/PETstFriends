package dao;
import java.util.HashMap;
import java.util.List;
import model.MeetingBoardReview;

public interface ReviewDao {
	public boolean insertReview(MeetingBoardReview mReview);//후기작성
	public boolean updateReview(MeetingBoardReview mReview);//후기 수정
	public boolean deleteReview(HashMap<String, Object> param);//후기 삭제
	public MeetingBoardReview selectOneReview(HashMap<String, Object> param);//후기글 보기
	public List<MeetingBoardReview> selectReviewAll(int meeting_boardno);//후기글 목록
	public MeetingBoardReview getReviewCount(int meeting_boardno);//후기글 갯수
	public int getReviewCount2(int meeting_boardno);//후기글 갯수
}
