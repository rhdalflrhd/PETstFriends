package service;

import java.io.File;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.FreeBoardDao;
import dao.UserDao;
import model.FreeBoard;
import model.FreeComment;
import model.FreeLikes;
import model.User;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {

	@Autowired
	private FreeBoardDao bDao;

	@Autowired
	private UserDao uDao;
	

	// ------------------------------------------------------------------------------------------------
	// 글수정
	@Override
	public int ModifyFreeBoard(FreeBoard freeboard) {
		HashMap<String, Object> params= new HashMap<String, Object>();
		params.put("freeBoard_boardname", freeboard.getFreeBoard_boardname());
		params.put("freeBoard_boardno", freeboard.getFreeBoard_boardno());
		FreeBoard originboard = bDao.selectOneBoard(params);
		if(originboard.getFreeBoard_userId().equals(freeboard.getFreeBoard_userId())) 
			return bDao.updateBoard(freeboard);
		else 
			return 0;
		
	}

	// -------------------------------------------------------------------------------------------------
	// 글삭제

	@Override
	public int DeleteFreeBoard(int freeBoard_boardname, int freeBoard_boardno) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("freeBoard_boardname", freeBoard_boardname);
		params.put("freeBoard_boardno", freeBoard_boardno);
		return bDao.deleteBoard(params);
	}

	// ----------------------------------------------------------------------------------------------------
	// 제목,내용,닉넴으로 검색 dog====================================================================
	@Override
	public HashMap<String, Object> SearchFreeBoardbyDog(HashMap<String, Object> params, int page) {
		// TODO Auto-generated method stub
		

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

		return result;
	}
	// 제목,내용,닉넴으로 검색cat ====================================================================
		@Override
		public HashMap<String, Object> SearchFreeBoardbyCat(HashMap<String, Object> params, int page) {
			// TODO Auto-generated method stub
			

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

			result.put("catFreeBoardList", bDao.selectBoardAll(params));
			 result.put("catFreeBoardCount", size);

			return result;
		}


		// 제목,내용,닉넴으로 검색 rabbit====================================================================
		@Override
		public HashMap<String, Object> SearchFreeBoardbyRabbit(HashMap<String, Object> params, int page) {
			// TODO Auto-generated method stub
			

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

			result.put("rabbitFreeBoardList", bDao.selectBoardAll(params));
			 result.put("rabbitFreeBoardCount", size);

			return result;
		}

		// 제목,내용,닉넴으로 검색 etc====================================================================
		@Override
		public HashMap<String, Object> SearchFreeBoardbyEtc(HashMap<String, Object> params, int page) {
			// TODO Auto-generated method stub
			

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

			result.put("etcFreeBoardList", bDao.selectBoardAll(params));
			 result.put("etcFreeBoardCount", size);

			return result;
		}


	// -------------------------------------------------------------------------------------------------------------------
	// 게시판 글 목록보기 dog================================================================
	@Override
	public HashMap<String, Object> ShowFreeBoardDog(HashMap<String, Object> params, int page) {

		HashMap<String, Object> result1 = new HashMap<String, Object>();
		int getEndPage = getEndPage(page);
		int getLastPage = getLastPage(params);
		if (getEndPage >= getLastPage)
			result1.put("end", getLastPage(params));
		else
			result1.put("end", getEndPage(page));
		result1.put("current", page);
		result1.put("start", getStartPage(page));
		result1.put("last", getLastPage(params));
		params.put("skip", getSkip(page));
		params.put("qty", 10);

		int size = bDao.getCount(params);
		result1.put("dogFreeBoardList", bDao.selectBoardAll(params)); 

		result1.put("dogFreeBoardCount", size);
		return result1;
	}
	// 게시판 글 목록보기 cat================================================================
		@Override
		public HashMap<String, Object> ShowFreeBoardCat(HashMap<String, Object> params, int page) {

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
			result.put("catFreeBoardList", bDao.selectBoardAll(params)); 

			result.put("catFreeBoardCount", size);
			return result;
		}
		// 게시판 글 목록보기 rabbit================================================================
		@Override
		public HashMap<String, Object> ShowFreeBoardRabbit(HashMap<String, Object> params, int page) {

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
			result.put("rabbitFreeBoardList", bDao.selectBoardAll(params)); 

			result.put("rabbitFreeBoardCount", size);
			return result;
		}
		// 게시판 글 목록보기 etc================================================================
		@Override
		public HashMap<String, Object> ShowFreeBoardEtc(HashMap<String, Object> params, int page) {

			HashMap<String, Object> result1 = new HashMap<String, Object>();
			int getEndPage = getEndPage(page);
			int getLastPage = getLastPage(params);
			if (getEndPage >= getLastPage)
				result1.put("end", getLastPage(params));
			else
				result1.put("end", getEndPage(page));
			result1.put("current", page);
			result1.put("start", getStartPage(page));
			result1.put("last", getLastPage(params));
			params.put("skip", getSkip(page));
			params.put("qty", 10);

			int size = bDao.getCount(params);
			result1.put("etcFreeBoardList", bDao.selectBoardAll(params)); 

			result1.put("etcFreeBoardCount", size);
			return result1;
		}
	// -----------------------------------------------------------------------------------------------------------------------

	@Override
	public int getStartPage(int page) {
		// TODO Auto-generated method stub
		return (page - 1) / 10 * 10 + 1;
	}

	@Override
	public int getEndPage(int page) {
		// TODO Auto-generated method stub
		return ((page-1) / 10 + 1) * 10;
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
	public FreeBoard getBoard(int freeBoard_boardname, int freeBoard_boardno) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("freeBoard_boardname", freeBoard_boardname);
		params.put("freeBoard_boardno", freeBoard_boardno);
		return bDao.selectOneBoard(params);	

	}

	@Override
	public int getLastBoardno(int freeBoard_boardname, String freeBoard_userid) {
		// TODO Auto-generated method stub
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("freeBoard_boardname", freeBoard_boardname);
		param.put("freeBoard_userId", freeBoard_userid);
		// 지금은 보드네임만 넣지만 유저랑 합치면 유저 아이디도 넣어야함 ㅇㅇ
		return bDao.getLastBoardno(param);
	}

	@Override
	public int writeFreeBoard(FreeBoard freeboard) {
		// TODO Auto-generated method stub
		User user =uDao.selectUserbyId(freeboard.getFreeBoard_userId());
		user.setUser_score(user.getUser_score()+10);
		uDao.updateScore(user);
		
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
		params.put("listsize", commentList.size());
		return params;

	}
	// if(comment_page == 0)
	// page = (commetnsDao.getCount( ) -1)/ 10 + 1 //맨마지막페이지부터
	@Override
	public int getStartCommentPage(int comment_page, int numb) { // 시작페이지
		return (comment_page - 1) / 10 * 10 + 1;
	}
	@Override
	public int getEndCommentPage(int comment_page) { // 마지막 페이지
		return ((comment_page - 1) / 10 + 1) * 10;
	}
	@Override
	public int getLastCommentPage(HashMap<String, Object> params) {// 목록의 끝 번호
		int comment_numb = Integer.parseInt(String.valueOf(params.get("comment_numb")));
		return (bDao.getCommentCount(params) - 1) / comment_numb + 1;
	}
	@Override
	public int getCommentSkip(int comment_page, int comment_numb) {// 앞에 지나간 갯수
		return (comment_page - 1) * comment_numb;
	}
//★★★여기요★★★=============================================================================
	@Override
	public HashMap<String, Object> selectBoardLike(HashMap<String, Object> params,int page) {
		// TODO Auto-generated method stub
		HashMap<String, Object> result2 = new HashMap<String, Object>();
		int getEndPage = getEndPage(page);
		int getLastPage = getLastPage(params);
		if (getEndPage >= getLastPage)
			result2.put("end", getLastPage(params));
		else
			result2.put("end", getEndPage(page));
		result2.put("current", page);
		result2.put("start", getStartPage(page));
		result2.put("last", getLastPage(params));
		params.put("skip", getSkip(page));
		params.put("qty", 3);

		int size = bDao.getCount(params);
		result2.put("selectBoardLike", bDao.selectBoardLike(params)); 

		result2.put("dogFreeBoardCount", size);

return result2;
	
	}
//==============================================================================================
	//========좋아요
	/* 게시판의 좋아요 번호가 있는지 카운트 */
	@Override
	public int countbyLike(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		  int count = bDao.countbyLike(params);
		    return count;
	}

	/* 좋아요 번호 등록 */
	@Override
	public int creatFreeLikes(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
	    int count = bDao.creatFreeLikes(params);
	    return count;
	}

	/* 조회 */
	@Override
	public FreeLikes readFreeLikes(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		FreeLikes fL = bDao.readFreeLikes(params);
	    return fL;
	}
	
	@Override
	public int like_check(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		 int count = bDao.like_check(params);
		    return count;
	}

	//해당 게시글의 라이크 카운트 업
			@Override
			public int FreeBoard_likeCnt_up(int boardname, int boardno) {
				// TODO Auto-generated method stub
				HashMap<String, Object> params= new HashMap<String, Object>();
				params.put("freeBoard_boardname", boardname);
				params.put("freeBoard_boardno", boardno);
				return bDao.FreeBoard_likeCnt_up(params);
			}
	
	@Override
	public int like_check_cancel(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		  int count = bDao.like_check_cancel(params);
		    return count;
	}

	//해당 게시글의 라이크 카운트 다운
			@Override
			public int FreeBoard_likeCnt_down(int boardname, int boardno) {
				// TODO Auto-generated method stub
				HashMap<String, Object> params= new HashMap<String, Object>();
				params.put("freeBoard_boardname", boardname);
				params.put("freeBoard_boardno", boardno);
				return bDao.FreeBoard_likeCnt_down(params);
			}
			
			//================댓글
			@Override
			public HashMap<String, Object> ShowCommentFreeBoard(int freeBoard_boardname, int freeBoard_boardno, int comment_page) {
				// TODO Auto-generated method stub
				int comment_numb = 3;
				HashMap<String, Object> params = new HashMap<String, Object>();
				params.put("freeBoard_boardname", freeBoard_boardname);
				params.put("freeBoard_boardno", freeBoard_boardno);
				params.put("comment_page", comment_page);
				params.put("comment_numb", comment_numb);
				 params.put("comment_current",comment_page);
				 params.put("comment_start", getStartCommentPage(comment_page, comment_numb));
				 if(getEndCommentPage(comment_page) > getLastCommentPage(params))
				 params.put("comment_end", getLastCommentPage(params));
				 else
				 params.put("comment_end", getEndCommentPage(comment_page));
				 params.put("comment_last", getLastCommentPage(params));
				int comment_skip = getCommentSkip(comment_page, comment_numb);
				params.put("comment_skip", comment_skip);
				List<FreeComment> commentList = bDao.selectCommentAll(params);
				params.put("commentList", commentList);
				return params;

			}
			@Override
			public int writeCommentFreeBoard(FreeComment freecomment) {
				// TODO Auto-generated method stub
				SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
				freecomment.setFreeComments_writeDate(simple.format(new Date()));
				String user_id = freecomment.getFreeComments_userId();
				User user = uDao.selectUserbyId(user_id);
				user.setUser_score(user.getUser_score()+3);
				uDao.updateScore(user);
				int result = bDao.insertComment(freecomment);
				if(freecomment.getFreeComments_parent()==0) {
					freecomment.setFreeComments_parent(freecomment.getFreeBoard_boardno());
					freecomment.setFreeComments_commentno(freecomment.getFreeBoard_boardno());
					result = bDao.updateCommentParent(freecomment);
				}
				return result;
			}
			public int deleteComments(int freeComments_commentno, int freeComments_parent) {
				if(freeComments_commentno == freeComments_parent) { //가장 상위 댓글
					if(bDao.groupCount(freeComments_commentno) == 1)//대댓 없는 경우(나만 패런트넘=코멘트넘이 자신 하나만 있는 경우) 
					  bDao.deleteComments(freeComments_commentno);//지우기
					else {
					  HashMap<String, Object> params = new HashMap<String, Object>();
					  params.put("freeComments_commentno", freeComments_commentno);
					  params.put("freeBoard_content", "");
					  bDao.updateComments(params);//대댓있는경우 빈칸  
				  }
					
				}else { //대댓
				 if(bDao.selectOneComments(freeComments_parent).getFreeComments_content() ==""
						 && bDao.groupCount(freeComments_commentno) == 2) {//패런트가코멘트넘인 원댓 지워지고 대댓 하나뿐인 경우
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
