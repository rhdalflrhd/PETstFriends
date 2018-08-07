package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.TipBoardEncycService;
import service.TipBoardService;

@Controller
public class TipBoardController {

	@Autowired
	private TipBoardService tipService;
	
	@Autowired
	private TipBoardEncycService EncycService;
	
	
	@RequestMapping("dogInfoSquareSpecies.tc")
	public String main(Model model, HttpSession session) {
			System.out.println("여기로는 오나");
//			model.addAttribute("EncycList", EncService.searchEncyc("(사)한국애견협회 애견정보", 70, 25));
//			model.addAttribute("EncycList1", EncycService.searchEncyc("FCI 스탠다드", 100, 1));
//			model.addAttribute("EncycList2", EncService.searchEncyc("FCI 스탠다드", 100, 100));
//			model.addAttribute("EncycList3", EncService.searchEncyc("FCI 스탠다드", 100, 200));
//			model.addAttribute("EncycList4", EncService.searchEncyc("FCI 스탠다드", 45, 300));
//			model.addAttribute("EncycList1", EncService.searchEncyc("다시 쓰는 고양이 사전", 70, 1));
//			model.addAttribute("EncycList1", EncService.searchEncyc("다시 쓰는 개 사전" +"견종 자세히 보기", 70, 1)); 
//			model.addAttribute("EncycList5", EncycService.searchEncyc("식육목 고양이과의 포유류",42,12));
			//이렇게하면 흰코사향고양이와 아비시니아 두종류가 빠짐. 파싱결과에서 호랑이와 시라소니 제외하는거 알아볼것
		model.addAttribute("msg", "메시지가 제대로 가나");
			return "dogInfoSquareSpecies";
		
	}
	
	
	
}
