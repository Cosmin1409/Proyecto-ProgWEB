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
<link href="Principal.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:useBean id="usuario1" class="beans.Usuario"/>
<jsp:useBean id="usuario2" class="beans.Usuario"/>
<jsp:setProperty property="nombre" name="usuario2" param="user2"/>
<%
usuario1= (Usuario) session.getAttribute("user");
MensajeDB mensajedb = new MensajeDB();
java.util.ArrayList<Mensaje> listaChat= mensajedb.getChat(usuario1, usuario2);
for(Mensaje a : listaChat){
	if(a.getNombreTransmisor().equals(usuario1.getNombre())){
		%>
		<div id="enviado">
		<%
		out.print(a.getContenido());
		%>
		<br>
		<%
		out.print(a.getFecha());
		%>
		</div>
		<%
	}
	else{
		%>
		<div id="recibido">
		<%
		out.print(a.getContenido());
		%>
		<br>
		<%
		out.print(a.getFecha());
		%>
		</div>
		<%
	}
}
%>
<br>
</body>
</html>