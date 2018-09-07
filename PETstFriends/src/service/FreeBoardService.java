package service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

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

	

	public int getStartPage(int page); //처음페이지 1페이지

	public int getEndPage(int page); // 마지막페이지
	
	public int getLastPage(HashMap<String, Object> params); 
	
	public int getSkip(int page);
	
	public FreeBoard getBoard(int freeBoard_boardname,int freeBoard_boardno); 
	
	public int getLastBoardno(int freeBoard_boardname,String user_id);
	public File getAttachFile(HashMap<String, Object> params);
	//==================댓글
	public int getStartCommentPage(int comment_page, int numb);
	public int getEndCommentPage(int comment_page);
	public int getLastCommentPage(HashMap<String, Object> params);
	public int getCommentSkip(int comment_page, int comment_numb);
	public HashMap<String, Object> ShowCommentFreeBoard(int freeBoard_boardname, int freeBoard_boardno, int comment_page);
	public int writeCommentFreeBoard(FreeComment freecomment);
	public int deleteComments(int freeComments_commentno, int freeComments_parent);
	public int updatefreeComment(int freeComments_commentno, String freeComments_content);
	
	
	//게시글하나
	HashMap<String, Object> readBoard(int freeBoard_boardname, int freeBoard_boardno);
	public int countbyLike(HashMap<String, Object> params);
	public int creatFreeLikes(HashMap<String, Object> params);

	public FreeLikes readFreeLikes(HashMap<String, Object> params);
	public int like_check(HashMap<String, Object> params);
	public int FreeBoard_likeCnt_up(int boardname, int boardno);
	public int like_check_cancel(HashMap<String, Object> params);
	public int FreeBoard_likeCnt_down(int boardname, int boardno);
	

}
