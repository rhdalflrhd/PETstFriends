package controller;
 
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

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

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import model.NaverUser;
import model.Pet;
import model.User;
import naver.NaverLoginBO;
import naver.Utils;
import service.UserService;
 
@Controller
public class NaverLoginTutorial {
 
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	@Autowired
	private UserService userService;
	
	/* NaverLoginBO */
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO){
		this.naverLoginBO = naverLoginBO;
	}
  
    @RequestMapping(value="/loginForm.do")
    public ModelAndView login(HttpSession session, Model model) {
 
        /* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        /* 생성한 인증 URL을 View로 전달 */
        return new ModelAndView("user/loginForm", "url", naverAuthUrl);
    }
    
    @RequestMapping("/callback.do")//네아로 login.do와 같음
	public String callback(@RequestParam String code, @RequestParam String state, HttpSession session, Model model) throws IOException {
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		NaverUser naverUser = naverLoginBO.getUserProfile(oauthToken);
		session.setAttribute("naverUser", naverUser);
		String user_id = naverUser.getId();
		System.out.println(userService.getUserbyId(user_id));
		if(userService.getUserbyId(user_id)) {//유저 아이디가 없으면 true, 회원가입창으로 
			return "redirect:/terms_use.do";
		}
		if(naverUser.getId().equals("41455065"))//어드민 규정 바꾸기??????어드민은 네아로x
			session.setAttribute("admin_check", 1);
		session.setAttribute("user_id", naverUser.getId());
		return "redirect:/main.do";
	}
    
    
    @RequestMapping("/join_naverForm.do")
    public String joinNaver(HttpServletRequest request, HttpSession session, Model model) {
    	return "naverLogin/join_naverForm";
    }
    
    
    @RequestMapping(value = "/joinUserNaver.do", method = RequestMethod.POST)//네이버????
	@ResponseBody
	public void joinUser(@RequestParam HashMap<String, Object> params, HttpServletResponse resp, HttpSession session) {
		resp.setContentType("text/html; charset=UTF-8");
		NaverUser naverUser = (NaverUser) session.getAttribute("naverUser");
		User user = new User();
		user.setUser_id(naverUser.getId());
		user.setUser_email(naverUser.getEmail());
		user.setUser_name(naverUser.getName());
		user.setUser_proPic(naverUser.getProfileImage());
		params.put("user", user);
		userService.joinNaverUser(params);
		session.setAttribute("user_id", naverUser.getId());
	}
}