package service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import model.MeetingBoard;
import model.MeetingBoardApply;
import model.MeetingBoardReview;
import model.MeetingComment;
import model.MeetingLikes;
import model.ReviewComment;

public interface MeetingService {
	public boolean writeMeetingBoard(MeetingBoard mboard);
	public int scoreCheckMeetingBoard(String meetingBoard_userId);
	public boolean modifyMeetingBoard(MeetingBoard mboard);
	public boolean deleteMeetingBoard(int meeting_boardno);
	public List<HashMap<String, Object>> showMeetingBoard(HashMap<String, Object> param);
	public MeetingBoard getCount();
	public MeetingBoard selectMeetingBoard(int meeting_boardno);
	
	public boolean insertApply(MeetingBoardApply mApply);
	public boolean deleteApply(String meetingBoardApply_userId, int meeting_boardno);
    public List<MeetingBoardApply> selectApply(String meetingBoardApply_userId);
    public List<MeetingBoardApply> showApply(int meeting_boardno);
    
    public boolean commentWriteMeetingBoard(MeetingComment mComment);
    public boolean commentModifyMeetingBoard(MeetingComment mComment);
    public boolean commentDeleteMeetingBoard(int meetingComment_commentno, int meeting_boardno);
    public MeetingComment selectCommentMeetingBoard(int meetingComment_commentno, int meeting_boardno);
    public List<MeetingComment> showCommentMeetingBoard(int meeting_boardno);
    
    public boolean writeReview(MeetingBoardReview mReview);
    public boolean modifyReview(MeetingBoardReview mReview);
    public boolean deleteReview(int Meeting_boardno, int MeetingReview_no);
    public MeetingBoardReview selectReview(int Meeting_boardno, int MeetingReview_no);
    public List<MeetingBoardReview> showReview(int meeting_boardno);
    public MeetingBoardReview getReviewCount(int meeting_boardno);
    public int getReviewCount2(int meeting_boardno);
    
    public boolean commentWriteReview(ReviewComment rComment);
    public boolean commentModifyReview(ReviewComment rComment);
    public boolean commentDeleteReview(int Meeting_boardno, int reviewComment_commentno,int reviewno);
    public ReviewComment commentSelectReview(int Meeting_boardno, int reviewComment_commentno,int reviewno);
    public List<ReviewComment> showCommentReview(int Meeting_boardno, int reviewno);
    
    public boolean insertReviewLikes(MeetingLikes rLikes);
    public boolean deleteReviewLikes(int Meeting_boardno, int reviewno, String meetingLikes_userId);
    public List<MeetingLikes> selectAllReviewLikes(int Meeting_boardno, int reviewno, String meetingLikes_userId);
    public int getReviewLikesCount(int Meeting_boardno, int reviewno);
    
    public HashMap<String, Object> getMeetingBoardListPage(HashMap<String, Object> param, int meetingPage);
    public int getMeetingBoardStartPage(int meetingPage);
    public int getMeetingBoardEndPage(int meetingPage);
    public int getMeetingBoardLastPage(int meetingPage);
    public int getMeetingBoardSkip(int meetingPage);
    
    public int getReviewListPage(int reviewPage);
    public int getReviewStartPage(int reviewPage);
    public int getReviewEndPage(int reviewPage);
    public int getReviewLastPage(int reviewPage);
    public int getReviewSkip(int reviewPage);


    
}
