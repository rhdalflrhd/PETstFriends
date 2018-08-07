package service;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.QnADao;
import model.QnA;


@Service
public class QnAService implements IQnAService{

	@Autowired
	QnADao qnADao;
	
	@Override
	public int wrtieQnABoard(QnA qnA) {
		// TODO Auto-generated method stub
		return qnADao.insertBoard(qnA);
	}
}
