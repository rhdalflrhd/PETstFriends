package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Mal;
import service.MalService;
import service.MalServiceImpl;

@Controller
public class MalController {

	@Autowired
	MalServiceImpl mService;
	
	@RequestMapping("showMalList.do")
	public ModelAndView showMalList() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("malList", mService.selectMalAll());
		mav.setViewName("manager/manager_SubjectHandling");
		return mav;
	}
	
	@RequestMapping("addMal.do")
	@ResponseBody
	public int addMal(@RequestParam String mal_malname) {
		Mal mal = new Mal();
		mal.setMal_malname(mal_malname);
		mService.addMal(mal);
		return mal.getMal_no();
	}
	
	@RequestMapping("deleteMal.do")
	@ResponseBody
	public int deleteMal(@RequestParam int mal_no) {
		return mService.deleteMal(mal_no);
	}
	
}