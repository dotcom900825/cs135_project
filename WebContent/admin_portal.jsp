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
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	DB_Helper dbConnection = new DB_Helper();
	boolean flag = dbConnection.checkAdmin(username, password);
 %>
		 <body>
		  <fieldset style="background: none repeat scroll 0 0 #F9F8F3;">
		  	<legend>Personal Information</legend>
		  	<h3>Full legal Name</h3>		  
		  	  <div class="container-fluid">
				  <div class="row-fluid">
				  		<% 
				  			if(flag)
				  			{
				  		%>
				  		<!-- First Name part -->
					    <div class="span2">
					    	<label>
					  			<a href="SpecializationAnalysis.jsp?auth=true">Specialization Analytics</a>
					  		</label>
					  	</div>
						
						<!-- Last Name part -->
						<div class="span2">
					    	<label>
					  			<a href="DisciplineAnalysis.jsp?auth=true">Discipline Analytics</a>
					  		</label>
					  	</div>						
						
						<%
				  			}
				  			else
				  			{
						%>
							<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Wrong username or password</span>
					  		</label>
					  	</div>
							
						<%
				  			}
						%>
				   </div>
			   </div>
		  </fieldset>			  
		 </body>
</html>
