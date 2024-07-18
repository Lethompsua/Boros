<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mi Perfil | Boros</title>
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
                    <form id="formCambiarAvatar" action="ActualizarDatosUsuarioServlet" method="post" enctype="multipart/form-data">
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
            <div class="perfil-usuario-bio">
                <h3 class="titulo">${Usuario.nombreUsuario}</h3>
                <p class="texto">Información adicional del usuario</p>
            </div>
            <div class="perfil-usuario-footer">
                <ul class="lista-datos">
                    <li><i class="icono fas fa-user"></i> Nombre(s): ${Usuario.nombres}</li>
                    <li><i class="icono fas fa-user"></i> Apellidos: ${Usuario.apellidos}</li>
                    <li><i class="icono fas fa-envelope"></i> Correo Electrónico: ${Usuario.correo}</li>
                    <li><i class="icono fas fa-calendar-alt"></i> Fecha de Nacimiento: <fmt:formatDate value="${Usuario.fechaNacimiento}" pattern="dd/MM/yyyy"/></li>
                    <li><i class="icono fas fa-key"></i> Contraseña: ${Usuario.pass}</li>
                </ul>
            </div>
            <div class="redes-sociales">
                <a href="#" class="boton-redes facebook fab fa-facebook-f"><i class="icon-facebook"></i></a>
                <a href="#" class="boton-redes twitter fab fa-twitter"><i class="icon-twitter"></i></a>
                <a href="#" class="boton-redes instagram fab fa-instagram"><i class="icon-instagram"></i></a>
            </div>
            <div class="editar-perfil">
                <a href="${pageContext.request.contextPath}/ModificaServlet" class="boton-editar">
                    <i class="fas fa-edit"></i> Editar Perfil
                </a>
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
        .lista-datos {
            list-style: none;
            padding: 0;
        }
        .lista-datos li {
            margin-bottom: 10px;
            font-size: 14px;
            color: #555;
        }
        .icono {
            margin-right: 10px;
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
        .editar-perfil {
            text-align: center;
            margin-top: 20px;
        }
        .boton-editar {
            display: inline-block;
            padding: 10px 20px;
            background-color: purple;
            color: white;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .boton-editar:hover {
            background-color: darkpurple;
        }
    </style>

</body>
</html>
