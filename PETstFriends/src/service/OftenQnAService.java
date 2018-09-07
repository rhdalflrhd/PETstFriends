package service;

import java.util.List;

import model.OftenQnA;

public interface OftenQnAService {
	public List<OftenQnA> showOftenList();
	public OftenQnA showOftenQnABoard(int oftenQnA_boardno);
	public int updateOftenBoard(OftenQnA oftenQnA);
	public int writeOftenBoard(OftenQnA oftenQnA);
	public int deleteOftenQnABoard(int oftenQnA_boardno);
}
