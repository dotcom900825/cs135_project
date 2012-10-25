<%@ page language="java" import="support.*, java.util.*" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 	<title>ChooseDicipline</title>
 	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
 	<script src="js/bootstrap.min.js"></script>
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
 </head>
 <!-- This page contains some errors, it can not show the value inputed from index.jsp  -->
		 <body>
		  <fieldset style="background: none repeat scroll 0 0 #F9F8F3;">
		  	<legend>Personal Information</legend>
		  	<form method="GET" action="degree_list.jsp">	
		  	<h3>Choose Discipline</h3>		  
		  	  <div class="container-fluid">
				  <div class="row-fluid">
					    <div class="span2">
					    	<label>
					  			<span style="margin-left:130px;">First Name</span>
					  		</label>
					  	</div>
					  	<div class="span9">     		      
					  			<input id="FIRST_NAME" type="text"  readonly="readonly"  
					  			value="<%out.print(util.firstName);%>" 
					  			maxlength="50" size="25" name="first_name">
						</div>
						
						<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Last Name</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
					  			<input id="LAST_NAME" type="text"  maxlength="50" size="25" readonly="readonly"  
					  			value="<%out.print(util.lastName);%>" name="last_name">
						</div>
						
						<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Middle Initial</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
					  			<input id="MIDDLE_NAME" type="text" maxlength="50" size="25" readonly="readonly"  
					  			value="<%out.print(util.middleName);%>" name="middle_name">
						</div>
						
						<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Country</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
									<input id="COUNTRY" type="text" maxlength="50" size="25" readonly="readonly"  
									value="<%out.print(util.country);%>" name="country">  	
					  	</div>
					  	
					  	<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Street Address</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
					  			<input id="STREET_ADDRESS" type="text" maxlength="50" size="25" readonly="readonly"  
					  			value="<%out.print(util.streetAddress);%>" name="street_address">
						</div>
					  	
					  	<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">City</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
								<input id="CITY" type="text" maxlength="50" size="25" readonly="readonly"  
								value="<%out.print(util.city);%>" name="city">  	
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
								value="<%out.print(util.states);%>" name="state">  	
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
								value="<%out.print(util.zipCode);%>" 
								name="zip_code">  	
					  	</div>
					  	
					  	<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">School</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
									<input id="SCHOOL" type="text" maxlength="50" size="25" readonly="readonly"  
									value="<%
										
										if(request.getParameter("school").isEmpty())
										{
											if(!request.getParameter("added_school_name").isEmpty())
											{
												//school_record.school_name = request.getParameter("added_school_name");
												out.print(request.getParameter("added_school_name"));
											}
										}
										else
										{
											//school_record.school_name  = (request.getParameter("school"));
											out.print(request.getParameter("school"));
										}
										%> "
											  			name="school">  	
					  	</div>
					  	
					  	<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Discipline</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
							<%
						 	 support s = new support();   			   	
						   	 String path1 = config.getServletContext().getRealPath("/support/disciplines.txt");
						   	 Vector disciplines = s.getDisciplines(path1);
						   	 for(int i=0; i<disciplines.size(); i++)
						         out.println("<input type='radio' value='" + disciplines.get(i) + "'" + "name='discipline'" +  ">" + disciplines.get(i) + "<br>");
							%> 
											  			
					  	</div>
					  	
					  	<div class="span3" style="margin-left:-85px">
					    	<label>
					  			<span style="margin-left:100px;">Expected time or awared time</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
							  	<input id="degree_time" type="text"  maxlength="50" size="25" name="degree_time">
			     	  	</div>
			     	  	
			     	  	<div class="span3" style="margin-left:-85px">
					    	<label>
					  			<span style="margin-left:100px;">Expected or awarded GPA</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
							  	<input id="gpa" type="text"  maxlength="50" size="25" name="gpa">
			     	  	</div>
			     	  	
			     	  	<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Degree List</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
							  	<select name="degree">
							  		<option value='BS'>BS</option>
							  		<option value='MS'>MS</option>
							  		<option value='PhD'>PhD</option>
							  	</select>
			     	  	</div>
					  	
						<div class="span8" style="margin-left:300px;">					      			      
					  			<input type="submit" name="submit" value="Submit Degree">						
					  	</div>
					
				   </div>
			   </div>
			 </form>
		  </fieldset>			  
		 </body>
</html>
