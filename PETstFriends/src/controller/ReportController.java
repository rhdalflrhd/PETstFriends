package controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.Report;
import service.ReportServiceImpl;

@Controller
public class ReportController {

	@Autowired
	ReportServiceImpl rService;
	
	@RequestMapping("showReportList.do")
	public ModelAndView showReportList(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int numb, @RequestParam(required=false)String keyword,
			@RequestParam(defaultValue = "0") int boardname) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("page", page);
		params.put("numb", numb);
		if(boardname!=0) {
		    params.put("report_boardname", boardname);
		}
		
		if(keyword!=null && keyword!="") 
		     params.put("keyword", keyword);
		HashMap<String, Object> result = rService.showReportList(params);
		mav.addAllObjects(result);
		mav.setViewName("report/customerCenter_report");
		return mav;
		
	}
	
//	@RequestMapping("showReport.do")
//	public ModelAndView showReport(@RequestParam HashMap<String, Object> params){
//		ModelAndView mav = new ModelAndView();
//		int report_reportNo = Integer.parseInt(String.valueOf(params.get("report_reportNo")));
//		params.put("report", rService.showReport(report_reportNo));
//		mav.addAllObjects(params);
//		mav.setViewName("report/customerCenter_showReport");
//		return mav;
//	}
	
	@RequestMapping("writeReportForm.do")
	public String writeReportForm(@RequestParam int report_boardname, @RequestParam int report_boardno, @RequestParam String report_userId, Model model) {
		model.addAttribute("report_boardname", report_boardname);
		model.addAttribute("report_boardno", report_boardno);
		model.addAttribute("report_userId", report_userId);
		return "report/customerCenter_reportForm";
	}
	
	@RequestMapping("reportButton.do")
	public String reportButton() {
		return "report/reportButton";
	}
	
	@RequestMapping(value="writeReport.do", method = RequestMethod.POST)
	@ResponseBody
	public int writeReport(@RequestParam HashMap<String, Object> params) {
		System.out.println("writeReport.do 들어옴");
		Report report = new Report();
		report.setReport_boardname(Integer.parseInt(String.valueOf(params.get("report_boardname"))));
		report.setReport_boardno(Integer.parseInt(String.valueOf(params.get("report_boardno"))));
		String report_reportReason = String.valueOf(params.get("report_reportReason"));
		report.setReport_reportReason(report_reportReason);		
		report.setReport_userId(String.valueOf(params.get("report_userId")));
		return rService.writeReport(report);
		
	}
	@RequestMapping("deleteReport.do")
	public String deleteReport(@RequestParam(value="deleteArr[]") List<Integer> deleteArr, Model model) {

		rService.deleteReport(deleteArr);
		return "redirect:showReportList.do";
		
	}
	
	@RequestMapping("updateReportState.do")
	@ResponseBody
	public int updateReportState(@RequestParam int report_reportNo, @RequestParam int report_state) {
		return rService.updateReport(report_reportNo, report_state);
	}
	
	@RequestMapping("uu.do")
	public void uu(@RequestParam HashMap<String, Object> params) {
		System.out.println("보드네임2");
		System.out.println(params.get("boardno"));
	}
	@RequestMapping("ud.do")
	public void ud(@RequestParam HashMap<String, Object> params) {
		System.out.println("보드네임1");
		System.out.println(params.get("boardno"));
	}
	
}