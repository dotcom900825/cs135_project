<%@ page language="java" import="support.*, java.util.*, sql_helper.*" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 	<title>Name</title>
 	<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
 	<script src="js/bootstrap.min.js"></script>
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
 </head>
 <%
 Vector<Applicant> application_list = null;
 Vector<Applicant> application_list2 = null;
 String specialization = null;
 String discipline = null;
 	if(request.getParameter("specialization") != null && !request.getParameter("specialization").toString().isEmpty())
	{
 		 specialization = request.getParameter("specialization");
 		 out.print(specialization);
	}
	
 	
 	if(request.getParameter("discipline") != null && !request.getParameter("discipline").toString().isEmpty())
 	{
 		discipline = request.getParameter("discipline");
 		out.print(discipline);
 	}
 	%>
 	<body>
	  <fieldset style="background: none repeat scroll 0 0 #F9F8F3;">
	  	<legend>Application Information</legend>
	  	<h3>Application List</h3>	
	  
	  	  <div class="container-fluid">
			  <div class="row-fluid">
	 <% 
 	if(specialization != null && !specialization.isEmpty())
 	{
 	DB_Helper dbConnector = new DB_Helper();
 	application_list = dbConnector.fetchApplicationWithSpecialization(specialization);
 	 			    	
		  	for(Applicant aTemp : application_list)
			{
		  	%>	
					    <div class="span2" style="margin-top:50px;">
					    	<label>
					  			<span style="margin-left:130px;">First Name</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-top:50px;">     		      
					  			<input id="FIRST_NAME" type="text"  readonly="readonly"  
					  			value="<%=aTemp.first_name%>" 
					  			maxlength="50" size="25" name="first_name">
						</div>
						
						<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Last Name</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
					  			<input id="LAST_NAME" type="text"  maxlength="50" size="25" readonly="readonly"  
					  			value="<%=aTemp.last_name%>" name="last_name">
						</div>
						
						<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Middle Initial</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
					  			<input id="MIDDLE_NAME" type="text" maxlength="50" size="25" readonly="readonly"  
					  			value="<%=aTemp.middle_name%>" name="middle_name">
						</div>
						
						<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Country</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
									<input id="COUNTRY" type="text" maxlength="50" size="25" readonly="readonly"  
									value="<%=aTemp.country%>" name="country">  	
					  	</div>
					  	
					  	<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Street Address</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
					  			<input id="STREET_ADDRESS" type="text" maxlength="50" size="25" readonly="readonly"  
					  			value="<%=aTemp.street_address%>" 
					  			name="street_address">
						</div>
					  	
					  	<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">City</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
								<input id="CITY" type="text" maxlength="50" size="25" readonly="readonly"  
								value="<%=aTemp.city%>" name="city">  	
					  	</div>
					  	
					  	<%
					  		if(!aTemp.state.isEmpty()){
					  	%>
					  	<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">State</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
								<input id="STATE" type="text" maxlength="50" size="25" readonly="readonly"  
								value="<%=aTemp.state%>" 
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
								value="<%=aTemp.zip_code%>" name="zip_code">  	
					  	</div>
					  	
					  	<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Specialization</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
								<input id="specialization" type="text" maxlength="50" size="25" readonly="readonly"  
								value="<%=aTemp.specialization%>" name="specialization">  	
					  	</div>
			 <%
			 DB_Helper connector2 = new DB_Helper();
			 
			 Vector<school_record>sList = connector2.fetchDegreeList(aTemp.unique_id);
			 
			 %>
					  	<div class="span11" style="margin-top:20px">
					    	<label>
					  			<span style="margin-left:100px; font-size:25px">Degree List</span>
					  		</label>
					  	</div>
					  	<br/>
					  	<br/>
					    <%					   					    										    				  		
					  		for(school_record key : sList)	
					  	{
					  	%>
					  		
							<div class="span2" style="margin-top:20px">
						    	<label>
						  			<span style="margin-left:100px;">School Name</span>
						  		</label>
					  		</div>
						  	<div class="span9" style="margin-top:20px; margin-left:0px">
						  	<input  type="text"  size="25" readonly="readonly" 
						  			value="<%=key.school_name%>">	
						  			
							</div>
							
							<div class="span2">
						    	<label>
						  			<span style="margin-left:100px;">Discipline</span>
						  		</label>
					  		</div>
						  	<div class="span9" style="margin-left:0px;">					      			      
						  			<input  type="text"  maxlength="50" size="25" readonly="readonly"  
						  			value="<%=key.discipline%>">
							</div>
							
							<div class="span2">
						    	<label>
						  			<span style="margin-left:100px;">GPA</span>
						  		</label>
					  		</div>
						  	<div class="span9" style="margin-left:0px;">					      			      
						  			<input  type="text"  maxlength="50" size="25" readonly="readonly"  
						  			value="<%=key.GPA%>">
							</div>
							
							<div class="span2">
						    	<label>
						  			<span style="margin-left:100px;">Degree</span>
						  		</label>
					  		</div>
						  	<div class="span9" style="margin-left:0px;">					      			      
						  			<input  type="text"  maxlength="50" size="25" readonly="readonly"  
						  			value="<%=key.degree%>">
							</div>
							
							<div class="span2">
						    	<label>
						  			<span style="margin-left:100px;">Degree Time</span>
						  		</label>
					  		</div>
						  	<div class="span9" style="margin-left:0px;">					      			      
						  			<input  type="text"  maxlength="50" size="25" readonly="readonly"  
						  			value="<%=key.degree_time%>">
							</div>
							<br />
					  	<%
							} 
					    %>

					    <%
					}
 	}
 	if(discipline != null && !discipline.isEmpty())
 	{
 		DB_Helper dbConnector = new DB_Helper();
 		application_list2 = dbConnector.fetchApplicationWithDiscipline(discipline);
 	 	//out.print(application_list.size());
 						
						for(Applicant aTemp : application_list2)
			{
		  	%>	
					    <div class="span2" style="margin-top:50px;">
					    	<label>
					  			<span style="margin-left:130px;">First Name</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-top:50px;">     		      
					  			<input id="FIRST_NAME" type="text"  readonly="readonly"  
					  			value="<%=aTemp.first_name%>" 
					  			maxlength="50" size="25" name="first_name">
						</div>
						
						<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Last Name</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
					  			<input id="LAST_NAME" type="text"  maxlength="50" size="25" readonly="readonly"  
					  			value="<%=aTemp.last_name%>" name="last_name">
						</div>
						
						<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Middle Initial</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
					  			<input id="MIDDLE_NAME" type="text" maxlength="50" size="25" readonly="readonly"  
					  			value="<%=aTemp.middle_name%>" name="middle_name">
						</div>
						
						<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Country</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
									<input id="COUNTRY" type="text" maxlength="50" size="25" readonly="readonly"  
									value="<%=aTemp.country%>" name="country">  	
					  	</div>
					  	
					  	<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Street Address</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
					  			<input id="STREET_ADDRESS" type="text" maxlength="50" size="25" readonly="readonly"  
					  			value="<%=aTemp.street_address%>" 
					  			name="street_address">
						</div>
					  	
					  	<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">City</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
								<input id="CITY" type="text" maxlength="50" size="25" readonly="readonly"  
								value="<%=aTemp.city%>" name="city">  	
					  	</div>
					  	
					  	<%
					  		if(!aTemp.state.isEmpty()){
					  	%>
					  	<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">State</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
								<input id="STATE" type="text" maxlength="50" size="25" readonly="readonly"  
								value="<%=aTemp.state%>" 
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
								value="<%=aTemp.zip_code%>" name="zip_code">  	
					  	</div>
					  	
					  	<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Specialization</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
								<input id="specialization" type="text" maxlength="50" size="25" readonly="readonly"  
								value="<%=aTemp.specialization%>" name="specialization">  	
					  	</div>
			 <%
			 DB_Helper connector2 = new DB_Helper();
			 
			 Vector<school_record>sList = connector2.fetchDegreeListDiscipline(aTemp.unique_id,discipline);
			 
			 %>
					  	<div class="span11" style="margin-top:20px">
					    	<label>
					  			<span style="margin-left:100px; font-size:25px">Degree List</span>
					  		</label>
					  	</div>
					  	<br/>
					  	<br/>
					    <%					   					    										    				  		
					  		for(school_record key : sList)	
					  	{
					  	%>
					  		
							<div class="span2" style="margin-top:20px">
						    	<label>
						  			<span style="margin-left:100px;">School Name</span>
						  		</label>
					  		</div>
						  	<div class="span9" style="margin-top:20px; margin-left:0px">
						  	<input  type="text"  size="25" readonly="readonly" 
						  			value="<%=key.school_name%>">	
						  			
							</div>
							
							<div class="span2">
						    	<label>
						  			<span style="margin-left:100px;">Discipline</span>
						  		</label>
					  		</div>
						  	<div class="span9" style="margin-left:0px;">					      			      
						  			<input  type="text"  maxlength="50" size="25" readonly="readonly"  
						  			value="<%=key.discipline%>">
							</div>
							
							<div class="span2">
						    	<label>
						  			<span style="margin-left:100px;">GPA</span>
						  		</label>
					  		</div>
						  	<div class="span9" style="margin-left:0px;">					      			      
						  			<input  type="text"  maxlength="50" size="25" readonly="readonly"  
						  			value="<%=key.GPA%>">
							</div>
							
							<div class="span2">
						    	<label>
						  			<span style="margin-left:100px;">Degree</span>
						  		</label>
					  		</div>
						  	<div class="span9" style="margin-left:0px;">					      			      
						  			<input  type="text"  maxlength="50" size="25" readonly="readonly"  
						  			value="<%=key.degree%>">
							</div>
							
							<div class="span2">
						    	<label>
						  			<span style="margin-left:100px;">Degree Time</span>
						  		</label>
					  		</div>
						  	<div class="span9" style="margin-left:0px;">					      			      
						  			<input  type="text"  maxlength="50" size="25" readonly="readonly"  
						  			value="<%=key.degree_time%>">
							</div>
							<br />
					  	<%
							} 
					  
			}
					    
					}
						  %>
		  </fieldset>			  
		 </body>
</html>
