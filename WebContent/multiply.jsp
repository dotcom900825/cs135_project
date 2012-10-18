<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>Multiply by 3 (JSP)</title>
  </head>
<body>
    <%
       int times = 3;
String firstName = request.getParameter("first_name");
String lastName = request.getParameter("last_name");
String middleName = request.getParameter("middle_name");
    %>
<%= firstName + "  " + lastName + "  " + middleName%>
  </body>
</html>