package service;

import java.io.File;
import java.io.IOException;
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

@Service
public class FreeBoardServiceImpl implements FreeBoardService {
	
	@Autowired
	private FreeBoardDao bDao;
	
	@Autowired
	private UserDao uDao;
	
	
	//---------------------------------------------------------------------------------------------------------------------------
//글쓰기
	@Override
	public int writeFreeBoard(FreeBoard freeboard, MultipartFile file) {
		String path = "C:/BitCamp/PetstFriends/";
		File dir = new File(path);
		
		if(!dir.exists())
			dir.mkdirs();//저 경로에 폴더 없으면 폴더하나 만들어 make directory
		
		String fileName = file.getOriginalFilename();
		File attachFile = new File(path + fileName);
		
		try {
			file.transferTo(attachFile);
			freeboard.setFreeBoard_file(fileName);
			
		} catch (IllegalStateException e) {
//			e.printStackTrace();
		} catch (IOException e) {
//			e.printStackTrace();
		}
		
		bDao.insertBoard(freeboard);
		return freeboard.getFreeBoard_boardname();
	}

	//------------------------------------------------------------------------------------------------
	//글수정
	@Override
	public int ModifyFreeBoard(FreeBoard freeBoard) {
		HashMap<String, Object> params= new HashMap<String, Object>();
		params.put("freeBoard_boardname", freeBoard.getFreeBoard_boardname());
		params.put("freeBoard_boardno", freeBoard.getFreeBoard_boardno());	
		FreeBoard originBoard = bDao.selectOneBoard(params);
		if (originBoard.getFreeBoard_userid().equals(freeBoard.getFreeBoard_userid()))
			return bDao.updateBoard(freeBoard);
		else
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
//-------------------------------------------------------------------------------------------------------------------
	//게시판 글 목록보기 
	@Override
	public  HashMap<String, Object> ShowFreeBoard(HashMap<String, Object> params, int page) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		result.put("current", page);
		result.put("start", getStartPage(page));
		
		if(getEndPage(page)<=getLastPage(params)) {
			result.put("end", getEndPage(page));
		}else {
			result.put("end", getLastPage(params));
		}
		result.put("last", getLastPage(params));
		
		params.put("skip", getSkip(page));
		params.put("qty", 10);
		result.put("FreeBoardList", bDao.selectBoardAll(params));
		
		
		
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

//	@Override
//	public HashMap<String, Object> getBoardListPage(HashMap<String, Object> params,int page) {
//		
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
//		result.put("boardList", bDao.selectBoardAll(params));
//		
//		
//		
//		return result;
//	}
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
	public FreeBoard getBoard(int FreeBoard_boardname, int FreeBoard_boardno) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params= new HashMap<String, Object>();
		params.put("tipBoard_boardname", FreeBoard_boardname);
		params.put("tipBoard_boardno", FreeBoard_boardno);
		return bDao.selectOneBoard(params);
	}

	@Override
	public FreeBoard readBoard(int freeBoard_boardname, int freeBoard_boardno) {
		// TODO Auto-generated method stub
		//게시물 정보를 조회, 조회수 +1 추가
				HashMap<String, Object> params = new HashMap<String, Object>();
				params.put("freeBoard_boardname", freeBoard_boardname);
				params.put("freeBoard_boardno", freeBoard_boardno);
				FreeBoard b = bDao.selectOneBoard(params);
				b.setFreeBoard_readCount(b.getFreeBoard_readCount() + 1);
				bDao.updateBoard(b);
				if(b.getFreeBoard_content()==null || b.getFreeBoard_content().equals(""))
					b.setFreeBoard_content("내용없음");
				if(b.getFreeBoard_title()==null || b.getFreeBoard_title().equals(""))
					b.setFreeBoard_title("제목없음");
				return b;
		
	}

	@Override
	public int getLastBoardno(int freeBoard_boardname, String freeBoard_userid) {
		// TODO Auto-generated method stub
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("FreeBoard_boardname", freeBoard_boardname);
		param.put("FreeBoard_userid", freeBoard_userid);
		//지금은 보드네임만 넣지만 유저랑 합치면 유저 아이디도 넣어야함 ㅇㅇ
		return bDao.getLastBoardno(param);
	}
	

	@Override
	public File getAttachFile(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		FreeBoard free = bDao.selectOneBoard(params);
		String fileName = free.getFreeBoard_file();
		String path = "C:/BitCamp/image/";
		return new File(path + fileName);
	}

}
