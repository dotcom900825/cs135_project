<%@ page language="java" import="support.*, java.util.*" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 	<title>Address</title>
 	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
 	<script src="js/bootstrap.min.js"></script>
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
 </head>
 	<%
 			String first_name = request.getParameter("first_name");
 			String last_name = request.getParameter("last_name");
 			String middle_name = request.getParameter("middle_name");
 			String country = request.getParameter("country");
 			
 			session.setAttribute("first_name", first_name);
 			session.setAttribute("last_name", last_name);
 			session.setAttribute("middle_name", middle_name);
 			session.setAttribute("country", country);
 			
 	%>
		 <body>
		  <fieldset style="background: none repeat scroll 0 0 #F9F8F3;">
		  	<legend>Personal Information</legend>
		  	<form method="GET" action="chooseLocation.jsp">	
		  	<h3>Choose Address</h3>		  
		  	  <div class="container-fluid">
				  <div class="row-fluid">
					    <!-- First Name input form -->
					    <div class="span2">
					    	<label>
					  			<span style="margin-left:130px;">First Name</span>
					  		</label>
					  	</div>
					  	<div class="span9">     		      
					  			<input id="FIRST_NAME" type="text"  readonly="readonly" 
					  			value="<%
					  								  				
					  				out.print(first_name);		
					  			%>"
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
								<input id="country" type="text" maxlength="50" size="25" readonly="readonly"  
								value="<%out.print(country);%>" name="country">  	
					  	</div>
					  			
					  			
					  			<!-- Hey your code should starts from here -->
					  	<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Street Address</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
					  			<input id="STREET_ADDRESS" type="text"  maxlength="50" size="25" name="street_address">
						</div>
						<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">City</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
					  			<input id="CITY" type="text"  maxlength="50" size="25" name="city">
						</div>
					  						      			      
					  				<%support s = new support();   	
							   	
							   	String path1 = config.getServletContext().getRealPath("/support/countries_and_states.txt");
							    //getCountriesAndStates returns a vector of the countries to be used for choosing citizenship
							    Vector<CountryState> countries_and_states = s.getCountriesAndStates(path1); 
							    
							    if(country.equals("United States")){%>
						<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">State</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">
							    	<%
							    	out.println("<select name=\"state\">");
							    	for(int i=0; i<51; i++)
								        out.println("<option" + " value=" + (String) ((CountryState)countries_and_states.get(i)).countryStateName
								        			+ ">" + (String) ((CountryState)countries_and_states.get(i)).countryStateName + "</option>");
									out.println("</select> </div>");
							    }
								%>


					  	
					  	<div class="span2">
					  		<label>
					  			<span style="margin-left:100px;">Zip Code</span>
					  		</label>
					  	</div>
					  	<div class="span10" style="margin-left:0px;">					      			      
					  			<input id="ZIP_CODE" type="text"  maxlength="50" size="25" name="zip_code">
						</div>
					  	<!-- Ends here -->


						<div class="span8" style="margin-left:300px;">					      			      
					  			<input type="submit" name="submit" value="Submit Address">						
					  	</div>
					
				   </div>
			   </div>
			 </form>
		  </fieldset>			  
		 </body>
</html>
