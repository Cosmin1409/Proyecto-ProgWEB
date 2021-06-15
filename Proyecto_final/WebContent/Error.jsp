<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>v_PRUEBAS</title>
</head>
<body>
<%
session.invalidate();
response.sendRedirect(request.getContextPath() +"/Principal.jsp");
%>
</body>
</html>