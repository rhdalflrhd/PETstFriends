package controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping("showUserList.do")
	public ModelAndView showUserList(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int numb,
			@RequestParam(required=false) String keyword) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("page", page);
		params.put("numb", numb);
		if(keyword!=null)
			params.put("keyword", keyword);
		HashMap<String, Object> result = userService.showUserList(params);
		mav.addAllObjects(params);
		mav.addAllObjects(result);
		mav.setViewName("user/customerCenter_MemberHandling");
		return mav;
		
	}
	
	@RequestMapping("stopUser.do")
	public int stopUser(String user_id,
			@RequestParam(defaultValue = "10") int stopdate) {
		return userService.stopUser(user_id, stopdate);
	}
	@RequestMapping("stopCancelUser.do")
	public int stopCancelUser(String user_id,
			@RequestParam(defaultValue = "1") int stopdate) {
		return userService.stopUser(user_id, stopdate);
	}
}
