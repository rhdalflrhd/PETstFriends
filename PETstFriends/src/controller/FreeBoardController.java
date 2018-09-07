package controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

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
	//강아지자게 
		@RequestMapping(value= "dogFreeBoardList.do", method=RequestMethod.GET) 		
		public ModelAndView DogFreeBoardList(Model model,@RequestParam(defaultValue = "1") int page,
				@RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int type,
				@RequestParam(required = false) String startDate, @RequestParam(required = false) String endDate,HttpSession session) {

			ModelAndView mav = new ModelAndView();

			HashMap<String, Object> params = new HashMap<String, Object>();
			HashMap<String, Object> result1= null; //★★★여기요★★★
			HashMap<String, Object> result2 = null;  //★★★여기요★★★
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
			result1 = freeboardService.ShowFreeBoardDog(params, page); //★★★여기요★★★
			result2 = freeboardService.selectBoardLike(params, page); //★★★여기요★★★
			
			String user_idCheck = (String) session.getAttribute("user_id");
			model.addAttribute("user_idCheck", user_idCheck);

			mav.addAllObjects(result1);//★★★여기요★★★
			mav.addAllObjects(result2); //★★★여기요★★★
		
			mav.addAllObjects(params); //★★★여기요★★★
//			mav.addAllObjects(params); //★★★여기요★★★ 하나만 넣어도 되겟지,,.? 일단 이렇게용
			mav.setViewName("freeboard/dogFreeBoardList");

			return mav;
		}		

		//-----------------------------------------------------------------------------------------
			//고양이자게
			@RequestMapping(value= "catFreeBoardList.do", method=RequestMethod.GET) 		
			public ModelAndView CatFreeBoardList(Model model,@RequestParam(defaultValue = "1") int page,
					@RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int type,
					@RequestParam(required = false) String startDate, @RequestParam(required = false) String endDate,HttpSession session) {

				ModelAndView mav = new ModelAndView();
				HashMap<String, Object> params = new HashMap<String, Object>();
				HashMap<String, Object> result = null;
				params.put("type", type);
				params.put("keyword", keyword);
				params.put("freeBoard_boardname", 4);
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
				result = freeboardService.ShowFreeBoardCat(params, page);
	
				
				String user_idCheck = (String) session.getAttribute("user_id");
				model.addAttribute("user_idCheck", user_idCheck);

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
					@RequestParam(required = false) String startDate, @RequestParam(required = false) String endDate,HttpSession session) {

				ModelAndView mav = new ModelAndView();
				HashMap<String, Object> params = new HashMap<String, Object>();
				HashMap<String, Object> result = null;
				params.put("type", type);
				params.put("keyword", keyword);
				params.put("freeBoard_boardname", 5);
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
				result = freeboardService.ShowFreeBoardRabbit(params, page);
				
				String user_idCheck = (String) session.getAttribute("user_id");
				model.addAttribute("user_idCheck", user_idCheck);

				mav.addAllObjects(result);
				mav.addAllObjects(params);
				mav.setViewName("freeboard/rabbitFreeBoardList");

				return mav;		
			}		
			
			//-----------------------------------------------------------------------------------------
			//기타자게
			@RequestMapping(value= "etcFreeBoardList.do", method=RequestMethod.GET) 		
			public ModelAndView EtcFreeBoardList(Model model,@RequestParam(defaultValue = "1") int page,
					@RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int type,
					@RequestParam(required = false) String startDate, @RequestParam(required = false) String endDate,HttpSession session) {
				ModelAndView mav = new ModelAndView();
				HashMap<String, Object> params = new HashMap<String, Object>();
				HashMap<String, Object> result = null;
				params.put("type", type);
				params.put("keyword", keyword);
				params.put("freeBoard_boardname", 6);
				params.put("page", page);
				System.out.println(type+"타입");
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

				result = freeboardService.ShowFreeBoardEtc(params, page);

				String user_idCheck = (String) session.getAttribute("user_id");
				model.addAttribute("user_idCheck", user_idCheck);

				mav.addAllObjects(result);
				mav.addAllObjects(params);
				mav.setViewName("freeboard/etcFreeBoardList");


				
				return mav;		
			}		
//---------------------------------------------------------------------------------------------------------
	//게시물 한개 보기 -dog
	@RequestMapping("selectOneBoard.do")
	public String SelectOneBoard(Model model, HttpSession session,@RequestParam HashMap<String, Object> params, int freeBoard_boardname, int freeBoard_boardno ) {

		
		freeboardService.readBoard(freeBoard_boardname, freeBoard_boardno);
		FreeBoard free = freeboardService.getBoard(freeBoard_boardname, freeBoard_boardno);
		String user_idCheck = (String) session.getAttribute("user_id");
		model.addAttribute("user_idCheck", user_idCheck);
		model.addAttribute("freeBoard", free);
		return "freeboard/selectOneBoard";

	}
	//---------------------------------------------------------------------------------------------------------
		//게시물 한개 보기 -cat
		@RequestMapping("selectOneBoardCat.do")
		public String selectOneBoardCat(Model model, HttpSession session,@RequestParam HashMap<String, Object> params, int freeBoard_boardname, int freeBoard_boardno ) {

			
			freeboardService.readBoard(freeBoard_boardname, freeBoard_boardno);
			FreeBoard free = freeboardService.getBoard(freeBoard_boardname, freeBoard_boardno);
			String user_idCheck = (String) session.getAttribute("user_id");
			model.addAttribute("user_idCheck", user_idCheck);
			model.addAttribute("freeBoard", free);
			return "freeboard/selectOneBoardCat";

		}
		//---------------------------------------------------------------------------------------------------------
		//게시물 한개 보기 -rabbit
		@RequestMapping("selectOneBoardRabbit.do")
		public String selectOneBoardRabbit(Model model, HttpSession session,@RequestParam HashMap<String, Object> params, int freeBoard_boardname, int freeBoard_boardno ) {

			
			freeboardService.readBoard(freeBoard_boardname, freeBoard_boardno);
			FreeBoard free = freeboardService.getBoard(freeBoard_boardname, freeBoard_boardno);
			String user_idCheck = (String) session.getAttribute("user_id");
			model.addAttribute("user_idCheck", user_idCheck);
			model.addAttribute("freeBoard", free);
			return "freeboard/selectOneBoardRabbit";

		}
		//---------------------------------------------------------------------------------------------------------
		//게시물 한개 보기 -etc
		@RequestMapping("selectOneBoardEtc.do")
		public String SelectOneBoardEtc(Model model, HttpSession session,@RequestParam HashMap<String, Object> params, int freeBoard_boardname, int freeBoard_boardno ) {

			
			freeboardService.readBoard(freeBoard_boardname, freeBoard_boardno);
			FreeBoard free = freeboardService.getBoard(freeBoard_boardname, freeBoard_boardno);
			String user_idCheck = (String) session.getAttribute("user_id");
			model.addAttribute("user_idCheck", user_idCheck);
			model.addAttribute("freeBoard", free);
			return "freeboard/selectOneBoardEtc";

		}
	//---------------------------------------------------------------------------------------
//게시글 쓰기 dog
	@RequestMapping("writeDogFreeBoardForm.do")	
	public String writeDogFreeBoardForm() {

		return "freeboard/writeDogFreeBoardForm";
	}
	

	@RequestMapping(value = "writeDogFreeBoard.do", method = RequestMethod.POST)
	public String writeDogFreeBoard(@RequestParam HashMap<String, Object> params, Model model, HttpSession session,
			HttpServletRequest req) {

		FreeBoard freeboard = new FreeBoard();
		String userid = (String) session.getAttribute("user_id");
		freeboard.setFreeBoard_userId(userid);
		freeboard.setFreeBoard_nickname(
				(String) userService.selectUser((String) session.getAttribute("user_id")).get("user_nickname"));


		freeboard.setFreeBoard_content((String) params.get("editor"));
		freeboard.setFreeBoard_title((String) params.get("freeBoard_title"));
		freeboard.setFreeBoard_boardname(3);
		freeboardService.writeFreeBoard(freeboard);
		int boardname = freeboard.getFreeBoard_boardname();
		int boardno = freeboardService.getLastBoardno(boardname, userid);


		return "redirect:dogFreeBoardList.do?boardname=" + boardname + "&boardno=" + boardno;
	}
	//게시글 쓰기 cat============================================================================================
	
		@RequestMapping("writeCatFreeBoardForm.do")	
		public String writeCatFreeBoardForm() {

			return "freeboard/writeCatFreeBoardForm";
		}
		

		@RequestMapping(value = "writeCatFreeBoard.do", method = RequestMethod.POST)
		public String writeCatFreeBoard(@RequestParam HashMap<String, Object> params, Model model, HttpSession session,
				HttpServletRequest req) {

			FreeBoard freeboard = new FreeBoard();
			String userid = (String) session.getAttribute("user_id");
			freeboard.setFreeBoard_userId(userid);
			freeboard.setFreeBoard_nickname(
					(String) userService.selectUser((String) session.getAttribute("user_id")).get("user_nickname"));


			freeboard.setFreeBoard_content((String) params.get("editor"));
			freeboard.setFreeBoard_title((String) params.get("freeBoard_title"));
			freeboard.setFreeBoard_boardname(4);
			freeboardService.writeFreeBoard(freeboard);
			int boardname = freeboard.getFreeBoard_boardname();
			int boardno = freeboardService.getLastBoardno(boardname, userid);


			return "redirect:catFreeBoardList.do?boardname=" + boardname + "&boardno=" + boardno;
		}
		//게시글 쓰기 Rabbit===========================================================================================
		@RequestMapping("writeRabbitFreeBoardForm.do")	
		public String writeRabbitFreeBoardForm() {

			return "freeboard/writeRabbitFreeBoardForm";
		}
		

		@RequestMapping(value = "writeRabbitFreeBoard.do", method = RequestMethod.POST)
		public String writeRabbitFreeBoard(@RequestParam HashMap<String, Object> params, Model model, HttpSession session,
				HttpServletRequest req) {

			FreeBoard freeboard = new FreeBoard();
			String userid = (String) session.getAttribute("user_id");
			freeboard.setFreeBoard_userId(userid);
			freeboard.setFreeBoard_nickname(
					(String) userService.selectUser((String) session.getAttribute("user_id")).get("user_nickname"));


			freeboard.setFreeBoard_content((String) params.get("editor"));
			freeboard.setFreeBoard_title((String) params.get("freeBoard_title"));
			freeboard.setFreeBoard_boardname(5);
			freeboardService.writeFreeBoard(freeboard);
			int boardname = freeboard.getFreeBoard_boardname();
			int boardno = freeboardService.getLastBoardno(boardname, userid);


			return "redirect:rabbitFreeBoardList.do?boardname=" + boardname + "&boardno=" + boardno;
		}
		//게시글 쓰기 etc============================================================================================
		@RequestMapping("writeEtcFreeBoardForm.do")	
		public String writeEtcFreeBoardForm() {

			return "freeboard/writeEtcFreeBoardForm";
		}
		

		@RequestMapping(value = "writeEtcFreeBoard.do", method = RequestMethod.POST)
		public String writeEtcFreeBoard(@RequestParam HashMap<String, Object> params, Model model, HttpSession session,
				HttpServletRequest req) {

			FreeBoard freeboard = new FreeBoard();
			String userid = (String) session.getAttribute("user_id");
			freeboard.setFreeBoard_userId(userid);
			freeboard.setFreeBoard_nickname(
					(String) userService.selectUser((String) session.getAttribute("user_id")).get("user_nickname"));


			freeboard.setFreeBoard_content((String) params.get("editor"));
			freeboard.setFreeBoard_title((String) params.get("freeBoard_title"));
			freeboard.setFreeBoard_boardname(6);
			freeboardService.writeFreeBoard(freeboard);
			int boardname = freeboard.getFreeBoard_boardname();
			int boardno = freeboardService.getLastBoardno(boardname, userid);


			return "redirect:etcFreeBoardList.do?boardname=" + boardname + "&boardno=" + boardno;
		}
		

//게시글 수정dog===============================================================================
		
		@RequestMapping("dogModifyFreeBoardForm.do")
		public String dogModifyFreeBoardForm(Model model,int freeBoard_boardno,int freeBoard_boardname ,HttpSession session) {
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
		//게시글 수정cat===============================================================================
		
				@RequestMapping("catModifyFreeBoardForm.do")
				public String catModifyFreeBoardForm(Model model,int freeBoard_boardno,int freeBoard_boardname ,HttpSession session) {
					FreeBoard free = freeboardService.getBoard(freeBoard_boardname, freeBoard_boardno);
					model.addAttribute("freeBoard", free);
					return "freeboard/catModifyFreeBoardForm";

				}	
				

				@RequestMapping(value="catModifyFreeBoard.do",method=RequestMethod.POST)
				public String catModifyFreeBoard(@RequestParam HashMap<String, Object> params, HttpSession session, Model model) {
				
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
				//게시글 수정rabbit===============================================================================
				
				@RequestMapping("rabbitModifyFreeBoardForm.do")
				public String rabbitModifyFreeBoardForm(Model model,int freeBoard_boardno,int freeBoard_boardname ,HttpSession session) {
					FreeBoard free = freeboardService.getBoard(freeBoard_boardname, freeBoard_boardno);
					model.addAttribute("freeBoard", free);
					return "freeboard/rabbitModifyFreeBoardForm";

				}	
				

				@RequestMapping(value="rabbitModifyFreeBoard.do",method=RequestMethod.POST)
				public String rabbitModifyFreeBoard(@RequestParam HashMap<String, Object> params, HttpSession session, Model model) {
				
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
				//게시글 수정etc===============================================================================
				
				@RequestMapping("etcModifyFreeBoardForm.do")
				public String etcModifyFreeBoardForm(Model model,int freeBoard_boardno,int freeBoard_boardname ,HttpSession session) {
					FreeBoard free = freeboardService.getBoard(freeBoard_boardname, freeBoard_boardno);
					model.addAttribute("freeBoard", free);
					return "freeboard/etcModifyFreeBoardForm";

				}	
				

				@RequestMapping(value="etcModifyFreeBoard.do",method=RequestMethod.POST)
				public String etcModifyFreeBoard(@RequestParam HashMap<String, Object> params, HttpSession session, Model model) {
				
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
		
//게시글 삭제 dog===============================================================================
		@RequestMapping("dogDeleteFreeBoard.do")
		public String dogDeleteFreeBoard(Model model, int freeBoard_boardname, int freeBoard_boardno,HttpSession session) {
				freeboardService.DeleteFreeBoard(freeBoard_boardname, freeBoard_boardno);
			return "redirect:dogFreeBoardList.do";
		}
		//게시글 삭제 cat===============================================================================
				@RequestMapping("catDeleteFreeBoard.do")
				public String catDeleteFreeBoard(Model model, int freeBoard_boardname, int freeBoard_boardno,HttpSession session) {
						freeboardService.DeleteFreeBoard(freeBoard_boardname, freeBoard_boardno);
					return "redirect:catFreeBoardList.do";
				}
				//게시글 삭제 rabbit===============================================================================
				@RequestMapping("rabbitDeleteFreeBoard.do")
				public String rabbitDeleteFreeBoard(Model model, int freeBoard_boardname, int freeBoard_boardno,HttpSession session) {
						freeboardService.DeleteFreeBoard(freeBoard_boardname, freeBoard_boardno);
					return "redirect:rabbitFreeBoardList.do";
				}
				//게시글 삭제 etc===============================================================================
				@RequestMapping("etcDeleteFreeBoard.do")
				public String etcDeleteFreeBoard(Model model, int freeBoard_boardname, int freeBoard_boardno,HttpSession session) {
						freeboardService.DeleteFreeBoard(freeBoard_boardname, freeBoard_boardno);
					return "redirect:etcFreeBoardList.do";
				}
		
		
		
		

}
