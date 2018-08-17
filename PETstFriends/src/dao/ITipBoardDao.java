package dao;

import java.util.HashMap;
import java.util.List;

import model.TipBoard;

public interface ITipBoardDao { 

	public int insertBoard(TipBoard dtBoard);

	public int updateBoard(TipBoard dtBoard);

	public int deleteBoard(int boardname, int boardno);

	public TipBoard selectOneBoard(int boardname, int boardno);

	public List<TipBoard> selectBoardbyId(int boardname, String id);
	
	//params : 제목, 내용, 넘길 레코드의 개수, 조회할 레코드의 개수
	public List<TipBoard> selectBoardPage(int boardname, HashMap<String, Object> params);

	//게시물 레코드 개수 조회
	public int getCount(HashMap<String, Object> paramas);

	//params : 제목, 내용, 넘길 레코드의 개수, 조회할 레코드의 개수
	public List<TipBoard> selectSearchTitleContent(HashMap<String, Object> params);
	
	//params : 글쓴이 조회, 넘길 레코드의 개수, 조회할 레코드의 개수
	public List<TipBoard> selectSearchName(HashMap<String, Object> params);
	
	//params : 시작일, 종료일, 넘길 레코드의 개수, 조회할 레코드의 개수
	public List<TipBoard> selectSearchPeriod(HashMap<String, Object> params);
}
