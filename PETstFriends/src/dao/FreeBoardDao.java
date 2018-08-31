package dao;

import java.util.HashMap;
import java.util.List;

import model.FreeBoard;
import model.FreeComment;
import model.FreeLikes;

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
	public boolean insertLikes(FreeLikes FreeLikes); //좋아요 한번클릭
	public boolean deleteLikes(int FreeBoard_boardname,int FreeBoard_boardno); //좋아요 또 클릭되면 좋아요 취소되는거
	public FreeBoard selectOneLikes(int FreeBoard_boardname,int FreeBoard_boardno); //모였지.. 내가조아요한게시물?
	public List<FreeBoard> selectAllLikes(int FreeBoard_boardname,String FreeLikes_id); //?? 조아요누름 게시물 전체..?
	
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
