<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>v_PRUEBAS</title>
<link href="${pageContext.request.contextPath}/PrincipalUsuario.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="contenedor">
<div id="campos">
<h1>Mensajes</h1>
<a href="${pageContext.request.contextPath}/formMensaje.jsp">Mandar mensajes</a>
<br>
<a href="${pageContext.request.contextPath}/verMensaje.jsp">Ver mensajes</a>
<br>
<a href="${pageContext.request.contextPath}/verChats.jsp">Chats</a>
<br>
<a href="${pageContext.request.contextPath}/Principal.jsp">Salir</a>
</div>
</div>
</body>
</html>