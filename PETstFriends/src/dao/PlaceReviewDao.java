package dao;

import java.util.HashMap;
import java.util.List;

import model.Place;

public interface PlaceReviewDao {
	public List<Place> selectReviewAll(HashMap<String, Object> params);
	public int insertPlaceReview(Place place);
	public int deletePlaceReview(int place_no);
	public int updatePlaceReview(Place place);
	public Place selectReviewOne(int place_no);
}
