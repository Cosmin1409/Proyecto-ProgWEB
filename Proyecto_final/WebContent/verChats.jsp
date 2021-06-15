<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="beans.Usuario" %>
<%@ page import="database.UsuarioDB" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>v_PRUEBAS</title>
<link href="${pageContext.request.contextPath}/verChats.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="volver">
<a href="${pageContext.request.contextPath}/PrincipalUsuario.jsp">Volver</a>
</div>
<jsp:useBean id="usuario" class="beans.Usuario"/>
<%
usuario = (Usuario) session.getAttribute("user");
UsuarioDB usuariodb = new UsuarioDB();
java.util.ArrayList<String> chats=usuariodb.verChats(usuario);
pageContext.setAttribute("chats", chats);
%>
<div id="contenedor">
<c:forEach var="listaChat" items="${chats}">
	<div id="campos">
	<form action="Chat.jsp" method="post">
	<input type="hidden" name="user2" value="${listaChat}">
	${listaChat}
	<br>
	<input type="submit" value="Hablar">
	</form>
	</div>
</c:forEach>
<br>
</div>
</body>
</html>