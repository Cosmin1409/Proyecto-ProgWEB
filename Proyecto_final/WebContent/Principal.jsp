<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<link href="Principal.css" rel="stylesheet" type="text/css">
<body>
<% session.invalidate();%>
<div>
<a href="http://localhost:8080/Proyecto_final/formLogin.jsp">Login</a>
</div>
<br/>
<div>
<a href="http://localhost:8080/Proyecto_final/formRegistro.jsp">Registrarse</a>
</div>
</body>
</html>