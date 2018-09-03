package service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import model.Board;
import model.FreeBoard;
import model.FreeComment;
import model.FreeLikes;

public interface FreeBoardService {

	public int writeFreeBoard(FreeBoard freeboard); //게시글 쓰기
	public int ModifyFreeBoard(FreeBoard freeboard); //게시글 수정
	public int DeleteFreeBoard(int freeBoard_boardname, int freeBoard_boardno); //게시글 삭제
	public HashMap<String, Object> SearchFreeBoardbyTNC(HashMap<String, Object> params,int page); //제목,닉넴,내용으로검색
//	public HashMap<String, Object> SearchFreeBoardbyTitle(HashMap<String, Object> params);//제목으로 검색
//	public HashMap<String, Object> SearchFreeBoardbyNN(HashMap<String, Object> params); // 닉넴으로 검색
//	public HashMap<String, Object> SearchFreeBoardbyCon(HashMap<String, Object> params); // 내용으로 검색
	public HashMap<String, Object> ShowFreeBoard(HashMap<String, Object> params,int page);//게시판 목록?
	public int writeCommentFreeBoard(FreeComment freecomment); // 댓글쓰기
	public int CommentModifyFreeBoard(FreeComment freecomment); //댓글 수정
	public int CommentDeleteFreeBoard(int freeBoard_boardname,int freeBoard_boardno,int freeComments_commentno); //댓글삭제
	public List<FreeComment> ShowCommentFreeBoard(int freeBoard_boardname, int freeBoard_boardno); //코멘트 보기
	public boolean insertLikesFreeBoard(FreeLikes freeLikes); //좋아요
	public boolean deleteLikesFreeBoard(int freeBoard_boardname, int freeBoard_boardno); //좋아요취소


	public int getStartPage(int page); //처음페이지 1페이지

	public int getEndPage(int page); // 마지막페이지
	
	public int getLastPage(HashMap<String, Object> params); //얘도 마지막페이지?
	
	public int getSkip(int page);
	
	public FreeBoard getBoard(int freeBoard_boardname,int freeBoard_boardno); 
	
	public FreeBoard readBoard(int freeBoard_boardname, int freeBoard_boardno);
	public int getLastBoardno(int freeBoard_boardname,String user_id);
	public File getAttachFile(HashMap<String, Object> params);
	
}
