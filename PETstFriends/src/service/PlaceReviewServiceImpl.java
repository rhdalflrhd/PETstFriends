package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.PlaceReviewDao;
import dao.UserDao;
import model.Place;

@Service
public class PlaceReviewServiceImpl implements PlaceReviewService{

	@Autowired
	PlaceReviewDao pDao;
	
	@Autowired
	UserDao uDao;
	
	@Override
	public List<Place> showPlaceReview(String place_info) {
		// TODO Auto-generated method stub
		
		StringTokenizer st = new StringTokenizer(place_info, "/");
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("place_x", st.nextToken());
		params.put("place_y", st.nextToken());
		params.put("place_name", st.nextToken());
		//dao추가하기????????
		
		return pDao.selectReviewAll(params);
	}

	@Override
	public HashMap<String, Object> writePlaceReview(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
		String user_id = (String) params.get("place_userid");
		Place place = new Place();
		place.setPlace_date(simple.format(new Date()));
		place.setPlace_name((String) params.get("place_name"));
		place.setPlace_review((String) params.get("place_review"));
		place.setPlace_userid(user_id);
		place.setPlace_x((String) params.get("place_x"));
		place.setPlace_y((String) params.get("place_y"));
		String place_usernickname = uDao.selectUserbyId(user_id).getUser_nickname();
		place.setPlace_usernickname(place_usernickname);
		HashMap<String, Object> result = new HashMap<String, Object>();
		pDao.insertPlaceReview(place);
		result.put("place_no", place.getPlace_no());
		result.put("place_usernickname", place_usernickname);
		return result;
	}

	@Override
	public int deletePlaceReview(int place_no) {
		// TODO Auto-generated method stub
		return pDao.deletePlaceReview(place_no);
	}

	@Override
	public Place modifyPlaceReview(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		Place place = new Place();
		int place_no = Integer.parseInt((String) params.get("place_no"));
		place.setPlace_no(place_no);
		place.setPlace_review((String) params.get("place_review"));
		pDao.updatePlaceReview(place);
		return pDao.selectReviewOne(place_no);
	}

}
