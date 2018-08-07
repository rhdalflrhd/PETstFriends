package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import service.TipBoardEncycService;
import service.TipBoardService;
import service.TipBoardServiceimpl;

@Controller
public class TipBoardController {

	@Autowired
	private TipBoardService tipService;
	
	@Autowired
	private TipBoardEncycService EncycService;
}
