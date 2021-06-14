<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="database.MensajeDB" %>
<%@ page import="beans.Usuario"%>
<%@ page import="beans.Mensaje"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/verMensaje.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="volver">
<a href="${pageContext.request.contextPath}/PrincipalUsuario.jsp">Volver</a>
</div>
<div id="contenedor">
<jsp:useBean id="usuario" class="beans.Usuario"/>
<div id="campos">
<h2>Mensajes recibidos:</h2>
<br>
<%
usuario = (Usuario) session.getAttribute("user");
MensajeDB mensajedb1 = new MensajeDB();
java.util.ArrayList<Mensaje> mensajes1 =  mensajedb1.mensajesRecibidos(usuario);
pageContext.setAttribute("mensajes_recibidos", mensajes1);
%>
<c:forEach var="listMensajes" items="${mensajes_recibidos}">
	${listMensajes.getNombreTransmisor()} 
	${listMensajes.getFecha()}
	${listMensajes.getContenido()}
<br>
</c:forEach>
</div>
<br>
<div id="campos">
<h2>Mensajes enviados:</h2>
<br>
<%
usuario = (Usuario) session.getAttribute("user");
MensajeDB mensajedb2 = new MensajeDB();
java.util.ArrayList<Mensaje> mensajes2 =  mensajedb2.mensajesMandados(usuario);
pageContext.setAttribute("mensajes_mandados", mensajes2);
%>
<c:forEach var="listMensajes" items="${mensajes_mandados}">
	${listMensajes.getNombreDestinatario()} 
	${listMensajes.getFecha()}
	${listMensajes.getContenido()}
<br>
</c:forEach>
</div>
</div>
</body>
</html>