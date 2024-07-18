package com.mycompany.pw1.servlets;

import com.mycompany.pw1.models.Publicaciones;
import com.mycompany.pw1.persistencia.PublicacionesJpaController;
import com.mycompany.pw1.persistencia.exceptions.NonexistentEntityException;
import java.io.IOException;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

@WebServlet(name = "modificarPublicacionServlet", urlPatterns = {"/modificarPublicacionServlet"})
public class modificarPublicacionServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("bdpw1");
        PublicacionesJpaController publicacionController = new PublicacionesJpaController(emf);

        String idString = request.getParameter("idPublicacion");
        String titulo = request.getParameter("ftitulo");
        String descripcion = request.getParameter("fdesc");
        String categoria = request.getParameter("fcategoria");

        if (idString != null && !idString.isEmpty() && titulo != null && descripcion != null) {
            try {
                int id = Integer.parseInt(idString);
                Publicaciones publicacion = publicacionController.findPublicaciones(id);
                if (publicacion != null) {
                    publicacion.setTitulo(titulo);
                    publicacion.setDescripcion(descripcion);
                    publicacion.setCategoria(categoria);
                    publicacion.setFechaMovimiento(new Date());
                    publicacionController.edit(publicacion);
                    response.sendRedirect("homeServlet");  // Redirigir a la página principal después de guardar
                } else {
                    response.sendRedirect("error.jsp");  // Redirigir a una página de error si no se encuentra la publicación
                }
            } catch (NumberFormatException | NonexistentEntityException e) {
                response.sendRedirect("error.jsp");  // Redirigir a una página de error si el ID no es un número válido o si ocurre un error
            } catch (Exception e) {
                response.sendRedirect("error.jsp");  // Redirigir a una página de error si ocurre un error general
            }
        } else {
            response.sendRedirect("error.jsp");  // Redirigir a una página de error si algún campo está nulo o vacío
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
        return "Servlet para guardar las modificaciones de una publicación";
    }
}
