package dao;

import java.util.List;

import model.OftenQnA;

public interface OftenQnADao {
	public List<OftenQnA> selectBoardAll();
	public OftenQnA selectOneBoard(int oftenQnA_boardno);
	public int updateBoard(OftenQnA oftenQnA);
	public int insertBoard(OftenQnA oftenQnA);
	public int deleteOftenBoard(int oftenQnA_boardno);
}
