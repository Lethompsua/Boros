package com.mycompany.pw1.servlets;

import com.mycompany.pw1.models.Publicaciones;
import com.mycompany.pw1.persistencia.PublicacionesJpaController;
import com.mycompany.pw1.persistencia.exceptions.NonexistentEntityException;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

@WebServlet(name = "EliminarPubliServlet", urlPatterns = {"/EliminarPubliServlet"})
public class EliminarPubliServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("bdpw1");
        PublicacionesJpaController publicacionController = new PublicacionesJpaController(emf);

        String idString = request.getParameter("idPublicacion");
        if (idString != null && !idString.isEmpty()) {
            try {
                int id = Integer.parseInt(idString);
                publicacionController.editEstatus(id, false);
                response.sendRedirect("homeServlet");  // Redirigir al homeServlet después de la eliminación
            } catch (NumberFormatException | NonexistentEntityException e) {
                response.sendRedirect("error.jsp");  // Redirigir a una página de error si el ID no es válido o la publicación no existe
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
        return "Servlet para eliminación lógica de publicaciones";
    }
}
