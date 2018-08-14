package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.Place;
import service.PlaceReviewServiceImpl;
import service.UserServiceImpl;

@Controller
public class PlaceReviewController {
	
	@Autowired
	PlaceReviewServiceImpl pService;
	UserServiceImpl uService;
	
	@RequestMapping(value="/reviewList.do")
	public void review(@RequestParam String place_info) {
		List<Place> pList = pService.showPlaceReview(place_info);
		//ajax 리턴값 추가하기!!!!
		
	}
	
	@RequestMapping(value="/writePlaceReview.do")
	public void writePlaceReview(@RequestParam Place place) {
		String palce_userid = place.getPlace_userid();
		//닉네임으로 user_nickname가져오기
		String place_usernickname = "dd";
		place.setPlace_usernickname(place_usernickname);
		pService.writePlaceReview(place);
		//성공실패 return 하기
	}
	@RequestMapping(value="/deletePlaceReview.do")
	public void deletePlaceReview(@RequestParam int place_no) {
		pService.deletePlaceReview(place_no);
	}
	
	@RequestMapping(value="/modifyPlaceReview.do")
	public void modifyPlaceReview(@RequestParam Place place) {
		
		pService.modifyPlaceReview(place);
		//성공실패 return 하기
	}
	
	@RequestMapping(value="/checkHospital.do")
	public String checkHosptial() {//메인에 넣기 앞으로는
		return "place/checkHospital";
	}
	@RequestMapping(value="/header.do")
	public String he() {//메인에 넣기 앞으로는
		return "header";
	}
}
