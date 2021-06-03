<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="database.UsuarioDB"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="usuario" class="beans.Usuario" />
<jsp:setProperty property="nombre" name="usuario" param="nombre"/>
<jsp:setProperty property="contrasena" name="usuario" param="contrasena"/>
<%
UsuarioDB usuariodb = new UsuarioDB();
if(usuariodb.loginUsuario(usuario)){
	session.setAttribute("user", usuario);
	response.sendRedirect("http://localhost:8080/Proyecto_final/PrincipalUsuario.jsp");
}
else{
	response.sendRedirect("http://localhost:8080/Proyecto_final/Principal.jsp");
}
%>
</body>
</html>