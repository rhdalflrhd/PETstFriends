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
		bDao.insertBoard(freeboard);
		return freeboard.getFreeBoard_boardname();
	}

	@Override
	public int ModifyFreeBoard(FreeBoard freeBoard) {
	
		return bDao.updateBoard(freeBoard);
	}

	@Override
	public int DeleteFreeBoard(int FreeBoard_boardname, int FreeBoard_boardno) {
		
		return bDao.deleteBoard(FreeBoard_boardname, FreeBoard_boardno);
	}

	//제목,내용,닉넴으로 검색
	@Override 
	public List<FreeBoard> SearchFreeBoardbyTNC(int FreeBoard_boardname, String FreeBoard_title,
			String FreeBoard_nickname, String FreeBoard_content) {
		// TODO Auto-generated method stub
		return null;
	}

	//제목으로 검색
	@Override 
	public List<FreeBoard> SearchFreeBoardbyTitle(int FreeBoard_boardname, String FreeBoard_title) {
		// TODO Auto-generated method stub
		return null;
	}

	//닉넴으로 검색
	@Override
	public List<FreeBoard> SearchFreeBoardbyNN(int FreeBoard_boardname, String FreeBoard_nickname) {
		// TODO Auto-generated method stub
		return null;
	}

	//내용으로 검색
	@Override
	public List<FreeBoard> SearchFreeBoardbyCon(int FreeBoard_boardname, String FreeBoard_content) {
		// TODO Auto-generated method stub
		return null;
	}

	//게시판 글 목록보기 
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
	public HashMap<String, Object> getBoardListPage(HashMap<String, Object> params,int page) {
		
//		HashMap<String, Object> result = new HashMap<String, Object>();
//		
//		result.put("current", page);
//		result.put("start", getStartPage(page));
//		
//		if(getEndPage(page)<=getLastPage(params)) {
//			result.put("end", getEndPage(page));
//		}else {
//			result.put("end", getLastPage(params));
//		}
//		result.put("last", getLastPage(params));
//		
//		params.put("skip", getSkip(page));
//		params.put("qty", 10);
//		result.put("boardList", bDao.selectOneBoard(FreeBoard_boardname, FreeBoard_boardno));
		
		
		
		return null;
	}

	@Override
	public int getStartPage(int FreeBoard_boardno) {
		// TODO Auto-generated method stub
		return ((FreeBoard_boardno-1)/10+1)*10;
	}

	@Override
	public int getEndPage(HashMap<String, Object> params,int FreeBoard_boardno) {
		// TODO Auto-generated method stub
		return ((FreeBoard_boardno-1)/10+1)*10;
	}

	@Override
	public int getLastPage(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return (bDao.getCount(params)-1)/10+1;
	}

	@Override
	public int getSkip(int page) {
		// TODO Auto-generated method stub
		return (page-1)*10;
	}

	@Override
	public FreeBoard getBoard(int FreeBoard_boardname, int FreeBoard_boardno) {
		// TODO Auto-generated method stub
		return bDao.selectOneBoard(FreeBoard_boardname, FreeBoard_boardno);
	}



	

	
	
}
