package controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import model.MeetingBoard;
import model.MeetingBoardApply;
import service.MeetingServiceImpl;

@Controller
public class MeetingBoardController {

	@Autowired
	private MeetingServiceImpl meetingServiceImpl;

	@RequestMapping("writeMBC.do")
	public String writeMBC() {
		MeetingBoard mBoard = new MeetingBoard();
		mBoard.setBoardname(1);
		mBoard.setMeetingBoard_userId("id");
		mBoard.setMeetingBoard_contentPic(null);
		mBoard.setMeetingBoard_title("title");
		mBoard.setMeetingBoard_startMeetingDate(new Date());
		mBoard.setMeetingBoard_endMeetingDate(new Date());
		mBoard.setMeetingBoard_startAcceptingDate(new Date());
		mBoard.setMeetingBoard_endAcceptingDate(new Date());
		mBoard.setMeetingBoard_place("place");
		mBoard.setMeetingBoard_content("content");
		mBoard.setMeetingBoard_contentPic("contentpic");
		mBoard.setMeetingBoard_phone("phone");
		mBoard.setMeetingBoard_email("email");
		mBoard.setMeetingBoard_readCount(0);
		mBoard.setMeetingBoard_writeDate(new Date());
		mBoard.setMeetingBoard_nickname("nickname");
		mBoard.setMeetingBoard_LikeCount(0);
		meetingServiceImpl.writeMeetingBoard(mBoard);
		
		return "redirect:testForm.do";
	}
	@RequestMapping("modifyMBC.do")
	public String modifyMBC() {
		MeetingBoard mBoard = new MeetingBoard();
		mBoard.setBoardname(1);
		mBoard.setMeeting_boardno(1);
		mBoard.setMeetingBoard_userId("id");
		mBoard.setMeetingBoard_contentPic(null);
		mBoard.setMeetingBoard_title("title");
		mBoard.setMeetingBoard_startMeetingDate(new Date());
		mBoard.setMeetingBoard_endMeetingDate(new Date());
		mBoard.setMeetingBoard_startAcceptingDate(new Date());
		mBoard.setMeetingBoard_endAcceptingDate(new Date());
		mBoard.setMeetingBoard_place("place1");
		mBoard.setMeetingBoard_content("content1");
		mBoard.setMeetingBoard_contentPic("contentpic");
		mBoard.setMeetingBoard_phone("phone1");
		mBoard.setMeetingBoard_email("email1");
		mBoard.setMeetingBoard_readCount(0);
		mBoard.setMeetingBoard_writeDate(new Date());
		mBoard.setMeetingBoard_nickname("nickname1");
		mBoard.setMeetingBoard_LikeCount(0);
		System.out.println(mBoard);
		meetingServiceImpl.modifyMeetingBoard(mBoard);
		System.out.println(meetingServiceImpl.showMeetingBoard());
		return "redirect:testForm.do";
	}
	
	@RequestMapping("insertApplyMBC.do")
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
