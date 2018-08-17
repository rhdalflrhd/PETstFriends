package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import javax.servlet.http.HttpServletRequest;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import dao.UserDao;
import model.Pet;
import model.User;
import service.UserService;
import service.UserServiceImpl;

@Controller
public class UserController {

	@Autowired
	UserServiceImpl userService;
	@Autowired
	private MailSender mailSender;

	public void setMailSender(MailSender mailSender) { // 이메일 인증 받기
		this.mailSender = mailSender;
	}

	@RequestMapping(value = "/emailAuth.do", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String emailAuth(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		String user_email = request.getParameter("user_email");
		String authNum = "";

		System.out.println(user_email);
		authNum = randomNum();
		// 가입승인에 사용될 인증키 난수 발생
		sendEmail(user_email, authNum);
		// 이메일전송
		String str = authNum;

		return str;
	}

	private String randomNum() {
		StringBuffer buffer = new StringBuffer();

		for (int i = 0; i <= 6; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}

		return buffer.toString();
	}

	public void sendEmail(String user_email, String authNum) {
		// 이메일 발송 메소드
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setSubject("회원가입 안내 .[이메일 제목]");
		mailMessage.setFrom("yoosohyun9933@gmail.com");
		mailMessage.setText("[이메일 내용]회원가입을 환영합니다. 인증번호를 확인해주세요. [ " + authNum + " ]");
		mailMessage.setTo(user_email);
		System.out.println(mailMessage);
		try {
			mailSender.send(mailMessage);

		} catch (Exception e) {
			System.out.println(e);
		}
	} // 이메일 인증 받기 끝

	@RequestMapping("userPwCheck.do")
	public String UserPwCheck(HttpSession session, Model model) {

		return "user/myInFo_PWCheck";

	}
	@RequestMapping("usermain.do")
	public String Useramin(HttpSession session, Model model) {

		return "user/main";

	}
	
	

	@RequestMapping("getUserId.do")
	public String UserUpdateForm(HttpSession session, Model model, String user_pass) {

		if (user_pass ==null) {
			HashMap<String, Object> params = userService.selectUser("yoo");
			model.addAttribute("params", userService.selectUser("yoo"));

			return "user/myInFo_Modification";
		} else
			return "user/myInFo_Modification";

	}
	
	
	

	@RequestMapping(value = "/petList.do") // 펫 리스트 보여주기
	@ResponseBody
	public void petList(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		System.out.println("da");
		resp.setContentType("text/html; charset=UTF-8");
		HashMap<String, Object> arr = userService.selectPetAll("yoo");
		Gson gson = new Gson();
		System.out.println(arr);

		String result = gson.toJson(userService.selectPetAll("yoo"));
		System.out.println(result);
		resp.getWriter().println(result);
	}

	@RequestMapping(value = "/nicknameCheck.do") // 닉네임 중복검사
	@ResponseBody
	public boolean getUserNn(HttpServletRequest req, HttpServletResponse resp) {

		resp.setContentType("text/html; charset=UTF-8");
		String user_nickname = req.getParameter("user_nickname");
		// System.out.println(user_nickname);
		boolean result = userService.getUserNn(user_nickname);
		// System.out.println(result);
		user_nickname = req.getParameter("user_nickname");
		// System.out.println(user_nickname);
		return result;

	}

	@RequestMapping(value = "/emailCheck.do")
	@ResponseBody // 이메일중복확인
	public boolean getUserEmail(HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("text/html; charset=UTF-8");
		String user_email = req.getParameter("user_email");
		// System.out.println(user_nickname);
		boolean result = userService.getUserEmail(user_email);
		// System.out.println(result);
		user_email = req.getParameter("user_email");
		// System.out.println(user_nickname);
		return result;

	}

	@RequestMapping(value = "/passCheck.do")
	@ResponseBody // 비밀번호 일치 검사
	public boolean getUserPw(HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("text/html; charset=UTF-8");
		String user_pass = req.getParameter("user_pass");
		boolean result = userService.getUserPass(user_pass);
		user_pass = req.getParameter("user_pass");
		return result;

	}

	@RequestMapping( value = "/updateUser.do") // 내정보수정에서 수정하기 누르면 업데이트!
@ResponseBody
	public String updateUserPet(@RequestParam HashMap<String, Object> params ,HttpServletResponse resp , HttpServletRequest req) {
		resp.setContentType("text/html; charset=UTF-8");
//User user = new User();
//user.setUser_nickname(req.getParameter("user_nickname"));
//user.setUser_pass(req.getParameter("user_pass"));
//user.setUser_email(req.getParameter("user_email"));
//user.setUser_phone(req.getParameter("user_phone"));
//int user_havePet = (Integer.parseInt(req.getParameter("user_havePet")));
//user.setUser_havePet(user_havePet);
//params.put("user", user);

		System.out.println(params);
		System.out.println("여기는 컨트롤로");
	   userService.updateUser(params);
	
String msg = "성공성공";
return msg;
	}
	

	
	

	@RequestMapping("deleteUserForm.do") // 탈퇴하기 누르면 비번확인폼으로이동
	public String userDeleteForm() {

		return "user/myInFo_MembershipDelete";
	}

	@RequestMapping("deleteUser.do") // 탈퇴- 비번일치할때 메인으로 보내기
	public String deleteUserPet(HttpSession session, String user_id) {

		// String pass = (String)session.getAttribute("user_pass");

		// if(pass.equals(user_pass)) {
		userService.deleteUserPet(user_id);

		return "user/main";

		// }else {
		// return "user/main";
		//
		//
		// }}

	}

}
