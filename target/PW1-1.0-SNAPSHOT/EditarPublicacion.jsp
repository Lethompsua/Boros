<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" type="text/css" href="master4.css">
</head>
<body>
    
<section class="container" style="width: 500px; height: 400px; background: url('https://w.wallhaven.cc/full/l8/wallhaven-l8o29q.jpg'); display: flex; justify-content: center; align-items: center; color: white;">
    <div id="divregistro">
        <h1>Edit Post</h1>
        <h2>Boros</h2>
        <form id="formPublicacion" action="modificarPublicacionServlet" method="post">
            <div class="inputContainer">
                <label for="ftitulo">Titulo:</label><br>
                <input class="inputTitulo" type="text" id="ftitulo" name="ftitulo" style="width: 300px;" value="${publicacion.titulo}"><br>
            </div>
            <div class="inputContainer">
                <label for="fdesc">Descripcion:</label><br>
                <input class="inputDesc" type="text" id="fdesc" name="fdesc" style="width: 300px;" value="${publicacion.descripcion}"><br>
            </div>
            <div class="inputContainer">
                <label for="fcategoria">Categoría:</label><br>
                <select class="inputCategoria" id="fcategoria" name="fcategoria" style="width: 300px;">
                    <option value="Tecnología" <c:if test="${publicacion.categoria == 'Tecnología'}">selected</c:if>>Tecnología</option>
                    <option value="Salud" <c:if test="${publicacion.categoria == 'Salud'}">selected</c:if>>Salud</option>
                    <option value="Educación" <c:if test="${publicacion.categoria == 'Educación'}">selected</c:if>>Educación</option>
                    <option value="Ciencia" <c:if test="${publicacion.categoria == 'Ciencia'}">selected</c:if>>Ciencia</option>
                    <option value="Entretenimiento" <c:if test="${publicacion.categoria == 'Entretenimiento'}">selected</c:if>>Entretenimiento</option>
                    <!-- Puedes añadir más opciones aquí -->
                </select><br>
            </div>
            <input type="hidden" name="idPublicacion" value="${publicacion.idPublicacion}"> <!-- Para enviar el ID de la publicación -->
            <br><br>
            <input class="btnCrear" type="submit" id="modificarPublicacion" name="modificarPublicacion" value="Submit" style="background-color: purple; color: white; padding: 10px 20px; border-radius: 5px; font-size: 16px;">
        </form>
    </div>
</section>

</body>
</html>
