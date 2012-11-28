<%@ page language="java" import="support.*, java.util.*, java.sql.*, sql_helper.*" contentType="text/html; charset=GB18030"
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
 
	DB_Helper db_conn = new DB_Helper();
	Vector<String> li = db_conn.fetchDisciplineAnalList();

	out.println("<P ALIGN='center'><TABLE BORDER=5>");
 %>
		 <body>
		  <fieldset style="background: none repeat scroll 0 0 #F9F8F3;">
		  	<legend>DisciplineAnalysis</legend>
		  		
		  	<h3>Cumulative number of applications for each Discipline</h3>		  
		  	  <div class="container-fluid">
				  <div class="row-fluid">
				  <%
				  while(!li.isEmpty())
					{
				  %>
						<!-- Country part -->
						<div class="span4">
					    	<label>
					  			<span style="margin-left:100px;"><%=li.get(0)%></span>
					  		</label>
					  	</div>
					  	<div class="span6 fieldgroup" style="margin-left:0px;">					      			      
							<a href="./applications.jsp?discipline=<%=li.get(0)%>"><%=li.get(1)%></a>
					  	</div>
					  	<%
							li.remove(0);
							li.remove(0);
					  	}
					  	%>
					
				   </div>
			   </div>
			
		  </fieldset>			  
		 </body>
</html>