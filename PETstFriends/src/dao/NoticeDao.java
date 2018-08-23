package dao;

import java.util.HashMap;

import model.Notice;

public interface NoticeDao {
	public Notice selectBoardPage(HashMap<String, Object> params);
	public int getCount(HashMap<String, Object> params);
	public Notice selectOneBoard(int notice_boardno);
	public int updateBoard(Notice notice);
	public int insertBoard(Notice notice);
	public int deleteBoard(int notice_boardno);
}
