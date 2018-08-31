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

	// ---------------------------------------------------------------------------------------------------------------------------
	// 글쓰기
	@Override
	public int writeFreeBoard(FreeBoard freeboard, MultipartFile file) {
		String path = "C:/BitCamp/PetstFriends/";
		File dir = new File(path);

		if (!dir.exists())
			dir.mkdirs();// 저 경로에 폴더 없으면 폴더하나 만들어 make directory

		String fileName = file.getOriginalFilename();
		File attachFile = new File(path + fileName);

		try {
			file.transferTo(attachFile);
			freeboard.setFreeBoard_file(fileName);

		} catch (IllegalStateException e) {
			// e.printStackTrace();
		} catch (IOException e) {
			// e.printStackTrace();
		}

		bDao.insertBoard(freeboard);
		return freeboard.getFreeBoard_boardname();
	}

	// ------------------------------------------------------------------------------------------------
	// 글수정
	@Override
	public int ModifyFreeBoard(FreeBoard freeBoard) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("freeBoard_boardname", freeBoard.getFreeBoard_boardname());
		params.put("freeBoard_boardno", freeBoard.getFreeBoard_boardno());
		FreeBoard originBoard = bDao.selectOneBoard(params);
		if (originBoard.getFreeBoard_userid().equals(freeBoard.getFreeBoard_userid()))
			return bDao.updateBoard(freeBoard);
		else
			return 0;
	}

	// -------------------------------------------------------------------------------------------------
	// 글삭제

	@Override
	public int DeleteFreeBoard(int FreeBoard_boardname, int FreeBoard_boardno) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("freeBoard_boardname", FreeBoard_boardname);
		params.put("freeBoard_boardno", FreeBoard_boardno);
		return bDao.deleteBoard(params);
	}

	// ----------------------------------------------------------------------------------------------------
	// 제목,내용,닉넴으로 검색
	@Override
	public List<FreeBoard> SearchFreeBoardbyTNC(int FreeBoard_boardname, String FreeBoard_title,
			String FreeBoard_nickname, String FreeBoard_content) {
		// TODO Auto-generated method stub
		return null;
	}

	// 제목으로 검색
	@Override
	public List<FreeBoard> SearchFreeBoardbyTitle(int FreeBoard_boardname, String FreeBoard_title) {
		// TODO Auto-generated method stub
		return null;
	}

	// 닉넴으로 검색
	@Override
	public List<FreeBoard> SearchFreeBoardbyNN(int FreeBoard_boardname, String FreeBoard_nickname) {
		// TODO Auto-generated method stub
		return null;
	}

	// 내용으로 검색
	@Override
	public List<FreeBoard> SearchFreeBoardbyCon(int FreeBoard_boardname, String FreeBoard_content) {
		// TODO Auto-generated method stub
		return null;
	}

	// -------------------------------------------------------------------------------------------------------------------
	// 게시판 글 목록보기
	@Override
	public HashMap<String, Object> ShowFreeBoard(HashMap<String, Object> params, int page) {
		HashMap<String, Object> result = new HashMap<String, Object>();

		result.put("current", page);
		result.put("start", getStartPage(page));

		if (getEndPage(page) <= getLastPage(params)) {
			result.put("end", getEndPage(page));
		} else {
			result.put("end", getLastPage(params));
		}
		result.put("last", getLastPage(params));

		params.put("skip", getSkip(page));
		params.put("qty", 10);
		result.put("FreeBoardList", bDao.selectBoardAll(params));

		return result;
	}

	// -----------------------------------------------------------------------------------------------------------------------
	// 댓글
	@Override
	public int writeCommentFreeBoard(FreeComment freecomment) {
		// TODO Auto-generated method stub
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
		freecomment.setFreeComments_writeDate(simple.format(new Date()));
		int result = bDao.insertComment(freecomment);
		if(freecomment.getFreeComments_parent()==0) {
			freecomment.setFreeComments_parent(freecomment.getFreeBoard_boardno());
			freecomment.setFreeComments_commentno(freecomment.getFreeBoard_boardno());
			result = bDao.updateCommentParent(freecomment);
		}
		return result;
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
	public List<FreeComment> ShowCommentFreeBoard(int freeBoard_boardname, int freeBoard_boardno, int comment_page) {
		// TODO Auto-generated method stub
		// 이건 처음 게시글 볼때
		int comment_numb = 3;
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("freeBoard_boardname", freeBoard_boardname);
		params.put("freeBoard_boardno", freeBoard_boardno);
		params.put("comment_page", comment_page);
		params.put("comment_numb", comment_numb);
		// params.put("comment_current",comment_page);
		// params.put("comment_start", getStartCommentPage(comment_page, numb));
		// if(getEndCommentPage(comment_page, numb) > getLastCommentPage(params))
		// params.put("comment_end", getLastCommentPage(params));
		// else
		// params.put("comment_end", getEndCommentPage(comment_page, numb));
		// params.put("comment_end", getLastCommentPage(params));
		int comment_skip = getCommentSkip(comment_page, comment_numb);
		params.put("comment_skip", comment_skip);
		params.put("comment_end", getCommentSkip(comment_page, comment_numb));
		List<FreeComment> commentList = bDao.selectCommentAll(params);
		params.put("commentList", commentList);
		return commentList;

	}

	// if(comment_page == 0)
	// page = (commetnsDao.getCount( ) -1)/ 10 + 1 //맨마지막페이지부터

	public int getStartCommentPage(int comment_page, int numb) { // 시작페이지
		return (comment_page - 1) / 10 * 10 + 1;
	}

	public int getEndCommentPage(int comment_page) { // 마지막 페이지
		return ((comment_page - 1) / 10 + 1) * 10;
	}

	public int getLastCommentPage(HashMap<String, Object> params) {// 목록의 끝 번호
		int comment_numb = Integer.parseInt(String.valueOf(params.get("comment_numb")));
		return (bDao.getCommentCount(params) - 1) / comment_numb + 1;
	}

	public int getCommentSkip(int comment_page, int comment_numb) {// 앞에 지나간 갯수
		return (comment_page - 1) * comment_numb;
	}

	// -----------------------------------------------------------------------------------------------------------

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
	public int getStartPage(int page) {
		// TODO Auto-generated method stub
		return ((page - 1) / 10 + 1) * 10;
	}

	@Override
	public int getEndPage(int page) {
		// TODO Auto-generated method stub
		return ((page - 1) / 10 + 1) * 10;
	}

	@Override
	public int getLastPage(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return (bDao.getCount(params) - 1) / 10 + 1;
	}

	@Override
	public int getSkip(int page) {
		// TODO Auto-generated method stub
		return (page - 1) * 10;
	}

	@Override
	public FreeBoard getBoard(int FreeBoard_boardname, int FreeBoard_boardno) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("tipBoard_boardname", FreeBoard_boardname);
		params.put("tipBoard_boardno", FreeBoard_boardno);
		return bDao.selectOneBoard(params);
	}

	@Override
	public HashMap<String, Object> readBoard(int freeBoard_boardname, int freeBoard_boardno) {
		// TODO Auto-generated method stub
		// 게시물 정보를 조회, 조회수 +1 추가
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("freeBoard_boardname", freeBoard_boardname);
		params.put("freeBoard_boardno", freeBoard_boardno);
		FreeBoard b = bDao.selectOneBoard(params);
		b.setFreeBoard_readCount(b.getFreeBoard_readCount() + 1);
		bDao.updateBoard(b);
		if (b.getFreeBoard_content() == null || b.getFreeBoard_content().equals(""))
			b.setFreeBoard_content("내용없음");
		if (b.getFreeBoard_title() == null || b.getFreeBoard_title().equals(""))
			b.setFreeBoard_title("제목없음");
		params.put("freeBoard", b);
		// 댓글
		int comment_numb = 3;
		params.put("comment_numb", comment_numb);
		int comment_page = getLastCommentPage(params);// 댓글마지막 페이지 
		params.put("comment_page", comment_page);
		params.put("comment_current", comment_page);
		params.put("comment_start", getStartCommentPage(comment_page, comment_numb));
		params.put("comment_last",getLastCommentPage(params));
		if (getEndCommentPage(comment_page) > getLastCommentPage(params))
			params.put("comment_end", getLastCommentPage(params));
		else
			params.put("comment_end", getEndCommentPage(comment_page));
		int comment_skip = getCommentSkip(comment_page, comment_numb);
		params.put("comment_skip", comment_skip);
		List<FreeComment> commentList = bDao.selectCommentAll(params);
		params.put("commentList", commentList);
		return params;

	}

	@Override
	public int getLastBoardno(int freeBoard_boardname, String freeBoard_userid) {
		// TODO Auto-generated method stub
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("FreeBoard_boardname", freeBoard_boardname);
		param.put("FreeBoard_userid", freeBoard_userid);
		// 지금은 보드네임만 넣지만 유저랑 합치면 유저 아이디도 넣어야함 ㅇㅇ
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
	public int deleteComments(int freeComments_commentno, int freeComments_parent) {
		if(freeComments_commentno == freeComments_parent) { //가장 상위 댓글
			System.out.println(bDao.groupCount(freeComments_commentno)+"가장상위인가");
			if(bDao.groupCount(freeComments_commentno) == 0)//대댓 없는 경우(나만 패런트넘=코멘트넘이 자신 하나만 있는 경우) 
			  bDao.deleteComments(freeComments_commentno);//지우기
			else {
			  HashMap<String, Object> params = new HashMap<String, Object>();
			  params.put("freeComments_commentno", freeComments_commentno);
			  params.put("freeBoard_content", "");
			  bDao.updateComments(params);//대댓있는경우 빈칸  
		  }
			
		}else { //대댓
			System.out.println(bDao.selectOneComments(freeComments_parent));
		 if(bDao.selectOneComments(freeComments_parent).getFreeComments_content() ==""
				 && bDao.groupCount(freeComments_commentno) == 1) {//패런트가코멘트넘인 원댓 지워지고 대댓 하나뿐인 경우
		   bDao.deleteComments(freeComments_commentno);//해당댓
		   bDao.deleteComments(freeComments_parent);//해당 원댓
		}
		 else //원댓 안지워지거나 대댓이 여러개인경우
		   bDao.deleteComments(freeComments_commentno);
		}
		return freeComments_parent;
	}
	public int updatefreeComment(int freeComments_commentno, String freeComments_content) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		  params.put("freeComments_commentno", freeComments_commentno);
		  params.put("freeComments_content", freeComments_content);
		return bDao.updateComments(params);
	}

}
