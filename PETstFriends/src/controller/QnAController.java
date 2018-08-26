package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.QnA;
import service.QnAService;
import service.QnAServiceImpl;

@Controller
public class QnAController {

	@Autowired
	QnAService qService;

	@RequestMapping("writeQnAForm.do")
	public String writeQnABoard() {
		return "qna/customerCenter_Ask";
	}

	@RequestMapping("writeQnA.do")
	public String writeQnABoard(@RequestParam HashMap<String, Object> params, HttpSession session, Model model) {
		QnA qnA = new QnA();
		qnA.setQnA_boardname(Integer.parseInt((String)params.get("qnA_boardname")));
		qnA.setQnA_content((String)params.get("qnA_content"));
		qnA.setQnA_title((String)params.get("qnA_title"));
		String user_id = (String) session.getAttribute("user_id");
		qnA.setQnA_userId(user_id);
		qService.writeQnABoard(qnA);
		return "qna/customerCenter_Ask";//내가쓴 문의글로 바꾸기????????
	}

	@RequestMapping("showQnAList.do")
	public ModelAndView showQnAList(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int numb, @RequestParam(defaultValue = "0") int boardname,
			@RequestParam(defaultValue = "0") int type, @RequestParam(required = false) String keyword) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("page", page);
		params.put("numb", numb);
		params.put("boardname", boardname);
		params.put("type", type);
		if (type == 1) {
			params.put("qnA_title", keyword);
		} else if (type == 2) {
			params.put("qnA_content", keyword);
		} else if (type == 3) {
			params.put("qnA_title", keyword);
			params.put("qnA_content", keyword);
		} else if (type == 4) {
			params.put("qnA_userid", keyword);
		}
		params.put("keyword", keyword);

		HashMap<String, Object> result = qService.showQnAList(params);
		mav.addAllObjects(params);
		mav.addAllObjects(result);
		mav.setViewName("qna/customerCenter_AskAdmin");
		return mav;
	}
	
	@RequestMapping("showQnABoard.do")
	public ModelAndView showQnABoard(@RequestParam HashMap<String, Object> params) {
		ModelAndView mav = new ModelAndView();
		System.out.println(params.get("boardname"));
		int qnA_boardno = Integer.parseInt(String.valueOf(params.get("qnA_boardno")));
		params.put("qnA", qService.showQnABoard(qnA_boardno));
		mav.addAllObjects(params);
		mav.setViewName("qna/customerCeneter_showQnABoard");
		return mav;
	}

	@RequestMapping("deleteQnABoard.do")
	public String deleteQnABoard(@RequestParam int qnA_boardno) {
		qService.deleteQnABoard(qnA_boardno);
		return "redirect:showQnAList.do";
	}
	
	@RequestMapping("writeQnAComment")
	@ResponseBody
	public int writeQnAComment(@RequestParam int qnA_boardno
			,@RequestParam(required=false) String qnA_reply, HttpSession session) {
		QnA qnA = new QnA();
		qnA.setQnA_adminId((String) session.getAttribute("user_id"));
		qnA.setQnA_reply(qnA_reply);
		qnA.setQnA_boardno(qnA_boardno);
		return qService.writeQnAComment(qnA);
	}
}
