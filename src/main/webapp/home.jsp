<%-- 
    Document   : Home
    Created on : 1 oct 2023, 20:36:46
    Author     : sadam
--%>

<%@page import="com.mycompany.pw1.models.Publicaciones"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
        <h1>Home</h1>
             <form id="formBuscarPublicacion" action="busquedaPublicacionServlet" method="post">
        
        <label for="txtBusqueda">Titulo:</label><br>
        <input class="inputTitulo" type="text" id="txtBusqueda" name="txtBusqueda"><br>
        <br>
        <input class="btnBuscar" type="submit" id="buscarPublicacion" name="buscarPublicacion" value="buscar">
       
    </form>
        <a href="crearPublicacion.jsp">Crear Publicacion</a>
        <% String idUsuario = String.valueOf(request.getSession().getAttribute("idUsuario"));
        List<Publicaciones> listaPublicaciones =(List) request.getAttribute("ListaPublicaciones");
        String urlImg = "imagenes/usuarios/"+String.valueOf(request.getSession().getAttribute("urlImg"));
        %>
        <h1><%=idUsuario%></h1>
        <img src=<%=urlImg%> />
        <ul id="listaPublicaciones">
        <% if(listaPublicaciones!=null)
            for(Publicaciones item : listaPublicaciones){     %>
          
            <li>
                  <h2><%=item.getTitulo()%></h2>
                   <p><%=item.getDescripcion()%></p> 
                   <p><%=item.getDescripcion()%></p>
            </li>
               <% }     %>      
          </ul>   
                      
 <nav aria-label="Paginacion">
  <ul id="paginacionPublicaciones" class="pagination">
   
  </ul>
</nav>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script src="js/Publicaciones.js"></script>
    </body>
</html>
