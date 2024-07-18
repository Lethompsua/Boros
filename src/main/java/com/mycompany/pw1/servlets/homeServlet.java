package com.mycompany.pw1.servlets;

import com.mycompany.pw1.models.Publicaciones;
import com.mycompany.pw1.models.Usuarios;
import com.mycompany.pw1.persistencia.PublicacionesJpaController;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

@WebServlet(name = "homeServlet", urlPatterns = {"/homeServlet"})
public class homeServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("bdpw1");
        PublicacionesJpaController publicacionController = new PublicacionesJpaController(emf);
        
        int recordsPerPage = 10; // Número de publicaciones por página
        int currentPage = 1; // Página predeterminada
        if (request.getParameter("page") != null) {
            currentPage = Integer.parseInt(request.getParameter("page"));
        }
        
        int offset = (currentPage - 1) * recordsPerPage;
        
        List<Publicaciones> listaPublicaciones = publicacionController.findPublicacionesActivasPaginadas(offset, recordsPerPage);
        int totalPublicaciones = publicacionController.getPublicacionesCount();
        int totalPages = (int) Math.ceil((double) totalPublicaciones / recordsPerPage);
        
        request.setAttribute("ListaPublicaciones", listaPublicaciones);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", currentPage);

        // Agregar información de usuarios a la solicitud
        request.setAttribute("usuarios", getUsuarios(listaPublicaciones));
        
        request.getRequestDispatcher("/Dashboard.jsp").forward(request, response);
    }

    // Método para obtener los usuarios de las publicaciones
    private List<Usuarios> getUsuarios(List<Publicaciones> publicaciones) {
        return publicaciones.stream()
                            .map(Publicaciones::getUsuario)
                            .collect(Collectors.toList());
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
        return "Servlet for handling home page requests";
    }
}
