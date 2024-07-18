<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Publicación</title>
    </head>
    <body>
        <div id="divregistro" style="background-color:red;">
            <form id="formPublicacion" action="crearPublicacionServlet" method="post">
                <label for="ftitulo">Titulo:</label><br>
                <input class="inputTitulo" type="text" id="ftitulo" name="ftitulo"><br>
                
                <label for="fdesc">Descripción:</label><br>
                <input class="inputDesc" type="text" id="fdesc" name="fdesc"><br><br>
                
                <label for="fcategoria">Categoría:</label><br>
                <select class="inputCategoria" id="fcategoria" name="fcategoria">
                    <option value="Tecnología">Tecnología</option>
                    <option value="Salud">Salud</option>
                    <option value="Educación">Educación</option>
                    <option value="Ciencia">Ciencia</option>
                    <option value="Entretenimiento">Entretenimiento</option>
                    <!-- Puedes añadir más opciones aquí -->
                </select><br><br>
                
                <input class="btnCrear" type="submit" id="crearPublicacion" name="crearPublicacion" value="Crear">
            </form>
        </div>
    </body>
</html>
