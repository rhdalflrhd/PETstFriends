package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ApplyDao;
import dao.MeetingBoardDao;
import dao.MeetingCommentDao;
import dao.ReviewCommentDao;
import dao.ReviewDao;
import dao.ReviewLikesDao;
import dao.UserDao;
import model.MeetingBoard;
import model.MeetingBoardApply;
import model.MeetingBoardReview;
import model.MeetingComment;
import model.MeetingLikes;
import model.ReviewComment;

@Service
public class MeetingServiceImpl implements MeetingService{

	@Autowired
	private MeetingBoardDao meetingBoardDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private ApplyDao applyDao;
	@Autowired
	private MeetingCommentDao meetingCommentDao;
	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private ReviewCommentDao reviewCommentDao;
	@Autowired
	private ReviewLikesDao reviewLikesDao;
	
	@Override
	public boolean writeMeetingBoard(MeetingBoard mboard) {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public int scoreCheckMeetingBoard(String meetingBoard_userId) {
		// TODO Auto-generated method stub
		return userDao.selectUserId(meetingBoard_userId).getUser_score();
	}
	@Override
	public boolean modifyMeetingBoard(MeetingBoard mboard) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean deleteMeetingBoard(int meeting_boardno) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public List<MeetingBoard> showMeetingBoard() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public MeetingBoard selectMeetingBoard(int meeting_boardno) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public boolean insertApply(MeetingBoardApply mApply) {
		// TODO Auto-generated method stub
		System.out.println("1");
		applyDao.insertApply(mApply);
		System.out.println("2");
		return true;
	}
	@Override
	public boolean deleteApply(String meetingBoardApply_userId, int meeting_boardno) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("meetingBoardApply_userId", meetingBoardApply_userId);
		params.put("meeting_boardno", meeting_boardno);
		applyDao.deleteApply(params);
		return true;
	}
	@Override
	public List<MeetingBoardApply> selectApply(String meetingBoardApply_userId) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<MeetingBoardApply> showApply(int meeting_boardno) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public boolean commentWriteMeetingBoard(MeetingComment mComment) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean commentModifyMeetingBoard(MeetingComment mComment) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean commentDeleteMeetingBoard(int meetingComment_commentno, int meeting_boardno) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public List<MeetingComment> showCommentMeetingBoard(int meeting_boardno) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public boolean writeReview(MeetingBoardReview mReview) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean modifyReview(MeetingBoardReview mReview) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean deleteReview(int meeting_boardno, int meetingReview_no) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public List<MeetingBoardReview> showReview(int meeting_boardno, int meetingReview_no) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public MeetingBoardReview selectReview(int meeting_boardno) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public boolean commentWriteReview(ReviewComment rComment) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean commentModifyReview(ReviewComment rComment) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean commentDeleteReview(int reviewComment_commentno, int reviewno) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public List<ReviewComment> showCommentReview(int reviewno) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public boolean insertReviewLikes(MeetingLikes rLikes) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean deleteReviewLikes(int reviewno, String meetingLikes_userId) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public int getMeetingBoardListPage(int meetingPage) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int getMeetingBoardStartPage(int meetingPage) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int getMeetingBoardEndPage(int meetingPage) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int getMeetingBoardLastPage(int meetingPage) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int getMeetingBoardSkip(int meetingPage) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int getReviewListPage(int reviewPage) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int getReviewStartPage(int reviewPage) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int getReviewEndPage(int reviewPage) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int getReviewLastPage(int reviewPage) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int getReviewSkip(int reviewPage) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
