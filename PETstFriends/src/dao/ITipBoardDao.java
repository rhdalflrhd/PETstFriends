package dao;

import java.util.HashMap;
import java.util.List;

import model.TipBoard;
import model.TipComments;

public interface ITipBoardDao { 

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
	
//
//	//params : 제목, 내용, 넘길 레코드의 개수, 조회할 레코드의 개수
//	public List<TipBoard> selectSearchTitleContent(HashMap<String, Object> params);
//	
//	//params : 글쓴이 조회, 넘길 레코드의 개수, 조회할 레코드의 개수
//	public List<TipBoard> selectSearchName(HashMap<String, Object> params);
//	
//	//params : 시작일, 종료일, 넘길 레코드의 개수, 조회할 레코드의 개수
//	public List<TipBoard> selectSearchPeriod(HashMap<String, Object> params);
	public int CommentsgetCount();
	
	public int insertTipComments(TipComments tc);
	
	public int updateTipCommentsGroup(int TipComments_no);

	public TipComments selectOneTipCommnets(int TipComments_groupno);
	
	public int updateTipComments(HashMap<String, Object> params);
	
	public List<TipComments> selectAll(int skip);
	
	public int groupnoCount(int TipComments_no);
	
	public int deleteTipComments(int TipComments_no);
	
}
