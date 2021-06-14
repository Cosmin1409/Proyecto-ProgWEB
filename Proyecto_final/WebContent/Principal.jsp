<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<link href="${pageContext.request.contextPath}/Principal.css" rel="stylesheet" type="text/css">
<body>
<% session.invalidate();%>
<div>
<a href="${pageContext.request.contextPath}/formLogin.jsp">Login</a>
<br/>
<a href="${pageContext.request.contextPath}/formRegistro.jsp">Registrarse</a>
</div>
</body>
</html>