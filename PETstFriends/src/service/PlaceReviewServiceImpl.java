package service;

import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.PlaceReviewDao;
import model.Place;

@Service
public class PlaceReviewServiceImpl implements PlaceReviewService{

	@Autowired
	PlaceReviewDao pDao;
	
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
	public int writePlaceReview(Place place) {
		// TODO Auto-generated method stub
		return pDao.insertPlaceReview(place);
	}

	@Override
	public int deletePlaceReview(int place_no) {
		// TODO Auto-generated method stub
		return pDao.deletePlaceReview(place_no);
	}

	@Override
	public int modifyPlaceReview(Place place) {
		// TODO Auto-generated method stub
		return pDao.updatePlaceReview(place);
	}

}
