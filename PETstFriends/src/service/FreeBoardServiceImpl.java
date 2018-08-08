package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.FreeBoardDao;
import dao.UserDao;
import model.FreeBoard;
import model.FreeComment;
import model.FreeLikes;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {
	
	@Autowired
	private FreeBoardDao bDao;
	
	@Autowired
	private UserDao uDao;

	@Override
	public int writeFreeBoard(FreeBoard freeboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int ModifyFreeBoard(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int DeleteFreeBoard(int FreeBoard_boardname, int FreeBoard_boardno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<FreeBoard> SearchFreeBoardbyTNC(int FreeBoard_boardname, String FreeBoard_title,
			String FreeBoard_nickname, String FreeBoard_content) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FreeBoard> SearchFreeBoardbyTitle(int FreeBoard_boardname, String FreeBoard_title) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FreeBoard> SearchFreeBoardbyNN(int FreeBoard_boardname, String FreeBoard_nickname) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FreeBoard> SearchFreeBoardbyCon(int FreeBoard_boardname, String FreeBoard_content) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FreeBoard> ShowFreeBoard(int FreeBoard_boardname) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int writeCommentFreeBoard(FreeComment freecomment) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int CommentModifyFreeBoard(FreeComment freecomment) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int CommentDeleteFreeBoard(int FreeBoard_boardname, int FreeBoard_boardno, int FreeComments_commentno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<FreeComment> ShowCommentFreeBoard(int FreeBoard_boardname, int FreeBoard_boardno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insertLikesFreeBoard(FreeLikes FreeLikes) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteLikesFreeBoard(int FreeBoard_boardname, int FreeBoard_boardno) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public HashMap<String, Object> getBoardListPage(HashMap<String, Object> params, int FreeBoard_boardno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getStartPage(int FreeBoard_boardno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getEndPage(int FreeBoard_boardno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getLastPage(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getSkip(int page) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public FreeBoard getBoard(int FreeBoard_boardname, int FreeBoard_boardno) {
		// TODO Auto-generated method stub
		return null;
	}



	

	
	
}
