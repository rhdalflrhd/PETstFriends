package model;

public class Pet {
	private String user_id;
	private String pet_name;
	private String pet_species;
	private int pet_gender;
	private int pet_age;
	private String pet_file;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}
	public String getPet_species() {
		return pet_species;
	}
	public void setPet_species(String pet_species) {
		this.pet_species = pet_species;
	}
	public int getPet_gender() {
		return pet_gender;
	}
	public void setPet_gender(int pet_gender) {
		this.pet_gender = pet_gender;
	}
	public int getPet_age() {
		return pet_age;
	}
	public void setPet_age(int pet_age) {
		this.pet_age = pet_age;
	}
	public String getPet_file() {
		return pet_file;
	}
	public void setPet_file(String pet_file) {
		this.pet_file = pet_file;
	}
	@Override
	public String toString() {
		return "Pet [user_id=" + user_id + ", pet_name=" + pet_name + ", pet_species=" + pet_species + ", pet_gender="
				+ pet_gender + ", pet_age=" + pet_age + ", pet_file=" + pet_file + "]";
	}

	
	
	
}

