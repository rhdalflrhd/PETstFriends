package service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import model.TipBoard;
import model.TipLikes;
import model.TipComments;

public interface TipBoardService {

	
	//==============================  팁보드 서비스==== ========================================
	
	public int TipboardNullcheck(int boardname);
	
	public int writeTipBoardS(TipBoard dtBoard,MultipartFile TipBoard_contentPic);
	public int ModifyTipBoardS(TipBoard dtBoard,MultipartFile TipBoard_contentPic);
	public int DeleteTipBoardS(int boardname, int boardno);
	
	public TipBoard ReadTipBoardS(int boardname, int boardno);

	public HashMap<String, Object> SearchTipBoardS(HashMap<String, Object> params, int Page);
	
	public int getStartPageS(int page);

	public int getEndPageS(int page);
	
	public int getLastPageS(HashMap<String, Object> params);
	
	public int getSkipS(int page);
	
	public int getLastBoardno(int boardname, String user_Id);
	
	public TipBoard getBoardS(int boardname, int boardno);
	
	public HashMap<String, Object> getBoardListPage(HashMap<String, Object> params, int page);	
	
	//첨부파일 갖다주는 기능 추가
	public File getAttachFileS(int boardname, int boardno);
	
	//해당 게시글의 라이크 카운트 업
	public int TipBoard_likeCnt_up(int boardname, int boardno);
	
	//해당 게시글의 라이크 카운트 다운
	public int TipBoard_likeCnt_down(int boardname, int boardno);
	
	//==============================팁보드 코멘트 서비스============================================	
	
	//해당 게시글에 댓글 작성
	public int writeTipComments(HashMap<String, Object> param);
    
	//해당 게시글에있는 댓글리스트 불러오기
	public List<TipComments> getTipCommentsList(HashMap<String, Object> param);
    
	//해당 게시글에있는 댓글 삭제
	public int deleteTipComments(HashMap<String, Object> param); 
   
	//해당 게시글에 있는 댓글 수정
	public boolean updateTipComments(HashMap<String, Object> param);
	
    
    //==============================팁보드 좋아요 서비스===========================================	
	
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
	  public int deletebyBoardNameBoardno(int boardname, int boardno);
	  
	  /* 회원의 좋아요 삭제 (회원 아이디로)*/
	  public int  deletebyUserId(String userid);
}

