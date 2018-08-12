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
	private UserService userService;
	
	/* NaverLoginBO */
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO){
		this.naverLoginBO = naverLoginBO;
	}
  
    @RequestMapping(value="/login.do")
    public ModelAndView login(HttpSession session, Model model) {
 
        /* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        /* 생성한 인증 URL을 View로 전달 */
        
        return new ModelAndView("naverLogin/login", "url", naverAuthUrl);
    }
    
    @RequestMapping("/callback.do")
	public String callback(@RequestParam String code, @RequestParam String state, HttpSession session, Model model) throws IOException {
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		NaverUser naverUser = naverLoginBO.getUserProfile(oauthToken);
		session.setAttribute("naverUser", naverUser);
		String user_id = naverUser.getId();
		
		if(naverUser.getName().equals("김가은")) {//바꾸기?????????
			return "redirect:/terms_use.do";
		}
//		if(userService.getUserbyId(user_id)) {//유저아이디 이미 디비에 있으면 빼기
//			return "redirect:/terms_use.do";
//		}
		return "naverLogin/callback";
		
	}
    
    
    @RequestMapping("/join_naverForm.do")
    public String joinNaver(HttpServletRequest request, HttpSession session, Model model) {
    	return "naverLogin/join_naverForm";
    }
    
    
    @RequestMapping(value = "/joinUserNaver.do", method = RequestMethod.POST)//네이버????
	@ResponseBody
	public void joinUser(@RequestParam HashMap<String, Object> params, HttpServletRequest req,
			HttpServletResponse resp, HttpSession session) {
		resp.setContentType("text/html; charset=UTF-8");
		String jsonStr = req.getParameter("jsonData");
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(jsonStr);
		JsonArray jArray = element.getAsJsonArray();
		JsonObject jOb = new JsonObject();
		for (int i = 0; i < jArray.size(); i++) {
			jOb = jArray.get(i).getAsJsonObject();
			if (!(jOb.get("pet_name").getAsString().equals(""))) {
				Pet pet = new Pet();
				pet.setPet_name(jOb.get("pet_name").getAsString());
				pet.setPet_gender(jOb.get("pet_gender").getAsInt());
				pet.setPet_species(jOb.get("pet_species").getAsString());
				pet.setPet_age(jOb.get("pet_age").getAsInt());
				pet.setPet_file(jOb.get("pet_file").getAsString());
			//펫 테이블에 insertSerive부르기
			}
		}
		NaverUser nUser = (NaverUser) session.getAttribute("naverUser");
		User user = new User();
		user.setUser_id(nUser.getId());
		user.setUser_adminCheck(false);
		user.setUser_email(nUser.getEmail());
		user.setUser_havePet(Boolean.parseBoolean(req.getParameter("user_havePet")));
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
		user.setUser_joinDate(simple.format(new Date()));
		user.setUser_name(nUser.getName());
		user.setUser_nickname(req.getParameter("user_nickname"));
		user.setUser_pass("");//패스워드 없음
		user.setUser_phone(req.getParameter("user_phone"));
		user.setUser_score(0);
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.add(Calendar.DAY_OF_YEAR, -1);
		user.setUser_state(simple.format(cal.getTime()));
		//user테이블에 insert 추가하기

	}
}