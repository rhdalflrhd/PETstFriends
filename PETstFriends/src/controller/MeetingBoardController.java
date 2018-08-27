package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping("meeting.do") // void !!
	public String meeting() {
		return "meeting/meeting";
	}
	
	@RequestMapping("meetingview.do") // void !!
	public String meetingView(Model model, @RequestParam int meeting_boardno) {
		model.addAttribute("meeting", meetingServiceImpl.selectMeetingBoard(meeting_boardno));
		model.addAttribute("comment", meetingServiceImpl.showCommentMeetingBoard(meeting_boardno));	
		return "meeting/meetingView";
	}
	
	@RequestMapping("writeForm.do") // void !!
	public String meetingWriteForm() {
		return "meeting/meetingWriteForm";
	}
	@RequestMapping("writeMBC.do")
	@ResponseBody
	public HashMap<String, Object> writeMBC(Model model, 
			@RequestParam String title, @RequestParam String startmeetingdate, @RequestParam String startmeetingdate2, @RequestParam String endmeetingdate, @RequestParam String endmeetingdate2
			, @RequestParam String startmeetingacceptdate, @RequestParam String startmeetingacceptdate2, @RequestParam String endmeetingacceptdate, @RequestParam String endmeetingacceptdate2
			, @RequestParam String content, @RequestParam String place) {
		SimpleDateFormat date1 = new SimpleDateFormat("yyyy MM dd HH:mm");
		MeetingBoard mBoard = new MeetingBoard();
		mBoard.setBoardname(1);
//		mBoard.setMeetingBoard_userId();//세션 id
//		mBoard.setMeetingBoard_proPic("portfolio-11.jpg"); 폴더에 저장하는법모름
		mBoard.setMeetingBoard_title(title);
		mBoard.setMeetingBoard_startMeetingDate(startmeetingdate+" "+startmeetingdate2);
		mBoard.setMeetingBoard_endMeetingDate(endmeetingdate+" "+endmeetingdate2);
		mBoard.setMeetingBoard_startAcceptingDate(startmeetingacceptdate+" "+startmeetingacceptdate2);
		mBoard.setMeetingBoard_endAcceptingDate(endmeetingacceptdate+" "+endmeetingacceptdate2);
		mBoard.setMeetingBoard_place(place);
		mBoard.setMeetingBoard_content(content);
//		mBoard.setMeetingBoard_contentPic("portfolio-11.jpg");//컨텐트에 포함됨
//		mBoard.setMeetingBoard_phone("phone");//세션 전화번호
//		mBoard.setMeetingBoard_email("email");//세션 이메일
		mBoard.setMeetingBoard_readCount(0);
		mBoard.setMeetingBoard_writeDate(date1.format(new Date()));
//		mBoard.setMeetingBoard_nickname("nickname");//세션 닉네임
		mBoard.setMeetingBoard_LikeCount(0);
		meetingServiceImpl.writeMeetingBoard(mBoard);
		int no = meetingServiceImpl.getCount().getMeeting_boardno();
		System.out.println(meetingServiceImpl.selectMeetingBoard(no));
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("meeting", meetingServiceImpl.selectMeetingBoard(no));
		JSONObject meeting = new JSONObject(result);
		return meeting;
	}
	@RequestMapping("modifyForm.do") // void !!
	public String meetingModifyForm(Model model, @RequestParam int meeting_boardno) {
		model.addAttribute("meeting",meetingServiceImpl.selectMeetingBoard(meeting_boardno));	
		return "meeting/meetingModifyForm";
	}
	@RequestMapping("modifyMBC.do")
	public String modifyMBC(@RequestParam String title, @RequestParam String startmeetingdate, @RequestParam String endmeetingdate
			, @RequestParam String startmeetingacceptdate, @RequestParam String endmeetingacceptdate
			, @RequestParam String content, @RequestParam String place) {
		SimpleDateFormat date1 = new SimpleDateFormat("yyyy MM dd HH:mm");
		MeetingBoard mBoard = new MeetingBoard();
		mBoard.setBoardname(1);
//		mBoard.setMeetingBoard_userId();//세션 id
//		mBoard.setMeetingBoard_proPic("portfolio-11.jpg"); 폴더에 저장하는법모름
		mBoard.setMeetingBoard_title(title);
		mBoard.setMeetingBoard_startMeetingDate(startmeetingdate);
		mBoard.setMeetingBoard_endMeetingDate(endmeetingdate);
		mBoard.setMeetingBoard_startAcceptingDate(startmeetingacceptdate);
		mBoard.setMeetingBoard_endAcceptingDate(endmeetingacceptdate);
		mBoard.setMeetingBoard_place(place);
		mBoard.setMeetingBoard_content(content);
//		mBoard.setMeetingBoard_contentPic("portfolio-11.jpg");//컨텐트에 포함됨
//		mBoard.setMeetingBoard_phone("phone");//세션 전화번호
//		mBoard.setMeetingBoard_email("email");//세션 이메일
		mBoard.setMeetingBoard_readCount(0);
		mBoard.setMeetingBoard_writeDate(date1.format(new Date()));
//		mBoard.setMeetingBoard_nickname("nickname");//세션 닉네임
		mBoard.setMeetingBoard_LikeCount(0);
		meetingServiceImpl.modifyMeetingBoard(mBoard);
		System.out.println(mBoard);
//		meetingView - >생성된 게시글 번호가지고
		return "redirect:meeting.do";
	}
	@RequestMapping("deleteMBC.do")
	public String deleteMBC() {
//		int meeting_boardno 
		meetingServiceImpl.deleteMeetingBoard(1);
		
		return "redirect:testForm.do";
	}
	@RequestMapping("showMBC.do")//검색 포함//게시판에서 페이지처리 때문에 추가 작성해야할수도잇음
	@ResponseBody 
	public HashMap<String, Object> showMBC(@RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int type) {
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
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("meetingBoard", meetingServiceImpl.showMeetingBoard(param));
		result.put("count", meetingServiceImpl.getCount().getMeeting_boardno());
		JSONObject meetingBoard = new JSONObject(result);
		return meetingBoard;
	}
	
	@RequestMapping("selectMBC.do")
	public String selectMBC(Model model, int meeting_boardno) {
		model.addAttribute("meetingBoard", meetingServiceImpl.selectMeetingBoard(meeting_boardno));
		return "meeting/meetingView";
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
		for(int i = 0; i<5;i++) {
		mComment.setBoardname(1);
		mComment.setMeeting_boardno(204);
		mComment.setMeetingComment_commentno(i+2);
		mComment.setMeetingComment_content("content");
		mComment.setMeetingComment_nickname("meetingComment_nickname");
		mComment.setMeetingComment_userId("meetingComment_userId");
		mComment.setMeetingComment_writeDate(new Date());
		meetingServiceImpl.commentWriteMeetingBoard(mComment);
		}
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
	@RequestMapping("review.do") // void !!
	public String review() {
		return "meeting/review";
	}
	@RequestMapping("reviewView.do") // void !!
	public String reviewview(Model model, @RequestParam int meeting_boardno, @RequestParam int meetingReview_no) {
		model.addAttribute("meeting_boardno", meetingServiceImpl.selectReview(meeting_boardno, meetingReview_no));
		return "meeting/reviewView";
	}
	@RequestMapping("writeReviewForm.do") // void !!
	public String writeReviewForm(Model model, @RequestParam int meeting_boardno) {
		model.addAttribute("meeting_boardno", meeting_boardno);
		return "meeting/writeReviewForm";
	}
	
	@RequestMapping("writeReviewMBC.do")
	public HashMap<String, Object> writeReviewMBC(@RequestParam int meeting_boardno, @RequestParam String meetingReview_title, 
			@RequestParam String meetingReview_content, @RequestParam String meetingReview_userid, @RequestParam String meetingReview_nickname) {
	MeetingBoardReview mReview = new MeetingBoardReview();
	SimpleDateFormat date1 = new SimpleDateFormat("yyyy MM dd HH:mm");
	mReview.setBoardname(1);
	mReview.setMeeting_boardno(meeting_boardno);
	mReview.setMeetingReview_title(meetingReview_title);
//	mReview.setMeetingReview_pic("meetingReview_pic");
	mReview.setMeetingReview_content(meetingReview_content);
	mReview.setMeetingReview_userid(meetingReview_userid);
	mReview.setMeetingReview_writeDate(date1.format(new Date()));
	mReview.setMeetingReview_nickname(meetingReview_nickname);
	meetingServiceImpl.writeReview(mReview);
	HashMap<String, Object> result = new HashMap<String, Object>();
	result.put("review", meetingServiceImpl.selectMeetingBoard(meetingServiceImpl.getReviewCount(meeting_boardno).getMeeting_boardno()));
	JSONObject review = new JSONObject(result);
		return review;
	}
	@RequestMapping("modifyReviewMBC.do")
	public String modifyReviewMBC() {
		MeetingBoardReview mReview = new MeetingBoardReview();
		SimpleDateFormat date1 = new SimpleDateFormat("yyyy MM dd HH:mm");
		mReview.setBoardname(1);
		mReview.setMeeting_boardno(1);
		mReview.setMeetingReview_no(1);
		mReview.setMeetingReview_title("meetingReview_title2");
		mReview.setMeetingReview_pic("meetingReview_pic");
		mReview.setMeetingReview_content("meetingReview_content2");
		mReview.setMeetingReview_userid("meetingReview_userid2");
		mReview.setMeetingReview_writeDate(date1.format(new Date()));
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
	@ResponseBody
	public HashMap<String, Object> showReviewMBC(@RequestParam int meeting_boardno) {
       System.out.println(meeting_boardno);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("meetingReview", meetingServiceImpl.showReview(meeting_boardno));
		if(meetingServiceImpl.getReviewCount2(meeting_boardno)!=0) {
			result.put("count", meetingServiceImpl.getReviewCount(meeting_boardno).getMeetingReview_no());
		}
		JSONObject review = new JSONObject(result);
		return review;
		
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

	



	@RequestMapping("g.do") // void !!
	public String joForm() {
		return "meeting/review";
	}
	@RequestMapping(value = "multiplePhotoUpload.do")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response) {
		try {
	         //파일정보
	         String sFileInfo = "";
	         //파일명을 받는다 - 일반 원본파일명
	         String filename = request.getHeader("file-name");
	         //파일 확장자
	         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	         //확장자를소문자로 변경
	         filename_ext = filename_ext.toLowerCase();
	         //파일 기본경로
	         String dftFilePath = request.getSession().getServletContext().getRealPath("/");
	         //파일 기본경로 _ 상세경로
	         String filePath = dftFilePath + "resource" + File.separator + "photoUpload" + File.separator;
	        
	         File file = new File(filePath);
	         if(!file.exists()) {
	            file.mkdirs();
	         }
	         String realFileNm = "";
	         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	         String today= formatter.format(new java.util.Date());
	         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
	         String rlFileNm = filePath + realFileNm;
	         ///////////////// 서버에 파일쓰기 /////////////////
	         InputStream is = request.getInputStream();
	         OutputStream os=new FileOutputStream(rlFileNm);
	         int numRead;
	         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	         while((numRead = is.read(b,0,b.length)) != -1){
	            os.write(b,0,numRead);
	         }
	         if(is != null) {
	            is.close();
	         }
	         os.flush();
	         os.close();
	         ///////////////// 서버에 파일쓰기 /////////////////
	         // 정보 출력
	         sFileInfo += "&bNewLine=true";
	         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
	         sFileInfo += "&sFileName="+ filename;
	         sFileInfo += "&sFileURL="+"http://localhost:8080/PETstFriends/resource/photoUpload/"+realFileNm;
	         PrintWriter print = response.getWriter();

	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}	
	}
