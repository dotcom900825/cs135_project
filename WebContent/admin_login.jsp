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
 	<script text="javascript">
 	(function($,W,D)
 			{
 			    var JQUERY4U = {};
 			 
 			    JQUERY4U.UTIL =
 			    {
 			        setupFormValidation: function()
 			        {
 			            //form validation rules
 			            $("#register-form").validate({
 			                rules: {
 			                    username: "required",
 			                    password: "required"
 			                },
 			                messages: {
 			                    username: "Please enter your username",
 			                    password: "Please enter your password"
 			                },
 			                submitHandler: function(form) {
 			                    form.submit();
 			                }
 			            });
 			        }
 			    }
 			 
 			    //when the dom has loaded setup form validation rules
 			    $(D).ready(function($) {
 			        JQUERY4U.UTIL.setupFormValidation();
 			    });
 			 
 			})(jQuery, window, document);
 	</script>
 </head>
 <%
 	
 %>
		 <body>
		  <fieldset style="background: none repeat scroll 0 0 #F9F8F3;">
		  	<legend>Chair Login</legend>
		  	<form method="POST" action="admin_portal.jsp" id="register-form" novalidate="novalidate">	
		  	<h3>Account info</h3>		  
		  	  <div class="container-fluid">
				  <div class="row-fluid">
				  		
				  		<!-- First Name part -->
					    <div class="span2">
					    	<label>
					  			<span style="margin-left:130px;">Username</span>
					  		</label>
					  	</div>
					  	<div class="span9 fieldgroup">     		      
					  			<input id="signupform" type="text"  maxlength="50" size="25" name="username">
						</div>
						
						<!-- Last Name part -->
						<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Password</span>
					  		</label>
					  	</div>
					  	<div class="span9 fieldgroup" style="margin-left:0px;">					      			      
					  			<input id="LAST_NAME" type="text"  maxlength="50" size="25" name="password">
						</div>
						
						
						<div class="span8" style="margin-left:300px;">					      			      
					  			<input type="submit" name="submit" value="Submit Personal Data">						
					  	</div>
					
				   </div>
			   </div>
			 </form>
		  </fieldset>			  
		 </body>
</html>
