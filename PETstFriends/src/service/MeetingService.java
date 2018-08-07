package service;

import java.util.List;

import model.MeetingBoard;
import model.MeetingBoardApply;

public interface MeetingService {
	public boolean writeMeetingBoard(MeetingBoard mboard);
	public int scoreCheckMeetingBoard(String meetingBoard_userId);
	public boolean modifyMeetingBoard(MeetingBoard mboard);
	public boolean deleteMeetingBoard(int meeting_boardno);
	public List<MeetingBoard> showMeetingBoard();
	public MeetingBoard selectMeetingBoard(int meeting_boardno);
	
	public boolean insertApply(MeetingBoardApply mApply);
//	deleteApply
//	selectApply
//	showApply
//	commentWriteMeetingBoard
//	commentModifyMeetingBoard
//	commentDeleteMeetingBoard
//	showCommentMeetingBoard
//	writeReview
//	modifyReview
//	deleteReview
//	showReview
//	selectReview
//	commentWriteReview
//	commentModifyReview
//	commentDeleteReview
//	showCommentReview
//	insertReviewLikes
//	deleteReviewLikes
//	getMeetingBoardListPage
//	getMeetingBoardStartPage
//	getMeetingBoardEndPage
//	getMeetingBoardLastPage
//	getMeetingBoardSkip
//	getReviewListPage
//	getReviewStartPage
//	getReviewEndPage
//	getReviewLastPage
//	getReviewSkip

}
