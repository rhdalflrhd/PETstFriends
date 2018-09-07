package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ReportDao;
import model.Report;

@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	ReportDao rDao;
	
	@Override
	public HashMap<String, Object> showReportList(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		int page = Integer.parseInt(String.valueOf(params.get("page")));
		int numb = Integer.parseInt(String.valueOf(params.get("numb")));
		HashMap<String, Object> result = new HashMap<String, Object>();
		params.put("skip", getSkip(page, numb));
		params.put("rList", rDao.selectReportAll(params));
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

	public int getStartPage(int page, int numb) {// 시작페이지
		return (page - 1) / numb * numb + 1;
	}

	public int getEndPage(int page, int numb) {// 10단위로
		return ((page - 1) / numb + 1) * numb;
	}

	public int getLastPage(HashMap<String, Object> params) {// 목록의 끝 번호
		int numb = Integer.parseInt(String.valueOf(params.get("numb")));
		return (rDao.getCount(params) - 1) / numb + 1;
	}

	public int getSkip(int page, int numb) {// 앞에 지나간 갯수
		return (page - 1) * numb;
	}

	@Override
	public Report showReport(int report_reportNo) {
		// TODO Auto-generated method stub
		return rDao.selectOneReport(report_reportNo);
	}

	@Override
	public int writeReport(Report report) {
		// TODO Auto-generated method stub
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd:hh:mm:ss");
		report.setReport_date(simple.format(new Date()));
		report.setReport_state(0);//0미와 1처리 2보류
		return rDao.insertReport(report);
	}

	@Override
	public int deleteReport(List<Integer> deleteArr) {
		// TODO Auto-generated method stub
		for(int i = 0; i < deleteArr.size(); i++) {
			rDao.deleteReport(deleteArr.get(i));
		}
		return 1;
	}

	@Override
	public int updateReport(int report_reportNo, int report_state) {
		// TODO Auto-generated method stub
		Report report = new Report();
		report.setReport_reportNo(report_reportNo);
		report.setReport_state(report_state);
		return rDao.updateReport(report);
	}

}