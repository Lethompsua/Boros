<%-- 
    Document   : BusquedaAdv
    Created on : 12 abr 2024, 17:27:20
    Author     : manol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Búsqueda Avanzada | Boros</title>
    <link href="master5.css" rel="stylesheet" type="text/css"/>
</head>
<body>

    <div class="buscar-avanzada">
        <h2>Búsqueda Avanzada</h2>
        <form action="BusquedaAvanzadaServlet" method="get">
            <div class="form-group">
                <label for="texto-busqueda">Texto de búsqueda:</label>
                <input type="text" id="texto-busqueda" name="texto-busqueda" placeholder="Texto de búsqueda en la publicación">
            </div>
            <div class="form-group">
                <label for="categoria">Categoría:</label>
                <select id="categoria" name="categoria">
                    <option value="Tecnología">Tecnología</option>
                    <option value="Salud">Salud</option>
                    <option value="Educación">Educación</option>
                    <option value="Ciencia">Ciencia</option>
                    <option value="Entretenimiento">Entretenimiento</option>
                    <!-- Puedes añadir más opciones aquí -->
                </select>
            </div>
            <div class="form-group">
                <label for="fecha-inicial">Fecha inicial:</label>
                <input type="date" id="fecha-inicial" name="fecha-inicial">
            </div>
            <div class="form-group">
                <label for="fecha-final">Fecha final:</label>
                <input type="date" id="fecha-final" name="fecha-final">
            </div>
            <button type="submit">Buscar</button>
        </form>
    </div>

</body>
</html>
