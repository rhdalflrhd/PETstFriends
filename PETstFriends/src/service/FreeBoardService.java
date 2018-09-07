package service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import model.Board;
import model.FreeBoard;
import model.FreeComment;
import model.FreeLikes;

public interface FreeBoardService {

	public int writeFreeBoard(FreeBoard freeboard); //게시글 쓰기
	public int ModifyFreeBoard(FreeBoard freeboard); //게시글 수정
	public int DeleteFreeBoard(int freeBoard_boardname, int freeBoard_boardno); //게시글 삭제
	
//----------------------------------------------------------------게시판검색------------------------------------------------------------------
	
	public HashMap<String, Object> SearchFreeBoardbyDog(HashMap<String, Object> params,int page); //dog게시판 검색
	public HashMap<String, Object> SearchFreeBoardbyCat(HashMap<String, Object> params,int page); //cat게시판 검색
	public HashMap<String, Object> SearchFreeBoardbyRabbit(HashMap<String, Object> params,int page); //rabbit게시판 검색
	public HashMap<String, Object> SearchFreeBoardbyEtc(HashMap<String, Object> params,int page); //etc게시판 검색

//----------------------------------------------------------------게시판목록------------------------------------------------------------------
	
	public  HashMap<String, Object> selectBoardLike(HashMap<String, Object> params,int page); //좋아요 높은 글 3개 ★★★여기요★★★
	public HashMap<String, Object> ShowFreeBoardDog(HashMap<String, Object> params,int page);//dog게시판 목록
	public HashMap<String, Object> ShowFreeBoardCat(HashMap<String, Object> params,int page);//cat게시판 목록
	public HashMap<String, Object> ShowFreeBoardRabbit(HashMap<String, Object> params,int page);//rabbit게시판 목록
	public HashMap<String, Object> ShowFreeBoardEtc(HashMap<String, Object> params,int page);//etc게시판 목록

	
	
	public int writeCommentFreeBoard(FreeComment freecomment); // 댓글쓰기
	public int CommentModifyFreeBoard(FreeComment freecomment); //댓글 수정
	public int CommentDeleteFreeBoard(int freeBoard_boardname,int freeBoard_boardno,int freeComments_commentno); //댓글삭제
	public List<FreeComment> ShowCommentFreeBoard(int freeBoard_boardname, int freeBoard_boardno); //코멘트 보기
	public boolean insertLikesFreeBoard(FreeLikes freeLikes); //좋아요
	public boolean deleteLikesFreeBoard(int freeBoard_boardname, int freeBoard_boardno); //좋아요취소


	public int getStartPage(int page); //처음페이지 1페이지

	public int getEndPage(int page); // 마지막페이지
	
	public int getLastPage(HashMap<String, Object> params); 
	
	public int getSkip(int page);
	
	public FreeBoard getBoard(int freeBoard_boardname,int freeBoard_boardno); 
	
	public FreeBoard readBoard(int freeBoard_boardname, int freeBoard_boardno);
	public int getLastBoardno(int freeBoard_boardname,String user_id);
	public File getAttachFile(HashMap<String, Object> params);
	
}
