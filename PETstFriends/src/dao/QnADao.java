package dao;

import java.util.HashMap;
import java.util.List;

import model.QnA;

public interface QnADao {
	public int insertBoard(QnA qnA);
	public List<QnA> selectBoardAll(HashMap<String, Object> params);
	public int getCount(HashMap<String, Object> params);
	public QnA selectOneBoard(int qnA_boardno);
	public int deleteQnABoard(int qnA_boardno);
	public int updateQnABoard(QnA qnA);
}
