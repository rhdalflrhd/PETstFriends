package controller;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.FreeBoard;
import service.FreeBoardServiceImpl;

@Controller
public class FreeBoardController {
	
	@Autowired 
	FreeBoardServiceImpl freeboardService;
	
	

	
}

