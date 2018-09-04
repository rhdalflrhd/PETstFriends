package controller;

import java.lang.reflect.Method;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		return "qna/customerCenter_Q";
	}
//	@RequestMapping("showOftenQnA.do")
//	public String showOftenQnABoard(@RequestParam int oftenQnA_boardno, Model model) {
//		model.addAttribute("oftenQnA", oqService.showOftenQnABoard(oftenQnA_boardno));
//		return "qna/customerCenter_QBoard";
//	}
	@RequestMapping("modifyOftenQnAForm.do")
	public String modifyOftenQnABoardForm(@RequestParam int oftenQnA_boardno, Model model) {
		model.addAttribute("oftenQnA", oqService.showOftenQnABoard(oftenQnA_boardno));
		return "qna/customerCenter_modifyQForm";
	}
	@RequestMapping(value="modifyOftenQnA.do", method = RequestMethod.POST)
	public String modifyOftenQnABoard(@RequestParam HashMap<String, Object> params) {
		OftenQnA oftenQnA = new OftenQnA();
		oftenQnA.setOftenQnA_title(String.valueOf(params.get("oftenQnA_title")));
		oftenQnA.setOftenQnA_content(String.valueOf(params.get("editor")));
		oftenQnA.setOftenQnA_boardno(Integer.parseInt(String.valueOf(params.get("oftenQnA_boardno"))));
		oqService.updateOftenBoard(oftenQnA);
		return "redirect:showOftenQnAList.do";
	}
	@RequestMapping("writeOftenQnAForm.do")
	public String writeOftenQnABoardForm() {
		return "qna/customerCenter_writeQForm";
	}
	@RequestMapping(value="writeOftenQnA.do", method = RequestMethod.POST)
	public String writeOftenQnABoard(@RequestParam String oftenQnA_title,
			@RequestParam String editor,
			Model model, HttpSession session) {
		OftenQnA oftenQnA = new OftenQnA();
		oftenQnA.setOftenQnA_adminId((String) session.getAttribute("user_id"));
		oftenQnA.setOftenQnA_content(editor);
		oftenQnA.setOftenQnA_title(oftenQnA_title);
		oqService.writeOftenBoard(oftenQnA);
		model.addAttribute("oftenQnA_boardno", oftenQnA.getOftenQnA_boardno());
		return "redirect:showOftenQnAList.do";
	}
	@RequestMapping("deleteOftenQnA.do")
	public String deleteOftenQnABoard(@RequestParam int oftenQnA_boardno) {
		System.out.println("옴");
		oqService.deleteOftenQnABoard(oftenQnA_boardno);
		return "redirect:showOftenQnAList.do";
	}
	
}