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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(document).ready(function() {
		$('#submit').click(function(event) {
			var redirectVar = $('#redireccionar').val();
			var destinoVar = $('#destino').val();
			var contenidoVar = $('#contenido').val();
			// Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
			$.post('MandarMensaje.jsp', {
				redireccionar : redirectVar,
				destino : destinoVar,
				contenido : contenidoVar
			});
		});
	});
</script>
<script>
$(function() {
$('html, body').animate({scrollTop:$(document).height()}, '500');
});
</script>
<script>
function refreshPage(){
	setTimeout(function() {
        window.location.reload();
    }, 1000);
}; 
</script>
</head>
<body>
<jsp:useBean id="usuario1" class="beans.Usuario"/>
<jsp:useBean id="usuario2" class="beans.Usuario"/>
<jsp:setProperty property="nombre" name="usuario2" param="user2"/>
<a href="http://localhost:8080/Proyecto_final/PrincipalUsuario.jsp">Volver inicio</a>
<div id="caja">
<%
usuario1= (Usuario) session.getAttribute("user");
MensajeDB mensajedb = new MensajeDB();
java.util.ArrayList<Mensaje> listaChat= mensajedb.getChat(usuario1, usuario2);
pageContext.setAttribute("destino", usuario2.getNombre());
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

	<div id="envio">
		<form id="form">
		<input type="hidden" value="false" id="redireccionar">
		<input type="hidden" id="destino" value="<%=pageContext.getAttribute("destino")%>">
		<textarea id="contenido" rows="5" cols="60"></textarea>
		<input type="button" id="submit" onClick="refreshPage()" value="Mandar">
		</form>
	</div>
</div>
</body>
</html>