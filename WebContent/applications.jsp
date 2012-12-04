<%@ page language="java" import="support.*, java.util.*, sql_helper.*" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 	<title>Name</title>
 	<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
 	<script src="js/bootstrap.min.js"></script>
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
 	<script>
 	var check = [];
 	$(document).ready(function(){
 		$.ajaxSetup ({
 			cache: false
 		});
			
 	})
 	function hideInfo(btn)
 	{
 		$("#result").css('display','none');
 		$(btn).parent().find('.btn-primary').css('display','inline'); 
 		$(btn).css('display','none');
 	}
 	
 	function loadInfo(button){
 		for(var i = 0; i < check.length; i++)
 			{
	 			$(check[i]).parent().find('.btn-primary').css('display','inline');
	 			$(check[i]).css('display','none');
	 			check.pop();
 			}
	 		check.push($(button).parent().find('.btn-info'));
	 		uid = button.id;
	 		var infoButton = $(button).parent().find('.btn-info');
	 		var ajax_load = "<img class='loading' src='img/load.gif' alt='loading...' />";
	 		var loadUrl = "personalInfo.jsp";
	 		loadUrl += (("?uid=") + uid);
	 		$("#result").html(ajax_load).load(loadUrl).css('display','inline');
	 		$(button).parent().find('.btn-info').css('display','inline'); //show hide applicaiton button
	 		$(button).css('display','none'); //hide show application button
 		};
	

 	</script>
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
			 	<div id="result">
			 	</div>
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
					  			<span style="margin-left:130px;">Application</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-top:50px;">     		      
					  			<input id="FIRST_NAME" type="text"  readonly="readonly"  
					  			value="<%=aTemp.first_name + " " + aTemp.middle_name + " " + aTemp.last_name %>" 
					  			maxlength="50" size="25" name="first_name">
					  			<span>
					  				<button id="<%=aTemp.unique_id%>"class="btn btn-primary" onClick="loadInfo(this); ">
					  				  Show Application
					  				</button>
					  				<button class="btn btn-info" style="display:none" onClick="hideInfo(this); ">
					  					Hide Application
					  				</button>
					  			</span>
						</div>					
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
					  			<span style="margin-left:130px;">Application</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-top:50px;">     		      
					  			<input id="FIRST_NAME" type="text"  readonly="readonly"  
					  			value="<%=aTemp.first_name + " " + aTemp.middle_name + " " + aTemp.last_name %>" 
					  			maxlength="50" size="25" name="first_name">
					  			<span>
					  				<button id="<%=aTemp.unique_id%>"class="btn btn-primary" onClick="loadInfo(this);">
					  				  Show Application
					  				</button>
					  				<button class="btn btn-info" style="display:none" onClick="hideInfo(this); ">
					  					Hide Application
					  				</button>
					  			</span>
						</div>			
			 <%
			 } 
 	}
			 %>
		  </fieldset>			  
		 </body>
</html>
