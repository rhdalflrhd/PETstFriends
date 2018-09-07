package controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.NaverShoppingService;



@Controller
public class ShoppingController {
	@Autowired
	private NaverShoppingService service;
	
	
	
	@RequestMapping("shoppingList.do")
	public ModelAndView shoppingList(@RequestParam(required=false) String keyword) {
		ModelAndView mav = new ModelAndView();
		if(keyword ==null) 
			keyword="수제간식";
		mav.addObject("sList", service.searchShoping(keyword, 10, 1,"sort"));
		mav.setViewName("shopping/shoppingList");
		return mav;
		
	}
	
}
