package controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



import dao.UserDao;
import model.User;
import service.UserServiceImpl;

@Controller
public class UserController {

	@Autowired
	private UserServiceImpl userService;
	
	@Autowired
	private MailSender mailSender;

	private String contextPath;
	private String reqUri;
	
	
	@RequestMapping(value = "/idCheck.do")
	@ResponseBody
	public boolean getUserId(HttpServletRequest req, HttpServletResponse resp) {
		
		resp.setContentType("text/html; charset=UTF-8");
		String user_id = req.getParameter("user_id");
		boolean result = userService.getUserbyId(user_id);
		return result;
	}
	
	@RequestMapping(value = "/NnCheck.do")
	@ResponseBody
	public boolean getUserNn(HttpServletRequest req, HttpServletResponse resp) {
		
		resp.setContentType("text/html; charset=UTF-8");
		String user_nickname = req.getParameter("user_nickname");
		boolean result1 = userService.getUserbyNn(user_nickname);
		
		return result1;
	}
	
	

	@RequestMapping(value = "/joinUserForm.do")
	public String joinForm() {
	
		System.out.println("조인유저폼.두");
		return "joinUserForm";
	
	}

	@RequestMapping(value = "/joinUser.do", method = RequestMethod.POST)
	@ResponseBody
	public String join(@RequestParam HashMap<String, Object> params,HttpServletResponse resp) {
		resp.setContentType("text/html; charset=UTF-8");
		System.out.println("조인유저.두1");
		userService.joinUser(params);
		System.out.println("조인유저.두2");
		String msg ="dd";
		return msg;
	
	
	}

	//----------------------------------------------------------------------


	public void setMailSender(MailSender mailSender) {    // 이메일 인증 받기 
	    this.mailSender = mailSender;
	}
	
		
		@RequestMapping(value="/emailAuth.do" , produces="text/plain;charset=utf-8")
		@ResponseBody
		public String emailAuth(HttpServletRequest request) {
		    ModelAndView mav = new ModelAndView();
		        
		    String user_email = request.getParameter("user_email");
		    String authNum = "";
		        
		    System.out.println(user_email);
		    authNum = randomNum();
		    //가입승인에 사용될 인증키 난수 발생    
		    sendEmail(user_email, authNum);
		    //이메일전송
		    String str = authNum;
		    
	        
		    return str;
		}
		    
		private String randomNum() {
		    StringBuffer buffer = new StringBuffer();
		        
		    for( int i = 0 ; i <= 6 ; i++) {
		        int n = (int)(Math.random()*10);
		        buffer.append(n);
		    }
		        
		    return buffer.toString();
		}
		 
		public void sendEmail(String user_email , String authNum ) {
		    //이메일 발송 메소드
		    SimpleMailMessage mailMessage = new SimpleMailMessage();
		    mailMessage.setSubject("회원가입 안내 .[이메일 제목]");
		    mailMessage.setFrom("ok7sw7@gmail.com");
		    mailMessage.setText("[이메일 내용]회원가입을 환영합니다. 인증번호를 확인해주세요. [ "+authNum+" ]");
		    mailMessage.setTo(user_email);
		    System.out.println(mailMessage);
		    try {
		        mailSender.send(mailMessage);
		        
		    } catch (Exception e) {
		        System.out.println(e);
		    }
		}   //이메일 인증 받기 끝 
		
		@RequestMapping(value = "/emailCheck.do")
		@ResponseBody                                                        // 이메일중복확인
		public boolean getUserEmail(HttpServletRequest req, HttpServletResponse resp)  {
			resp.setContentType("text/html; charset=UTF-8");
			String user_email= req.getParameter("user_email");
//			System.out.println(user_nickname);
			boolean result = userService.getUserbyEmail(user_email);
//			System.out.println(result);
			user_email = req.getParameter("user_email");
//			System.out.println(user_nickname);
			return result;
			
		}
		
		//----------------------------------------------------------
		//로그인
		@RequestMapping("/loginForm.do")
		public String loginForm() {
		
			System.out.println("로그인폼.두");
			return "loginForm";
		}
		
		
		@RequestMapping(value = "/login.do" ,method = RequestMethod.GET)
		@ResponseBody
		public boolean login(String user_id, String user_pass) {
			System.out.println("로그인.두");
		
			if(userService.loginUser(user_id, user_pass)) {
			return true;
			}
			else {
				return false;
			}
		}


	
	
	
	
	
	
	
	

	}//컨트롤러

