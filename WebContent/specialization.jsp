<%@ page language="java" import="support.*, java.util.* , java.sql.* ,sql_helper.*" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 	<title>Specialization</title>
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
	try
	{
		  state = session.getAttribute("state").toString();
	}
	catch(Exception ex)
	{
		state = "";
	}
	DB_Helper dbConnection = new DB_Helper();
%>
<fieldset style="background: none repeat scroll 0 0 #F9F8F3;">
		  	<legend>Personal Info</legend>
		  		
		  	<h3>Specialization</h3>		  
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
		  	
							   	
										    Vector specializations = dbConnection.fetchSpecializations(); 	 
							    %>
							    
					<form method="GET" action="verification.jsp">
						<div class="span2" style="margin-top:50px">
					    	<label>
					  			<span style="margin-left:100px;">Specialization</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-top:50px; margin-left:0px;">
							    	<%//print out the specialization from text file
							    	out.println("<select name=\"specialization\">");
							    	for(int i=0; i<specializations.size(); i++)
								        out.println("<option" + " value='" + (String)specializations.get(i) + "'>" + (String) specializations.get(i) + "</option>");
									out.println("</select> </div>");
							    
								%>
						</div>
					
							<div class="span8" style="margin-left:300px;">					      			      
						  			<input type="submit" name="submit" value="Submit">						
						  	</div>
					</form>	
						
				   </div>
			   </div>
			
		  </fieldset>	
</body>
</html>