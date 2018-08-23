package controller;

import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.google.gson.Gson;

import dao.UserDao;
import model.Board;
import model.TipBoard;
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
	
	@RequestMapping("index.do")
	public void index() {
	}

	@RequestMapping("send.do")
	public void send() {
	}	
	
	
	
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
	
	//---------------------------강아지 꿀TIP게시판		@RequestMapping(value= "dogTipBoardList.do", method=RequestMethod.GET)
	
	// 강아지 TIp정보 게시판목록
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
	
	// 강아지 TIp정보 게시판 글쓰기 폼
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
	
	
	// 강아지 TIp정보 게시판 글쓰기 실행
	@RequestMapping("DogWriteTipBoard.do")		
	public String DogWriteTipBoardC(HttpSession session, @RequestParam HashMap<String, Object> params, @RequestParam("tipBoard_contentPic") MultipartFile contentPic) {
		System.out.println("들어옴");
		System.out.println(contentPic);
		
		TipBoard dtboard = new TipBoard();
//		String user_id = (String)session.getAttribute("user_id");
		String WriteUserid = "testID";  		//지금은 USer랑 연결안했으니까 임의의 ID 지정하겠음
		dtboard.setTipBoard_boardname(7);		// 강아지 TIP게시판 보드네임은 숫자 7로 구분함 ( 팁개=7, 팁고양이=8 팁토끼=9)
//												보드넘버는 오토인크리트먼트, 작성일도 curdate로 넣을거임
		dtboard.setTipBoard_userId(WriteUserid);
//      										dtboard.setTipBoard_nickname(uDao.selectUserId(WriteUserid));uDao
		dtboard.setTipBoard_nickname("test");	//지금은 USer랑 연결안했으니까 임의의 nickname 지정하겠음
		dtboard.setTipBoard_title((String) params.get("tipBoard_title"));
		dtboard.setTipBoard_file((String) params.get("tipBoard_file"));
		dtboard.setTipBoard_content((String) params.get("tipBoard_content"));	
		//아직 조회수 없음
		dtboard.setTipBoard_YoutubeUrl((String) params.get("tipBoard_YoutubeUrl"));
		//아직 좋아요 수 없음
	
		tipService.writeTipBoardS(dtboard, contentPic);		
//		return "Tipboard/DogReadTipBoard.do?TipBoard_boardno=" + dtBoard.getTipBoard_boardno();
		return "Tipboard/dogTipBoardList";//지금은 이렇게 설정.
	}

	// 강아지 TIp정보 게시판 글 한개 읽기.
	@RequestMapping("DogReadTipBoard.do")
	public String DogReadTipBoardC(Model model, int boardname, int boardno, HttpSession session) {
		System.out.println(boardname);
		System.out.println(boardno);
		tipService.ReadTipBoardS(boardname, boardno);
		TipBoard tb = tipService.getBoardS(boardname, boardno);
		System.out.println(tb);
		System.out.println(tb.getTipBoard_nickname());
//		session.setAttribute("user_id", "테스트용");
		session.setAttribute("user_id", "testID");
		String user_idCheck = (String) session.getAttribute("user_id");
		System.out.println(user_idCheck);
		model.addAttribute("user_idCheck", user_idCheck);
		model.addAttribute("tipboard", tb);

		return "Tipboard/DogReadTipBoard";
	}
	
	// 강아지 TIp정보 게시판 글 한 개 수정폼 제공
	@RequestMapping("DogModifyFormTipBoard.do")
	public String DogModifyFormTipBoardC(Model model, int boardname, int boardno,HttpSession session) {
		System.out.println("강아지 꿀TIp 게시글 수정 컨트롤러 들어옴");
		TipBoard tb = tipService.getBoardS(boardname, boardno);
		model.addAttribute("tipboard", tb);
		return "Tipboard/DogModifyFormTipBoard";
	}	
	
	// 강아지 TIp정보 게시판 글 한 개 수정 실행!
	@RequestMapping("DogModifyTipBoard.do")
	public String ModifyTipBoardC(HttpSession session, @RequestParam HashMap<String, Object> params) {
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
	
	
//	@RequestMapping("InfoSquareSpecies.do")
//	public String InfoSquareSpecies(Model model) {
//		System.out.println("모든종류 백과사전 요청");
//		return "Tipboard/InfoSquareSpecies";
//	}
//		

}
