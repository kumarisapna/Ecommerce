<%@page import="com.entity.User"%>
<%
User user = (User)session.getAttribute("currentUser");
	if(user==null){
		
		session.setAttribute("msg", "You are not logged in!! Login First");
		response.sendRedirect("login");
		return;
	}
	
	
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Panel</title>
<%@include file="./base.jsp"%>
</head>
<body>
	<%@include file="./navbar.jsp"%>
</body>
</html>