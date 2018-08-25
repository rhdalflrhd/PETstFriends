package dao;

import java.util.HashMap;
import java.util.List;

import model.QnA;

public interface QnADao {
	public int insertBoard(QnA qnA);
	
	
	 public List<QnA> myInquiry (HashMap<String, Object> params);

	 public int getMyQnACount(String user_id);
}
