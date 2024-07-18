<%-- 
    Document   : index
    Created on : 1 oct 2023, 13:38:27
    Author     : sadam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/hojaEstilo.css">
    
    </head>
    <body>
       <div id="divLogin" style="background-color:red;">
        <form id="formLogin" action="login" method="post">
        <label for="fname">Usuarios:</label><br>
        <input class="inputLogin" type="text" id="fusuario" name="fusuario"><br>
        <label for="lname">Contraseña:</label><br>
        <input class="inputLogin" type="text" id="fcontra" name="fcontra">
        <br>
        <br>
        <input class="btnLogin" type="submit" id="Iniciar" name="bIniciarSesion" value="Ingresar">
        <button class="btnLogin" ><a class="btn btn-success" href="registro.jsp">Registrarse</a></button>
    </form>
</div>
    </body>
</html>
