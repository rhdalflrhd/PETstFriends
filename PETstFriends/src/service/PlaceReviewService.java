package service;

import java.util.HashMap;
import java.util.List;

import model.Place;

public interface PlaceReviewService {
	public List<Place> showPlaceReview(String place_info);
	public HashMap<String, Object> writePlaceReview(HashMap<String, Object> params);
	public int deletePlaceReview(int place_no);
	public Place modifyPlaceReview(HashMap<String, Object> params);
}
