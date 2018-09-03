package controller;

import java.util.ArrayList;import java.util.Date;
import java.util.HashMap;

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
import model.Board;
import model.TipBoard;
import model.TipLikes;
import service.TipBoardEncycService;
import service.TipBoardService;

@Controller
public class TipBoardController {

	@Autowired
	private TipBoardService tipService;

	@Autowired
	private TipBoardEncycService EncycService;
	private static UserDao uDao;
	
	public static Gson gson = new Gson();		
	// Spring MVC 컨트롤러에서 사용할 수 있는 반환유형의 종류
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
	
	//---------------------------강아지 꿀TIP게시판---------------------------------------------------------------------------------------------
	
	//----강아지 TIp정보 게시판목록
	@RequestMapping(value= "dogTipBoardList.do", method=RequestMethod.GET) 		
	public ModelAndView dogTipBoardList(Model model,@RequestParam(defaultValue = "1") int page,
			@RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int type,
			@RequestParam(required = false) String startDate, @RequestParam(required = false) String endDate) {
		

		System.out.println("강아지 꿀 Tip정보 요청");
		System.out.println("들어온 키워드는: "+keyword);
		System.out.println("요청 타입은: "+keyword);	
		
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> params = new HashMap<String, Object>();
		HashMap<String, Object> result = null;
		params.put("type", type);
		params.put("keyword", keyword);
		params.put("tipBoard_boardname", 7);
		
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
		
		result = tipService.SearchTipBoardS(params, page);
		
		
		mav.addObject("DogEncycList1", EncycService.searchEncyc("다시 쓰는 개 사전", 46, 3));
		mav.addAllObjects(result);
		mav.addAllObjects(params);
		mav.setViewName("Tipboard/dogTipBoardList");

		System.out.println("보더리스트에서:" + result.toString());

		return mav;		
	}		
	
	//----강아지 TIp정보 게시판 글쓰기 폼	
	@RequestMapping("DogWriteTipBoardForm.do")	
	public String DogWriteTipBoardFormC(Model model, HttpSession session) {
		String id = (String)session.getAttribute("TipBoard_userId");
		//유저서비스에서 UserService의 getUserbyId함수 이용해서, USer user변수에 담고,
		//그, user의 getUser_nickname해서 얻은 닉네임값을 String nickName이라는 변수에담음
		//지금은 아직 USer랑 연결안했으니까 아래와같이 임의로 만듦.
		String nickName = "user컨트롤러 연결전 닉네임";
		model.addAttribute("nickName", nickName);	
		return "Tipboard/DogWriteTipBoardForm";
	}
	
	
	//----강아지 TIp정보 게시판 글쓰기 실행
	@RequestMapping("DogWriteTipBoard.do")		
	public String DogWriteTipBoardC(HttpSession session, @RequestParam HashMap<String, Object> params, @RequestParam(value="tipBoard_contentPic", required=false) MultipartFile contentPic) {
		System.out.println("들어옴");
		System.out.println(contentPic);
		
		TipBoard dtboard = new TipBoard();
//		String user_id = (String)session.getAttribute("user_id");
		String WriteUserid = "tesID";  		// 지금은 USer랑 연결안했으니까 현재 내가 DB에 넣은 유저멤버들중 임의의 ID 지정하겠음
		dtboard.setTipBoard_boardname(7);		// 강아지 TIP게시판 보드네임은 숫자 7로 구분함 ( 팁개=7, 팁고양이=8 팁토끼=9)
//												    보드넘버는 오토인크리트먼트, 작성일도 curdate로 넣을거임
		dtboard.setTipBoard_userId(WriteUserid);
//      dtboard.setTipBoard_nickname(uDao.selectUserId(WriteUserid));uDao
		dtboard.setTipBoard_nickname("test");	//지금은 USer랑 연결안했으니까 임의의 nickname 지정하겠음
		dtboard.setTipBoard_title((String) params.get("tipBoard_title"));
		dtboard.setTipBoard_file((String) params.get("tipBoard_file"));
		dtboard.setTipBoard_content((String) params.get("tipBoard_content"));	
		//아직 조회수 없음
		dtboard.setTipBoard_YoutubeUrl((String) params.get("tipBoard_YoutubeUrl"));
		//아직 좋아요 수 없음
	
		tipService.writeTipBoardS(dtboard, contentPic);
		int boardname = dtboard.getTipBoard_boardname();
		int boardno = tipService.getLastBoardno(boardname, WriteUserid);// 유저와 합친후에는 WriteUserid말고 세션에서 갖고온 user_id넣어야함 ㅇㅇ
		System.out.println("보드넘버는= " +boardno);
		
		return "redirect:DogReadTipBoard.do?boardname="+boardname+"&boardno="+boardno;
	}

	//----강아지 TIp정보 게시판 글 한개 읽기.
	@RequestMapping("DogReadTipBoard.do")
	public String DogReadTipBoardC(Model model, int boardname, int boardno, HttpSession session) {
		
		
		System.out.println("DogReadTipBoard.do 들어옴");
		System.out.println("해당게시판넘버(개7고양이8토끼9)= "+boardname);
		System.out.println("해당게시글 넘버= "+boardno);
		tipService.ReadTipBoardS(boardname, boardno);
		TipBoard tb = tipService.getBoardS(boardname, boardno);
		System.out.println("해당게시글 row전체내용= "+tb);
		System.out.println("해당게시글의 닉네임은= "+tb.getTipBoard_nickname());

		session.setAttribute("user_id", "tesID");
		
		String user_idCheck = (String) session.getAttribute("user_id");
		System.out.println("접속된 id는= "+user_idCheck);
		
		HashMap<String, Object> paramForLike = new HashMap<String, Object>();
		paramForLike.put("tipLikes_boardname", boardname);
		paramForLike.put("tipLikes_boardno", boardno);
		paramForLike.put("tipLikes_userId", user_idCheck);
		
	    if(tipService.countbyLike(paramForLike)==0){
	    	tipService.createTipLikes(paramForLike);
	    }
	     
	    TipLikes tLikes = tipService.readTipLikes(paramForLike);	 // 해당유저가 해당게시판의 해당게시글에 남긴 좋아요를 갖고옴.   
	    int like_check = 0;
	    like_check = tLikes.getTipLikes_likeCheck();    //좋아요 체크 값  
	    System.out.println("해당세션유저의 라이크체크값은: "+like_check);
		model.addAttribute("user_idCheck", user_idCheck);
		model.addAttribute("tipLikes_SessionuserlikeCheck", like_check);
		model.addAttribute("tipboard", tb);
		
		return "Tipboard/DogReadTipBoard";
	}
	
	//----강아지 TIp정보 게시판 글 한 개 수정폼 제공
	@RequestMapping("DogModifyFormTipBoard.do")
	public String DogModifyFormTipBoardC(Model model, int boardname, int boardno,HttpSession session) {
		System.out.println("강아지 꿀TIp 게시글 수정 컨트롤러 들어옴");
		TipBoard tb = tipService.getBoardS(boardname, boardno);
		model.addAttribute("tipboard", tb);
		return "Tipboard/DogModifyFormTipBoard";
	}	
	
	//----강아지 TIp정보 게시판 글 한 개 수정 실행!
	@RequestMapping("DogModifyTipBoard.do")
	public String DogModifyTipBoardC(HttpSession session, @RequestParam HashMap<String, Object> params) {
		System.out.println("강아지 TIp정보 게시판 글 한 개 수정, 들어옴");

		String tipBoard_boardnameS = (String)params.get("tipBoard_boardname");
		int tipBoard_boardname = Integer.parseInt(tipBoard_boardnameS);
		
		String tipBoard_boardnoS = (String)params.get("tipBoard_boardno");
		int tipBoard_boardno = Integer.parseInt(tipBoard_boardnoS);
		
		TipBoard tb = tipService.getBoardS(tipBoard_boardname,tipBoard_boardno);

		tb.setTipBoard_title((String) params.get("tipBoard_title"));
		tb.setTipBoard_file((String) params.get("tipBoard_file"));
		tb.setTipBoard_content((String) params.get("tipBoard_content"));
		tb.setTipBoard_contentPic((String) params.get("tipBoard_contentPic"));
		tb.setTipBoard_YoutubeUrl((String) params.get("tipBoard_YoutubeUrl"));
		tipService.ModifyTipBoardS(tb);
		String boardname =(String)params.get("tipBoard_boardname");
		String boardno =(String)params.get("tipBoard_boardno");
		
		return "redirect:DogReadTipBoard.do?boardname="+boardname+"&boardno="+boardno;
	}
	@ResponseBody
	@RequestMapping("dogDeleteTipBoard.do")
	public String DogDeleteTipBoardC(Model model, int boardname, int boardno,HttpSession session) {
		System.out.println("dogDeleteTipBoard.do 컨트롤러 들어옴");
		TipBoard tb = tipService.getBoardS(boardname, boardno);
		session.setAttribute("user_id", "testID");//지금은 유저랑 연결안해놨으니까 일단 이렇게 해놈 08.23 현재날짜 기준.
		String user_idCheck = (String) session.getAttribute("user_id");
		if(tb.getTipBoard_userId().equals(user_idCheck)) {
			tipService.DeleteTipBoardS(boardname, boardno);
		}
		
		return "redirect:dogTipBoardList.do";
	}

	//좋아요
	@ResponseBody
	@RequestMapping(value="InsertLikesTipBoard.do", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String InsertLikesTipBoardC(Model model, int boardname, int boardno,HttpSession session) {
		
		System.out.println("dogInsertLikesTipBoard.do 컨트롤러 들어옴");
		session.setAttribute("user_id", "tesID");// 지금은 USer랑 안합쳤으니 일단 이렇게 하겠음 ㅇㅇ
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
	
	

	
	
	
	
	
	
//	@RequestMapping("InfoSquareSpecies.do")
//	public String InfoSquareSpecies(Model model) {
//		System.out.println("모든종류 백과사전 요청");
//		return "Tipboard/InfoSquareSpecies";
//	}
//		

}
