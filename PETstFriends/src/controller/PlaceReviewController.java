package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public void modifyPlaceReview(@RequestParam Place place) {
		
		pService.modifyPlaceReview(place);
		//성공실패 return 하기
	}
	
	@RequestMapping(value="/checkHospital.do")
	public String checkHosptial() {//메인에 넣기 앞으로는??????????
		return "place/checkHospital";
	}
	@RequestMapping(value="/header.do")
	public String he() {//메인에 넣기 앞으로는
		return "header";
	}
}
