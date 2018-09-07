package model;

public class Place {
private int place_no; 
private String place_name;
private String place_x;
private String place_y;
private String place_userid;
private String place_usernickname;
private String place_review;
private String place_date;
public int getPlace_no() {
	return place_no;
}
public void setPlace_no(int place_no) {
	this.place_no = place_no;
}
public String getPlace_name() {
	return place_name;
}
public void setPlace_name(String place_name) {
	this.place_name = place_name;
}
public String getPlace_x() {
	return place_x;
}
public void setPlace_x(String place_x) {
	this.place_x = place_x;
}
public String getPlace_y() {
	return place_y;
}
public void setPlace_y(String place_y) {
	this.place_y = place_y;
}
public String getPlace_userid() {
	return place_userid;
}
public void setPlace_userid(String place_userid) {
	this.place_userid = place_userid;
}
public String getPlace_usernickname() {
	return place_usernickname;
}
public void setPlace_usernickname(String place_usernickname) {
	this.place_usernickname = place_usernickname;
}
public String getPlace_review() {
	return place_review;
}
public void setPlace_review(String place_review) {
	this.place_review = place_review;
}
public String getPlace_date() {
	return place_date;
}
public void setPlace_date(String place_date) {
	this.place_date = place_date;
}
@Override
public String toString() {
	return "Place [place_no=" + place_no + ", place_name=" + place_name + ", place_x=" + place_x + ", place_y="
			+ place_y + ", place_userid=" + place_userid + ", place_usernickname=" + place_usernickname
			+ ", place_review=" + place_review + ", place_date=" + place_date + "]";
}


}
