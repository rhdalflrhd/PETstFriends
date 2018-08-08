package service;

import java.util.HashMap;
import java.util.List;


import model.FreeBoard;
import model.FreeComment;
import model.FreeLikes;

public interface FreeBoardService {

	public int writeFreeBoard(FreeBoard freeboard); //게시글 쓰기
	public int ModifyFreeBoard(HashMap<String, Object> params); //게시글 수정
	public int DeleteFreeBoard(int FreeBoard_boardname, int FreeBoard_boardno); //게시글 삭제
	public List<FreeBoard> SearchFreeBoardbyTNC(int FreeBoard_boardname,String FreeBoard_title,String FreeBoard_nickname,String FreeBoard_content); //제목,닉넴,내용으로검색
	public List<FreeBoard> SearchFreeBoardbyTitle(int FreeBoard_boardname,String FreeBoard_title);//제목으로 검색
	public List<FreeBoard> SearchFreeBoardbyNN(int FreeBoard_boardname,String FreeBoard_nickname); // 닉넴으로 검색
	public List<FreeBoard> SearchFreeBoardbyCon(int FreeBoard_boardname,String FreeBoard_content); // 내용으로 검색
	public List<FreeBoard> ShowFreeBoard(int FreeBoard_boardname); //게시판 목록?
	public int writeCommentFreeBoard(FreeComment freecomment); // 댓글쓰기
	public int CommentModifyFreeBoard(FreeComment freecomment); //댓글 수정
	public int CommentDeleteFreeBoard(int FreeBoard_boardname,int FreeBoard_boardno,int FreeComments_commentno); //댓글삭제
	public List<FreeComment> ShowCommentFreeBoard(int FreeBoard_boardname, int FreeBoard_boardno); //코멘트 보기
	public boolean insertLikesFreeBoard(FreeLikes FreeLikes); //좋아요
	public boolean deleteLikesFreeBoard(int FreeBoard_boardname, int FreeBoard_boardno); //좋아요취소
	
	
	public HashMap<String, Object> getBoardListPage(HashMap<String, Object> params, int FreeBoard_boardno); //이게 게시판목록보기인가?

	public int getStartPage(int FreeBoard_boardno); //처음페이지 1페이지

	public int getEndPage(int FreeBoard_boardno); // 마지막페이지
	
	public int getLastPage(HashMap<String, Object> params); //얘도 마지막페이지?
	
	public int getSkip(int page);
	
	public FreeBoard getBoard(int FreeBoard_boardname,int FreeBoard_boardno); 
	
	
}
