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
import model.MeetingBoardReview;
import model.MeetingComment;
import model.MeetingLikes;
import model.ReviewComment;
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
	@RequestMapping("showMBC.do")//검색 포함//게시판에서 페이지처리 때문에 추가 작성해야할수도잇음
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
	@RequestMapping("commentModifyMBC.do")
	public String commentModifyMBC() {
		MeetingComment mComment = new MeetingComment();
		mComment.setBoardname(1);
		mComment.setMeeting_boardno(1);
		mComment.setMeetingComment_commentno(1);
		mComment.setMeetingComment_content("content2");
		mComment.setMeetingComment_nickname("meetingComment_nickname2");
		mComment.setMeetingComment_userId("meetingComment_userId");
		mComment.setMeetingComment_writeDate(new Date());
		meetingServiceImpl.commentModifyMeetingBoard(mComment);
		System.out.println(meetingServiceImpl.showCommentMeetingBoard(1));
		return "redirect:testForm.do";
	}
	@RequestMapping("commentDeleteMBC.do")
	public String commentDeleteMBC() {
//		 int Meeting_boardno,
//		 int MeetingComment_commentno
		meetingServiceImpl.commentDeleteMeetingBoard(1, 1);
		return "redirect:testForm.do";
	}
	@RequestMapping("commentSelectMBC.do")
	public ModelAndView commentSelectMBC() {
//		 int Meeting_boardno,
//		 int MeetingComment_commentno
		ModelAndView mav = new ModelAndView();
		MeetingComment result = meetingServiceImpl.selectCommentMeetingBoard(1, 1);
		mav.addObject(result);
		mav.setViewName("meeting/test");
		System.out.println(result);
		return mav;
	}
	@RequestMapping("showCommentMBC.do")
	public ModelAndView showCommentMBC() {
//		 int Meeting_boardno,
		ModelAndView mav = new ModelAndView();
		List<MeetingComment> result = meetingServiceImpl.showCommentMeetingBoard(1);
		mav.addObject(result);
		mav.setViewName("meeting/test");
		System.out.println(result);
		return mav;
	}
	
	//후기글
	
	@RequestMapping("writeReviewMBC.do")
	public String writeReviewMBC() {
	MeetingBoardReview mReview = new MeetingBoardReview();
	mReview.setBoardname(1);
	mReview.setMeeting_boardno(1);
	mReview.setMeetingReview_no(1);
	mReview.setMeetingReview_title("meetingReview_title");
	mReview.setMeetingReview_pic("meetingReview_pic");
	mReview.setMeetingReview_content("meetingReview_content");
	mReview.setMeetingReview_userid("meetingReview_userid");
	mReview.setMeetingReview_writeDate(new Date());
	mReview.setMeetingReview_nickname("meetingReview_nickname");
	meetingServiceImpl.writeReview(mReview);
	System.out.println(meetingServiceImpl.showReview(1));
		return "redirect:testForm.do";
	}
	@RequestMapping("modifyReviewMBC.do")
	public String modifyReviewMBC() {
		MeetingBoardReview mReview = new MeetingBoardReview();
		mReview.setBoardname(1);
		mReview.setMeeting_boardno(1);
		mReview.setMeetingReview_no(1);
		mReview.setMeetingReview_title("meetingReview_title2");
		mReview.setMeetingReview_pic("meetingReview_pic");
		mReview.setMeetingReview_content("meetingReview_content2");
		mReview.setMeetingReview_userid("meetingReview_userid2");
		mReview.setMeetingReview_writeDate(new Date());
		mReview.setMeetingReview_nickname("meetingReview_nickname2");
		meetingServiceImpl.modifyReview(mReview);
		System.out.println(meetingServiceImpl.showReview(1));
		return "redirect:testForm.do";
	}
	@RequestMapping("deleteReviewMBC.do")
	public String deleteReviewMBC() {
//		 int meeting_boardno, int meetingReview_no
		meetingServiceImpl.deleteReview(1, 1);
		return "redirect:testForm.do";
	}
	@RequestMapping("selectReviewMBC.do")
	public ModelAndView selectReviewMBC() {
//		 int meeting_boardno, int meetingReview_no
		ModelAndView mav = new ModelAndView();
		MeetingBoardReview result = meetingServiceImpl.selectReview(1, 1);
		mav.addObject(result);
		mav.setViewName("meeting/test");
		System.out.println(result);
		return mav;
	}
	@RequestMapping("showReviewMBC.do")
	public ModelAndView showReviewMBC() {
//		 int Meeting_boardno,
		ModelAndView mav = new ModelAndView();
		List<MeetingBoardReview> result = meetingServiceImpl.showReview(1);
		mav.addObject(result);
		mav.setViewName("meeting/test");
		System.out.println(result);
		return mav;
	}	
	
	//후기글 댓글
	
	@RequestMapping("commentWriteReviewMBC.do")
	public String commentWriteReviewMBC() {
		ReviewComment rComment = new ReviewComment();
		rComment.setBoardname(1);
		rComment.setMeeting_boardno(1);
		rComment.setReviewno(1);
		rComment.setReviewComment_commentno(1);  
		rComment.setReviewComment_content("reviewComment_content");
		rComment.setReviewComment_nickname("reviewComment_nickname");
		rComment.setReviewComment_userId("reviewComment_userId");
		rComment.setReviewComment_writeDate(new Date());
		meetingServiceImpl.commentWriteReview(rComment);
		System.out.println(meetingServiceImpl.showCommentReview(1,1));
		return "redirect:testForm.do";
	}
	@RequestMapping("commentModifyReviewMBC.do")
	public String commentModifyReviewMBC() {
		ReviewComment rComment = new ReviewComment();
		rComment.setBoardname(1);
		rComment.setMeeting_boardno(1);
		rComment.setReviewno(1);
		rComment.setReviewComment_commentno(1);  
		rComment.setReviewComment_content("reviewComment_content2");
		rComment.setReviewComment_nickname("reviewComment_nickname2");
		rComment.setReviewComment_userId("reviewComment_userId");
		rComment.setReviewComment_writeDate(new Date());
		meetingServiceImpl.commentModifyReview(rComment);
		System.out.println(meetingServiceImpl.showCommentReview(1,1));
		return "redirect:testForm.do";
	}
	@RequestMapping("commentDeleteReviewMBC.do")
	public String commentDeleteReviewMBC() {
//		int meeting_boardno, int reviewComment_commentno, int reviewno
		meetingServiceImpl.commentDeleteReview(1, 1,1);
		return "redirect:testForm.do";
	}
	@RequestMapping("commentSelectReviewMBC.do")
	public ModelAndView commentSelectReviewMBC() {
//		int meeting_boardno, int reviewComment_commentno, int reviewno
		ModelAndView mav = new ModelAndView();
		ReviewComment result = meetingServiceImpl.commentSelectReview(1,1, 1);
		mav.addObject(result);
		mav.setViewName("meeting/test");
		System.out.println(result);
		return mav;
	}
	@RequestMapping("showCommentReviewMBC.do")
	public ModelAndView showCommentReviewMBC() {
//		 int meeting_boardno, int reviewno
		ModelAndView mav = new ModelAndView();
		List<ReviewComment> result = meetingServiceImpl.showCommentReview(1,1);
		mav.addObject(result);
		mav.setViewName("meeting/test");
		System.out.println(result);
		return mav;
	}
	
	//후기 좋아요
	@RequestMapping("ReviewLikesMBC.do")
	public String ReviewLikesMBC() {
//		int meeting_boardno, int reviewComment_commentno, int reviewno
		MeetingLikes rLikes = new MeetingLikes();
		rLikes.setBoardname(1);
		rLikes.setMeeting_boardno(1);
		rLikes.setReviewno(1);
		rLikes.setMeetingLikes_date(new Date());
		rLikes.setMeetingLikes_userId("meetingLikes_userId");
		meetingServiceImpl.insertReviewLikes(rLikes);
		return "redirect:testForm.do";
	}
	@RequestMapping("deleteReviewLikesMBC.do")
	public String deleteReviewLikesMBC() {
//		int meeting_boardno, int reviewno, String meetingLikes_userId
		meetingServiceImpl.deleteReviewLikes(1, 1, "meetingLikes_userId");
		return "redirect:testForm.do";
	}
	@RequestMapping("selectAllReviewLikesMBC.do")
	public String selectAllReviewLikesMBC() {
//		int meeting_boardno, int reviewno, String meetingLikes_userId
		System.out.println(meetingServiceImpl.selectAllReviewLikes(1, 1, "meetingLikes_userId"));
		return "redirect:testForm.do";
	}
	
	@RequestMapping("ReviewLikesCountMBC.do")
	public String ReviewLikesCountMBC() {
//		int meeting_boardno, int reviewno
		System.out.println(meetingServiceImpl.getReviewLikesCount(1, 1));
		return "redirect:testForm.do";
	}
	
	
	
	
	@RequestMapping("testForm.do") // void !!
	public String joinForm() {
		return "meeting/test";
	}


		
	}
