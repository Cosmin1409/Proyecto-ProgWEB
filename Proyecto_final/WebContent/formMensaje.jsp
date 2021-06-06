<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<form action="MandarMensaje.jsp" method="post">
<input type="hidden" value="true" name="redireccionar">
Usuario:
<input type="text" name="destino">
<br>
<textarea name="contenido" rows="20" cols="40"></textarea>
<br>
<input type="submit" value="Mandar">
</form>
</body>
</html>