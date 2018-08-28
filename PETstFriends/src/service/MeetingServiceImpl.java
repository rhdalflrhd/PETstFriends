package service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
		meetingBoardDao.insertBoard(mboard);
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
		meetingBoardDao.updateBoard(mboard);
		return true;
	}
	@Override
	public boolean deleteMeetingBoard(int meeting_boardno) {
		// TODO Auto-generated method stub
		meetingBoardDao.deleteBoard(meeting_boardno);
		return true;
	}
	@Override
	public List<HashMap<String, Object>> showMeetingBoard(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return meetingBoardDao.selectBoardAll(param);
	}
	@Override
	public MeetingBoard getCount() {
		// TODO Auto-generated method stub
		return meetingBoardDao.getCount();
	}
	
	@Override
	public MeetingBoard selectMeetingBoard(int meeting_boardno) {
		// TODO Auto-generated method stub
		return meetingBoardDao.selectOneBoard(meeting_boardno);
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
		return applyDao.selectOneApply(meetingBoardApply_userId);
	}
	@Override
	public List<MeetingBoardApply> showApply(int meeting_boardno) {
		// TODO Auto-generated method stub
		return applyDao.selectAllApply(meeting_boardno);
	}
	@Override
	public boolean commentWriteMeetingBoard(MeetingComment mComment) {
		// TODO Auto-generated method stub
		meetingCommentDao.insertComment(mComment);
		return true;
	}
	@Override
	public boolean commentModifyMeetingBoard(MeetingComment mComment) {
		// TODO Auto-generated method stub
		meetingCommentDao.updateComment(mComment);
		return true;
	}
	@Override
	public boolean commentDeleteMeetingBoard(int meetingComment_commentno, int meeting_boardno) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("meetingComment_commentno", meetingComment_commentno);
		params.put("meeting_boardno", meeting_boardno);
		meetingCommentDao.deleteComment(params);
		return true;
	}
	@Override
	public MeetingComment selectCommentMeetingBoard(int meetingComment_commentno, int meeting_boardno) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("meetingComment_commentno", meetingComment_commentno);
		params.put("meeting_boardno", meeting_boardno);
		return meetingCommentDao.selectCommentOne(params);
	}
	@Override
	public List<MeetingComment> showCommentMeetingBoard(int meeting_boardno) {
		// TODO Auto-generated method stub
		return meetingCommentDao.selectCommentAll(meeting_boardno);
	}
	@Override
	public boolean writeReview(MeetingBoardReview mReview) {
		// TODO Auto-generated method stub
		reviewDao.insertReview(mReview);
		return true;
	}
	@Override
	public boolean modifyReview(MeetingBoardReview mReview) {
		// TODO Auto-generated method stub
		reviewDao.updateReview(mReview);
		return true;
	}
	@Override
	public boolean deleteReview(int meeting_boardno, int meetingReview_no) {
		// TODO Auto-generated method stub
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("meeting_boardno", meeting_boardno);
		param.put("meetingReview_no", meetingReview_no);
		reviewDao.deleteReview(param);
		return false;
	}
	@Override
	public MeetingBoardReview selectReview(int meeting_boardno, int meetingReview_no) {
		// TODO Auto-generated method stub
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("meeting_boardno", meeting_boardno);
		param.put("meetingReview_no", meetingReview_no);
		return reviewDao.selectOneReview(param);
	}
	@Override
	public List<MeetingBoardReview> showReview(int meeting_boardno) {
		// TODO Auto-generated method stub
		return reviewDao.selectReviewAll(meeting_boardno);
	}
	
	@Override
	public MeetingBoardReview getReviewCount(int meeting_boardno) {
		// TODO Auto-generated method stub
		return reviewDao.getReviewCount(meeting_boardno);
	}
	
	@Override
	public int getReviewCount2(int meeting_boardno) {
		// TODO Auto-generated method stub
		return reviewDao.getReviewCount2(meeting_boardno);
	}
	@Override
	public boolean commentWriteReview(ReviewComment rComment) {
		// TODO Auto-generated method stub
		reviewCommentDao.insertReviewComment(rComment);
		return true;
	}
	@Override
	public boolean commentModifyReview(ReviewComment rComment) {
		// TODO Auto-generated method stub
		reviewCommentDao.updateReviewComment(rComment);
		return true;
	}
	@Override
	public boolean commentDeleteReview(int meeting_boardno, int reviewComment_commentno, int reviewno) {
		// TODO Auto-generated method stub
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("meeting_boardno", meeting_boardno);
		param.put("reviewComment_commentno", reviewComment_commentno);
		param.put("reviewno", reviewno);
		reviewCommentDao.deleteReviewComment(param);
		return true;
	}
	
	@Override
	public ReviewComment commentSelectReview(int meeting_boardno, int reviewComment_commentno, int reviewno) {
		// TODO Auto-generated method stub
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("meeting_boardno", meeting_boardno);
		param.put("reviewComment_commentno", reviewComment_commentno);
		param.put("reviewno", reviewno);
		return reviewCommentDao.selectReviewCommentOne(param);
	}
	@Override
	public List<ReviewComment> showCommentReview(int meeting_boardno, int reviewno) {
		// TODO Auto-generated method stub
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("meeting_boardno", meeting_boardno);
		param.put("reviewno", reviewno);
		return reviewCommentDao.selectReviewCommentAll(param);
	}
	@Override
	public boolean insertReviewLikes(MeetingLikes rLikes) {
		// TODO Auto-generated method stub
		reviewLikesDao.insertReviewLikes(rLikes);
		return true;
	}

	@Override
	public boolean deleteReviewLikes(int meeting_boardno, int reviewno, String meetingLikes_userId) {
		// TODO Auto-generated method stub
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("meeting_boardno", meeting_boardno);
		param.put("reviewno", reviewno);
		param.put("meetingLikes_userId", meetingLikes_userId);
		reviewLikesDao.deleteReviewLikes(param);
		return false;
	}
	
	@Override
	public List<MeetingLikes> selectAllReviewLikes(int meeting_boardno, int reviewno, String meetingLikes_userId) {
		// TODO Auto-generated method stub
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("meeting_boardno", meeting_boardno);
		param.put("reviewno", reviewno);
		param.put("meetingLikes_userId", meetingLikes_userId);
		return reviewLikesDao.selectAllReviewLikes(param);
	}
	@Override
	public int getReviewLikesCount(int meeting_boardno, int reviewno) {
		// TODO Auto-generated method stub
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("meeting_boardno", meeting_boardno);
		param.put("reviewno", reviewno);
		
		return reviewLikesDao.getReviewLikesCount(param);
	}
	@Override
	public HashMap<String, Object> getMeetingBoardListPage(HashMap<String, Object> param, int meetingPage) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("current", meetingPage);
		result.put("start", getMeetingBoardStartPage(meetingPage)); 
		result.put("end", getMeetingBoardEndPage(meetingPage));
		result.put("last", getMeetingBoardLastPage(meetingPage));
		
		param.put("skip", getMeetingBoardSkip(meetingPage));
		param.put("qty", 10);
		
		return result;
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
