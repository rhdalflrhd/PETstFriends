package model;

public class Report {
	private int report_boardname;
	private int report_boardno;
	private String report_reportReason;
	private int report_reportNo;
	private String report_userId;//신고당한 아이디
	private int report_state;
	private String report_date;
	public int getReport_boardname() {
		return report_boardname;
	}
	public void setReport_boardname(int report_boardname) {
		this.report_boardname = report_boardname;
	}
	public int getReport_boardno() {
		return report_boardno;
	}
	public void setReport_boardno(int report_boardno) {
		this.report_boardno = report_boardno;
	}
	public String getReport_reportReason() {
		return report_reportReason;
	}
	public void setReport_reportReason(String report_reportReason) {
		this.report_reportReason = report_reportReason;
	}
	public int getReport_reportNo() {
		return report_reportNo;
	}
	public void setReport_reportNo(int report_reportNo) {
		this.report_reportNo = report_reportNo;
	}
	public String getReport_userId() {
		return report_userId;
	}
	public void setReport_userId(String report_userId) {
		this.report_userId = report_userId;
	}
	public int getReport_state() {
		return report_state;
	}
	public void setReport_state(int report_state) {
		this.report_state = report_state;
	}
	public String getReport_date() {
		return report_date;
	}
	public void setReport_date(String report_date) {
		this.report_date = report_date;
	}
	@Override
	public String toString() {
		return "Report [report_boardname=" + report_boardname + ", report_boardno=" + report_boardno
				+ ", report_reportReason=" + report_reportReason + ", report_reportNo=" + report_reportNo
				+ ", report_userId=" + report_userId + ", report_state=" + report_state + ", report_date=" + report_date
				+ "]";
	}
	

}