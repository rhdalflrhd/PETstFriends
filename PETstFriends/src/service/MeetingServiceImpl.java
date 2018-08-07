package service;

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
		return false;
	}

	@Override
	public int scoreCheckMeetingBoard(String meetingBoard_userId) {
		// TODO Auto-generated method stub
		return 0;
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
		return false;
	}
	
	
}
