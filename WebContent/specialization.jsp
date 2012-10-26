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
	// keep this code, in case we want to allow user to remodify his form
	//school_record.GPA = request.getParameter("gpa");
	//school_record.degree_time = request.getParameter("degree_time");
	//school_record.discipline = request.getParameter("discipline");
	//school_record.degree = request.getParameter("degree");
	

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
					    Connection connection;   
					    Vector degree_list = new Vector();
					    try 
						{
							Class.forName("org.postgresql.Driver"); 
						} 
						catch (ClassNotFoundException e)
						{ 
							System.out.println("Where is your PostgreSQL JDBC Driver? "
									+ "Include in your library path!");
							e.printStackTrace();
							return;
						} 
						 connection = null;
				 
						try 
						{

							connection = DriverManager.getConnection(
									"jdbc:postgresql://127.0.0.1:5432/grad_admin", "postgres",
									"4742488");
						} 
						catch (SQLException e) 
						{
							e.printStackTrace();
							return;
						}
						if (connection != null) 
						{
							try
							{				
								java.sql.Statement st = connection.createStatement();
					            String sql = "select * from degree_list";
					            ResultSet rs =  st.executeQuery(sql);
					           while(rs.next())
					           {
					        	   String sID = rs.getString(1);
					        	   String schoolName1 = rs.getString(5);
					        	   String discipline1 = rs.getString(6);
					        	   String gpa1 = rs.getString(7);
					        	   String degree1 = rs.getString(8);
					        	   String degree_time1 = rs.getString(9);
					        	   degreeInfo dInfo = new degreeInfo(sID, schoolName1,discipline1,gpa1,degree1,degree_time1);
					        	   degree_list.add(dInfo);
					           }
					            st.close();
					            connection.close();
							}
							catch(Exception ex)
							{
								
							}
						} else {
							System.out.println("Failed to make connection!");
						}
					   					    										    
					    %>
					  	
					  	<%
					  		for(int i = 0; i < degree_list.size(); i++)
					  		{
					  	%>
					  		
							<div class="span2" style="margin-top:20px">
						    	<label>
						  			<span style="margin-left:100px;">School Name</span>
						  		</label>
					  		</div>
						  	<div class="span9" style="margin-top:20px; margin-left:0px">	     			      
						  			<input  type="text"  maxlength="50" size="25" readonly="readonly" 
						  			value="<%=((degreeInfo)degree_list.get(i)).school_name%>">
						  			
							</div>
							
							<div class="span2">
						    	<label>
						  			<span style="margin-left:100px;">Discipline</span>
						  		</label>
					  		</div>
						  	<div class="span9" style="margin-left:0px;">					      			      
						  			<input  type="text"  maxlength="50" size="25" readonly="readonly"  
						  			value="<%=((degreeInfo)degree_list.get(i)).discipline%>">
							</div>
							
							<div class="span2">
						    	<label>
						  			<span style="margin-left:100px;">GPA</span>
						  		</label>
					  		</div>
						  	<div class="span9" style="margin-left:0px;">					      			      
						  			<input  type="text"  maxlength="50" size="25" readonly="readonly"  
						  			value="<%=((degreeInfo)degree_list.get(i)).GPA%>">
							</div>
							
							<div class="span2">
						    	<label>
						  			<span style="margin-left:100px;">Degree</span>
						  		</label>
					  		</div>
						  	<div class="span9" style="margin-left:0px;">					      			      
						  			<input  type="text"  maxlength="50" size="25" readonly="readonly"  
						  			value="<%=((degreeInfo)degree_list.get(i)).degree%>">
							</div>
							
							<div class="span2">
						    	<label>
						  			<span style="margin-left:100px;">Degree Time</span>
						  		</label>
					  		</div>
						  	<div class="span9" style="margin-left:0px;">					      			      
						  			<input  type="text"  maxlength="50" size="25" readonly="readonly"  
						  			value="<%=((degreeInfo)degree_list.get(i)).degree_time%>">
							</div>
							
					  	<%
							} 
					  	support s = new support();   	
							   	
							   	String path1 = config.getServletContext().getRealPath("/support/specializations.txt");
							    //getCountriesAndStates returns a vector of the countries to be used for choosing citizenship
							    Vector specializations = s.getSpecializations(path1); 
							    %>
							    
					<form method="GET" action="verification.jsp">
						<div class="span2" style="margin-top:50px">
					    	<label>
					  			<span style="margin-left:100px;">Specialization</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-top:50px; margin-left:0px;">
							    	<%
							    	out.println("<select name=\"specialization\">");
							    	for(int i=0; i<specializations.size(); i++)
								        out.println("<option" + " value=" + (String)specializations.get(i) + ">" + (String) specializations.get(i) + "</option>");
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