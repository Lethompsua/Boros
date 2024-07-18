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
                    <img src="${Usuario.urlImgPerfil}" alt="img-avatar">
                    <button type="button" class="boton-avatar">
                        <i class="far fa-image"></i>
                    </button>
                </div>
                <button type="button" class="boton-portada">
                    <i class="far fa-image"></i> Cambiar fondo
                </button>
            </div>
        </div>
        <div class="perfil-usuario-body">
            <div class="perfil-usuario-bio">
                <h3 class="titulo">${Usuario.nombreUsuario}</h3>
                <p class="texto">Me gustan los macarrones con Queso</p>
            </div>
            <div class="perfil-usuario-footer">
                <ul class="lista-datos">
                    <li><i class="icono fas fa-user"></i> Nombre(s): ${Usuario.nombres}</li>
                    <li><i class="icono fas fa-user"></i> Apellidos: ${Usuario.apellidos}</li>
                    <li><i class="icono fas fa-calendar-alt"></i> Fecha de nacimiento: <fmt:formatDate value="${Usuario.fechaNacimiento}" pattern="dd/MM/yyyy"/></li>
                    <li><i class="icono fas fa-envelope"></i> Correo electrónico: ${Usuario.correo}</li>
                </ul>
            </div>
            <div class="redes-sociales">
                <a href="#" class="boton-redes facebook fab fa-facebook-f"><i class="icon-facebook"></i></a>
                <a href="#" class="boton-redes twitter fab fa-twitter"><i class="icon-twitter"></i></a>
                <a href="#" class="boton-redes instagram fab fa-instagram"><i class="icon-instagram"></i></a>
            </div>
        </div>
    </section>
    
    <div class="mis-redes" style="display: block; position: fixed; bottom: 1rem; left: 1rem; opacity: 0.5; z-index: 1000;">
        <p style="font-size: .75rem;">Boros</p>
        <div>
            <a target="_blank" href="https://www.facebook.com/people/Lightning-The-Darkness/61556667584863/"><i class="fab fa-facebook-square"></i></a>
            <a target="_blank" href="https://twitter.com/?lang=es"><i class="fab fa-twitter"></i></a>
            <a target="_blank" href="https://www.instagram.com/ligtngthedrknesss/"><i class="fab fa-instagram"></i></a>
            <a target="_blank" href="https://www.youtube.com/watch?v=v7GMG1aLyPw"><i class="fab fa-youtube"></i></a>
        </div>
    </div>

    <div class="profile">
        <h1>Mi Perfil</h1>
        <div class="profile-info">
            <div class="profile-image">
                <img src="${Usuario.urlImgPerfil}" alt="Foto de Perfil">
            </div>
            <div class="profile-details">
                <p><span>Nombre de Usuario:</span> ${Usuario.nombreUsuario}</p>
                <p><span>Nombre y Apellidos:</span> ${Usuario.nombres} ${Usuario.apellidos}</p>
                <p><span>Correo Electrónico:</span> ${Usuario.correo}</p>
                <p><span>Fecha de Nacimiento:</span> <fmt:formatDate value="${Usuario.fechaNacimiento}" pattern="dd/MM/yyyy"/></p>
            </div>
        </div>
        <a href="editarPerfil.jsp" class="edit-profile-btn" style="background-color: purple; color: white; padding: 10px 20px; border-radius: 5px; font-size: 16px; text-decoration: none;">Editar Perfil</a>
    </div>
</body>
</html>
