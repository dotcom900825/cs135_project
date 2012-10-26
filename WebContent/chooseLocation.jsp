<%@ page language="java" import="support.*, java.util.*" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 	<title>ChooseLocation</title>
 	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
 	<script src="js/bootstrap.min.js"></script>
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
 </head>
 <%
	String first_name = session.getAttribute("first_name").toString();
	String last_name = session.getAttribute("last_name").toString();
	String middle_name = session.getAttribute("middle_name").toString();
	String country = session.getAttribute("country").toString();
	String street_address;
	String city;
	String zip_code;
	String state;
	
	
	 if( request.getParameter("action") == null ||request.getParameter("action").toString().isEmpty())
	 {
		 street_address = request.getParameter("street_address");
	     city = request.getParameter("city");
	     zip_code = request.getParameter("zip_code");
	     state = request.getParameter("state");
	     
	    session.setAttribute("street_address", street_address);
	    session.setAttribute("city", city);
	    session.setAttribute("zip_code", zip_code);
	    session.setAttribute("state", state);
	 }
	 else
	 {
		 street_address = session.getAttribute("street_address").toString();
	 	 city = session.getAttribute("city").toString();
	 	 zip_code = session.getAttribute("zip_code").toString();
	     try
	     {
	    	  state = session.getAttribute("state").toString();
	     }
	     catch(Exception ex)
	     {
	     	state = "";
	     }
	 }
	
 
 %>
		 <body>
		  <fieldset style="background: none repeat scroll 0 0 #F9F8F3;">
		  	<legend>Personal Information</legend>
		  	<form method="POST" action="degree_location.jsp">	
		  	<h3>Choose Location</h3>		  
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
					  			value="<%out.print(last_name);%>" 
					  			name="last_name">
						</div>
						
						<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Middle Initial</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
					  			<input id="MIDDLE_NAME" type="text" maxlength="50" size="25" readonly="readonly"  
					  			value="<%out.print(middle_name);%>" 
					  			name="middle_name">
						</div>
						
						<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Country</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
									<input id="COUNTRY" type="text" maxlength="50" size="25" readonly="readonly"  
									value="<%out.print(country);%>" 
											  			name="country">	
					  	</div>
					  	
					  	<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Street Address</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
					  			<input id="STREET_ADDRESS" type="text" maxlength="50" size="25" readonly="readonly"  
					  			value="<%out.print(street_address);%>" 
					  			name="street_address">
						</div>
					  	
					  	<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">City</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
								<input id="CITY" type="text" maxlength="50" size="25" readonly="readonly"  
								value="<%out.print(city);%>" 
								name="city">  	
					  	</div>
					  	
					  	<%
					  		if(request.getParameter("state") != null){
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
					  	<div class="span8" style="margin-left:0px;">					      			      
								<input id="ZIP_CODE" type="text" maxlength="50" size="25" readonly="readonly"  
								value="<%out.print(zip_code);%>" 
								name="zip_code">  	
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
							        String states = (String)tuple.get(0);
							        out.println("<th><a  href='./chooseUniversity.jsp?place=" + states + " ' >" + states +"</a></th>");    
							    }
								 out.print("</tr>");
							  }
							              
							   							  
							  %>
						</table>
					
					
				   </div>
			   </div>
			 </form>
		  </fieldset>			  
		 </body>
</html>
