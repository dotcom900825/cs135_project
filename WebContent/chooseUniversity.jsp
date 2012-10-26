<%@ page language="java" import="support.*, java.util.* ,java.sql.*" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 	<title>ChooseUniversity</title>
 	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
 	<script src="js/bootstrap.min.js"></script>
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
 </head>
 <%
	 String place = request.getParameter("place");

	 
	 session.setAttribute("place", place);

    
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
 %>
 <!-- This page contains some errors, it can not show the value inputed from index.jsp  -->
		 <body>
		  <fieldset style="background: none repeat scroll 0 0 #F9F8F3;">
		  	<legend>Personal Information</legend>
		  	<form method="POST" action="chooseDiscipline.jsp">	
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
					  	<div class="span8" style="margin-left:0px;">					      			      
								<input id="ZIP_CODE" type="text" maxlength="50" size="25" readonly="readonly"  
								value="<%out.print(zip_code);%>" name="zip_code">  	
					  	</div>
					  	
					  	<table width="100%" class="table">
							  <%
							  
							    Connection connection;   
							    Vector school_list = new Vector();
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
										

							           String sql = "select cs_id from countries_and_states where country_state ='"+ place + "'";
																
							             ResultSet rs =  st.executeQuery(sql);
							               rs.next();
							        	   int cs_id = rs.getInt(1);
					
							        	   sql = "select university from universities where country_state_id ='"+ cs_id + "'";
							        	   rs =  st.executeQuery(sql);
							        	   
							        	   while(rs.next())
							        	   {
							        		   String school_name = rs.getString(1);
							        		   school_list.add(school_name);
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
							   					    										    

							 	for(int row = 0; row < school_list.size() / 3; row ++)
							 	{
									  out.print("<tr>");
									  for(int column = 0; column < 3; column++)
									   {
									       String school = (String)school_list.get(row * 3 + column);
									 	   out.println("<th><a href='./chooseDiscipline.jsp?school=" + school + " '>" + school+"</a></th>");    
									   }
									  out.print("</tr>");									         				 	      
							 	}
							   	//Vector tuple = (Vector)universities.get(universities.indexOf(place));
							 	/*Vector u = (Vector)tuple.get(1);
						         for(int row = 0; row < u.size()/3; row++)
						         {
						        	 for(int column = 0; column < 3; column++)
						        	 {
						        		String school = (String)u.get(row * 3 + column);
						 		        out.println("<th><a href='localhost:8080/assignment1/chooseDiscipline.jsp?school=" + school + " '>" + school+"</a></th>");    
						        	 }
						         }*/
						            							  							           			   							  
							  %>
						</table>
						
						<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Other University</span>
					  		</label>
					  	</div>
					  	<div class="span8" style="margin-left:0px;">					      			      
								<input id="ZIP_CODE" type="text" maxlength="50" size="25"   
								value="Please enter the university's name" name="added_school_name">  	
					  	</div>
					  	
						<div class="span8" style="margin-left:300px;">					      			      
					  			<input type="submit" name="submit" value="Submit Other university">						
					  	</div>
					
				   </div>
			   </div>
			 </form>
		  </fieldset>			  
		 </body>
</html>
