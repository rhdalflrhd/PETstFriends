package controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

import dao.ITipBoardDao;
import dao.UserDao;
import model.TipBoard;
import model.TipLikes;
import model.TipComments;
import model.User;
import service.TipBoardEncycService;
import service.TipBoardService;
import service.UserServiceImpl;

@Controller
public class TipBoardController {

	@Autowired
	private TipBoardService tipService;

	@Autowired
	private TipBoardEncycService EncycService;
	
	
	@Autowired
	private UserDao uDao;
	
	@Autowired
	UserServiceImpl userService;
	
	public static Gson gson = new Gson();		
	// Spring MVC 컨트롤러에서 사용할 수 있는 반환유형의 종류  dd
	// 데이터와 페이지 정보가 둘 다 있는 경우	= ModelAndView
	// 데이터에 대한 정보만 있는 경우   		=  Model or Map(해쉬맵. 키값과 밸류값으로 넘어감)
	// 페이지에 대한 정보만 있는경우    		=   String
	// 둘 다 없을 때 						=     void
	
	// model.addAllAttributes(service.getMemberInfo(id))<= Map을 통채로 싣기
	// model.addAttibute(arg0); <= 모델 객체를 통채로 싣기
	// model.addAttribute(arg0, arg1); <=키 값 지정 하나의 데이터 싣기

	// @RequestMapping("test.do")
	// public ModelAndView dummy() {
	// ModelAndView mav = new ModelAndView();
	// mav.addObject("msg", service.getData());
	// mav.setViewName("test");
	// return mav;
	// }

	
	
	//===========================펫프정보- 정보게시판====================================================================================
	@RequestMapping("download.do")
	public View download(int boardname, int boardno) {

		View view = new DownloadView(tipService.getAttachFileS(boardname,boardno));
		return view;
	}
	
	@RequestMapping("dogInfoSquareSpecies.do")
	public String dogInfoSquareSpecies(Model model) {
		System.out.println("강아지 백과사전 요청");
		model.addAttribute("DogEncycList1", EncycService.searchEncyc("FCI 스탠다드", 100, 1));
		model.addAttribute("DogEncycList2", EncycService.searchEncyc("FCI 스탠다드", 100, 100));
		model.addAttribute("DogEncycList3", EncycService.searchEncyc("FCI 스탠다드", 100, 200));
		model.addAttribute("DogEncycList4", EncycService.searchEncyc("FCI 스탠다드", 45, 300));		
		return "Tipboard/dogInfoSquareSpecies";
	}
	
	@RequestMapping("CatInfoSquareSpecies.do")
	public String CatInfoSquareSpecies(Model model) {
		System.out.println("고양이 백과사전 요청");
		model.addAttribute("CatEncycList", EncycService.searchEncyc("식육목 고양이과의 포유류",43,12));
		//이렇게하면 흰코사향고양이와 아비시니아 두종류가 빠짐. 파싱결과에서 호랑이와 시라소니 제외하는거 알아볼것
		return "Tipboard/CatInfoSquareSpecies";
	}
	
	@RequestMapping("RabbitInfoSquareSpecies.do")
	public String RabbitInfoSquareSpecies(Model model) {
		System.out.println("토끼 백과사전 요청!");
		model.addAttribute("RabbitEncycList1", EncycService.searchEncyc("토끼목 토끼과의 포유류", 91, 2));
		model.addAttribute("RabbitEncycList2", EncycService.searchEncyc("토끼목 토끼과의 포유류", 100, 101));
	
		return "Tipboard/RabbitInfoSquareSpecies";
	}
	
	//===========================펫프정보- 꿀TIP게시판==========================================================================================	
		
	//---TIp정보 게시판목록
	@RequestMapping(value= "TipBoardList.do", method=RequestMethod.GET) 		
	public ModelAndView TipBoardList(Model model,@RequestParam(defaultValue = "1") int page,
			@RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int type,
			@RequestParam(required = false) String startDate, @RequestParam(required = false) String endDate,  @RequestParam(defaultValue = "0") int tipBoard_boardname, HttpSession session) throws MalformedURLException, IOException {
		
		System.out.println(tipBoard_boardname + ": 꿀 Tip정보 요청(개7고양이8토끼9)");
		System.out.println("들어온 키워드는: " + keyword);
		System.out.println("요청 타입은: " + type);

		String user_idCheck = (String)session.getAttribute("user_id");
		System.out.println("현재 접속자는?: "+user_idCheck);
		
		String check = String.valueOf(tipBoard_boardname);
		int sendboardName = 0;
		
		if (check.equals("0")) {
			sendboardName = 7;
		} else {
			sendboardName = tipBoard_boardname;
		}
		
		//해당게시판에 게시글이 0개일시, 최초 dummy용 fake게시글 하나 생성. 이럴려면 User table에 fakeDummyID이 있어야함 반드시.
		if (tipService.TipboardNullcheck(sendboardName) == 0) {

			TipBoard dtboard = new TipBoard();
			String WriteUserid = "fakeDummyID";
			dtboard.setTipBoard_boardname(sendboardName);
			dtboard.setTipBoard_userId(WriteUserid);
			dtboard.setTipBoard_nickname("fakeDummynickname");
			dtboard.setTipBoard_title("fakeDummy게시글");
			dtboard.setTipBoard_content("이 게시글은 fakeDummy 게시글이 0개일시 최초 생성되는 가짜게시글이다.");
			MultipartFile contentPic = null;
			tipService.writeTipBoardS(dtboard, contentPic);
			System.out.println("해당게시판에 게시글이 0개일시, 최초 dummy용 fake게시글 하나 생성하는 쿼리실행됨");
		}

		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> params = new HashMap<String, Object>();
		HashMap<String, Object> result = null;
		params.put("type", type);
		params.put("keyword", keyword);
		params.put("tipBoard_boardname", sendboardName);
		
		if (type == 0) {
			if ((startDate != null || startDate != "") && (endDate != null || endDate != "")) {
				params.put("startdate", startDate);
				params.put("enddate", endDate);
			}
		} else if (type == 1) {
			params.put("title", keyword);
		} else if (type == 2) {
			params.put("content", keyword);
		} else if (type == 3) {
			params.put("title", keyword);
			params.put("content", keyword);
		} else if (type == 4) {
			params.put("nickname", keyword);
		}
		
		result = tipService.SearchTipBoardS(params, page);
		
		if(sendboardName==7) {
			mav.addObject("EncycList1", EncycService.searchEncyc("다시 쓰는 개 사전", 46, 3));	
			System.out.println("강아지 팁정보 확인");

		}else if (sendboardName==8) {
			
			mav.addObject("EncycList1", EncycService.searchEncyc("다시 쓰는 고양이 사전", 49, 2));
			System.out.println("고양이 팁정보 확인");
			System.out.println(EncycService.searchEncyc("다시 쓰는 고양이 사전", 2, 2));
		}else if(sendboardName==9) {
			
			mav.addObject("EncycList9", EncycService.onlyforRabbitWebParsing());
			System.out.println("토끼 팁정보 확인");
		}
//		user_idCheck
		mav.addObject("user_idCheck", user_idCheck);
		mav.addAllObjects(result);
		mav.addAllObjects(params);
		mav.setViewName("Tipboard/TipBoardList");
		return mav;		
	}		
	

	//-----------------------------------------  TIp정보 게시판 글 한개 읽기.
	@RequestMapping("ReadTipBoard.do")
	public String ReadTipBoardC(Model model, int boardname, int boardno, HttpSession session) {
		String user_idCheck = (String)session.getAttribute("user_id");
		System.out.println("접속된 id는= "+user_idCheck);
		
		System.out.println("ReadTipBoard.do 들어옴");
		System.out.println("해당게시판넘버(개7고양이8토끼9)= "+boardname);
		System.out.println("해당게시글 넘버= "+boardno);
		
		tipService.ReadTipBoardS(boardname, boardno);		   //조회수 증가
		TipBoard tb = tipService.getBoardS(boardname, boardno);//글 한개 갖고옴

		System.out.println("해당게시글의 닉네임은= "+tb.getTipBoard_nickname());
		
		HashMap<String, Object> paramForLike = new HashMap<String, Object>();
		paramForLike.put("tipLikes_boardname", boardname);
		paramForLike.put("tipLikes_boardno", boardno);
		paramForLike.put("tipLikes_userId", user_idCheck);
		
		if (session.getAttribute("user_id") != null) {
			if (tipService.countbyLike(paramForLike) == 0) {
				tipService.createTipLikes(paramForLike);
			}
		}
		
	    TipLikes tLikes = tipService.readTipLikes(paramForLike);	 // 해당유저가 해당게시판의 해당게시글에 남긴 좋아요를 갖고옴.   
	    System.out.println("라이크첵 : "+tLikes);
	  
	    int like_check = 0;

	    
		if (tLikes != null) {
		    like_check = tLikes.getTipLikes_likeCheck();    //좋아요 체크 값  
		    System.out.println("해당세션유저의 라이크체크값은: "+like_check);
		}
	  	    
		HashMap<String, Object> paramforuser = new HashMap<String, Object>();
		paramforuser.put("user_id", user_idCheck);
		User tempuser = uDao.selectUserbyId2(paramforuser);
		System.out.println("템프유저는?"+tempuser);
		

		String usernn = "";
		
		if(tempuser ==null) {
			usernn ="비회원";
		}else {
			usernn = tempuser.getUser_nickname();
		}
		
	    model.addAttribute("user_nickname", usernn);	    
	    model.addAttribute("user_idCheck", user_idCheck);
		model.addAttribute("tipLikes_SessionuserlikeCheck", like_check);
		model.addAttribute("tipboard", tb);
		System.out.println("tipboard 파람 확인 :"+tb);
		model.addAttribute("tipComment", tipService.readCommentBoard(boardname, boardno));
		System.out.println("코멘트 파람 확인 :"+tipService.readCommentBoard(boardname, boardno));
		return "Tipboard/ReadTipBoard";
	}
	
	//------------------------------------------- TIp정보 게시판 글쓰기 폼	
	@RequestMapping("WriteTipBoardForm.do")	
	public String WriteTipBoardFormC(Model model, HttpSession session, int tipBoard_boardname) {
		System.out.println("WriteTipBoardForm.do 들어옴");
		String id = (String)session.getAttribute("user_id");
		System.out.println("접속된 유저 아이디는 :"+id);
		HashMap<String, Object> paramforuser = new HashMap<String, Object>();
		paramforuser.put("user_id", id);
		User tempuser = uDao.selectUserbyId2(paramforuser);

		
		//유저서비스에서 UserService의 getUserbyId함수 이용해서, USer user변수에 담고, f
		//그, user의 getUser_nickname해서 얻은 닉네임값을 String nickName이라는 변수에담음
		//지금은 아직 USer랑 연결안했으니까 아래와같이 임의로 만듦.
		String nickName = tempuser.getUser_nickname();
		model.addAttribute("tipBoard_boardname", tipBoard_boardname);
		model.addAttribute("id", id);
		model.addAttribute("nickName", nickName);	
		return "Tipboard/WriteTipBoardForm";
	}
	
	
	//--------------------------------------- TIp정보 게시판 글쓰기 실행
	@RequestMapping("WriteTipBoard.do")		
	public String WriteTipBoardC(HttpSession session, @RequestParam HashMap<String, Object> params,
@RequestParam(value="tipBoard_contentPic", required=false) MultipartFile contentPic) {
		System.out.println("WriteTipBoard.do 들어옴");
		System.out.println(contentPic);
		
		TipBoard dtboard = new TipBoard();

		String WriteUserid = (String)session.getAttribute("user_id");

		String tName = (String)params.get("tipBoard_boardname");
		int Tipboardname = Integer.parseInt(tName);
		
		dtboard.setTipBoard_boardname(Tipboardname);
		dtboard.setTipBoard_userId(WriteUserid);
		dtboard.setTipBoard_nickname((String) params.get("tipBoard_nickname"));		
		dtboard.setTipBoard_title((String) params.get("tipBoard_title"));
		dtboard.setTipBoard_file((String) params.get("tipBoard_file"));
		dtboard.setTipBoard_content((String) params.get("editor"));	
		dtboard.setTipBoard_YoutubeUrl((String) params.get("tipBoard_YoutubeUrl"));
		
		tipService.writeTipBoardS(dtboard, contentPic);
		int boardname = dtboard.getTipBoard_boardname();
		int boardno = tipService.getLastBoardno(boardname, WriteUserid);
		System.out.println("보드넘버는= " +boardno);
		
		return "redirect:ReadTipBoard.do?boardname="+boardname+"&boardno="+boardno;
	}

	//------------------------------------------------------ TIp정보 게시판 글 한 개 수정폼 제공
	@RequestMapping("ModifyFormTipBoard.do")
	public String ModifyFormTipBoardC(Model model, int boardname, int boardno,HttpSession session) {
		System.out.println("TIp정보 게시판 글 한 개 수정폼 제공 들어옴");
		TipBoard tb = tipService.getBoardS(boardname, boardno);
		model.addAttribute("tipboard", tb);
		return "Tipboard/ModifyFormTipBoard";
	}	
	
	//------------------------------------------------------ TIp정보 게시판 글 한 개 수정 실행!
	@RequestMapping("ModifyTipBoard.do")
	public String ModifyTipBoardC(HttpSession session, @RequestParam HashMap<String, Object> params,
			@RequestParam(value="tipBoard_contentPic", required=false) MultipartFile contentPic){
		
		String WriteUserid = (String)session.getAttribute("user_id");

		System.out.println("TIp정보 게시판 글 한 개 수정, 들어옴");
		System.out.println("컨텐츠 픽은: "+contentPic);
		System.out.println(params);
		System.out.println("해당글의 작성자는: "+(String)params.get("tipBoard_userId") );
		System.out.println("현재접속자는: "+WriteUserid);
		
		String boardname =(String)params.get("tipBoard_boardname");
		String boardno =(String)params.get("tipBoard_boardno");
	
		int tipBoard_boardname = Integer.parseInt(boardname);
		int tipBoard_boardno = Integer.parseInt(boardno);
		
		TipBoard tb = tipService.getBoardS(tipBoard_boardname,tipBoard_boardno);
		System.out.println("지금 tb변수로 끄집어온 글의 작성자는: "+tb.getTipBoard_userId());
		tb.setTipBoard_title((String) params.get("tipBoard_title"));
		tb.setTipBoard_content((String) params.get("editor"));
		tb.setTipBoard_contentPic((String) params.get("tipBoard_contentPic"));
		tb.setTipBoard_YoutubeUrl((String) params.get("tipBoard_YoutubeUrl"));
			
		if(WriteUserid.equals((String)params.get("tipBoard_userId"))) {
			tipService.ModifyTipBoardS(tb,contentPic);		
			return "redirect:ReadTipBoard.do?boardname="+boardname+"&boardno="+boardno;
		}else {			
			return "redirect:ModifyFormTipBoard.do?boardname="+boardname+"&boardno="+boardno;
		}

	}
	
	
	//------------------------------------------------------TIp정보 게시판 글 한 개 삭제 실행!!	!
//	@ResponseBody
	@RequestMapping("DeleteTipBoard.do")
	public String DogDeleteTipBoardC(Model model, int boardname, int boardno,HttpSession session) {
		System.out.println("DeleteTipBoard.do 컨트롤러 들어옴");
		System.out.println("boardname: "+boardname);
		System.out.println("boardno: "+boardno);
		TipBoard tb = tipService.getBoardS(boardname, boardno);
		String user_idCheck = (String) session.getAttribute("user_id");
		if(tb.getTipBoard_userId().equals(user_idCheck)) {
			tipService.DeleteTipBoardS(boardname, boardno);
		}
		
		return "redirect:TipBoardList.do";
	}

//------------------------------------0905 게시글 하나 읽는 페이지에서 작성자 아이디 클릭해서 나오는 메뉴중,
//-----------------------------------------해당 회원이 작성한 전체 게시글 보기 페이지로 이동.
	@RequestMapping(value = "CertainMemberWrites.do", method = RequestMethod.GET) 
	public ModelAndView CertainMemberWrites(Model model, String memberid,
			@RequestParam(defaultValue = "1") int page,	@RequestParam(required = false) String keyword,
			@RequestParam(defaultValue = "0") int type, @RequestParam(required = false) String startDate,
			@RequestParam(required = false) String endDate) {
		
		System.out.println("해당 회원이 작성한 전체 게시글 보기 컨트롤러들어옴");
		System.out.println("작성자의 id는 :" + memberid);
		
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
				
		HashMap<String, Object> result = userService.myWrites(memberid, page, params);
        System.out.println(result);
		mav.addAllObjects(result);
		mav.addAllObjects(params);
		mav.addObject("ThatmemberId", memberid);
		mav.setViewName("Tipboard/CertainMemberWrites");
		return mav;

	}
	

	//--------------------------------------------------------TIpboard 공통좋아요--------------------------------------------------------
	@ResponseBody
	@RequestMapping(value="InsertLikesTipBoard.do", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String InsertLikesTipBoardC(Model model, int boardname, int boardno,HttpSession session) {
		
		System.out.println("InsertLikesTipBoard.do 컨트롤러 들어옴");
		String user_idCheck = (String)session.getAttribute("user_id");
	    JSONObject obj = new JSONObject();
	    String mm ="";
	    ArrayList<String> msgs = new ArrayList<String>();
	    HashMap <String, Object> params = new HashMap<String, Object>();
	    params.put("tipLikes_boardname", boardname);
	    params.put("tipLikes_boardno", boardno);
	    params.put("tipLikes_userId", user_idCheck);
	    
	    TipLikes tLikes = tipService.readTipLikes(params);	 //해당유저가 해당게시판의 해당게시글에 남긴 좋아요를 갖고옴.   
	    TipBoard tBoard = tipService.getBoardS(boardname, boardno);
	    
	    int like_cnt = tBoard.getTipBoard_LikeCount();    //게시판의 좋아요 카운트
	    int like_check = 0;
	    like_check = tLikes.getTipLikes_likeCheck();    //좋아요 체크 값
	    
	    //해당아이디의 보드네임,보드넘버(게시글)에 남긴 좋아요가 0일시에는 Create
	    if(tipService.countbyLike(params)==0){
	    	tipService.createTipLikes(params);
	    }
	      
	    if(like_check == 0) {
	    	mm ="좋아요완료";
	      msgs.add("좋아요!");
	      tipService.like_check(params);
	      like_check++;
	      like_cnt++;
	      tipService.TipBoard_likeCnt_up(boardname, boardno);  //팁보드테이블, 해당게시판 해당게시글의 좋아요 갯수 +
	    } else {
	      msgs.add("좋아요 취소");
	      mm ="좋아요 취소";
	      tipService.like_check_cancel(params);
	      like_check--;
	      like_cnt--;
	      tipService.TipBoard_likeCnt_down(boardname, boardno); //팁보드테이블, 해당게시판 해당게시글의 좋아요 갯수 -
	    }
//	    obj.put("boardno", tLikes.getTipLikes_boardno());
//	    obj.put("boardname", tLikes.getTipLikes_boardname());
	    obj.put("like_check", like_check);
	    obj.put("like_cnt", like_cnt);
	    System.out.println(mm);
	    obj.put("mm", mm);
	    
	    return obj.toJSONString();
	}

	//=============================================TIpboard 공통 댓글 쿼리 시작=====================================================
	
	
	//댓글 리스트
	@RequestMapping("tipCommentsList.do")
	@ResponseBody
	public void freeCommentList(HttpServletResponse resp, int tipComments_boardname, int tipComments_boardno, int comment_page, HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		HashMap<String, Object> params = tipService.ShowCommentTipBoard(tipComments_boardname, tipComments_boardno, comment_page);
		params.put("user_id", user_id);
		params.put("user_idCheck", user_id);
		Gson gson = new Gson();
		resp.setCharacterEncoding("UTF-8");
		List<TipComments> TipCommentList = (List<TipComments>)params.get("commentList");
		System.out.println("tipCommentsList.do의 댓글 출력: "+TipCommentList);
		String result1 =gson.toJson(TipCommentList);
		params.put("TipCommentList", result1);
		String result =gson.toJson(params);
		try {
			resp.getWriter().println(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//댓글 쓰기
	@RequestMapping("writeTipComment.do")
	@ResponseBody
	public int writeTipComment(@RequestParam(defaultValue = "0") int tipComments_parent, @RequestParam int tipComments_boardname,
			@RequestParam String tipComments_content, @RequestParam int tipComments_boardno, HttpSession session) {
		TipComments tipcom = new TipComments();
		String tipComments_userId = (String) session.getAttribute("user_id");
		String tipComments_nickname = (String) userService.selectUser(tipComments_userId).getUser_nickname();
		tipcom.setTipComments_boardname(tipComments_boardname);
		tipcom.setTipComments_boardno(tipComments_boardno);
		tipcom.setTipComments_content(tipComments_content);
		tipcom.setTipComments_nickname(tipComments_nickname);
		tipcom.setTipComments_parent(tipComments_parent);
		tipcom.setTipComments_userId(tipComments_userId);
		return tipService.writeCommentTipBoard(tipcom);
		
	}
	//댓글삭제
	@RequestMapping("deleteTipComment.do")
	@ResponseBody
	public int deletefreeComment(@RequestParam int tipComments_commentno, @RequestParam int tipComments_parent) {
		return tipService.deleteComments(tipComments_commentno, tipComments_parent);
	}
	
	//댓글 수정
	@RequestMapping("updateTipComment.do")
	@ResponseBody
	public int updatefreeComment(@RequestParam int tipComments_commentno, @RequestParam String tipComments_content) {
		return tipService.updateTipComment(tipComments_commentno, tipComments_content);
	}


}
