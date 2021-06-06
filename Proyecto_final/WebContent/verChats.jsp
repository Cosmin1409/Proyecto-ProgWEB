<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="beans.Usuario" %>
<%@ page import="database.UsuarioDB" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="usuario" class="beans.Usuario"/>
<%
usuario = (Usuario) session.getAttribute("user");
UsuarioDB usuariodb = new UsuarioDB();
java.util.ArrayList<String> chats=usuariodb.verChats(usuario);
pageContext.setAttribute("chats", chats);
%>
<c:forEach var="listaChat" items="${chats}">
	<form action="Chat.jsp" method="post">
	<input type="hidden" name="user2" value="${listaChat}">
	${listaChat}
	<input type="submit" value="Hablar">
	</form>
	<br>
</c:forEach>
<br>
</body>
</html>