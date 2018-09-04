package dao;

import java.util.HashMap;
import java.util.List;

import model.Report;

public interface ReportDao {
	public List<Report> selectReportAll(HashMap<String, Object>params);
	public int getCount(HashMap<String, Object> params);
	public Report selectOneReport(int report_reportNo);
	public int insertReport(Report report);
	public int deleteReport(int report_reportNo);
	public int updateReport(Report report);
	
}