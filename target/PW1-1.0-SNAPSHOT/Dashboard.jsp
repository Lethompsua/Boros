<%-- 
    Document   : Dashboard
    Created on : 12 abr 2024, 16:35:58
    Author     : manol
--%>

<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int recordsPerPage = 10; // Número de publicaciones por página
    int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;
    int startIndex = 0;
    int endIndex = 0;
    
    List<com.mycompany.pw1.models.Publicaciones> listaPublicaciones = (List<com.mycompany.pw1.models.Publicaciones>) request.getAttribute("ListaPublicaciones");
    if (listaPublicaciones != null && !listaPublicaciones.isEmpty()) {
        startIndex = (currentPage - 1) * recordsPerPage;
        endIndex = Math.min(startIndex + recordsPerPage, listaPublicaciones.size());
        startIndex = 0;

    }
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8" />
    <title>Boros</title>
    <link href="pagnWV1.css" rel="stylesheet" type="text/css"/>
    <!-- Boxicons CDN Link -->
    <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
   
        .search-icon {
            display: flex;
            align-items: center;
            margin-left: auto;
        }

        .search-icon input[type="text"] {
            width: 200px;
            padding: 10px;
            border: 2px solid #ccc;
            border-radius: 20px 0 0 20px;
            outline: none;
            transition: width 0.4s ease-in-out;
        }

        .search-icon input[type="text"]:focus {
            width: 300px;
        }

        .search-icon input[type="submit"] {
            padding: 10px 15px;
            border: 2px solid #ccc;
            border-left: none;
            border-radius: 0 20px 20px 0;
            background-color: #8e44ad; 
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .search-icon input[type="submit"]:hover {
            background-color: #6e348b; 
        }

        .nav-list .search-icon {
            width: 100%;
        }

        .nav-list .search-icon input[type="text"],
        .nav-list .search-icon input[type="submit"] {
            width: 100%;
            max-width: none;
            border-radius: 20px;
        }

        .nav-list .search-icon input[type="submit"] {
            border-left: 2px solid #ccc;
        }

        nav ul {
            display: flex;
            align-items: center;
            padding: 0;
        }

        nav .items {
            display: flex;
            margin-right: auto;
        }

        nav .items li {
            list-style: none;
            margin: 0 10px;
        }

        nav .items a {
            text-decoration: none;
            color: #000;
            font-weight: bold;
        }

        .sidebar {
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        .nav-list {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }

        .nav-list .profile {
            margin-top: auto;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="logo-details">
            <i class='bx bxs-skull'></i>
            <div class="logo_name">Boros</div>
            <i class="bx bx-menu" id="btn"></i>
        </div>
        <ul class="nav-list">
            <li>
                <i class="bx bx-search"></i>
                <input type="text" placeholder="Search..." />
                <span class="tooltip">Search</span>
            </li>
            <li>
                <a href="<%= request.getContextPath() %>/homeServlet"> 
                    <i class='bx bx-home'></i>
                    <span class="links_name">Home</span>
                </a>
                <span class="tooltip">Analytics</span>
            </li>
            <li>
                <a href="Pblicacion.jsp">
                    <i class='bx bx-add-to-queue'></i>
                    <span class="links_name">Add</span>
                </a>
                <span class="tooltip">Messages</span>
            </li>
            <li>
                <a href="#">
                    <i class='bx bx-save'></i>
                    <span class="links_name">Saved</span>
                </a>
                <span class="tooltip">Saved</span>
            </li>
            <li>
                <a href="BusquedaAdv.jsp">
                    <i class='bx bx-search-alt'></i>
                    <span class="links_name">Advanced</span>
                </a>
                <span class="tooltip">Setting</span>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/perfilServlet">
                    <i class="bx bx-user"></i>
                    <span class="links_name">User</span>
                </a>
                <span class="tooltip">User</span>
            </li>
            <li>
                <a href="#">
                    <i class="bx bx-cog"></i>
                    <span class="links_name">Settings</span>
                </a>
                <span class="tooltip">Setting</span>
            </li>
            <li class="profile">
                <a href="login.jsp">
                    <i class='bx bx-log-out'></i>
                    <span class="links_name">Log Out</span>
                </a>
                <span class="tooltip">Log Out</span>
            </li>
        </ul>
    </div>
    <section class="home-section">
        <!-- NAVBAR -->
        <nav>
            <ul>
                <li class="btn"><span class="fas fa-bars"></span></li>
                <div class="items">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Services</a></li>
                    <li><a href="#">Contact</a></li>
                </div>
                <form id="formBuscarPublicacion" action="busquedaPublicacionServlet" method="post">
                    <li class="search-icon">
                        <input class="inputTitulo" type="text" id="txtBusqueda" name="txtBusqueda" placeholder="Buscar...">
                        <input class="icon" type="submit" id="buscarPublicacion" name="buscarPublicacion" value="B">
                    </li>
                </form>
            </ul>
        </nav>

        <div class="suggestions">
            <h2>Sugerencias para ti</h2>
            <ul>
                <li>
                    <img src="imgDashb/rosaazul.jfif" alt="Usuario 1">
                    <span> Alexis Ness</span>
                </li>
                <li>
                    <img src="imgDashb/dino.jfif" alt="Usuario 2">
                    <span> RamonDinoPro</span>
                </li>
                <li>
                    <img src="imgDashb/Guiomen.jfif" alt="Usuario 3">
                    <span> Sukuna</span>
                </li>
                <li>
                    <img src="imgDashb/Peppa pig.jfif" alt="Usuario 4">
                    <span> Peppa</span>
                </li>
            </ul>
        </div>

        <!-- PUBLICACIONES -->

       
    
        <% 
            if (listaPublicaciones != null && !listaPublicaciones.isEmpty()) {
                for (int i = startIndex; i < endIndex; i++) { 
                    com.mycompany.pw1.models.Publicaciones publicacion = listaPublicaciones.get(i);
                     com.mycompany.pw1.models.Usuarios usuario = publicacion.getUsuario(); // Asume que hay un método getUsuario() en Publicaciones
        %>
        <li>
            <div class="post">
                <div class="post-header">
                    <img src="<%= usuario.getUrlImgPerfil() %>" alt="Profile Picture">
                    <div class="post-header-info">
                        <h3><%= usuario.getNombres() %></h3>
                        <p><%= publicacion.getFechaCreacion() %></p> 
                    </div>
                </div>
                <div class="post-content">
                    <h3><%= publicacion.getTitulo() %></h3>
                    <p><%= publicacion.getDescripcion() %></p>
                </div>
                <div class="comment-share-preview">
                    <span>0 comments</span> 
                    <span>0 shares</span> 
                </div>
                <div class="post-actions">
                    <button><i class='bx bx-heart'></i> Love</button>
                    <button><i class='bx bx-message-rounded'></i> Comment</button>
                    <button><i class='bx bx-share'></i> Share</button>
                    <form action="${pageContext.request.contextPath}/ModificaPubliServlet" method="get" style="display: inline;">
                        <input type="hidden" name="idPublicacion" value="<%= publicacion.getIdPublicacion() %>">
                        <button type="submit"><i class='bx bx-edit'></i> Editar</button>
                    </form>
                    <button type="button" onclick="confirmarEliminacion(<%= publicacion.getIdPublicacion() %>)"><i class='bx bx-trash'></i> Eliminar</button>
                </div>
            </div>
        </li>
        <% 
                }
            } 
        %>
    




<script>
    function confirmarEliminacion(idPublicacion) {
        var confirmacion = confirm("¿Estás seguro de que deseas eliminar esta publicación?");
        if (confirmacion) {
            window.location.href = '${pageContext.request.contextPath}/EliminarPubliServlet?idPublicacion=' + idPublicacion;
        } else {
            window.location.href = '${pageContext.request.contextPath}/homeServlet';
        }
    }
</script>

    
    

        <!-- OTRAS PUBLICACIONES -->

        
        <div class="post">
    <div class="post-header">
    </div>
    <div class="post-content">
        <p>Paginacion</p>
    </div>
    <div class="likes-comment-preview">
        <div class="likes-preview">
            <span class="count-likes"></span>
        </div>
        <div class="Comment-share-preview">
        </div>
    </div>
    <div class="post-actions">
        <!-- Botón para ir a la página ANTERIOR -->
        <a href="?page=<%= currentPage - 1 %>"><button><i class='bx bx-share'></i> ANTERIOR</button></a>
        <!-- Botón para ir a la página SIGUIENTE -->
        <a href="?page=<%= currentPage + 1 %>"><button><i class='bx bx-share'></i> SIGUIENTE</button></a>
    </div>
</div>
        
        
        
        <div class="post">
            <div class="post-header">
                <img src="imgDashb/waos.jfif" alt="Profile Picture">
                <div class="post-header-info">
                    <h3>Kaiser</h3>
                    <p>08/03/2024</p>
                </div>
            </div>
            <div class="post-content">
                <p>Eh neee, ¿Quién trae mi INE y por qué me afiliaron a Morena banda?</p>
            </div>
            <div class="likes-comment-preview">
                <div class="likes-preview">
                    <span class="count-likes"></span>
                </div>
                <div class="Comment-share-preview">
                    <span>20k comments</span>
                    <span>6.9k shares</span>
                </div>
            </div>
            <div class="post-actions">
                <button><i class='bx bx-heart'></i> Love</button>
                <button><i class='bx bx-message-rounded'></i> Comment</button>
                <button><i class='bx bx-share'></i> Share</button>
                <button style="margin-left: auto;"><i class='bx bx-edit'></i> Editar</button>
                <button><i class='bx bx-trash'></i> Eliminar</button>
            </div>
        </div>

        <!-- PUBLICACIÓN DE GOJO -->

        <div class="post">
            <div class="post-header">
                <img src="imgDashb/gojo.jfif" alt="Profile Picture">
                <div class="post-header-info">
                    <h3>Gojo Satoru</h3>
                    <p>08/03/2024</p>
                </div>
            </div>
            <div class="post-content">
                <p>Jajaj A un wey se le cayo su INE y que lo afilio a Morena, Ponganse al tiro Morros</p>
                <img src="imgDashb/morena.jfif" alt="Post Image">
            </div>
            <div class="likes-comment-preview">
                <div class="likes-preview">
                    <span class="count-likes"></span>
                </div>
                <div class="Comment-share-preview">
                    <span>10.5k comments</span>
                    <span>3.8k shares</span>
                </div>
            </div>
            <div class="post-actions">
                <button><i class='bx bx-heart'></i> Love</button>
                <button><i class='bx bx-message-rounded'></i> Comment</button>
                <button><i class='bx bx-share'></i> Share</button>
                <button style="margin-left: auto;"><i class='bx bx-edit'></i> Editar</button>
                <button><i class='bx bx-trash'></i> Eliminar</button>
            </div>
        </div>
        
        <footer>
            <img src="imgDashb/Borosv1.jpg" alt="" class="logo">
            <div class="social-icons-container">
                <a href="" class="social-icon"></a>
                <a href="" class="social-icon"></a>
                <a href="" class="social-icon"></a>
                <a href="" class="social-icon"></a>
            </div>
            <ul class="footer-menu-container">
                <li class="menu-item">Legal</li>
                <li class="menu-item">Cookies</li>
                <li class="menu-item">Privacy</li>
                <li class="menu-item">Shipping</li>
                <li class="menu-item">Refounds</li>
            </ul>
            <span class="copyright">&copy;2024, Boros Industries. All rights reserved.</span>
        </footer>
    </section>
                
        <script src="main.js"></script>        
                
</body>
</html>
