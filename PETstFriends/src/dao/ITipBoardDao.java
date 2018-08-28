package dao;

import java.util.HashMap;
import java.util.List;

import model.TipBoard;
import model.TipComments;
import model.TipLikes;

public interface ITipBoardDao { 

		
	//==============================팁보드 다오============================================
	public int insertBoard(TipBoard dtBoard);

	public int updateBoard(TipBoard dtBoard);

	public int deleteBoard(HashMap<String, Object> params);

	public TipBoard selectOneBoard(HashMap<String, Object> params);

	public List<TipBoard> selectBoardbyId(int boardname, String id);
	
	//params : 제목, 내용, 넘길 레코드의 개수, 조회할 레코드의 개수
	public List<TipBoard> selectBoardPage(HashMap<String, Object> params);

	//게시물 레코드 개수 조회
	public int getCount(HashMap<String, Object> params);
	
	//해당 게시판의 마지막 게시물 보드넘버 리턴
	public int getLastBoardno(HashMap<String, Object> params);
	
	//해당 게시판의 게시글의 좋아요 숫자 UP.
	public int TipBoard_likeCnt_up(HashMap<String, Object> params);
	
	//해당 게시판의 게시글의 좋아요 숫자 down.
	public int TipBoard_likeCnt_down(HashMap<String, Object> params);
	
//updateBoardLikes
//	//params : 제목, 내용, 넘길 레코드의 개수, 조회할 레코드의 개수
//	public List<TipBoard> selectSearchTitleContent(HashMap<String, Object> params);
//	
//	//params : 글쓴이 조회, 넘길 레코드의 개수, 조회할 레코드의 개수
//	public List<TipBoard> selectSearchName(HashMap<String, Object> params);
//	
//	//params : 시작일, 종료일, 넘길 레코드의 개수, 조회할 레코드의 개수
//	public List<TipBoard> selectSearchPeriod(HashMap<String, Object> params);
	
	
	//==============================팁보드 코멘트 다오============================================	
	public int CommentsgetCount();
	
	public int insertTipComments(TipComments tc);
	
	public int updateTipCommentsGroup(int TipComments_no);

	public TipComments selectOneTipCommnets(int TipComments_groupno);
	
	public int updateTipComments(HashMap<String, Object> params);
	
	public List<TipComments> selectAll(int skip);
	
	public int groupnoCount(int TipComments_no);
	
	public int deleteTipComments(int TipComments_no);

	//==============================팁보드 좋아요 다오============================================
	
	 /* 게시판의 좋아요 번호가 있는지 카운트 */
	public int countbyLike(HashMap<String, Object> params);
	  
	  /* 좋아요 번호 등록 */
	public int createTipLikes(HashMap<String, Object> params);
	  
	  /**
	   * 좋아요 체크 여부 (0 -> 1)
	   * @param hashMap
	   * @return
	   */
	public int like_check(HashMap<String, Object> params);
	  
	  /**
	   * 좋아요 체크 여부 (1 -> 0)
	   * @param hashMap
	   * @return
	   */
	public int like_check_cancel(HashMap<String, Object> params);
	  
	  /* 조회 */
	public TipLikes readTipLikes(HashMap<String, Object> params);
	 
	  /* 게시판의 좋아요 삭제(보드네임과 보드넘버로) */
	public int deletebyBoardNameBoardno(HashMap<String, Object> params);
	  
	  /* 회원의 좋아요 삭제 (회원 아이디로)*/
	public int deletebyUserId(String userid);
	
}
