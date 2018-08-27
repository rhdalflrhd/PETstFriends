package service;

import java.util.HashMap;
import java.util.List;

import model.QnA;

public interface QnAService {
	public int writeQnABoard(QnA qnA);
	public HashMap<String, Object> showQnAList(HashMap<String, Object> params);
	public QnA showQnABoard(int qnA_boardno);
	public int getSkip(int page, int numb);
	public int getStartPage(int page, int numb);
	public int getEndPage(int page, int numb);
	public int getLastPage(HashMap<String, Object> params);
	public int deleteQnABoard(int qnA_boardno);
	public int writeQnAComment(QnA qnA);
}