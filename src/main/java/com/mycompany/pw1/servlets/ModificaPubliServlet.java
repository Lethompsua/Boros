package com.mycompany.pw1.servlets;

import com.mycompany.pw1.models.Publicaciones;
import com.mycompany.pw1.models.Usuarios;
import com.mycompany.pw1.persistencia.PublicacionesJpaController;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

@WebServlet(name = "ModificaPubliServlet", urlPatterns = {"/ModificaPubliServlet"})
public class ModificaPubliServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("bdpw1");
        PublicacionesJpaController publicacionController = new PublicacionesJpaController(emf);

        HttpSession session = request.getSession();
        Usuarios usuarioLogueado = (Usuarios) session.getAttribute("usuarioLogueado"); // Obtener el objeto de usuario logueado de la sesión
        if (usuarioLogueado == null) {
            response.sendRedirect("login.jsp");  // Redirigir a la página de login si no hay usuario logueado
            return;
        }

        String idString = request.getParameter("idPublicacion");
        if (idString != null && !idString.isEmpty()) {
            try {
                int id = Integer.parseInt(idString);
                Publicaciones publicacion = publicacionController.findPublicaciones(id);
                if (publicacion != null) {
                    // Verificar si el usuario logueado es el dueño de la publicación
                    if (publicacion.getUsuario().getIdUsuario() == usuarioLogueado.getIdUsuario()) {
                        request.setAttribute("publicacion", publicacion);
                        request.getRequestDispatcher("/EditarPublicacion.jsp").forward(request, response);
                    } else {
                        response.sendRedirect("error.jsp");  // Redirigir a una página de error si el usuario no es el dueño
                    }
                } else {
                    response.sendRedirect("error.jsp");  // Redirigir a una página de error si no se encuentra la publicación
                }
            } catch (NumberFormatException e) {
                response.sendRedirect("error.jsp");  // Redirigir a una página de error si el ID no es un número válido
            }
        } else {
            response.sendRedirect("error.jsp");  // Redirigir a una página de error si el ID es nulo o vacío
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet para modificar publicaciones";
    }
}

