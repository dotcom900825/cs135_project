<%@ page language="java" import="support.*, java.util.*, sql_helper.*" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 	<title>Name</title>
 	<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
 	<script src="js/bootstrap.min.js"></script>
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
 	
 	
 </head>
 <%
 	DB_Helper dbConnector = new DB_Helper();
 	Vector disciplineList = dbConnector.DisciplineFromDegreeList();

 %>
		 <body>
		  <fieldset style="background: none repeat scroll 0 0 #F9F8F3;">
		  	<legend>SpecializationAnalysis</legend>
		  		
		  	<h3>Cumulative number of applications for each Specialization</h3>		  
		  	  <div class="container-fluid">
				  <div class="row-fluid">
				  
						<!-- Country part -->
						<%
							for(int i = 0; i < disciplineList.size(); i++)
							{
								
						%>
						<div class="span4">
					    	<label>
					  			<a style="margin-left:100px;" href="./Applications.jsp"><%=disciplineList.get(i)%></a>
					  		</label>
					  	</div>
					  	<div class="span6 fieldgroup" style="margin-left:0px;">					      			      
								  	
					  	</div>
					  	<%
							}
					  	%>
					  		
						<div class="span8" style="margin-left:300px;">					      			      
					  			<input type="submit" name="submit" value="Submit Personal Data">						
					  	</div>
					
				   </div>
			   </div>
			
		  </fieldset>			  
		 </body>
</html>