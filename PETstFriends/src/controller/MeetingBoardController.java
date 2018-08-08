package controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.MeetingBoard;
import model.MeetingBoardApply;
import model.MeetingComment;
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
		mBoard.setMeetingBoard_phone("phone2");
		mBoard.setMeetingBoard_email("email2");
		mBoard.setMeetingBoard_readCount(0);
		mBoard.setMeetingBoard_writeDate(new Date());
		mBoard.setMeetingBoard_nickname("nickname2");
		mBoard.setMeetingBoard_LikeCount(0);
		System.out.println(mBoard);
		meetingServiceImpl.modifyMeetingBoard(mBoard);
		return "redirect:testForm.do";
	}
	@RequestMapping("deleteMBC.do")
	public String deleteMBC() {
//		int meeting_boardno 
		meetingServiceImpl.deleteMeetingBoard(1);
		return "redirect:testForm.do";
	}
	@RequestMapping("showMBC.do")//검색 포함
	public ModelAndView showMBC(@RequestParam(defaultValue = "1") int page, @RequestParam(required = false) String keyword, 
			@RequestParam(defaultValue = "0") int type) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("type", type);
		param.put("keyword", keyword);
		if (type == 1) {
			param.put("meetingBoard_title", keyword);
		} else if (type == 2) {
			param.put("meetingBoard_content", keyword);
		} else if (type == 3) {
			param.put("meetingBoard_title", keyword);
			param.put("meetingBoard_content", keyword);
		} else if (type == 4) {
			param.put("meetingBoard_nickname", keyword);
		}
		List<MeetingBoard> result = meetingServiceImpl.showMeetingBoard(param);
		mav.addObject(result);
		mav.addAllObjects(param);
		mav.setViewName("meeting/test");
		System.out.println(result);
		return mav;
	}
	
	@RequestMapping("selectMBC.do")
	public String selectMBC(Model model, int meeting_boardno) {
		model.addAttribute("MeetingBoard", meetingServiceImpl.selectMeetingBoard(meeting_boardno));
		return "meeting/test";
	}
	
	//모임신청
	
	@RequestMapping("insertApplyMBC.do")
	public String insertApplyMBC() {
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
	@RequestMapping("deleteApplyMBC.do")
	public String deleteApplyMBC() {
//		String meetingBoardApply_userId,
//		 int meeting_boardno
		meetingServiceImpl.deleteApply("userId", 1);
		return "redirect:testForm.do";
	}
	@RequestMapping("showApplyMBC.do")
	public ModelAndView showApplyMBC() {
//		 int meeting_boardno
		ModelAndView mav = new ModelAndView();
		List<MeetingBoardApply> result = meetingServiceImpl.showApply(1);
		mav.addObject(result);
		mav.setViewName("meeting/test");
		return mav;
	}
	
	
	//모임글 댓글
	
	@RequestMapping("commentWriteMBC.do")
	public String commentWriteMBC() {
		MeetingComment mComment = new MeetingComment();
		mComment.setBoardname(1);
		mComment.setMeeting_boardno(1);
		mComment.setMeetingComment_commentno(1);
		mComment.setMeetingComment_content("content");
		mComment.setMeetingComment_nickname("meetingComment_nickname");
		mComment.setMeetingComment_userId("meetingComment_userId");
		mComment.setMeetingComment_writeDate(new Date());
		meetingServiceImpl.commentWriteMeetingBoard(mComment);
		System.out.println(meetingServiceImpl.showCommentMeetingBoard(1));
		return "redirect:testForm.do";
	}
	
	@RequestMapping("testForm.do") // void !!
	public String joinForm() {
		return "meeting/test";
	}


		
	}
