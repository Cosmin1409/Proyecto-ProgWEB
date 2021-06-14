<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="database.UsuarioDB"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	response.sendRedirect(request.getContextPath() +"/PrincipalUsuario.jsp");
}
else{
	out.print("Usuario o contraseña incorrectos");
	response.setHeader("Refresh", "1; url="+request.getContextPath()+"/Principal.jsp");
}
%>
</body>
</html>