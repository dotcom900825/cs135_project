<%@ page language="java" import="support.*, java.util.*" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 	<title>Multiplier Form</title>
 	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
 	<script src="js/bootstrap.min.js"></script>
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
 </head>
 <!-- This page contains some errors, it can not show the value inputed from index.jsp  -->
		 <body>
		  <fieldset style="background: none repeat scroll 0 0 #F9F8F3;">
		  	<legend>Personal Information</legend>
		  	<form method="POST" action="degree_location.jsp">	
		  	<h3>Full legal Name</h3>		  
		  	  <div class="container-fluid">
				  <div class="row-fluid">
					    <div class="span2">
					    	<label>
					  			<span style="margin-left:130px;">First Name</span>
					  		</label>
					  	</div>
					  	<div class="span9">     		      
					  			<input id="FIRST_NAME" type="text"  readonly="readonly"  
					  			<%out.print("value=" + (request.getParameter("first_name").isEmpty() ? " '' " : request.getParameter("first_name")));%> 
					  			maxlength="50" size="25" name="first_name">
						</div>
						
						<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Last Name</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
					  			<input id="LAST_NAME" type="text"  maxlength="50" size="25" readonly="readonly"  
					  			<%out.print("value=" + (request.getParameter("last_name").isEmpty() ? " '' " : request.getParameter("last_name")));%> 
					  			name="last_name">
						</div>
						
						<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Middle Initial</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
					  			<input id="MIDDLE_NAME" type="text" maxlength="50" size="25" readonly="readonly"  
					  			<%out.print("value=" + (request.getParameter("middle_name").isEmpty() ? " '' " : request.getParameter("middle_name")));%> 
					  			name="middle_name">
						</div>
						
						<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Country</span>
					  		</label>
					  	</div>
					  	<div class="span8" style="margin-left:0px;">					      			      
											  			<input id="MIDDLE_NAME" type="text" maxlength="50" size="25" readonly="readonly"  
											  			<%out.print("value=" + (request.getParameter("country_state").isEmpty() ? " ' ' " : request.getParameter("country_state")));%> 
											  			name="country_state">  	
					  	</div>
					  	
					  	
					  	<table width="100%" class="table">
							  <%
							 	 support s = new support();   			   	
							   	String path1 = config.getServletContext().getRealPath("/support/universities.txt");
							    //getCountriesAndStates returns a vector of the countries to be used for choosing citizenship
							    Vector universities = s.getUniversities(path1);
							  for(int row = 0; row < universities.size()/3; row++)
							  {
								 out.print("<tr>");
							    for (int i=0; i<3; i++){
							        //each entry in the universities vector is a tuple with the first entry being the country/state
							        //and the second entry being a vector of the universities as String's
							        Vector tuple = (Vector)universities.get(row*3 + i);
							        String state = (String)tuple.get(0);
							        out.println("<th><a href='localhost:8080/assignment1/chooseUniversity.jsp?place=" + state + ">" + state+"</a></th>");    
							    }
								 out.print("</tr>");
							  }
							              
							   							  
							  %>
						</table>
						<div class="span8" style="margin-left:300px;">					      			      
					  			<input type="submit" name="submit" value="Submit Address">						
					  	</div>
					
				   </div>
			   </div>
			 </form>
		  </fieldset>			  
		 </body>
</html>
