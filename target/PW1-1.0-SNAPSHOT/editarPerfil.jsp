<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Perfil | Boros</title>
    <link href="master3.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="https://necolas.github.io/normalize.css/8.0.1/normalize.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
</head>
<body>

    <section class="seccion-perfil-usuario">
        <div class="perfil-usuario-header">
            <div class="perfil-usuario-portada">
                <div class="perfil-usuario-avatar">
                    <img src="${Usuario.urlImgPerfil}" alt="Imagen de perfil">
                    <form id="formCambiarAvatar" action="GuardarUsuarioCambiosServlet" method="post" enctype="multipart/form-data">
                        <input type="file" name="imagen_perfil" id="imagen_perfil" style="display: none;" onchange="this.form.submit()">
                        <label for="imagen_perfil" class="boton-avatar">
                            <i class="far fa-image"></i>
                        </label>
                    </form>
                </div>
                <button type="button" class="boton-portada">
                    <i class="far fa-image"></i> Cambiar fondo
                </button>
            </div>
        </div>
        <div class="perfil-usuario-body">
            <form id="formEditarPerfil" action="GuardarUsuarioCambiosServlet" method="post" enctype="multipart/form-data">
                <div class="perfil-usuario-bio">
                    <h3 class="titulo">Editar Perfil</h3>
                </div>
                <div class="perfil-usuario-footer">
                    <div class="inputContainer">
                        <label for="nombreUsuario">Nombre de Usuario:</label><br>
                        <input class="inputTitulo" type="text" id="nombreUsuario" name="nombreUsuario" value="${Usuario.nombreUsuario}" style="width: 300px;"><br>
                    </div>
                    <div class="inputContainer">
                        <label for="nombres">Nombre(s):</label><br>
                        <input class="inputTitulo" type="text" id="nombres" name="nombres" value="${Usuario.nombres}" style="width: 300px;"><br>
                    </div>
                    <div class="inputContainer">
                        <label for="apellidos">Apellidos:</label><br>
                        <input class="inputDesc" type="text" id="apellidos" name="apellidos" value="${Usuario.apellidos}" style="width: 300px;"><br>
                    </div>
                    <div class="inputContainer">
                        <label for="correo">Correo Electrónico:</label><br>
                        <input class="inputDesc" type="text" id="correo" name="correo" value="${Usuario.correo}" style="width: 300px;"><br>
                    </div>
                    <div class="inputContainer">
                        <label for="password">Contraseña:</label><br>
                        <input class="inputDesc" type="text" id="password" name="password" value="${Usuario.pass}" style="width: 300px;"><br> 
                    </div>
                    <div class="inputContainer">
                        <label for="fechaNacimiento">Fecha de Nacimiento:</label><br>
                        <input class="inputDesc" type="date" id="fechaNacimiento" name="fechaNacimiento" value="${Usuario.fechaNacimiento}" style="width: 300px;"><br>
                    </div>
                    <div class="inputContainer">
                        <label for="imagen_perfil">Cambiar Foto de Perfil:</label><br>
                        <input class="inputDesc" type="file" id="imagen_perfil" name="imagen_perfil" style="width: 300px;"><br>
                    </div>
                    <br><br>
                    <input class="btnCrear" type="submit" id="actualizarDatos" name="actualizarDatos" value="Actualizar" style="background-color: purple; color: white; padding: 10px 20px; border-radius: 5px; font-size: 16px;">
                </div>
            </form>
            <div class="redes-sociales">
                <a href="#" class="boton-redes facebook fab fa-facebook-f"><i class="icon-facebook"></i></a>
                <a href="#" class="boton-redes twitter fab fa-twitter"><i class="icon-twitter"></i></a>
                <a href="#" class="boton-redes instagram fab fa-instagram"><i class="icon-instagram"></i></a>
            </div>
        </div>
    </section>

    <c:if test="${empty Usuario}">
        <p>No se pudieron cargar los datos del perfil.</p>
    </c:if>

    <style>
        .seccion-perfil-usuario {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f4f4f4;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .perfil-usuario-header {
            position: relative;
        }
        .perfil-usuario-portada {
            position: relative;
            background: url('portada.jpg') no-repeat center center;
            background-size: cover;
            height: 200px;
            border-radius: 8px 8px 0 0;
        }
        .perfil-usuario-avatar {
            position: absolute;
            bottom: -50px;
            left: 20px;
            width: 100px;
            height: 100px;
            border-radius: 50%;
            overflow: hidden;
            border: 4px solid #fff;
        }
        .perfil-usuario-avatar img {
            width: 100%;
            height: auto;
        }
        .boton-avatar, .boton-portada {
            display: inline-block;
            cursor: pointer;
            background-color: #fff;
            padding: 10px;
            border-radius: 50%;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            transition: all 0.3s;
        }
        .boton-avatar:hover, .boton-portada:hover {
            background-color: #eee;
        }
        .perfil-usuario-bio {
            text-align: center;
            margin-top: 60px;
        }
        .titulo {
            font-size: 24px;
            margin: 0;
        }
        .texto {
            color: #888;
            margin-top: 5px;
        }
        .perfil-usuario-footer {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .inputContainer {
            margin-bottom: 15px;
        }
        .inputContainer label {
            font-weight: bold;
        }
        .inputContainer input {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .redes-sociales {
            text-align: center;
            margin-top: 20px;
        }
        .boton-redes {
            display: inline-block;
            margin: 0 10px;
            color: #555;
            font-size: 18px;
            text-decoration: none;
        }
        .boton-redes:hover {
            color: #000;
        }
        .btnCrear {
            display: inline-block;
            padding: 10px 20px;
            background-color: purple;
            color: white;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .btnCrear:hover {
            background-color: darkpurple;
        }
    </style>

</body>
</html>