package service;

import java.util.List;

import model.Place;

public interface PlaceReviewService {
	public List<Place> showPlaceReview(String place_info);
	public int writePlaceReview(Place place);
	public int deletePlaceReview(int place_no);
	public int modifyPlaceReview(Place place);
}
