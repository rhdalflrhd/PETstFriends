package service;

import java.io.File;
import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.MultipartFilter;

import dao.FreeBoardDao;
import dao.UserDao;
import model.Board;
import model.FreeBoard;
import model.FreeComment;
import model.FreeLikes;
import model.Notice;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {
	
	@Autowired
	private FreeBoardDao bDao;
	
	@Autowired
	private UserDao uDao;
	

	//------------------------------------------------------------------------------------------------
	//글수정
	@Override
	public int ModifyFreeBoard(FreeBoard freeBoard) {
		HashMap<String, Object> params= new HashMap<String, Object>();
		params.put("freeBoard_boardname", freeBoard.getFreeBoard_boardname());
		params.put("freeBoard_boardno", freeBoard.getFreeBoard_boardno());	
//		FreeBoard originBoard = bDao.selectOneBoard(params);
//		if (originBoard.getFreeBoard_userId().equals(freeBoard.getFreeBoard_userId()))
//			return bDao.updateBoard(freeBoard);
//		else
			return 0;
		}

	//-------------------------------------------------------------------------------------------------
	//글삭제
	
	@Override
	public int DeleteFreeBoard(int FreeBoard_boardname, int FreeBoard_boardno) {
		HashMap<String, Object> params= new HashMap<String, Object>();
		params.put("freeBoard_boardname", FreeBoard_boardname);
		params.put("freeBoard_boardno", FreeBoard_boardno);
		return bDao.deleteBoard(params);
	}
//----------------------------------------------------------------------------------------------------
	//제목,내용,닉넴으로 검색
	@Override 
	public HashMap<String, Object> SearchFreeBoardbyTNC(HashMap<String, Object> params,int page) {
		// TODO Auto-generated method stub
		
		System.out.println("SearchfreeBoard 들어옴");

		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		int getEndPage = getEndPage(page);
		int getLastPage = getLastPage(params);

	
		if (getEndPage >= getLastPage)
			result.put("end", getLastPage(params));
		else
			result.put("end", getEndPage(page));

		result.put("current", page);
		result.put("start", getStartPage(page));
		result.put("last", getLastPage(params));
		
		params.put("skip", getSkip(page));
		params.put("qty", 10);	
		System.out.println("SearchFreeBoard 최종 파람:" + params.toString());

//		System.out.println("겟카운트:" + tipDao.getCount(params));		
		int size =bDao.getCount(params);				
		
		result.put("FreeBoardList", bDao.selectBoardAll(params));
//		result.put("FreeBoardCount", size);
		
		
//		result.put("current", page);
//		result.put("startPage", getStartPageS(page));
//		result.put("endPage", getEndPageS(page));
//		result.put("last", getLastPageS(params));	
//		params.put("skip", getSkipS(page));
//		params.put("qty", 10);		
//		result.put("dogTipBoardList", tipDao.selectBoardPage(params));	

		System.out.println(params.get("FreeBoard_boardname"));
		return result;
	}
	

	//제목으로 검색
	@Override 
	public HashMap<String, Object> SearchFreeBoardbyTitle(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return null;
	}

	//닉넴으로 검색
	@Override
	public HashMap<String, Object> SearchFreeBoardbyNN(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return null;
	}

	//내용으로 검색
	@Override
	public HashMap<String, Object> SearchFreeBoardbyCon(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return null;
	}
//-------------------------------------------------------------------------------------------------------------------
	//게시판 글 목록보기 
	@Override
	public 	HashMap<String, Object> ShowFreeBoard(HashMap<String, Object> params, int page) {

		HashMap<String, Object> result = new HashMap<String, Object>();
		int getEndPage = getEndPage(page);
		int getLastPage = getLastPage(params);
		if (getEndPage >= getLastPage)
			result.put("end", getLastPage(params));
		else
			result.put("end", getEndPage(page));
		result.put("current", page);
		result.put("start", getStartPage(page));
		result.put("last", getLastPage(params));
		params.put("skip", getSkip(page));
		params.put("qty", 10);	
	
		int size = bDao.getCount(params);				
		result.put("dogFreeBoardList", bDao.selectBoardAll(params));
		result.put("dogFreeBoardCount", size);

		System.out.println("타이틀="+(String) params.get("freeBoard_title"));
		
		

		return result;
	}
		

	
	//-----------------------------------------------------------------------------------------------------------------------

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

	//-----------------------------------------------------------------------------------------------------------
	
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
	//-----------------------------------------------------------------------------------------------------------


	//-----------------------------------------------------------------------------------------------------------

	@Override
	public int getStartPage(int page) {
		// TODO Auto-generated method stub
		return ((page-1)/10+1)*10;
	}

	@Override
	public int getEndPage(int page) {
		// TODO Auto-generated method stub
		return ((page-1)/10+1)*10;
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
	public FreeBoard getBoard(int freeBoard_boardname, int freeBoard_boardno) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params= new HashMap<String, Object>();
		params.put("freeBoard_boardname", freeBoard_boardname);
		params.put("freeBoard_boardno", freeBoard_boardno);
		return bDao.selectOneBoard(freeBoard_boardname,freeBoard_boardno);
	}

	@Override
	public FreeBoard readBoard(int freeBoard_boardname, int freeBoard_boardno) {
		// TODO Auto-generated method stub
		//게시물 정보를 조회, 조회수 +1 추가
		
		FreeBoard freeboard = bDao.selectOneBoard(freeBoard_boardno,freeBoard_boardname);
		freeboard.setFreeBoard_readCount(freeboard.getFreeBoard_readCount()+1);
		bDao.updateBoard(freeboard);
		return freeboard;
		
//				HashMap<String, Object> params = new HashMap<String, Object>();
//				FreeBoard freeBoard = bDao.selectOneBoard(params);
//				freeBoard.setFreeBoard_readCount(freeBoard.getFreeBoard_readCount() + 1);
//				params.put("freeBoard", freeBoard);
//				bDao.updateBoard(freeBoard);
//				FreeBoard b1 = bDao.selectOneBoard(params);
//				if(freeBoard.getFreeBoard_content()==null || freeBoard.getFreeBoard_content().equals(""))
//					freeBoard.setFreeBoard_content("내용없음");
//				if(freeBoard.getFreeBoard_title()==null || freeBoard.getFreeBoard_title().equals(""))
//					freeBoard.setFreeBoard_title("제목없음");
//				return freeBoard;
		
	}

	@Override
	public int getLastBoardno(int freeBoard_boardname,String freeBoard_userid) {
		// TODO Auto-generated method stub
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("freeBoard_boardname", freeBoard_boardname);
		param.put("freeBoard_userId", freeBoard_userid);
		//지금은 보드네임만 넣지만 유저랑 합치면 유저 아이디도 넣어야함 ㅇㅇ
		return bDao.getLastBoardno(param);
	}

//	@Override
//	public File getAttachFile(HashMap<String, Object> params) {
//		// TODO Auto-generated method stub
//		FreeBoard free = bDao.selectOneBoard(params);
//		String fileName = free.getFreeBoard_file();
//		String path = "C:/BitCamp/image/";
//		return new File(path + fileName);
//	}

	@Override
	public int writeFreeBoard(FreeBoard freeboard) {
		// TODO Auto-generated method stub
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd:hh:mm:ss");
		String freeBoard_writeDate = simple.format(new Date());
		freeboard.setFreeBoard_writeDate(freeBoard_writeDate);
		freeboard.setFreeBoard_readCount(0);
		freeboard.getFreeBoard_boardname();
	
		return bDao.insertBoard(freeboard);
	
	}

	@Override
	public File getAttachFile(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return null;
	}

}
