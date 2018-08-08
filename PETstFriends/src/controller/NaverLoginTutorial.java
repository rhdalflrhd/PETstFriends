package controller;
 
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.Gson;

import naver.NaverLoginBO;
 
@Controller
public class NaverLoginTutorial {
 
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;

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
	public ModelAndView callback(@RequestParam String code, @RequestParam String state, HttpSession session, Model model) throws IOException {
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		String apiResult = naverLoginBO.getUserProfile(oauthToken);

		return new ModelAndView("naverLogin/callback", "result", apiResult);

	}
}