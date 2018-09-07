package model;

public class encyc {
	
	private String encyc_total; //페이징처리를 위한 변수
	private String encyc_title;
	private String encyc_link;
	private String encyc_description;
	private String encyc_thumbnail;
	
	
	
	public String getEncyc_total() {
		return encyc_total;
	}
	public void setEncyc_total(String encyc_total) {
		this.encyc_total = encyc_total;
	}
	public String getEncyc_title() {
		return encyc_title;
	}
	public void setEncyc_title(String encyc_title) {
		this.encyc_title = encyc_title;
	}
	public String getEncyc_link() {
		return encyc_link;
	}
	public void setEncyc_link(String encyc_link) {
		this.encyc_link = encyc_link;
	}
	public String getEncyc_description() {
		return encyc_description;
	}
	public void setEncyc_description(String encyc_description) {
		this.encyc_description = encyc_description;
	}
	public String getEncyc_thumbnail() {
		return encyc_thumbnail;
	}
	public void setEncyc_thumbnail(String encyc_thumbnail) {
		this.encyc_thumbnail = encyc_thumbnail;
	}
	@Override
	public String toString() {
		return "encyc [encyc_total=" + encyc_total + ", encyc_title=" + encyc_title + ", encyc_link=" + encyc_link
				+ ", encyc_description=" + encyc_description + ", encyc_thumbnail=" + encyc_thumbnail + "]";
	}

	
}
