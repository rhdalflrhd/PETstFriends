package controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.UserService;
import service.UserServiceImpl;

@Controller
public class UserController {
	
	
	@Autowired
	UserServiceImpl userService;
	
	@RequestMapping("getUserId.uc")   // 비번 일치하면 내정보수정폼으로감
	public String UserUpdateForm(	HttpSession session, Model model) { 
		System.out.println("하이");
	 String user_pass = (String)session.getAttribute("user_pass");
      int user_no = (Integer)session.getAttribute("user_no");
      if (user_pass.equals(userService.infoForUpdate(user_no).getUser_pass())) {
    		model.addAttribute("User", userService.infoForUpdate(user_no));
            return "user/myINFO_Modifcation";
	}
        else 
        	model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
    	 return  "MyINFO_PWCheck";
	
	}
	
	
	
	@RequestMapping("UserPetUpdate.uc")  // 내정보수정에서 수정하기 누르면 업데이트!
	public String userUpdate(@RequestParam HashMap<String, Object> params, HttpSession session, Model model) {

		if(params != null) {
			model.addAttribute("params", userService.updateUser(params));
			model.addAttribute("params" , userService.updatePet(params));
	}
		return "user/myINFO_Modifcation";
	}
	
	@RequestMapping("deleteUser.uc")  // 탈퇴하기 누르면 비번확인폼으로이동 
	public String userDeleteForm( ) {

		return "user/myINFO_MembershipDelete";
	}
	
	
	
	@RequestMapping("")   // 탈퇴- 비번일치할때 메인으로 보내기 
	public String deleteUserForm(HttpSession session ,String user_id){
		String userid = (String)session.getAttribute("user_id");
		 int user_no = (Integer)session.getAttribute("user_no");
	String pass = (String)session.getAttribute("user_pass");
	   if (pass.equals(userService.infoForUpdate(user_no).getUser_pass())) {
		   userService.deleteUser(user_id);
	   }
		return "user/main";

		
	}



	

}
