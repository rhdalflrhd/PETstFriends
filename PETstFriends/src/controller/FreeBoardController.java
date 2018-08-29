package controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import model.FreeBoard;
import service.FreeBoardServiceImpl;
import service.UserService;

@Controller
public class FreeBoardController {
	
	@Autowired 
	FreeBoardServiceImpl freeboardService;
	
	@Autowired
	UserService userService;
	
	
	//---------------------------------------------------------------------------------------
//게시글 목록
	@RequestMapping("FreeBoardList.do")
	public ModelAndView FreeBoardList(@RequestParam(defaultValue = "1") int page,
			@RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int type,
			@RequestParam(required = false) String startDate, @RequestParam(required = false) String endDate) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("type", type);
		params.put("keyword", keyword);
		params.put("page", page);
		if (startDate != null && endDate != null
				&& !(startDate.equals("") || startDate.equals("0") || startDate.equals("null"))
				&& !(endDate.equals("") || endDate.equals("null") || endDate.equals("0"))) {
			params.put("startDate", startDate);
			params.put("endDate", endDate);
		}
		if (type == 1) {
			params.put("title", keyword);
		} else if (type == 2) {
			params.put("content", keyword);
		} else if (type == 3) {
			params.put("title", keyword);
			params.put("content", keyword);
		} else if (type == 4) {
			params.put("name", keyword);
		}

		HashMap<String, Object> result = freeboardService.ShowFreeBoard(params, page);

		mav.addAllObjects(result);
		mav.addAllObjects(params);
		mav.setViewName("FreeBoardList");
		return mav;
		
}
	//---------------------------------------------------------------------------------------

	//게시물 한개 보기 
	@RequestMapping("selectOneBoard.do")
	public ModelAndView SelectOneBoard(@RequestParam(required=false) HashMap<String, Object> params, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(params);
		int freeBoard_boardname =  Integer.parseInt((String) params.get("freeBoard_boardname"));
		int freeBoard_boardno =  Integer.parseInt((String) params.get("freeBoard_boardno"));
		mav.addObject("freeBoard", freeboardService.readBoard(freeBoard_boardname, freeBoard_boardno));
		mav.setViewName("freeboard/selectOneBoard");

		return mav;
	}
	//---------------------------------------------------------------------------------------
//게시글 쓰기 
		@RequestMapping("WriteFreeBoardForm.do")	
		public String WriteFreeBoardForm(Model model, HttpSession session) {
			String user_id = (String) session.getAttribute("user_id");
			String user_nickname = (String) session.getAttribute("user_nickname");

			model.addAttribute("user_nickname", userService.getUserbyNn(user_nickname));
			model.addAttribute("user_id", user_id);
			return "freeboard/WriteFreeBoardForm";
		}
		

		@RequestMapping("WriteFreeBoard.do")		
		public String WriteFreeBoard(HttpSession session, @RequestParam HashMap<String, Object> params, @RequestParam(value="FreeBoard_contentPic", required=false) MultipartFile file) {
			System.out.println("들어옴");
			System.out.println(file);
			
			FreeBoard freeboard = new FreeBoard();
			String user_id = (String)session.getAttribute("user_id");
			String user_nickname = (String)session.getAttribute("user_nickname");


//			freeboard.setFreeBoard_boardname(freeBoard_boardname);		// 강아지 TIP게시판 보드네임은 숫자 7로 구분함 ( 팁개=7, 팁고양이=8 팁토끼=9)
//													    보드넘버는 오토인크리트먼트, 작성일도 curdate로 넣을거임
			freeboard.setFreeBoard_userid(user_id);
			freeboard.setFreeBoard_nickname(user_nickname);	
			freeboard.setFreeBoard_title((String) params.get("freeBoard_title"));
			freeboard.setFreeBoard_file((String) params.get("freeBoard_file"));
			freeboard.setFreeBoard_content((String) params.get("freeBoard_content"));	
			//아직 조회수 없음
			freeboard.setFreeBoard_YoutubeUrl((String) params.get("freeBoard_YoutubeUrl"));
			//아직 좋아요 수 없음

			freeboardService.writeFreeBoard(freeboard, file);
			int boardname = freeboard.getFreeBoard_boardname();
			int boardno = freeboardService.getLastBoardno(boardname, user_id);// 유저와 합친후에는 WriteUserid말고 세션에서 갖고온 user_id넣어야함 ㅇㅇ
			System.out.println("보드넘버는= " +boardno);
			
			return "redirect:ReadFreeBoard.do?boardname="+boardname+"&boardno="+boardno;
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		@RequestMapping("ReadFreeBoard.do")
		public String ReadFreeBoard(Model model, int FreeBoard_boardname, int FreeBoard_boardno, HttpSession session) {
			
			System.out.println("ReadFreeBoard.do 들어옴");
			System.out.println(FreeBoard_boardname);
			System.out.println(FreeBoard_boardno);
			
			freeboardService.readBoard(FreeBoard_boardno,FreeBoard_boardname);
			FreeBoard freeBoard = freeboardService.getBoard(FreeBoard_boardno,FreeBoard_boardname);
			
			System.out.println(freeBoard);
			System.out.println(freeBoard.getFreeBoard_nickname());
			
//			session.setAttribute("user_id", "테스트용");
			session.setAttribute("user_id", "user_id");
			String user_idCheck = (String) session.getAttribute("user_id");
			System.out.println(user_idCheck);
			model.addAttribute("user_idCheck", user_idCheck);
			model.addAttribute("freeboard", freeBoard);

			return "freeboard/ReadFreeBoard";
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
//게시글 수정
		
		@RequestMapping("FreeBoardModifyForm.do")
		public String FreeBoardModifyForm(Model model, int FreeBoard_boardname, int FreeBoard_boardno,HttpSession session) {
			System.out.println("FreeBoardModifyForm");
			FreeBoard freeboard = freeboardService.getBoard(FreeBoard_boardname, FreeBoard_boardno);
			model.addAttribute("FreeBoard", freeboard);
			return "freeboard/FreeBoardModifyForm";
		}	
		

		@RequestMapping("FreeBoardModify.do")
		public String FreeBoardModify(HttpSession session, @RequestParam HashMap<String, Object> params) {
			System.out.println("FreeBoardModify");

			String FreeBoard_boardname = (String)params.get("FreeBoard_boardname");
			int FreeBoard_boardname1 = Integer.parseInt(FreeBoard_boardname);
			
			String FreeBoard_boardno = (String)params.get("FreeBoard_boardno");
			int FreeBoard_boardno1 = Integer.parseInt(FreeBoard_boardno);
			
			FreeBoard freeboard = freeboardService.getBoard(FreeBoard_boardname1,FreeBoard_boardno1);

			freeboard.setFreeBoard_title((String) params.get("FreeBoard_title"));
			freeboard.setFreeBoard_file((String) params.get("FreeBoard_file"));
			freeboard.setFreeBoard_content((String) params.get("FreeBoard_content"));
			freeboard.setFreeBoard_contentPic((String) params.get("FreeBoard_contentPic"));
			freeboard.setFreeBoard_YoutubeUrl((String) params.get("FreeBoard_YoutubeUrl"));
			freeboardService.ModifyFreeBoard(freeboard);
			String boardname =(String)params.get("freeBoard_boardname");
			String boardno =(String)params.get("freeBoard_boardno");
			
			return "redirect:ReadFreeBoard.do?boardname="+boardname+"&boardno="+boardno;
		}
		//------------------------------------------------------------------------------------------------------------------------------
//게시글 삭제
		@RequestMapping("DeleteFreeBoard.do")
		public String DeleteFreeBoard(Model model, int FreeBoard_boardname, int FreeBoard_boardno,HttpSession session) {
			System.out.println("dogDeleteTipBoard.do 컨트롤러 들어옴");
			FreeBoard freeboard = freeboardService.getBoard(FreeBoard_boardname, FreeBoard_boardno);
//			session.setAttribute("user_id", "testID");//지금은 유저랑 연결안해놨으니까 일단 이렇게 해놈 08.23 현재날짜 기준.
			String user_idCheck = (String) session.getAttribute("user_id");
			if(freeboard.getFreeBoard_userid().equals(user_idCheck)) {
				freeboardService.DeleteFreeBoard(FreeBoard_boardname, FreeBoard_boardno);
			}
			
			return "redirect:FreeBoardList.do";
		}
		
//		@RequestMapping("download.do")
//		public View download(HashMap<String, Object> params) {
//
//			View view = new DownloadView(freeboardService.getAttachFile(params));
//			return view;
//		}
		

	
}
