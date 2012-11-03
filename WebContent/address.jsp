<%@ page language="java" import="support.*,sql_helper.*, java.util.*" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 	<title>Address</title>
 	<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
 	<script src="js/bootstrap.min.js"></script>
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
 	
 	<script text="javascript">
 	(function($,W,D)
 			{
 			    var JQUERY4U = {};
 			 
 			    JQUERY4U.UTIL =
 			    {
 			        setupFormValidation: function()
 			        {
 			            //form validation rules
 			            $("#register-form").validate({
 			                rules: {
 			                    street_address: "required",
 			                    city: "required",
 			                    zip_code: "required"
 			                },
 			                messages: {
 			                    street_address: "Please enter your street address",
 			                    city: "Please enter your city",
 			                    zip_code: "please enter your zip code"
 			                },
 			                submitHandler: function(form) {
 			                    form.submit();
 			                }
 			            });
 			        }
 			    }
 			 
 			    //when the dom has loaded setup form validation rules
 			    $(D).ready(function($) {
 			        JQUERY4U.UTIL.setupFormValidation();
 			    });
 			 
 			})(jQuery, window, document);
 	</script>
 </head>
 	<%
 		//fetch all the parameters passed to this page and then save them into session
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
		  	<form method="POST" action="chooseLocation.jsp" id="register-form" novalidate="novalidate">	
		  	<h3>Choose Address</h3>		  
		  	  <div class="container-fluid">
				  <div class="row-fluid">
					    
					    <!-- First Name form -->
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
						
						<!-- Last Name form -->
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
						
						<!-- Middle Name form -->
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
						
						<!-- Country form -->
						<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Country</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
								<input id="country" type="text" maxlength="50" size="25" readonly="readonly"  
								value="<%out.print(country);%>" name="country">  	
					  	</div>
					  			
					  			
					  	<!-- Street Name form -->
					  	<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Street Address</span>
					  		</label>
					  	</div>
					  	<div class="span9 fieldgroup" style="margin-left:0px;">					      			      
					  			<input id="STREET_ADDRESS" type="text"  maxlength="50" size="25" name="street_address">
						</div>
						
						<!-- City Name form -->
						<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">City</span>
					  		</label>
					  	</div>
					  	<div class="span9 fieldgroup" style="margin-left:0px;">					      			      
					  			<input id="CITY" type="text"  maxlength="50" size="25" name="city">
						</div>
					  	
					  	<!-- State form. We need to check whether the user's country is US or not-->		      			      
					  	<%
					  	DB_Helper dbHelper = new DB_Helper();
					    Vector<String> states = dbHelper.fetchStates();
					
							    
							    if(country.equals("United States"))
							   {%>
						<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">State</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">
							    	<%
							    	out.println("<select name=\"state\">");
							    	for(int i=0; i<51; i++)
								        out.println("<option" + " value=" + (String) (states.get(i))
								        			+ ">" + (String) ((states.get(i)) + "</option>"));
									out.println("</select> </div>");
							    }
									%>
									
						<!-- Zip Code form -->		  	
					  	<div class="span2">
					  		<label>
					  			<span style="margin-left:100px;">Zip Code</span>
					  		</label>
					  	</div>
					  	<div class="span10 fieldgroup" style="margin-left:0px;">					      			      
					  			<input id="ZIP_CODE" type="text"  maxlength="50" size="25" name="zip_code">
						</div>

						<div class="span8" style="margin-left:300px;">					      			      
					  			<input type="submit" name="submit" value="Submit Address">						
					  	</div>
					
				   </div>
			   </div>
			 </form>
		  </fieldset>			  
		 </body>
</html>
