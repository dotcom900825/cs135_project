<%@ page language="java" import="support.*, java.util.* , java.sql.* ,sql_helper.*" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 	<title>Degree List</title>
 	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
 	<script src="js/bootstrap.min.js"></script>
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
 </head>
<body>
<%
	//fetch all the parameters from session
	String first_name = session.getAttribute("first_name").toString();
	String last_name = session.getAttribute("last_name").toString();
	String middle_name = session.getAttribute("middle_name").toString();
	String country_name = session.getAttribute("country").toString();
	String street_name = session.getAttribute("street_address").toString();
	String city = session.getAttribute("city").toString();
	String zip_code = session.getAttribute("zip_code").toString();
	String state = "";
	//check whether session exists or not
	try
	{
		  state = session.getAttribute("state").toString();
	}
	catch(Exception ex)
	{
		state = "";
	}
	//we use degree_flag in case user hit fresh the page and added the degree again
	String degree_flag = session.getAttribute("degree_flag").toString();
	
	//we check whether the discipline is a new added one by user
	if(request.getParameter("new_discipline") != null && !request.getParameter("new_discipline").isEmpty())
	{
		//we check the discipline_flag, if it si true then we save the discipline and set it
		//to false, so when the user hit refresh, this entry not added to database
		if(session.getAttribute("discipline_flag") == "true")
		{
    	//DB_Helper conn = new DB_Helper();
    	//conn.storeDiscipline(request.getParameter("new_discipline"));
    	if(session.getAttribute("new_added_discipline") == null)
    	{
    		Vector new_added_discipline = new Vector();
        	new_added_discipline.add(request.getParameter("new_discipline"));
        	session.setAttribute("new_added_discipline", new_added_discipline);    	
    	}
    	else
    	{
    		Vector discipline_list = (Vector)session.getAttribute("new_added_discipline");
    		discipline_list.add(request.getParameter("new_discipline"));
    		session.setAttribute("new_added_discipline", discipline_list); 
    	}
    	session.setAttribute("discipline_flag", "false");
		}
    	
	}
	//if the user hit delete button, then we should catch the parameter and delete that 
	//specific degree from session, we use the unique degree_id to locate it
	if(request.getParameter("del_school") != null && !request.getParameter("del_school").isEmpty())
	{
		try
		{  
	((HashMap)session.getAttribute("degree_list")).remove((Long.decode(request.getParameter("del_school").toString())));
		}
		catch(Exception ex)
		{
	ex.printStackTrace();
		}
	}
	// if the degree_adding_flag is true then we store the degree entry into the session
	else if(degree_flag == "true")
	{
		long sID = (int)(Math.random()*500); // we generate a random number from 0~500 as id
		String school_name = request.getParameter("school");
		String gpa = request.getParameter("gpa");
		String degree_time = request.getParameter("degree_time");
		out.print(gpa + " " + degree_time);
		String discipline;
		//check whether user is using the unique discipline or not
		if(request.getParameter("discipline") != null)
		{
		 discipline = request.getParameter("discipline");
		}
		else
		{
		 discipline = request.getParameter("new_discipline");
		}
		String degree = request.getParameter("degree");
		//create a school_record and save it with id into the session.
		school_record sRecord = new school_record(school_name, discipline,gpa,degree,degree_time);
		((HashMap)session.getAttribute("degree_list")).put(sID, sRecord);
		session.setAttribute("degree_flag", "false");
	}
%>
<fieldset style="background: none repeat scroll 0 0 #F9F8F3;">
		  	<legend>Personal Info</legend>
		  		
		  	<h3>Degree List</h3>		  
		  	  <div class="container-fluid">
				  <div class="row-fluid">
					    <div class="span2">
					    	<label>
					  			<span style="margin-left:130px;">First Name</span>
					  		</label>
					  	</div>
					  	<div class="span9">     		      
					  			<input id="FIRST_NAME" type="text"  readonly="readonly"  
					  			value="<%out.print(first_name);%>" 
					  			maxlength="50" size="25" name="first_name">
						</div>
						
						<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Last Name</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
					  			<input id="LAST_NAME" type="text"  maxlength="50" size="25" readonly="readonly"  
					  			value="<%out.print(last_name);%>" name="last_name">
						</div>
						
						<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Middle Initial</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
					  			<input id="MIDDLE_NAME" type="text" maxlength="50" size="25" readonly="readonly"  
					  			value="<%out.print(middle_name);%>" name="middle_name">
						</div>
						
						<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Country</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
									<input id="COUNTRY" type="text" maxlength="50" size="25" readonly="readonly"  
									value="<%out.print(country_name);%>" name="country">  	
					  	</div>
					  	
					  	<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Street Address</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
					  			<input id="STREET_ADDRESS" type="text" maxlength="50" size="25" readonly="readonly"  
					  			value="<%out.print(street_name);%>" 
					  			name="street_address">
						</div>
					  	
					  	<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">City</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
								<input id="CITY" type="text" maxlength="50" size="25" readonly="readonly"  
								value="<%out.print(city);%>" name="city">  	
					  	</div>
					  	
					  	<%
					  		if(!state.isEmpty()){
					  	%>
					  	<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">State</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
								<input id="STATE" type="text" maxlength="50" size="25" readonly="readonly"  
								value="<%out.print(state);%>" 
								name="state">  	
					  	</div>
					  	<%
					  		}
					  	%>
					  	
					  	<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Zip Code</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
								<input id="ZIP_CODE" type="text" maxlength="50" size="25" readonly="readonly"  
								value="<%out.print(zip_code);%>" name="zip_code">  	
					  	</div>
					 
					  	<div class="span11" style="margin-top:20px">
					    	<label>
					  			<span style="margin-left:100px; font-size:25px">Degree List</span>
					  		</label>
					  	</div>
					  	<br/>
					  	<br/>
					    <%
					    	//print out the added school_list recorded in session.
					    	Set degree_list;										
							degree_list = ((HashMap)session.getAttribute("degree_list")).keySet();					   					    										    
				  		
					  		for(Object key : degree_list)	
					  	{
					  	%>
					  		
							<div class="span2" style="margin-top:20px">
						    	<label>
						  			<span style="margin-left:100px;">School Name</span>
						  		</label>
					  		</div>
						  	<div class="span9" style="margin-top:20px; margin-left:0px">
						  	<input  type="text"  size="25" readonly="readonly" 
						  			value="<%=((school_record)((HashMap)session.getAttribute("degree_list")).get(key)).school_name%>">	
						  		<form method="GET" action="degree_list.jsp">				      			      
						  			
						  			<input  type="hidden"  maxlength="50" size="25"  
						  			value="<%=key%>" name="del_school">
						  				<input type="submit" value="Delete Degree" />
						  		</form>
						  			
							</div>
							
							<div class="span2">
						    	<label>
						  			<span style="margin-left:100px;">Discipline</span>
						  		</label>
					  		</div>
						  	<div class="span9" style="margin-left:0px;">					      			      
						  			<input  type="text"  maxlength="50" size="25" readonly="readonly"  
						  			value="<%=((school_record)((HashMap)session.getAttribute("degree_list")).get(key)).discipline%>">
							</div>
							
							<div class="span2">
						    	<label>
						  			<span style="margin-left:100px;">GPA</span>
						  		</label>
					  		</div>
						  	<div class="span9" style="margin-left:0px;">					      			      
						  			<input  type="text"  maxlength="50" size="25" readonly="readonly"  
						  			value="<%=((school_record)((HashMap)session.getAttribute("degree_list")).get(key)).GPA%>">
							</div>
							
							<div class="span2">
						    	<label>
						  			<span style="margin-left:100px;">Degree</span>
						  		</label>
					  		</div>
						  	<div class="span9" style="margin-left:0px;">					      			      
						  			<input  type="text"  maxlength="50" size="25" readonly="readonly"  
						  			value="<%=((school_record)((HashMap)session.getAttribute("degree_list")).get(key)).degree%>">
							</div>
							
							<div class="span2">
						    	<label>
						  			<span style="margin-left:100px;">Degree Time</span>
						  		</label>
					  		</div>
						  	<div class="span9" style="margin-left:0px;">					      			      
						  			<input  type="text"  maxlength="50" size="25" readonly="readonly"  
						  			value="<%=((school_record)((HashMap)session.getAttribute("degree_list")).get(key)).degree_time%>">
							</div>
							<br />
					  	<%
							} 
						%>
						<form method="GET" action="chooseLocation.jsp">
							<div class="span8" style="margin-left:300px;">		
									<input type="hidden" name="action" value="more">			      			      
						  			<input type="submit" name="submit" value="Submit Next Degree">						
						  	</div>
						</form>
						
						<!-- Sharon, please insert action code here! -->
						<form method="GET" action="specialization.jsp">
							<div class="span8" style="margin-left:300px;">					      			      
						  			<input type="submit" name="submit" value="Done">						
						  	</div>
					  	</form>
				   </div>
			   </div>
			
		  </fieldset>	
</body>
</html>