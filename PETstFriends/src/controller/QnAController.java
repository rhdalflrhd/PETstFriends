package controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import model.QnA;
import service.IQnAService;
import service.QnAService;

@Controller
public class QnAController {

	@Autowired
	IQnAService qnAService;
	
//	@RequestMapping("writeQnABoard.do")
//	public String writeQnABoard() {
//		System.out.println("왔다.");
//		QnA qnA = new QnA();
//		qnA.setQnA_userId("dd");
//		qnA.setQnA_boardname(1);
//		qnA.setQnA_content("아아아");
//		qnA.setQnA_title("제목");
////		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd:hh:mm:ss");
//		Date today = new Date();
//		qnA.setQnA_writeDate(today);
//		qnAService.wrtieQnABoard(qnA);
//		return "qna/aa";
//		
//		
//	}
	@RequestMapping("aa.do")
	public String aa() {
		
		return "qna/aa";
		
		
	}
	
}
