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

	public int writeFreeBoard(FreeBoard freeboard, MultipartFile file); //게시글 쓰기
	public int ModifyFreeBoard(FreeBoard freeBoard); //게시글 수정
	public int DeleteFreeBoard(int FreeBoard_boardname, int FreeBoard_boardno); //게시글 삭제
	public List<FreeBoard> SearchFreeBoardbyTNC(int FreeBoard_boardname,String FreeBoard_title,String FreeBoard_nickname,String FreeBoard_content); //제목,닉넴,내용으로검색
	public List<FreeBoard> SearchFreeBoardbyTitle(int FreeBoard_boardname,String FreeBoard_title);//제목으로 검색
	public List<FreeBoard> SearchFreeBoardbyNN(int FreeBoard_boardname,String FreeBoard_nickname); // 닉넴으로 검색
	public List<FreeBoard> SearchFreeBoardbyCon(int FreeBoard_boardname,String FreeBoard_content); // 내용으로 검색
	public HashMap<String, Object> ShowFreeBoard(HashMap<String, Object> params, int page); //게시판 목록?
	
	public int writeCommentFreeBoard(FreeComment freecomment); // 댓글쓰기
	public int CommentModifyFreeBoard(FreeComment freecomment); //댓글 수정
	public int CommentDeleteFreeBoard(int FreeBoard_boardname,int FreeBoard_boardno,int FreeComments_commentno); //댓글삭제
	public List<FreeComment> ShowCommentFreeBoard(int FreeBoard_boardname, int FreeBoard_boardno, int comment_page); //코멘트 보기
	
	public boolean insertLikesFreeBoard(FreeLikes FreeLikes); //좋아요
	public boolean deleteLikesFreeBoard(int FreeBoard_boardname, int FreeBoard_boardno); //좋아요취소
	

//	public HashMap<String, Object> getBoardListPage(HashMap<String, Object> params, int page); //이게 게시판목록보기인가?

	public int getStartPage(int page); //처음페이지 1페이지

	public int getEndPage(int page); // 마지막페이지
	
	public int getLastPage(HashMap<String, Object> params); //얘도 마지막페이지?
	
	public int getSkip(int page);
	
	public FreeBoard getBoard(int FreeBoard_boardname,int FreeBoard_boardno); 
	
	public HashMap<String, Object> readBoard(int FreeBoard_boardname, int FreeBoard_boardno);
	public int getLastBoardno(int boardname, String user_id);
	public File getAttachFile(HashMap<String, Object> params);
	
}
