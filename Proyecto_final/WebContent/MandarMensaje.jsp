<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ page import="database.MensajeDB" %>
 <%@ page import="database.UsuarioDB" %>
 <%@ page import="beans.Usuario" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>v_PRUEBAS</title>
</head>
<body>
<jsp:useBean id="mensaje" class="beans.Mensaje"/>
<jsp:useBean id="usuario" class="beans.Usuario"/>
<jsp:setProperty property="nombreDestinatario" name="mensaje" param="destino"/>
<jsp:setProperty property="contenido" name="mensaje" param="contenido"/>
<%
MensajeDB mensajedb= new MensajeDB();
UsuarioDB usuariodb= new UsuarioDB();
usuario= (Usuario) session.getAttribute("user");
mensaje.setNombreTransmisor(usuario.getNombre());

if(request.getParameter("redireccionar").equals("true")){
	
	if(usuariodb.existeUsuario(mensaje.getNombreDestinatario())){
	mensajedb.mandarMensaje(mensaje);
	response.sendRedirect(request.getContextPath()+"/PrincipalUsuario.jsp");
	}
else{
	out.print("No existe el usuario");
	response.setHeader("Refresh", "2; url="+request.getContextPath()+"/PrincipalUsuario.jsp");
	%>
	<br>
	<a href="${pageContext.request.contextPath}/formMensaje.jsp">Volver</a>
	<%
	}
}
else{
	mensajedb.mandarMensaje(mensaje);
}
%>
</body>
</html>