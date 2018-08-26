package model;

public class Mal {
	
	private int mal_no;
	private String mal_malname;
	public int getMal_no() {
		return mal_no;
	}
	public void setMal_no(int mal_no) {
		this.mal_no = mal_no;
	}
	public String getMal_malname() {
		return mal_malname;
	}
	public void setMal_malname(String mal_malname) {
		this.mal_malname = mal_malname;
	}
	@Override
	public String toString() {
		return "Mal [mal_no=" + mal_no + ", mal_malname=" + mal_malname + "]";
	}
	

}
