package support;

public class Applicant {
	public String last_name;
	public String first_name;
	public String middle_name;
	public String country;
	public String street_address;
	public String city;
	public String state;
	public String zip_code;
	public String specialization;
	public String unique_id;
	public Applicant(String last_name, String first_name, String middle_name, String country, 
			  String street_address, String city, String state, String zip_code, 
			  String specialization, String unique_id)
	{
		this.last_name = last_name;
		this.first_name = first_name;
		this.middle_name = middle_name;
		this.country = country;
		this.street_address = street_address;
		this.city = city;
		this.state = state;
		this.zip_code = zip_code;
		this.specialization = specialization;
		this.unique_id = unique_id;
	}
}
