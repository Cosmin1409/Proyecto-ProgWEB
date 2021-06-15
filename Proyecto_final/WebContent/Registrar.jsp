<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="database.UsuarioDB"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>v_PRUEBAS</title>
</head>
<body>
<jsp:useBean id="usuario" class="beans.Usuario" />
<jsp:setProperty property="nombre" name="usuario" param="nombre"/>
<jsp:setProperty property="contrasena" name="usuario" param="contrasena"/>
<%

UsuarioDB usuariodb = new UsuarioDB();
if(request.getParameter("nombre")!="" && request.getParameter("contrasena")!=""){
	if(!usuariodb.existeUsuario(usuario.getNombre())){
		usuariodb.registrarUsuario(usuario);
		if(usuariodb.loginUsuario(usuario)){
			session.setAttribute("user", usuario);
			response.sendRedirect(request.getContextPath() +"/PrincipalUsuario.jsp");
		}
	}
	else{
		out.print("El usuario ya existe");
		response.setHeader("Refresh", "1; url="+request.getContextPath()+"/Principal.jsp");
	}
}
else{
	out.print("Debes rellenar los campos");
	response.setHeader("Refresh", "1; url="+request.getContextPath()+"/formRegistro.jsp");
}
%>
</body>
</html>