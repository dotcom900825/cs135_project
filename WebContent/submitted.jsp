<%@ page language="java" import="support.*, java.util.* , java.sql.* ,sql_helper.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Application Submitted</title>
</head>

<%
		String first_name = session.getAttribute("first_name").toString();
		String last_name = session.getAttribute("last_name").toString();
		String middle_name = session.getAttribute("middle_name").toString();
		String country_name = session.getAttribute("country").toString();
		String street_name = session.getAttribute("street_address").toString();
		String city = session.getAttribute("city").toString();
		String zip_code = session.getAttribute("zip_code").toString();
		String specialization = session.getAttribute("specialization").toString();
		String state = "";
		
		try
		{
			  state = session.getAttribute("state").toString();
		}
		catch(Exception ex)
		{
			state = "";
		}
		list_reader dbConnector = new list_reader();
		try
		{
			Set degree_list;										
			degree_list = ((HashMap)session.getAttribute("degree_list")).keySet();					   					    										    
		
				for(Object key : degree_list)	
			{
				String sName = ((school_record)((HashMap)session.getAttribute("degree_list")).get(key)).school_name;
				String discipline = ((school_record)((HashMap)session.getAttribute("degree_list")).get(key)).discipline;
				String gpa = ((school_record)((HashMap)session.getAttribute("degree_list")).get(key)).GPA;
				String degree = ((school_record)((HashMap)session.getAttribute("degree_list")).get(key)).degree;
				String degree_time = ((school_record)((HashMap)session.getAttribute("degree_list")).get(key)).degree_time;
				dbConnector.storeDegreeInfo(last_name, middle_name, first_name, country_name, state, city, zip_code, sName, degree, discipline, degree_time, gpa);
				
			}
		}
		
		catch(Exception ex)
		{
			
		}
		

%>
<body>
Thank you, your application has been submitted.
</body>
</html>