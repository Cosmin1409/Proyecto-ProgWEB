<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>v_PRUEBAS</title>
<link href="${pageContext.request.contextPath}/Login.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="volver">
<a href="${pageContext.request.contextPath}/Principal.jsp">Volver</a>
</div>
<div id="contenedor">
<form action="Login.jsp" method="post">
<div id="campo">
<label for="nombre">Nombre</label>
<br>
<input type="text" name="nombre">
<br>
<br>
<label for="contrasena">Contraseña</label>
<br>
<input type="password" name="contrasena">
<br>
<br>
<input type="submit" value="Login">
</div>
</form>
</div>
</body>
</html>