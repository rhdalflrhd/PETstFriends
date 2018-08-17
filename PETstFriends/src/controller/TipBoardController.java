package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

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
	
	public static Gson gson = new Gson();		
	// Spring MVC 컨트롤러에서 사용할 수 있는 반환유형의 종류

	// 데이터와 페이지 정보가 둘 다 있는 경우	= ModelAndView
	// 데이터에 대한 정보만 있는 경우   		=  Model or Map(해쉬맵. 키값과 밸류값으로 넘어감)
	// 페이지에 대한 정보만 있는경우    		=   String
	// 둘 다 없을 때 						 =     void
	
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


	//18.08.08 지금은 이렇게 세개의 페이지로 나누었으나,
	//헤더에서 버튼을 누르면 값(키워드값)이 보내져서 페이지의 중앙부분의 테이블만 바꿀수있고,
	//또 각각의 키워드에 대한 검색 출력 total개수가 달라도 동일한 페이징 목록처리가 가능하고 검색도 가능한걸 구현한다면
	//하나로 합치기로 한다. (추후)
	
//	@RequestMapping(value= "dogInfoSquareSpecies.do", method=RequestMethod.GET)		
	@RequestMapping("dogInfoSquareSpecies.do")
	public String dogInfoSquareSpecies(Model model) {
		System.out.println("강아지 백과사전 요청");
		model.addAttribute("DogEncycList1", EncycService.searchEncyc("FCI 스탠다드", 100, 1));
		model.addAttribute("DogEncycList2", EncycService.searchEncyc("FCI 스탠다드", 100, 100));
		model.addAttribute("DogEncycList3", EncycService.searchEncyc("FCI 스탠다드", 100, 200));
		model.addAttribute("DogEncycList4", EncycService.searchEncyc("FCI 스탠다드", 45, 300));		
		return "Tipboard/dogInfoSquareSpecies";
	}

//	@RequestMapping(value= "dogInfoSquareSpecies.do", method=RequestMethod.GET)		
	@RequestMapping("dogTipBoardList.do") // 강아지 TIp정보 게시판목록
	public String dogTipBoardList(Model model) {
		System.out.println("강아지 꿀 Tip정보 요청");
		model.addAttribute("DogEncycList1", EncycService.searchEncyc("다시 쓰는 개 사전", 46, 3));	
		//8월 17일 현재까지는 naver api에서 끌고온 정보만 출력되게 해놨음.
		//유저가 올린것도 같이 출력되게 이후에 시행할 예정
		return "Tipboard/dogTipBoardList";
	}	
	
	@RequestMapping("DogWriteTipBoardForm.do")// 강아지 TIp정보 게시판 글쓰기 폼
	public String WriteTipBoardFormC() {
		return "Tipboard/DogWriteTipBoardForm";
	}
	
	@RequestMapping("DogWriteTipBoard.do")// 강아지 TIp정보 게시판 글쓰기실행
	public String DogWriteTipBoardC(HttpSession session,TipBoard dtBoard, @RequestParam("TipBoard_contentPic") MultipartFile TipBoard_contentPic) {
//		String id = (String)session.getAttribute("TipBoard_userId");
		tipService.writeTipBoardS(dtBoard, TipBoard_contentPic);		
		return "Tipboard/DogReadTipBoard.do?TipBoard_boardno=" + dtBoard.getTipBoard_boardno();
	}
	
	@RequestMapping("CatInfoSquareSpecies.do")
	public String CatInfoSquareSpecies(Model model) {
		System.out.println("고양이 백과사전 요청");
		model.addAttribute("CatEncycList", EncycService.searchEncyc("식육목 고양이과의 포유류",43,12));
		//이렇게하면 흰코사향고양이와 아비시니아 두종류가 빠짐. 파싱결과에서 호랑이와 시라소니 제외하는거 알아볼것
		return "Tipboard/CatInfoSquareSpecies";
	}
	
	//https://terms.naver.com/search.nhn?query=%ED%86%A0%EB%81%BC%EB%AA%A9+%ED%86%A0%EB%81%BC%EA%B3%BC%EC%9D%98+%ED%8F%AC%EC%9C%A0%EB%A5%98&dicType=1&cid=40942&categoryId=32622	
	@RequestMapping("RabbitInfoSquareSpecies.do")
	public String RabbitInfoSquareSpecies(Model model) {
		System.out.println("토끼 백과사전 요청!");
//		model.addAttribute("RabbitEncycList1", EncycService.searchEncyc("토끼목 토끼과의 포유류", 30, 2));
		model.addAttribute("RabbitEncycList1", EncycService.searchEncyc("토끼목 토끼과의 포유류", 91, 2));
		model.addAttribute("RabbitEncycList2", EncycService.searchEncyc("토끼목 토끼과의 포유류", 100, 101));
//		model.addAttribute("RabbitEncycList2", EncycService.searchEncyc("+토끼목 +토끼과 -향토문화전자대전 -반달가슴곰 -금강산동물상의일반적특징 -한국민족문화대백과", 100, 100));	
//		model.addAttribute("RabbitEncycList2", EncycService.searchEncyc("토끼목의 토끼과 -한국민족문화대백과 -향토문화전자대전 -사냥의방법과도구", 100, 100));	
//		model.addAttribute("RabbitEncycList2", EncycService.searchEncyc("토끼목의 토끼과 -사냥의방법과도구 -한국민족문화대백과 -향토문화전자대전 -토끼기르기-위키백과", 100, 1));		
		return "Tipboard/RabbitInfoSquareSpecies";
	}
	
	@RequestMapping("InfoSquareSpecies.do")
	public String InfoSquareSpecies(Model model) {
		System.out.println("모든종류 백과사전 요청");
		return "Tipboard/InfoSquareSpecies";
	}
		
//	@RequestMapping(value= "Species.do", method=RequestMethod.GET)
//	public void RabbitTest(HttpServletResponse response, HttpServletRequest req) {
//		System.out.println("백과사전 요청들어옴");
//		response.setContentType("application/json");
//		response.setCharacterEncoding("UTF-8");	
//		String query = req.getParameter("query");
//		System.out.println(query);
//		
//		int display = Integer.parseInt(req.getParameter("display"));
//		int start = Integer.parseInt(req.getParameter("start"));		
//		
//		String EncResult = EncycService.searchEncyc(query, display, start);
//		String EncResultGjson = gson.toJson(EncResult);		
//		
//	System.out.println(EncResult);
//		
//		try {
////			response.getWriter().println(EncResult);
//			response.getWriter().println(EncResultGjson);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		System.out.println(EncResultGjson);	
//		System.out.println("제이슨 데이터 전송완료");
//
//	}
}
