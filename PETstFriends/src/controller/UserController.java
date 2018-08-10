package controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.UserServiceImpl;

@Controller
public class UserController {
	
	@Autowired
	UserServiceImpl userService;
	
	@RequestMapping(value="/getUserNn.do")
	@ResponseBody
	public boolean getUserNn(HttpServletRequest req, HttpServletResponse resp) {
		
		resp.setContentType("text/html; charset=UTF-8");
		String user_nickname = req.getParameter("user_nickname");
		boolean result = userService.getUserbyNn(user_nickname);
		user_nickname = req.getParameter("user_nickname");
		return result;
		
	}
	@RequestMapping(value="/joinUser.do")
	@ResponseBody
	public void joinUser(HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("text/html; charset=UTF-8");
		System.out.println("옴");
		req.getParameter(arg0)
		
	}
	
	
	
}

	


