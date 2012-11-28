<%@ page language="java" import="support.*, java.util.* , java.sql.* ,sql_helper.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Application Submitted</title>
</head>

<%
	//fetch all the parameters
		String first_name = session.getAttribute("first_name").toString();
		String last_name = session.getAttribute("last_name").toString();
		String middle_name = session.getAttribute("middle_name").toString();
		String country_name = session.getAttribute("country").toString();
		String street_name = session.getAttribute("street_address").toString();
		String city = session.getAttribute("city").toString();
		String zip_code = session.getAttribute("zip_code").toString();
		String specialization = session.getAttribute("specialization").toString();
		String state = "";
		Random r = new Random();
		try
		{
	  		state = session.getAttribute("state").toString();
		}
		catch(Exception ex)
		{
			state = "";
		}
		// use list_reader to store all the degree_list into the database
		DB_Helper dbConnector = new DB_Helper();
		PreparedStatement degree_list_ps = null;
		PreparedStatement submission_ps = null;
		
		int application_id = Math.abs(r.nextInt());
		
		try
		{
			int unique_id = Math.abs(r.nextInt());
			dbConnector.storeApplicant(last_name, middle_name, first_name, country_name, state, city, Long.parseLong(zip_code), specialization, unique_id);
			Set degree_list;										
			degree_list = ((HashMap)session.getAttribute("degree_list")).keySet();					   					    										    		
		
			for(Object key : degree_list)	
	{
		String sName = ((school_record)((HashMap)session.getAttribute("degree_list")).get(key)).school_name;
		String discipline = ((school_record)((HashMap)session.getAttribute("degree_list")).get(key)).discipline;
		String gpa = ((school_record)((HashMap)session.getAttribute("degree_list")).get(key)).GPA;
		String degree = ((school_record)((HashMap)session.getAttribute("degree_list")).get(key)).degree;
		String degree_time = ((school_record)((HashMap)session.getAttribute("degree_list")).get(key)).degree_time;
		String month_year = degree_time.substring(3);
		String month = month_year.substring(0,2);
		String year = month_year.substring(3,7);
		
		out.print(month + " " + year);
		//dbConnector.storeApplicant(last_name, middle_name, first_name, country_name, state, city, zip_code, specialization, unique_id);
		int did = Math.abs(r.nextInt());
		dbConnector.setAutoCommitFalse();
		degree_list_ps = dbConnector.storeDegreeList(sName, Integer.parseInt(gpa), degree, Integer.parseInt(year), Integer.parseInt(month), discipline, did);
		degree_list_ps.executeUpdate();
		submission_ps = dbConnector.storeSubmission(unique_id, did, application_id);
		submission_ps.executeUpdate();
		dbConnector.commitTransaction();
		dbConnector.setAutoCommitTrue();
	}
			degree_list_ps.close();
			submission_ps.close();
		dbConnector.closeConnection();
		}
		
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
%>
<body>
Thank you, your application has been submitted. Your Applicaiton id is<%=application_id  %>
</body>
</html>