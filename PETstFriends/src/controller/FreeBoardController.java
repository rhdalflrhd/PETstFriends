package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import service.FreeBoardService;

@Controller
public class FreeBoardController {
	
	@Autowired 
	FreeBoardService freeboardService;
	
	

	
}

