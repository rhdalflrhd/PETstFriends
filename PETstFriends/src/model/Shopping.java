package model;

public class Shopping {
	private String shopping_title;
	private String shopping_link;
	private String shopping_image;
	private String shopping_lprice;
	private String shopping_hprice;
	private String shopping_mallName;
	private String shopping_productId;
	public String getShopping_title() {
		return shopping_title;
	}
	public void setShopping_title(String shopping_title) {
		this.shopping_title = shopping_title;
	}
	public String getShopping_link() {
		return shopping_link;
	}
	public void setShopping_link(String shopping_link) {
		this.shopping_link = shopping_link;
	}
	public String getShopping_image() {
		return shopping_image;
	}
	public void setShopping_image(String shopping_image) {
		this.shopping_image = shopping_image;
	}
	public String getShopping_lprice() {
		return shopping_lprice;
	}
	public void setShopping_lprice(String shopping_lprice) {
		this.shopping_lprice = shopping_lprice;
	}
	public String getShopping_hprice() {
		return shopping_hprice;
	}
	public void setShopping_hprice(String shopping_hprice) {
		this.shopping_hprice = shopping_hprice;
	}
	public String getShopping_mallName() {
		return shopping_mallName;
	}
	public void setShopping_mallName(String shopping_mallName) {
		this.shopping_mallName = shopping_mallName;
	}
	public String getShopping_productId() {
		return shopping_productId;
	}
	public void setShopping_productId(String shopping_productId) {
		this.shopping_productId = shopping_productId;
	}
	@Override
	public String toString() {
		return "Shopping [shopping_title=" + shopping_title + ", shopping_link=" + shopping_link + ", shopping_image="
				+ shopping_image + ", shopping_lprice=" + shopping_lprice + ", shopping_hprice=" + shopping_hprice
				+ ", shopping_mallName=" + shopping_mallName + ", shopping_productId=" + shopping_productId + "]";
	}
	
	
	
}