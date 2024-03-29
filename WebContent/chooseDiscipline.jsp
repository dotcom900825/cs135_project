	<%@ page language="java" import="support.*, java.util.*, sql_helper.*, java.sql.*" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 	<title>ChooseDicipline</title>
 	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
 	<link href="${pageContext.request.contextPath}/css/datepicker.css" rel="stylesheet">
 	<script src="js/bootstrap.min.js"></script>
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
 	<script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.js"> </script>
 	<script>

 	$(function(){
		window.prettyPrint && prettyPrint();
		$('#dp1').datepicker({
			format: 'mm-dd-yyyy'
		});
		$('#dp2').datepicker();
		$('#dp3').datepicker();
		$('#dp3').datepicker();
		$('#dpYears').datepicker();
		$('#dpMonths').datepicker();
		
		
		var startDate = new Date(2012,1,20);
		var endDate = new Date(2012,1,25);
		$('#dp4').datepicker()
			.on('changeDate', function(ev){
				if (ev.date.valueOf() > endDate.valueOf()){
					$('#alert').show().find('strong').text('The start date can not be greater then the end date');
				} else {
					$('#alert').hide();
					startDate = new Date(ev.date);
					$('#startDate').text($('#dp4').data('date'));
				}
				$('#dp4').datepicker('hide');
			});
		$('#dp5').datepicker()
			.on('changeDate', function(ev){
				if (ev.date.valueOf() < startDate.valueOf()){
					$('#alert').show().find('strong').text('The end date can not be less then the start date');
				} else {
					$('#alert').hide();
					endDate = new Date(ev.date);
					$('#endDate').text($('#dp5').data('date'));
				}
				$('#dp5').datepicker('hide');
			});
	});
</script>

 	</script>
 </head>
 <%
 	//get school name, whether from existed one from selected hyperlink
 	//or the new one from input box
 	String school_name = request.getParameter("school");
    String school = "";
    String new_added_school = null;
 	if(school_name == null || school_name.isEmpty())
 	{
 		if(!request.getParameter("added_school_name").isEmpty())
 		{
 			school = request.getParameter("added_school_name");
 			new_added_school = school;
 		}
 	}
 	
 	else
 	{
 		school = school_name;
 	}
 	session.setAttribute("school", school);
 	
 	String first_name = session.getAttribute("first_name").toString();
	String last_name = session.getAttribute("last_name").toString();
	String middle_name = session.getAttribute("middle_name").toString();
	String country_name = session.getAttribute("country").toString();
 	String street_name = session.getAttribute("street_address").toString();
	String city = session.getAttribute("city").toString();
 	String zip_code = session.getAttribute("zip_code").toString();
 	String place = session.getAttribute("place").toString();
 	String state = "";
    try
    {
   	  state = session.getAttribute("state").toString();
    }
    catch(Exception ex)
    {
    	state = "";
    }
    
    DB_Helper connector = new DB_Helper();
    Vector disc_list = connector.fetchDiscipline();
    if(session.getAttribute("new_added_discipline") != null)
    {
    		Vector new_added_discipline_list = (Vector)session.getAttribute("new_added_discipline");
    		for(int i = 0; i < new_added_discipline_list.size(); i++)
    		{
    			disc_list.add(new_added_discipline_list.get(i));
    		}
    }
	if(session.getAttribute("new_added_school") == null)
	{
		HashMap new_school_list = new HashMap();
		new_school_list.put(place, school);
		session.setAttribute("new_added_school_list", new_school_list);
	}
	else
	{
		HashMap school_list = (HashMap)session.getAttribute("new_added_school_list");
		school_list.put(place, school);
		session.setAttribute("new_added_school_list", school_list);
	}
	//now we want to insert the newly added school to database
	
	/*if(request.getParameter("added_school_name") !=null && !request.getParameter("added_school_name").isEmpty())
{
    
	if (connection != null) 
	{
		try
		{		
		   //in order to insert the school, we need to fetch the country_state_id first
		   java.sql.Statement st = connection.createStatement();			
           String sql = "select cs_id from countries_and_states where country_state ='"+ place + "'";								
           ResultSet rs =  st.executeQuery(sql);
           rs.next();
           int cs_id = rs.getInt(1);
           //then we can do the insertion with the school name and cs_id
		   sql = "insert into universities(country_state_id, university)" +
					"values ('" + cs_id + "', '" + school+ "')";
		   st.executeUpdate(sql);
           st.close();
           connection.close();
		}
		catch(Exception ex)
		{
			
		}
	} 
	else
	{
		System.out.println("Failed to make connection!");
	}
}
	 if(!connection.isClosed())
	 {
	  connection.close();							  	
	 }*/
  %>
 
 <!-- This page contains some errors, it can not show the value inputed from index.jsp  -->
		 <body>
		  <fieldset style="background: none repeat scroll 0 0 #F9F8F3;">
		  	<legend>Personal Information</legend>
		  	<form method="GET" action="degree_list.jsp">	
		  	<h3>Choose Discipline</h3>		  
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
					  			value="<%out.print(street_name);%>" name="street_address">
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
								value="<%out.print(state);%>" name="state">  	
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
								value="<%out.print(zip_code);%>" 
								name="zip_code">  	
					  	</div>
					  	
					  	<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">School</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
									<input id="SCHOOL" type="text" maxlength="50" size="25" readonly="readonly"  
									value="<%out.print(school);%> "name="school">  	
					  	</div>
					  	
					  <div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Discipline</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
							<%
							 for(int i=0; i<disc_list.size(); i++)
						         out.println("<input type='radio' value='" + disc_list.get(i) + "'" + "name='discipline'" +  ">" + disc_list.get(i) + "<br>");
						   	 out.println("or custom discipline: ");
						   	%>
							<input id="DISCIPLINE" type="text" maxlength="50" size="25" name="new_discipline"> 

											  			
					  	</div>
					  	
					  	<div class="span3" style="margin-left:-85px">
					    	<label>
					  			<span style="margin-left:100px;">Expected time or awared time</span>
					  		</label>
					  	</div>

			     	  	
			     	  	
						  <div class="span9 input-append date" id="dp3" style="margin-left:0px;">
							<input size="16"  id="dp1" type="text" value="02-2012"  data-date-viewmode="years" data-date-format="mm/yyyy" data-date-minviewmode="months" name="degree_time">
						  </div>
          				
			     	  	
			     	  	<div class="span3" style="margin-left:-85px">
					    	<label>
					  			<span style="margin-left:100px;">Expected or awarded GPA</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
							  	<input id="gpa" type="text"  maxlength="50" size="25" name="gpa">
			     	  	</div>
			     	  	
			     	  	<div class="span2">
					    	<label>
					  			<span style="margin-left:100px;">Degree List</span>
					  		</label>
					  	</div>
					  	<div class="span9" style="margin-left:0px;">					      			      
							  	<select name="degree">
							  		<option value='BS'>BS</option>
							  		<option value='MS'>MS</option>
							  		<option value='PhD'>PhD</option>
							  	</select>
			     	  	</div>
					  	
						<div class="span8" style="margin-left:300px;">					      			      
					  			<input type="submit" name="submit" value="Submit Degree">						
					  	</div>
					
				   </div>
			   </div>
			 </form>
		  </fieldset>			  
		 </body>
</html>
