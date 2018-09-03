package controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;

import javax.print.DocFlavor.STRING;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.POST;

import org.apache.http.HttpRequest;
import org.apache.ibatis.annotations.Param;
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

			System.out.println("들어온 키워드는: "+keyword);
			System.out.println("요청 타입은: "+keyword);	
			
			ModelAndView mav = new ModelAndView();
			HashMap<String, Object> params = new HashMap<String, Object>();
			HashMap<String, Object> result = null;
			params.put("type", type);
			params.put("keyword", keyword);
			params.put("freeBoard_boardname", 3);
			params.put("page", page);
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

			result = freeboardService.ShowFreeBoard(params, page);
			
			mav.addAllObjects(result);
			mav.addAllObjects(params);
			mav.setViewName("freeboard/dogFreeBoardList");
			System.out.println("보더리스트에서:" + result.toString());
			return mav;		
		}		

		//-----------------------------------------------------------------------------------------
			//고양이자게
			@RequestMapping(value= "catFreeBoardList.do", method=RequestMethod.GET) 		
			public ModelAndView CatFreeBoardList(Model model,@RequestParam(defaultValue = "1") int page,
					@RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int type,
					@RequestParam(required = false) String startDate, @RequestParam(required = false) String endDate) {
				

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

				mav.addAllObjects(result);
				mav.addAllObjects(params);
				mav.setViewName("freeboard/etcFreeBoardList");

				return mav;		
			}		
//---------------------------------------------------------------------------------------------------------
	//게시물 한개 보기 
	@RequestMapping("selectOneBoard.do")
	public String SelectOneBoard(Model model, HttpSession session,@RequestParam HashMap<String, Object> params, int freeBoard_boardname, int freeBoard_boardno ) {

		
		freeboardService.readBoard(freeBoard_boardname, freeBoard_boardno);
		FreeBoard free = freeboardService.getBoard(freeBoard_boardname, freeBoard_boardno);
		System.out.println("컨트롤러 프리에는"+free);
		String user_idCheck = (String) session.getAttribute("user_id");
		model.addAttribute("user_idCheck", user_idCheck);
		model.addAttribute("freeBoard", free);
		return "freeboard/selectOneBoard";

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
//게시글 수정
		
		@RequestMapping("dogModifyFreeBoardForm.do")
		public String dogModifyFreeBoardForm(Model model,int freeBoard_boardno,int freeBoard_boardname ,HttpSession session) {
			System.out.println("강아지 프리보드 게시글 수정 컨트롤러 들어옴");
			FreeBoard free = freeboardService.getBoard(freeBoard_boardname, freeBoard_boardno);
			model.addAttribute("freeBoard", free);
			return "freeboard/dogModifyFreeBoardForm";

		}	
		

		@RequestMapping(value="dogModifyFreeBoard.do",method=RequestMethod.POST)
		public String dogModifyFreeBoard(@RequestParam HashMap<String, Object> params, HttpSession session, Model model) {
		
			String freeBoard_boardname1 = (String)params.get("freeBoard_boardname");
			int freeBoard_boardname = Integer.parseInt(freeBoard_boardname1);
			String freeBoard_boardno1 = (String)params.get("freeBoard_boardno");
			int freeBoard_boardno = Integer.parseInt(freeBoard_boardno1);
			FreeBoard free = freeboardService.getBoard(freeBoard_boardname, freeBoard_boardno);

			free.setFreeBoard_title((String)params.get("freeBoard_title"));
			free.setFreeBoard_content((String)params.get("editor"));
			freeboardService.ModifyFreeBoard(free);
			String boardname = (String) params.get("freeBoard_boardname");
			String boardno = (String) params.get("freeBoard_boardno");		
			return "redirect:selectOneBoard.do?freeBoard_boardname="+boardname+"&freeBoard_boardno="+boardno;

		}
		//------------------------------------------------------------------------------------------------------------------------------
//게시글 삭제
		@RequestMapping("dogDeleteFreeBoard.do")
		public String DeleteFreeBoard(Model model, int freeBoard_boardname, int freeBoard_boardno,HttpSession session) {
				freeboardService.DeleteFreeBoard(freeBoard_boardname, freeBoard_boardno);
			return "redirect:dogFreeBoardList.do";
		}

}
