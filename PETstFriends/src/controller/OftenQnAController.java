package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.OftenQnA;
import service.OftenQnAService;

@Controller
public class OftenQnAController {
	
	@Autowired
	OftenQnAService oqService;
	
	@RequestMapping("showOftenQnAList.do")
	public String showOftenQnAList(Model model) {
		model.addAttribute("oqList", oqService.showOftenList());
		return "notice/customerCenter_Q";
	}
	@RequestMapping("showOftenQnABoard.do")
	public String showOftenQnABoard(@RequestParam int oftenQnA_boardno, Model model) {
		model.addAttribute("oftenQnA", oqService.showOftenQnABoard(oftenQnA_boardno));
		return "notice/customerCenter_QBoard";
	}
	@RequestMapping("modifyOftenQnABoardForm.do")
	public String modifyOftenQnABoardForm(@RequestParam int oftenQnA_boardno, Model model) {
		model.addAttribute("oftenQnA", oqService.showOftenQnABoard(oftenQnA_boardno));
		return "notice/customerCenter_showOftenQnABoardForm";
	}
	@RequestMapping("modifyOftenQnABoard.do")
	public String modifyOftenQnABoard(@RequestParam OftenQnA oftenQnA, Model model) {
		oqService.updateOftenBoard(oftenQnA);
		model.addAttribute("oftenQnA_boardno", oftenQnA.getOftenQnA_boardno());
		return "redirect:showOftenQnABoard.do";
	}
	@RequestMapping("writeOftenQnABoardForm.do")
	public String writeOftenQnABoardForm() {
		return "notice/customerCenter_writeQForm";
	}
	@RequestMapping("writeOftenQnABoard.do")
	public String writeOftenQnABoard(@RequestParam OftenQnA oftenQnA, Model model, HttpSession session) {
		oftenQnA.setOftenQnA_adminId((String) session.getAttribute("user_id"));
		oqService.writeOftenBoard(oftenQnA);
		model.addAttribute("oftenQnA_boardno", oftenQnA.getOftenQnA_boardno());
		return "redirect:showOftenQnABoard.do";
	}
	@RequestMapping("deleteOftenQnABoard.do")
	public String deleteOftenQnABoard(@RequestParam int oftenQnA_boardno) {
		oqService.deleteOftenQnABoard(oftenQnA_boardno);
		return "redirect:showOftenQnAList.do";
	}
	
}
