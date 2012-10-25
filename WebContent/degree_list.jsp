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
	String school_name = request.getParameter("school");
	String gpa = request.getParameter("gpa");
	String degree_time = request.getParameter("degree_time");
	String discipline = request.getParameter("discipline");
	String degree = request.getParameter("degree");

	list_reader dbConnecter = new list_reader();
	if(school_name != null)
	{
		try
		{
			dbConnecter.storeDegreeInfo(school_name, degree, discipline, degree_time, gpa);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	try
	{
		dbConnecter.deleteSchool(request.getParameter("del_school"));
	}
	catch(Exception ex)
	{
		ex.printStackTrace();
	}
	// keep this code, in case we want to allow user to remodify his form
	//school_record.GPA = request.getParameter("gpa");
	//school_record.degree_time = request.getParameter("degree_time");
	//school_record.discipline = request.getParameter("discipline");
	//school_record.degree = request.getParameter("degree");
	

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
					  			value="<%out.print(util.streetAddress);%>" 
					  			name="street_address">
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
								value="<%out.print(util.states);%>" 
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
								value="<%out.print(util.zipCode);%>" name="zip_code">  	
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
					        	   String schoolName1 = rs.getString(2);
					        	   String discipline1 = rs.getString(3);
					        	   String gpa1 = rs.getString(4);
					        	   String degree1 = rs.getString(5);
					        	   String degree_time1 = rs.getString(6);
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
						  		<form method="GET" action="degree_list.jsp">				      			      
						  			<input  type="text"  maxlength="50" size="25" readonly="readonly" 
						  			value="<%=((degreeInfo)degree_list.get(i)).school_name%>" name="del_school">
						  			
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
							<br />
					  	<%
							} 
						%>
						<form method="GET" action="chooseLocation.jsp">
							<div class="span8" style="margin-left:300px;">					      			      
						  			<input type="submit" name="submit" value="Submit Next Degree">						
						  	</div>
						</form>
						
						<!-- Sharon, please insert action code here! -->
						<form method="GET" action="">
							<div class="span8" style="margin-left:300px;">					      			      
						  			<input type="submit" name="submit" value="Done">						
						  	</div>
					  	</form>
				   </div>
			   </div>
			
		  </fieldset>	
</body>
</html>