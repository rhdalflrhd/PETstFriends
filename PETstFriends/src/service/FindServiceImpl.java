package service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.QnADao;
import model.MeetingBoard;
import model.QnA;

@Service
public class FindServiceImpl implements FindService{


	@Autowired
	QnADao qdao;

	@Override
	public HashMap<String, Object> FindmyWrites(int boardno, int boardname) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public QnA FindmyInquiry(int boardno, int boardname) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> FindmyLikes(int boardno, int boardname) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MeetingBoard FindmyMeeting(int boardno, int boardname) {
		// TODO Auto-generated method stub
		return null;
	}
	
}