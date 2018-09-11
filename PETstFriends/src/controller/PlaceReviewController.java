package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import model.Place;
import service.PlaceReviewServiceImpl;
import service.UserServiceImpl;

@Controller
public class PlaceReviewController {
	
	@Autowired
	PlaceReviewServiceImpl pService;
	UserServiceImpl uService;
	
	@RequestMapping(value="/reviewList.do")
	@ResponseBody
	public void review(@RequestParam String place_info, HttpServletResponse resp) {
		resp.setCharacterEncoding("UTF-8");
		Gson gson = new Gson();
		String pList = gson.toJson(pService.showPlaceReview(place_info));
		try {
			resp.getWriter().println(pList);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/writePlaceReview.do")
	@ResponseBody
	public void writePlaceReview(@RequestParam HashMap<String, Object> params, HttpSession session, HttpServletResponse resp) {
		String place_userid = (String) session.getAttribute("user_id");
		params.put("place_userid", place_userid);
		String place_review = (String) params.get("place_review");
		params.put("place_review", place_review);
		HashMap<String, Object> result = pService.writePlaceReview(params);
		String place_usernickname = (String) result.get("place_usernickname");
		int place_no = (int) result.get("place_no");
		resp.setCharacterEncoding("UTF-8");
		String resultStr = "{\"place_usernickname\" : "+ place_usernickname +
				",\"place_no\" : "+ place_no +  
				",\"place_userid\" : "+place_userid+
				"}";
		JsonParser parser = new JsonParser();
		Object obj = parser.parse(resultStr);
		JsonObject jsonObj = (JsonObject) obj;
		try {
			resp.getWriter().println(jsonObj);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping(value="/deletePlaceReview.do")
	@ResponseBody
	public void deletePlaceReview(@RequestParam int place_no) {
		pService.deletePlaceReview(place_no);
	}
	
	@RequestMapping(value="/modifyPlaceReview.do")
	@ResponseBody
	public void modifyPlaceReview(@RequestParam HashMap<String, Object> params, HttpServletResponse resp) {
		Place place = pService.modifyPlaceReview(params);
		resp.setCharacterEncoding("UTF-8");
		String resultStr = "{\"place_usernickname\" : "+ place.getPlace_usernickname()+
				",\"place_no\" : "+ place.getPlace_no() +  
				",\"place_userid\" : "+place.getPlace_userid()+
				"}";
		JsonParser parser = new JsonParser();
		Object obj = parser.parse(resultStr);
		JsonObject jsonObj = (JsonObject) obj;
		try {
			resp.getWriter().println(jsonObj);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//성공실패 return 하기
	}
	
	@RequestMapping(value="/checkHospital.do")
	public String checkHosptial() {//메인에 넣기 앞으로는??????????
		return "place/checkHospital";
	}
	@RequestMapping(value="/checkPlace.do")
	public String checkPlace(Model model, @RequestParam(defaultValue="0") int randomnum, @RequestParam(defaultValue="1") int randomnum2) {
		//비오는날 : 카페, 반려동물용품
		//화창한날 : 공원 놀이터 호텔
		//randomnum = 1 서울2 부산 3인천4 대구 5 대전 6 광주 7 울산 8 제주
		//randomnum2 = 1:애견카페 2:애묘카페 3.호텔 4.공원 5:놀이터		
		String mainKey = randomnum==0?"종로구":randomnum==1?"서울":randomnum==2?"부산":randomnum==3?"인천":randomnum==4?"대구":randomnum==5?"대전":randomnum==6?
		"광주":randomnum==7?"울산":"제주";
		String mainPlace = randomnum2==1?" 애견카페":randomnum2==2?" 애묘카페":randomnum2==3?" 반려동물 호텔":randomnum2==4?" 공원":" 반려견 놀이터";
		String mainPlace1 = randomnum2==1?"p1":randomnum2==2?"p2":randomnum2==3?"p5":randomnum2==4?"p6":"p7";
		
		model.addAttribute("mainPlace", mainPlace);
		model.addAttribute("mainKey", mainKey);
		model.addAttribute("mainPlace1", mainPlace1);
		return "place/checkPlace";
	}
	@RequestMapping(value="/header.do")
	public String he() {//메인에 넣기 앞으로는
		return "header";
	}
}
