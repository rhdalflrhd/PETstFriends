package controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.UserService;
import service.UserServiceImpl;

@Controller
public class UserController {
	
	
	@Autowired
	UserServiceImpl userService;


@RequestMapping("joinUserForm.do")
public String joinForm(Model model, @RequestParam(required=false) String msg) {
	if(msg != null)
		model.addAttribute("msg", msg);
	
	return "joinUserForm";
}


@RequestMapping("joinUser.do")
public String join(@RequestParam HashMap<String, Object> params,Model model) {
	if(userService.joinUser(params)) {
		return"redirect:loginForm.do";}
	else {
		model.addAttribute("msg", "가입실패");
	return "redirect:joinForm.do";
	}

}








}	


