<%-- 
    Document   : registro
    Created on : 6 oct 2023, 07:51:53
    Author     : sadam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
     
    </head>
    <body>
        
       
        <div id="divregistro" style="background-color:red;">
        <form id="formRegistro" action="registroServlet" method="post" enctype="multipart/form-data">
        <label for="imgRuta">Imagen Perfil:</label><br>
        <img for="imgRuta" id="imgPerfil" name="imgPerfil">
        <input class="inputImgPerfil" type="file" id="imgRuta" name="imgRuta">
        <label for="fname">Usuarios:</label><br>
        <input class="inputRegistrar" type="text" id="txtNombreUsuario" name="fusuario"><br>
        <label for="lname">Contraseña:</label><br>
        <input class="inputRegistrar" type="text" id="txtPassword" name="fcontra">
        <br>
        <div class="col-sm-4">
            <input type="date" class="form-control" id="fechaNacimiento" name="fechaNacimiento"/>
        </div>
       
        <br>
        <input class="btnRegistrar" type="submit" id="Registrar" name="bRegistrar" value="Registrar">
       
    </form>
</div>
        
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
    
    </body>
</html>
