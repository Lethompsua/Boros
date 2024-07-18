<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <h1>Create Post</h1>
            <h2>Boros</h2>
            <form id="formPublicacion" action="crearPublicacionServlet" method="post">
                <div class="inputContainer">
                    <label for="ftitulo">Titulo:</label><br>
                    <input class="inputTitulo" type="text" id="ftitulo" name="ftitulo" style="width: 300px;"><br>
                </div>
                <div class="inputContainer">
                    <label for="fdesc">Descripcion:</label><br>
                    <input class="inputDesc" type="text" id="fdesc" name="fdesc" style="width: 300px;"><br>
                </div>
                <div class="inputContainer">
                    <label for="fcategoria">Categoría:</label><br>
                    <select class="inputCategoria" id="fcategoria" name="fcategoria" style="width: 300px;">
                        <option value="Tecnología">Tecnología</option>
                        <option value="Salud">Salud</option>
                        <option value="Educación">Educación</option>
                        <option value="Ciencia">Ciencia</option>
                        <option value="Entretenimiento">Entretenimiento</option>
                        <!-- Puedes añadir más opciones aquí -->
                    </select><br>
                </div>
                <br><br>
                <input class="btnCrear" type="submit" id="crearPublicacion" name="crearPublicacion" value="Submit" style="background-color: purple; color: white; padding: 10px 20px; border-radius: 5px; font-size: 16px;">
            </form>
        </div>
    </section>

    </body>
</html>
