package service;

import java.util.HashMap;
import java.util.List;

import model.Report;

public interface ReportService {
	public HashMap<String, Object> showReportList(HashMap<String, Object> params);
	public Report showReport(int report_reportNo);
	public int writeReport(Report report);
	public int deleteReport(List<Integer> deleteArr);
	public int updateReport(int report_reportNo, int report_state);
}