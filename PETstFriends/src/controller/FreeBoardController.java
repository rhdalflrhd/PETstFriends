package controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		if(freeboardService.countbyLike(paramForLike)==0){
	    	freeboardService.creatFreeLikes(paramForLike);
	    }
	       
	    FreeLikes fLikes = freeboardService.readFreeLikes(paramForLike);	 // 해당유저가 해당게시판의 해당게시글에 남긴 좋아요를 갖고옴.   
	    int like_check = 0;
	    like_check = fLikes.getFreeLikes_likeCheck();    //좋아요 체크 값  
	    System.out.println("해당세션유저의 라이크체크값은: "+like_check);
	    
	    // 해당게시판에 있는 댓글리스트도 같이 보내줘야함 ㅇㅇ 
//	    HashMap<String, Object> paramForComment = new HashMap<String, Object>();
//	    paramForLike.put("freeComments_boardname", freeBoard_boardname);
//		paramForLike.put("freeComments_boardno", freeBoard_boardno);
		mav.addObject("freeLikes_SessionuserlikeCheck", like_check);		
	    }
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
			
			freeboardService.readBoard(FreeBoard_boardno,FreeBoard_boardname);
			FreeBoard freeBoard = freeboardService.getBoard(FreeBoard_boardno,FreeBoard_boardname);
			
			session.setAttribute("user_id", "user_id");//용도
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
			if(freeboard.getFreeBoard_userId().equals(user_idCheck)) {
				freeboardService.DeleteFreeBoard(FreeBoard_boardname, FreeBoard_boardno);
			}
			
			return "redirect:FreeBoardList.do";
		}
		
		
		//댓글 리스트
		@RequestMapping("freeCommentList.do")
		@ResponseBody
		public void freeCommentList(HttpServletResponse resp, int freeBoard_boardname, int freeBoard_boardno, int comment_page, HttpSession session) {
			String user_id = (String) session.getAttribute("user_id");
			HashMap<String, Object> params = freeboardService.ShowCommentFreeBoard(freeBoard_boardname, freeBoard_boardno, comment_page);
			params.put("user_id", user_id);
//			if(user_id == null)
//				params.put("user_id", "");
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
			String freeComments_nickname = (String) userService.selectUser(freeComments_userId).get("user_nickname");
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
//		    obj.put("boardno", tLikes.getTipLikes_boardno());
//		    obj.put("boardname", tLikes.getTipLikes_boardname());
		    obj.put("like_check", like_check);
		    obj.put("like_cnt", like_cnt);
		    System.out.println(mm);
		    obj.put("mm", mm);
		    
		    return obj.toJSONString();
		}

}