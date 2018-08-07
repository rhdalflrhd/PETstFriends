package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import model.MeetingBoardApply;
import service.MeetingServiceImpl;

@Controller
public class MeetingBoardController {

	@Autowired
	private MeetingServiceImpl meetingServiceImpl;

	@RequestMapping("apply.do")
	public String apply() {
		MeetingBoardApply mApply = new MeetingBoardApply();
		mApply.setBoardname(1);
		mApply.setMeeting_boardno(1);
		mApply.setMeetingBoardApply_count(0);
		mApply.setMeetingBoardApply_email("dqwdq");
		mApply.setMeetingBoardApply_nickname("dw");
		mApply.setMeetingBoardApply_userId("wqwqwqwq");
		System.out.println(mApply);
        meetingServiceImpl.deleteApply("wqwqwqwq", 1);
        return "redirect:testForm.do";
	}
	@RequestMapping("testForm.do") // void !!
	public String joinForm() {
		return "meeting/test";
	}


		
	}
