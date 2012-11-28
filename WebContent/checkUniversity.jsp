<%@ page language="java" import="support.*, java.util.* ,sql_helper.*, java.sql.*" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<% response.setContentType("text/xml") ; %>
<% 
String uName=request.getParameter("university");
System.out.println(uName);
DB_Helper db = new DB_Helper();
boolean flag = db.checkUniversity(uName);

if (flag == true)
  {
%>
<schoolExist>
 <flag>true</flag>
</schoolExist>
<%
  }
else
  {
%>
<schoolExist>
 <flag>false</flag>
</schoolExist>
<%
  }
%>

