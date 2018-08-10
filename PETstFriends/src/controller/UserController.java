package controller;

import java.io.IOException;
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

import model.User;
import service.UserService;
import service.UserServiceImpl;

@Controller
public class UserController {
	
	
	@Autowired
	UserServiceImpl userService;
	
//	@RequestMapping("getUserId.do")   // 비번 일치하면 내정보수정폼으로감
//	public String UserUpdateForm(	HttpSession session, Model model ) { 
//		System.out.println("하이");
//	 User u = new User();
//		String user_pass = (String)session.getAttribute("user_pass");
//      int user_no = (Integer)session.getAttribute("user_no");
//      
//      if (user_no == u.getUser_no() && user_pass.equals(u.getUser_pass())) {
//    		model.addAttribute("params", userService.selectUserPet(user_no));
//            return "myInFo_Modification";
//	}
//        else 
//        	model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
//    	 return  "myInFo_PWCheck";
//	
//	}
	@RequestMapping("loginForm.do")
	public String loginForm() {
		return "user/loginForm";
	}
	@RequestMapping("login.do")
	public String login(HttpSession session) {
		String userid = (String)session.getAttribute("user_id");
		String pss = (String)session.getAttribute("user_pass");
		
//		if (userid.equals(userService.selectUser(userid)) || pss.equals(userService.selectUser(userid).getUser_pass())) {
			if (userid != null) {
			session.setAttribute("userid", userid);
			return "user/myInFo_PWCheck";
	}
			else
			return "user/myInFo_PWCheck";
	}


	
	
	
	
	@RequestMapping("getUserId.do")  
	public String UserUpdateForm(	HttpSession session, Model model ) { 
		
		String userid = (String)session.getAttribute("user_id");
		String pass = (String)session.getAttribute("user_pass");
		
		if (pass !=null) {
			HashMap<String, Object> params = userService.selectUserPet(userid);
		model.addAttribute("params", userService.selectUserPet(userid) );
			return "user/myInFo_Modification";
		}
		else 
		return "user/myInFo_Modification";
		
	}
	
	@RequestMapping(value="/nicknameCheck.do")
	@ResponseBody
	public boolean getUserNn(HttpServletRequest req, HttpServletResponse resp) {
		
		resp.setContentType("text/html; charset=UTF-8");
		String user_nickname = req.getParameter("user_nickname");
//		System.out.println(user_nickname);
		boolean result = userService.getUserNn(user_nickname);
//		System.out.println(result);
		user_nickname = req.getParameter("user_nickname");
//		System.out.println(user_nickname);
		return result;
		
	}
	

	@RequestMapping(value = "/emailCheck.do")
	@ResponseBody                                                        // 이메일중복확인
	public boolean getUserEmail(HttpServletRequest req, HttpServletResponse resp)  {
		resp.setContentType("text/html; charset=UTF-8");
		String user_email= req.getParameter("user_email");
//		System.out.println(user_nickname);
		boolean result = userService.getUserEmail(user_email);
//		System.out.println(result);
		user_email = req.getParameter("user_email");
//		System.out.println(user_nickname);
		return result;
		
	}
	
	
	
	
	@RequestMapping("userPetUpdate.do")  // 내정보수정에서 수정하기 누르면 업데이트!
	public String updateUserPet(@RequestParam HashMap<String, Object> params, HttpSession session, Model model) {

		if(params != null) {
			model.addAttribute("params", userService.updateUserPet(params));

	}
	
		userService.updateUserPet(params);

		return "user/main";
	}
	
	@RequestMapping("deleteUserForm.do")  // 탈퇴하기 누르면 비번확인폼으로이동 
	public String userDeleteForm( ) {

		return "user/myInFo_MembershipDelete";
	}
	
	
	
	@RequestMapping("deleteUser.do")   // 탈퇴- 비번일치할때 메인으로 보내기 
	public String deleteUserPet(HttpSession session, String user_id ){

//		 String pass = (String)session.getAttribute("user_pass");
		
//		 if(pass.equals(user_pass)) {
	userService.deleteUserPet(user_id);	 
	
		return "user/main";
			 
			
//			}else {
//			return "user/main";
//
//		
//			}}

	}

	

}
