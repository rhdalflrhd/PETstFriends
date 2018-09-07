package controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.print.DocFlavor.STRING;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.POST;

import org.apache.http.HttpRequest;
import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.google.gson.Gson;

import model.FreeBoard;
import model.FreeComment;
import model.FreeLikes;
import service.FreeBoardServiceImpl;
import service.UserService;

@Controller
public class FreeBoardController {
	
	@Autowired 
	FreeBoardServiceImpl freeboardService;
	
	@Autowired
	UserService userService;
	
	
	//---------------------------------------------------------------------------------------

//	@RequestMapping(value= "selectBoardLike.do", method=RequestMethod.GET) 		
//	public ModelAndView selectBoardLike(Model model,@RequestParam(defaultValue = "1") int page,
//			@RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int type,
//			@RequestParam(required = false) String startDate, @RequestParam(required = false) String endDate,HttpSession session) {
//
//		ModelAndView mav = new ModelAndView();
//		HashMap<String, Object> params = new HashMap<String, Object>();
//		HashMap<String, Object> result2 = null;
//		params.put("type", type);
//		params.put("keyword", keyword);
//		params.put("freeBoard_boardname", 3);
//		params.put("page", page);
//		if (type == 0) {
//			if ((startDate != null || startDate != "") && (endDate != null || endDate != "")) {
//				params.put("startdate", startDate);
//				params.put("enddate", endDate);
//			}
//		} 
//		else if (type == 1) {
//			params.put("title", keyword);
//		} else if (type == 2) {
//			params.put("content", keyword);
//		} else if (type == 3) {
//			params.put("title", keyword);
//			params.put("content", keyword);
//		} else if (type == 4) {
//			params.put("nickname", keyword);
//		}
//
//		System.out.println(result2+"result2");
//		result2 = freeboardService.selectBoardLike(params, page);
//		
//		String user_idCheck = (String) session.getAttribute("user_id");
//		model.addAttribute("user_idCheck", user_idCheck);
//
//
//		mav.addAllObjects(result2);
//	
//		mav.addAllObjects(params);
//
//		mav.setViewName("freeboard/dogFreeBoardList");
//
//		return mav;		
//	}		

	
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
			System.out.println(user_idCheck+"유저아이디이다.");
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
			//게시물 한개 보기 
			@RequestMapping("selectOneBoard.do")
			public ModelAndView SelectOneBoard(@RequestParam(required=false) HashMap<String, Object> params, HttpSession session) {
				ModelAndView mav = new ModelAndView();
				String user_idCheck = (String) session.getAttribute("user_id");
				mav.addObject("user_idCheck", user_idCheck);
				mav.addAllObjects(params);
				int freeBoard_boardname =  Integer.parseInt((String) params.get("freeBoard_boardname"));
				int freeBoard_boardno =  Integer.parseInt((String) params.get("freeBoard_boardno"));
				mav.addAllObjects(freeboardService.readBoard(freeBoard_boardname, freeBoard_boardno));
				
				HashMap<String, Object> paramForLike = new HashMap<String, Object>();
				paramForLike.put("freeLikes_userId", user_idCheck);
				paramForLike.put("freeLikes_boardname", freeBoard_boardname);
				paramForLike.put("freeLikes_boardno", freeBoard_boardno);
			   
				if(user_idCheck != null ) {
				System.out.println(user_idCheck+"아이디체크");
				System.out.println(userService.selectUser(user_idCheck)+"유저");
			   	String freeBoard_nickname = (String) userService.selectUser(user_idCheck).getUser_nickname();
			   	mav.addObject("freeBoard_nickname", freeBoard_nickname);
				if(freeboardService.countbyLike(paramForLike)==0){
			    	freeboardService.creatFreeLikes(paramForLike);
			    }
			       
			    FreeLikes fLikes = freeboardService.readFreeLikes(paramForLike);	 // 해당유저가 해당게시판의 해당게시글에 남긴 좋아요를 갖고옴.   
			    int like_check = 0;
			    like_check = fLikes.getFreeLikes_likeCheck();    //좋아요 체크 값  
			    System.out.println("해당세션유저의 라이크체크값은: "+like_check);
			    
			    // 해당게시판에 있는 댓글리스트도 같이 보내줘야함 ㅇㅇ 
//			    HashMap<String, Object> paramForComment = new HashMap<String, Object>();
//			    paramForLike.put("freeComments_boardname", freeBoard_boardname);
//				paramForLike.put("freeComments_boardno", freeBoard_boardno);
				mav.addObject("freeLikes_SessionuserlikeCheck", like_check);		
			    }
				mav.setViewName("freeboard/selectOneBoard");
				return mav;
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
				(String) userService.selectUser((String) session.getAttribute("user_id")).getUser_nickname());
		freeboard.setFreeBoard_content((String) params.get("editor"));
		freeboard.setFreeBoard_title((String) params.get("freeBoard_title"));
		freeboard.setFreeBoard_boardname(3);
		freeboardService.writeFreeBoard(freeboard);
		int boardname = freeboard.getFreeBoard_boardname();
		int boardno = freeboard.getFreeBoard_boardno();
		return "redirect:selectOneBoard.do?freeBoard_boardname=" + boardname + "&freeBoard_boardno=" + boardno;
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
					(String) userService.selectUser((String) session.getAttribute("user_id")).getUser_nickname());


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
					(String) userService.selectUser((String) session.getAttribute("user_id")).getUser_nickname());


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
					(String) userService.selectUser((String) session.getAttribute("user_id")).getUser_nickname());


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
		@RequestMapping(value="dogDeleteFreeBoard.do", method = RequestMethod.GET)
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
		
				//댓글 리스트===================================================================
				//댓글 리스트
				@RequestMapping("freeCommentList.do")
				@ResponseBody
				public void freeCommentList(HttpServletResponse resp, int freeBoard_boardname, int freeBoard_boardno, int comment_page, HttpSession session) {
					String user_id = (String) session.getAttribute("user_id");
					HashMap<String, Object> params = freeboardService.ShowCommentFreeBoard(freeBoard_boardname, freeBoard_boardno, comment_page);
					params.put("user_id", user_id);
					params.put("user_idCheck", user_id);
					Gson gson = new Gson();
					resp.setCharacterEncoding("UTF-8");
					List<FreeComment> freeCommentList = (List<FreeComment>) params.get("commentList");
					String result1 =gson.toJson(freeCommentList);
					params.put("freeCommentList", result1);
					String result =gson.toJson(params);
					try {
						resp.getWriter().println(result);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				
				//댓글 쓰기
				@RequestMapping("writefreeComment.do")
				@ResponseBody
				public int writefreeComment(@RequestParam(defaultValue = "0") int freeComments_parent, @RequestParam int freeBoard_boardname,
						@RequestParam String freeComments_content, @RequestParam int freeBoard_boardno, HttpSession session) {
					FreeComment freeCom = new FreeComment();
					String freeComments_userId = (String) session.getAttribute("user_id");
					String freeComments_nickname = (String) userService.selectUser(freeComments_userId).getUser_nickname();
					freeCom.setFreeBoard_boardname(freeBoard_boardname);
					freeCom.setFreeBoard_boardno(freeBoard_boardno);
					freeCom.setFreeComments_content(freeComments_content);
					freeCom.setFreeComments_nickname(freeComments_nickname);
					freeCom.setFreeComments_parent(freeComments_parent);
					freeCom.setFreeComments_userId(freeComments_userId);
					return freeboardService.writeCommentFreeBoard(freeCom);
					
				}
				//댓글삭제
				@RequestMapping("deletefreeComment.do")
				@ResponseBody
				public int deletefreeComment(@RequestParam int freeComments_commentno, @RequestParam int freeComments_parent) {
					return freeboardService.deleteComments(freeComments_commentno, freeComments_parent);
				}
				//댓글 수정
				@RequestMapping("updatefreeComment.do")
				@ResponseBody
				public int updatefreeComment(@RequestParam int freeComments_commentno, @RequestParam String freeComments_content) {
					return freeboardService.updatefreeComment(freeComments_commentno, freeComments_content);
				}

		//좋아요
				@ResponseBody
				@RequestMapping(value="insertLikesFreeBoard.do", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
				public String insertLikesFreeBoardC(Model model, int boardname, int boardno,HttpSession session) {
					
					String user_idCheck = (String)session.getAttribute("user_id");
				    JSONObject obj = new JSONObject();
				    String mm ="";
				    ArrayList<String> msgs = new ArrayList<String>();
				    HashMap <String, Object> params = new HashMap<String, Object>();
				    params.put("freeLikes_boardname", boardname);
				    params.put("freeLikes_boardno", boardno);
				    params.put("freeLikes_userId", user_idCheck);
				    FreeLikes fLikes = freeboardService.readFreeLikes(params);	 //해당유저가 해당게시판의 해당게시글에 남긴 좋아요를 갖고옴.   
				    FreeBoard fBoard = freeboardService.getBoard(boardname, boardno);
				    
				    int like_cnt = fBoard.getFreeBoard_LikeCount();    //게시판의 좋아요 카운트
				    int like_check = 0;
				    like_check = fLikes.getFreeLikes_likeCheck();    //좋아요 체크 값
				   
				    //해당아이디의 보드네임,보드넘버(게시글)에 남긴 좋아요가 0일시에는 Create
				    if(freeboardService.countbyLike(params)==0){
				    	freeboardService.creatFreeLikes(params);
				    }
				      
				    if(like_check == 0) {
				    	mm ="좋아요완료";
				      msgs.add("좋아요!");
				      freeboardService.like_check(params);
				      like_check++;
				      like_cnt++;
				      freeboardService.FreeBoard_likeCnt_up(boardname, boardno);  //팁보드테이블, 해당게시판 해당게시글의 좋아요 갯수 +
				    } else {
				      msgs.add("좋아요 취소");
				      mm ="좋아요 취소";
				      freeboardService.like_check_cancel(params);
				      like_check--;
				      like_cnt--;
				      freeboardService.FreeBoard_likeCnt_down(boardname, boardno); //팁보드테이블, 해당게시판 해당게시글의 좋아요 갯수 -
				    }
//				    obj.put("boardno", tLikes.getTipLikes_boardno());
//				    obj.put("boardname", tLikes.getTipLikes_boardname());
				    obj.put("like_check", like_check);
				    obj.put("like_cnt", like_cnt);
				    System.out.println(mm);
				    obj.put("mm", mm);
				    
				    return obj.toJSONString();
				}
		

}
