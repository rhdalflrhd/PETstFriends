package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.OftenQnADao;
import model.Notice;
import model.OftenQnA;

@Service
public class OftenQnAServiceImpl implements OftenQnAService{

	@Autowired
	OftenQnADao oqDao;
	
	@Override
	public List<OftenQnA> showOftenList() {
		// TODO Auto-generated method stub
		return oqDao.selectBoardAll();
	}

	@Override
	public OftenQnA showOftenQnABoard(int oftenQnA_boardno) {
		// TODO Auto-generated method stub
		OftenQnA oftenQnA = oqDao.selectOneBoard(oftenQnA_boardno);
		oftenQnA.setOftenQnA_readCount(oftenQnA.getOftenQnA_readCount()+1);
		oqDao.updateBoard(oftenQnA);
		return oqDao.selectOneBoard(oftenQnA_boardno);
	}

	@Override
	public int updateOftenBoard(OftenQnA oftenQnA) {
		// TODO Auto-generated method stub
			return oqDao.updateBoard(oftenQnA);
	}

	@Override
	public int writeOftenBoard(OftenQnA oftenQnA) {
		// TODO Auto-generated method stub
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd:hh:mm:ss");
		String oftenQnA_writeDate = simple.format(new Date());
		oftenQnA.setOftenQnA_writeDate(oftenQnA_writeDate);
		oftenQnA.setOftenQnA_readCount(0);
		return oqDao.insertBoard(oftenQnA);
		
	}

	@Override
	public int deleteOftenQnABoard(int oftenQnA_boardno) {
		// TODO Auto-generated method stub
		return oqDao.deleteOftenBoard(oftenQnA_boardno);
	}

}
