package controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import model.FreeBoard;
import model.TipBoard;
import model.TipLikes;
import service.FreeBoardServiceImpl;
import service.UserService;

@Controller
public class FreeBoardController {
	
	@Autowired 
	FreeBoardServiceImpl freeboardService;
	
	@Autowired
	UserService userService;
	
	
	//---------------------------------------------------------------------------------------

	//---------------------------------------------------------------------------------------
	//강아지자게
		@RequestMapping(value= "dogFreeBoardList.do", method=RequestMethod.GET) 		
		public ModelAndView DogFreeBoardList(Model model,@RequestParam(defaultValue = "1") int page,
				@RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int type,
				@RequestParam(required = false) String startDate, @RequestParam(required = false) String endDate) {

			ModelAndView mav = new ModelAndView();
			HashMap<String, Object> params = new HashMap<String, Object>();
			HashMap<String, Object> result = null;
			params.put("type", type);
			params.put("keyword", keyword);
			params.put("freeBoard_boardname", 3);
			
			if (type == 0) {
				if ((startDate != null || startDate != "") && (endDate != null || endDate != "")) {
					params.put("startdate", startDate);
					params.put("enddate", endDate);
				}
			} 
			else if (type == 1) {
				params.put("title", keyword);
			} else if (type == 2) {
				params.put("content", keyword);
			} else if (type == 3) {
				params.put("title", keyword);
				params.put("content", keyword);
			} else if (type == 4) {
				params.put("nickname", keyword);
			}
			FreeBoard freeboard = new FreeBoard();
			freeboard.setFreeBoard_title((String) params.get("freeBoard_title"));
			result = freeboardService.ShowFreeBoard(params, page);
			
			mav.addAllObjects(result);
			mav.addAllObjects(params);
			mav.setViewName("freeboard/dogFreeBoardList");
			return mav;		
		}		

		//-----------------------------------------------------------------------------------------
			//고양이자게
			@RequestMapping(value= "catFreeBoardList.do", method=RequestMethod.GET) 		
			public ModelAndView CatFreeBoardList(Model model,@RequestParam(defaultValue = "1") int page,
					@RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int type,
					@RequestParam(required = false) String startDate, @RequestParam(required = false) String endDate) {
				

				System.out.println("자게정보 요청");
				System.out.println("들어온 키워드는: "+keyword);
				System.out.println("요청 타입은: "+keyword);	
				
				ModelAndView mav = new ModelAndView();
				HashMap<String, Object> params = new HashMap<String, Object>();
				HashMap<String, Object> result = null;
				params.put("type", type);
				params.put("keyword", keyword);
				params.put("FreeBoard_boardname", 4);
				
				if (type == 0) {
					if ((startDate != null || startDate != "") && (endDate != null || endDate != "")) {
						params.put("startdate", startDate);
						params.put("enddate", endDate);
					}
				} 
				else if (type == 1) {
					params.put("title", keyword);
				} else if (type == 2) {
					params.put("content", keyword);
				} else if (type == 3) {
					params.put("title", keyword);
					params.put("content", keyword);
				} else if (type == 4) {
					params.put("nickname", keyword);
				}
				
				result = freeboardService.SearchFreeBoardbyTNC(params,page);

				mav.addAllObjects(result);
				mav.addAllObjects(params);
				mav.setViewName("freeboard/catFreeBoardList");

				return mav;		
			}		
			
			//-----------------------------------------------------------------------------------------
			//토끼자게
			@RequestMapping(value= "rabbitFreeBoardList.do", method=RequestMethod.GET) 		
			public ModelAndView RabbitFreeBoardList(Model model,@RequestParam(defaultValue = "1") int page,
					@RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int type,
					@RequestParam(required = false) String startDate, @RequestParam(required = false) String endDate) {
				

				System.out.println("자게정보 요청");
				System.out.println("들어온 키워드는: "+keyword);
				System.out.println("요청 타입은: "+keyword);	
				
				ModelAndView mav = new ModelAndView();
				HashMap<String, Object> params = new HashMap<String, Object>();
				HashMap<String, Object> result = null;
				params.put("type", type);
				params.put("keyword", keyword);
				params.put("FreeBoard_boardname", 5);
				
				if (type == 0) {
					if ((startDate != null || startDate != "") && (endDate != null || endDate != "")) {
						params.put("startdate", startDate);
						params.put("enddate", endDate);
					}
				} 
				else if (type == 1) {
					params.put("title", keyword);
				} else if (type == 2) {
					params.put("content", keyword);
				} else if (type == 3) {
					params.put("title", keyword);
					params.put("content", keyword);
				} else if (type == 4) {
					params.put("nickname", keyword);
				}
				
				result = freeboardService.SearchFreeBoardbyTNC(params,page);
				
				
//				mav.addObject("DogEncycList1", EncycService.searchEncyc("다시 쓰는 개 사전", 46, 3));
				mav.addAllObjects(result);
				mav.addAllObjects(params);
				mav.setViewName("freeboard/rabbitFreeBoardList");
//				System.out.println("보더리스트에서:" + result.toString());
				return mav;		
			}		
			
			//-----------------------------------------------------------------------------------------
			//기타자게
			@RequestMapping(value= "etcFreeBoardList.do", method=RequestMethod.GET) 		
			public ModelAndView EtcFreeBoardList(Model model,@RequestParam(defaultValue = "1") int page,
					@RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int type,
					@RequestParam(required = false) String startDate, @RequestParam(required = false) String endDate) {
				

				System.out.println("자게정보 요청");
				System.out.println("들어온 키워드는: "+keyword);
				System.out.println("요청 타입은: "+keyword);	
				
				ModelAndView mav = new ModelAndView();
				HashMap<String, Object> params = new HashMap<String, Object>();
				HashMap<String, Object> result = null;
				params.put("type", type);
				params.put("keyword", keyword);
				params.put("FreeBoard_boardname", 6);
				
				if (type == 0) {
					if ((startDate != null || startDate != "") && (endDate != null || endDate != "")) {
						params.put("startdate", startDate);
						params.put("enddate", endDate);
					}
				} 
				else if (type == 1) {
					params.put("title", keyword);
				} else if (type == 2) {
					params.put("content", keyword);
				} else if (type == 3) {
					params.put("title", keyword);
					params.put("content", keyword);
				} else if (type == 4) {
					params.put("nickname", keyword);
				}
				
				result = freeboardService.SearchFreeBoardbyTNC(params,page);
				
				
//				mav.addObject("DogEncycList1", EncycService.searchEncyc("다시 쓰는 개 사전", 46, 3));
				mav.addAllObjects(result);
				mav.addAllObjects(params);
				mav.setViewName("freeboard/etcFreeBoardList");
//				System.out.println("보더리스트에서:" + result.toString());
				return mav;		
			}		
//---------------------------------------------------------------------------------------------------------
	//게시물 한개 보기 
	@RequestMapping("selectOneBoard.do")
	public ModelAndView SelectOneBoard(Model model, @RequestParam(required=false) HashMap<String, Object> params, HttpSession session,int page) {
		
		System.out.println("셀렉트원보드.두 들어옴");
		System.out.println(params.get("freeBoard_content"));
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(params);
		mav.addObject("freeBoard", freeboardService.ShowFreeBoard(params, page));
		mav.setViewName("freeboard/selectOneBoard");
		return mav;
		
		
//		System.out.println("Dog원보드들어옴");
//		System.out.println(FreeBoard_boardname+"보드네임");
//		System.out.println(FreeBoard_boardno+"보드넘버");
//		freeboardService.readBoard(FreeBoard_boardname, FreeBoard_boardno);
//		FreeBoard freeboard = freeboardService.getBoard(FreeBoard_boardname, FreeBoard_boardno);
//		System.out.println(freeboard);
//		System.out.println(freeboard.getFreeBoard_nickname());
////		session.setAttribute("user_id", "테스트용");
////		session.setAttribute("user_id", "testID");
//		String user_idCheck = (String) session.getAttribute("user_id");
//		System.out.println(user_idCheck);
//		model.addAttribute("user_idCheck", user_idCheck);
//		model.addAttribute("freeBoard", freeboard);

		
	}
	//---------------------------------------------------------------------------------------
//게시글 쓰기 dog
	@RequestMapping("writeDogFreeBoardForm.do")	
	public String writeFreeBoardForm() {

		return "freeboard/writeDogFreeBoardForm";
	}
	

	@RequestMapping(value = "writeDogFreeBoard.do", method = RequestMethod.POST)
	public String writeFreeBoard(@RequestParam HashMap<String, Object> params, Model model, HttpSession session,
			HttpServletRequest req) {

		FreeBoard freeboard = new FreeBoard();
		
		String userid = (String) session.getAttribute("user_id");
		freeboard.setFreeBoard_userId(userid);
		freeboard.setFreeBoard_nickname(
				(String) userService.selectUser((String) session.getAttribute("user_id")).get("user_nickname"));
		System.out.println((String) userService.selectUser((String) session.getAttribute("user_id")).get("user_nickname"));

		freeboard.setFreeBoard_content((String) params.get("editor"));
		freeboard.setFreeBoard_title((String) params.get("freeBoard_title"));
		freeboard.setFreeBoard_boardname(3);
		freeboardService.writeFreeBoard(freeboard);
		int boardname = freeboard.getFreeBoard_boardname();
		int boardno = freeboardService.getLastBoardno(boardname, userid);


		return "redirect:dogFreeBoardList.do?boardname=" + boardname + "&boardno=" + boardno;
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
		
		@RequestMapping("freeBoardModifyForm.do")
		public String FreeBoardModifyForm(Model model, int FreeBoard_boardname, int FreeBoard_boardno,HttpSession session) {
			System.out.println("freeBoardModifyForm");
			FreeBoard freeboard = freeboardService.getBoard(FreeBoard_boardname, FreeBoard_boardno);
			model.addAttribute("freeBoard", freeboard);
			return "freeboard/freeBoardModifyForm";
		}	
		

		@RequestMapping("freeBoardModify.do")
		public String FreeBoardModify(HttpSession session, @RequestParam HashMap<String, Object> params) {
			System.out.println("freeBoardModify");

			String FreeBoard_boardname = (String)params.get("freeBoard_boardname");
			int FreeBoard_boardname1 = Integer.parseInt(FreeBoard_boardname);
			
			String FreeBoard_boardno = (String)params.get("freeBoard_boardno");
			int FreeBoard_boardno1 = Integer.parseInt(FreeBoard_boardno);
			
			FreeBoard freeboard = freeboardService.getBoard(FreeBoard_boardname1,FreeBoard_boardno1);

			freeboard.setFreeBoard_title((String) params.get("freeBoard_title"));
			freeboard.setFreeBoard_file((String) params.get("freeBoard_file"));
			freeboard.setFreeBoard_content((String) params.get("freeBoard_content"));
			freeboard.setFreeBoard_contentPic((String) params.get("freeBoard_contentPic"));
			freeboard.setFreeBoard_YoutubeUrl((String) params.get("freeBoard_YoutubeUrl"));
			freeboardService.ModifyFreeBoard(freeboard);
			String boardname =(String)params.get("freeBoard_boardname");
			String boardno =(String)params.get("freeBoard_boardno");
			
			return "redirect:freeboard/readFreeBoard.do?boardname="+boardname+"&boardno="+boardno;
		}
		//------------------------------------------------------------------------------------------------------------------------------
//게시글 삭제
		@RequestMapping("deleteFreeBoard.do")
		public String DeleteFreeBoard(Model model, int FreeBoard_boardname, int FreeBoard_boardno,HttpSession session) {
			System.out.println("dogDeleteTipBoard.do 컨트롤러 들어옴");
			FreeBoard freeboard = freeboardService.getBoard(FreeBoard_boardname, FreeBoard_boardno);
//			session.setAttribute("user_id", "testID");//지금은 유저랑 연결안해놨으니까 일단 이렇게 해놈 08.23 현재날짜 기준.
			String user_idCheck = (String) session.getAttribute("user_id");
			if(freeboard.getFreeBoard_userId().equals(user_idCheck)) {
				freeboardService.DeleteFreeBoard(FreeBoard_boardname, FreeBoard_boardno);
			}
			
			return "redirect:freeboard/FreeBoardList.do";
		}
		
//		@RequestMapping("download.do")
//		public View download(HashMap<String, Object> params) {
//
//			View view = new DownloadView(freeboardService.getAttachFile(params));
//			return view;
//		}
		

	
}
