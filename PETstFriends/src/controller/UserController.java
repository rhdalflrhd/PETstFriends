package controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import dao.UserDao;
import service.UserServiceImpl;

@Controller
public class UserController {

	@Autowired
	private UserServiceImpl userService;

	private String contextPath;
	private String reqUri;
	
	@RequestMapping(value = "/idCheck.do")
	@ResponseBody
	public boolean getUserId(HttpServletRequest req, HttpServletResponse resp) {
		
		resp.setContentType("text/html; charset=UTF-8");
		String user_id = req.getParameter("user_id");
		boolean result = userService.getUserbyId(user_id);
		user_id = req.getParameter("user_id");
		return result;
	}
	
	@RequestMapping(value = "/NnCheck.do")
	@ResponseBody
	public boolean getUserNn(HttpServletRequest req, HttpServletResponse resp) {
		
		resp.setContentType("text/html; charset=UTF-8");
		String user_nickname = req.getParameter("user_nickname");
		System.out.println("ddd");
		boolean result1 = userService.getUserbyNn(user_nickname);
		user_nickname = req.getParameter("user_nickname");
		return result1;
	}
	
	

	@RequestMapping("joinUserForm.do")
	public String joinForm(Model model, @RequestParam(required = false) String msg) {
		if (msg != null)
			model.addAttribute("msg", msg);
		System.out.println("tes1");
		return "joinUserForm";
	}

	@RequestMapping(value = "joinUser.do", method = RequestMethod.POST)
	public String join(@RequestParam HashMap<String, Object> params, Model model) {
		System.out.println("dddjo");
		if (userService.joinUser(params)) {
			return "redirect:loginForm.do";
		} else {
			model.addAttribute("msg", "가입실패");
			return "redirect:joinUserForm.do";
		}

	}


	}

