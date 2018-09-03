package dao;

import java.util.HashMap;
import java.util.List;

import model.FreeBoard;
import model.FreeComment;
import model.FreeLikes;
import model.TipLikes;

public interface FreeBoardDao {
	public int insertBoard(FreeBoard freeboard); //게시글쓰기
	public int updateBoard(FreeBoard freeBoard); //게시글 수정
	public int deleteBoard(HashMap<String, Object> params); //게시글 삭제
	public FreeBoard selectOneBoard(HashMap<String, Object> params); //게시글하나만보기
	public List<FreeBoard> selectBoardbyId(int FreeBoard_boardname, String FreeBoard_id); //선택된 id가 쓴 게시글 보기?
	public List<FreeBoard> selectBoardAll(HashMap<String, Object> params);//게시글 전체 보기
	public int getCount(HashMap<String, Object> params); // 게시물 레코드 갯수 조회.. 이게 모였지
	
	public int getLastBoardno(HashMap<String, Object> params);
	
	//좋아요

	 /* 게시판의 좋아요 번호가 있는지 카운트 */
	public int countbyLike(HashMap<String, Object> params);
	  
	  /* 좋아요 번호 등록 */
	public int creatFreeLikes(HashMap<String, Object> params);
	  
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
	public FreeLikes readFreeLikes(HashMap<String, Object> params);
	 
	  /* 게시판의 좋아요 삭제(보드네임과 보드넘버로) */
	public int deletebyBoardNameBoardno(HashMap<String, Object> params);
	  
	  /* 회원의 좋아요 삭제 (회원 아이디로)*/
	public int deletebyUserId(String userid);
	
	//해당 게시판의 게시글의 좋아요 숫자 UP.
		public int FreeBoard_likeCnt_up(HashMap<String, Object> params);
		
		//해당 게시판의 게시글의 좋아요 숫자 down.
		public int FreeBoard_likeCnt_down(HashMap<String, Object> params);
		
	
	
	
	//댓글
	public int getCommentCount(HashMap<String, Object> params);//댓글 개수 조회
	public List<FreeComment> selectCommentAll(HashMap<String, Object> params);
	public int insertComment(FreeComment freecomment);
	public int updateCommentParent(FreeComment freecomment);
	public int groupCount(int freeComments_commentno);
	public int updateComments(HashMap<String, Object> params);
	public int deleteComments(int freeComments_commentno);
	public FreeComment selectOneComments(int freeComments_parent);
}