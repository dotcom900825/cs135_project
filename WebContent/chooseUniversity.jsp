<%@ page language="java" import="support.*, java.util.* ,sql_helper.*, java.sql.*" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 	<title>ChooseUniversity</title>
 	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
 	<script src="js/bootstrap.min.js"></script>
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
 	<script text="javascript">
 		
 		function checkUniversity(uName)
 		{
 		var xmlHttp;
 		xmlHttp = GetXmlHttpObject();
 		if (xmlHttp == null)
 		{
 		  alert ("Your browser does not support AJAX!");
 		  return;
 		}
 		var url="checkUniversity.jsp";
 		url=url+"?university="+uName;
 		
 		xmlHttp.onreadystatechange = function()
 		{ 
	 		if (xmlHttp.readyState==4)
	 		{
	 			var xmlDoc=xmlHttp.responseXML.documentElement;
	 			var feedback= xmlDoc.getElementsByTagName("flag")[0].childNodes[0].nodeValue;
	 			if(feedback == "true")
	 				{
	 				 alert(feedback);
	 				}
	 			else
	 				{
	 					//alert(feedback);	 					
	 				}
	 		}
 		};
	 		xmlHttp.open("GET",url,true);
	 		xmlHttp.send(null);
 		}

 		
 		function GetXmlHttpObject()
 		{
 		var xmlHttp=null;
 		try
 		  {
 		  // Firefox, Opera 8.0+, Safari
 		  xmlHttp=new XMLHttpRequest();
 		  }
 		catch (e)
 		  {
 		  // Internet Explorer
 		  try
 		    {
 		    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
 		    }
 		  catch (e)
 		    {
 		    xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
 		    }
 		  }
 		return xmlHttp;
 		}

 	</script>
 </head>
 <%
 	
	String place = request.getParameter("place");//Get country or state name
 	session.setAttribute("place", place); 
	
 	String first_name = session.getAttribute("first_name").toString();
	String last_name = session.getAttribute("last_name").toString();
	String middle_name = session.getAttribute("middle_name").toString();
	String country_name = session.getAttribute("country").toString();
    String street_name = session.getAttribute("street_address").toString();
    String city = session.getAttribute("city").toString();
    String zip_code = session.getAttribute("zip_code").toString();
    String state = "";
    //if the user has choosen US, then user needs to choose state, otherwise remain null
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
							 	DB_Helper connector = new DB_Helper();
							  	Vector school_list = connector.fetchSchool(place);
							  	if(session.getAttribute("new_added_school_list") != null)
							  	{
							  		HashMap schoolList = (HashMap)session.getAttribute("new_added_school_list");
							  		if(schoolList.get(place) != null)
							  		{
							  			school_list.add(schoolList.get(place));
							  		}
							  	}
							   	Iterator it = school_list.iterator();
							   	int columnNum = 0;
							   	out.print("<tr>");
							   	while(it.hasNext())
							   	{							   		
							   		while(it.hasNext() && columnNum < 3)
							   		{
							   			String school = it.next().toString();
									 	   out.println("<th><a href='./chooseDiscipline.jsp?school=" + school + " '>" 
									       + school+"</a></th>");   
									 	columnNum++;
							   		}
							   		columnNum = 0;
							   		out.print("</tr>");
							   	}
							   		
							  %>
						</table>
						
						<!-- If there is no user's university, user can type in new one -->
						<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Other University</span>
					  		</label>
					  	</div>
					  	<div class="span8" style="margin-left:0px;">					      			      
								<input id="other_university" type="text" maxlength="50" size="25"   
								value="Please enter the university's name" name="added_school_name" onkeyup="checkUniversity(this.value)">  	
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
