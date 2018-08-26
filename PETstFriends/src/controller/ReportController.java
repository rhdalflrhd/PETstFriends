package controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
			@RequestParam int report_boardname) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("page", page);
		params.put("numb", numb);
	    params.put("report_boardname", report_boardname);
		if(keyword!=null)
		     params.put("keyword", keyword);

		HashMap<String, Object> result = rService.showReportList(params);
		mav.setViewName("report/customerCenter_report");
		return mav;
		
	}
	
	@RequestMapping("showReport.do")
	public ModelAndView showReport(@RequestParam HashMap<String, Object> params){
		ModelAndView mav = new ModelAndView();
		int report_reportNo = Integer.parseInt(String.valueOf(params.get("report_reportNo")));
		params.put("report", rService.showReport(report_reportNo));
		mav.addAllObjects(params);
		mav.setViewName("report/customerCenter_showReport");
		return mav;
	}
	
	@RequestMapping("writeReportForm.do")
	public String writeReportForm() {
		return "report/customerCenter_reportForm";
	}
	@RequestMapping("writeReport.do")
	@ResponseBody
	public int writeReport(@RequestParam Report report) {
		return rService.writeReport(report);
		
	}
	@RequestMapping("deleteReport.do")
	public String deleteReport(@RequestParam HashMap<String, Object> params, Model model) {
		model.addAllAttributes(params);
		int report_reportNo = Integer.parseInt(String.valueOf(params.get("report_reportNo")));
		rService.deleteReport(report_reportNo);
		return "redirect:showReportList.do";
		
	}
	
	@RequestMapping("updateReportState.do")
	public int updateReportState(@RequestParam int report_reportNo, @RequestParam int report_state) {
		rService.updateReport(report_reportNo, report_state);
		return 1;
		
	}
}
