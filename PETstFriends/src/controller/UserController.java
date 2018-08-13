package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import service.UserServiceImpl;


@Controller
public class UserController {

	@Autowired
	UserServiceImpl userService;

	@RequestMapping(value = "/getUserNn.do")
	@ResponseBody
	public boolean getUserNn(HttpServletRequest req, HttpServletResponse resp) {

		resp.setContentType("text/html; charset=UTF-8");
		String user_nickname = req.getParameter("user_nickname");
		boolean result = userService.getUserbyNn(user_nickname);
		user_nickname = req.getParameter("user_nickname");
		return result;

	}

	
	@RequestMapping("/terms_use.do") //회원 동의약관
    public String termsUse(HttpServletRequest request, HttpSession session, Model model) {
    	if(session.getAttribute("naverUser") != null) {
    		model.addAttribute("type", "naver");
    	}
    	return "naverLogin/terms_use"; 		
    }

	@RequestMapping("/main.do") //회원 동의약관
    public String termsUse() {
    	return "main"; 		
    }
}

	


