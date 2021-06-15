<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>v_PRUEBAS</title>
<link href="${pageContext.request.contextPath}/MandarMensaje.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="volver">
<a href="${pageContext.request.contextPath}/PrincipalUsuario.jsp">Volver</a>
</div>
<div id="contenedor">
<form action="MandarMensaje.jsp" method="post">
<div id="campos">
<input type="hidden" value="true" name="redireccionar">
<label for="destino">Usuario</label>
<br>
<input type="text" name="destino">
<br>
<br>
<textarea name="contenido" rows="20" cols="60"></textarea>
<br>
<input type="submit" value="Mandar">
</div>
</form>
</div>
</body>
</html>