package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.QnADao;
import model.QnA;

@Service
public class QnAServiceImpl implements QnAService {

	@Autowired
	QnADao qnADao;

	@Override
	public int writeQnABoard(QnA qnA) {
		// TODO Auto-generated method stub
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd:hh:mm:ss");
		qnA.setQnA_writeDate(simple.format(new Date()));
		return qnADao.insertBoard(qnA);
	}

	@Override
	public HashMap<String, Object> showQnAList(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		int numb = Integer.parseInt(String.valueOf(params.get("numb")));
		int page = Integer.parseInt(String.valueOf(params.get("page")));
		int skip = getSkip(page, numb);
		params.put("skip", skip);
		params.put("qList", qnADao.selectBoardAll(params));
		params.put("current", page);
		params.put("start", getStartPage(page, numb));
		if (getEndPage(page, numb) <= getLastPage(params)) {
			params.put("end", getEndPage(page, numb));
		} else {
			params.put("end", getLastPage(params));
		}
		params.put("last", getLastPage(params));
		return params;
	}
	@Override
	public int getStartPage(int page, int numb) { // 시작페이지
		return (page - 1) / numb * numb + 1;
	}
	@Override
	public int getEndPage(int page, int numb) { // 10단위로
		return ((page - 1) / numb + 1) * numb;
	}
	@Override
	public int getLastPage(HashMap<String, Object> params) {// 목록의 끝 번호
		int numb = Integer.parseInt(String.valueOf(params.get("numb")));
		return (qnADao.getCount(params) - 1) / numb + 1;
	}
	@Override
	public int getSkip(int page, int numb) {// 앞에 지나간 갯수
		return (page - 1) * numb;
	}

	@Override
	public QnA showQnABoard(int qnA_boardno) {
		// TODO Auto-generated method stub
		return qnADao.selectOneBoard(qnA_boardno);
	}

	@Override
	public int deleteQnABoard(int qnA_boardno) {
		// TODO Auto-generated method stub
		return qnADao.deleteQnABoard(qnA_boardno);
	}

	@Override
	public int writeQnAComment(QnA qnA) {
		// TODO Auto-generated method stub
		return qnADao.updateQnABoard(qnA);
	}

}
