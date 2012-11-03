package support;

/*
* Name: Yu Xia student
* Date: Oct 20, 2012
* File: school_record.java
* Source of Help: slides on lecture
*
* This class is data helper class, abstraction of degree_info
*/
public class school_record {
	public school_record(String sName, String disci, String gpa, String degree, String dTime)
	{
		school_name = sName;
		discipline = disci;
		GPA = gpa;
		this.degree = degree;
		degree_time = dTime;
	} 
	public  String school_name;
	public  String discipline;
	public  String GPA;
	public  String degree;
	public  String degree_time;
	
}
