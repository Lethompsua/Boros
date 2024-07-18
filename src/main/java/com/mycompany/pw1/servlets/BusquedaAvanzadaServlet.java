package com.mycompany.pw1.servlets;

import com.mycompany.pw1.models.Publicaciones;
import com.mycompany.pw1.persistencia.PublicacionesJpaController;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author sadam
 */
@WebServlet(name = "BusquedaAvanzadaServlet", urlPatterns = {"/BusquedaAvanzadaServlet"})
public class BusquedaAvanzadaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
       
        String texto = request.getParameter("txtBusqueda");
        String categoria = request.getParameter("categoria");
        String fechaInicialStr = request.getParameter("fecha-inicial");
        String fechaFinalStr = request.getParameter("fecha-final");
        
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaInicial = null;
        Date fechaFinal = null;
        
        try {
            if (fechaInicialStr != null && !fechaInicialStr.isEmpty()) {
                fechaInicial = dateFormat.parse(fechaInicialStr);
            }
            if (fechaFinalStr != null && !fechaFinalStr.isEmpty()) {
                fechaFinal = dateFormat.parse(fechaFinalStr);
            }
        } catch (ParseException ex) {
            // Manejo de error si la fecha no está en el formato esperado
            ex.printStackTrace();
        }
        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("bdpw1");
        PublicacionesJpaController publicacionController = new PublicacionesJpaController(emf);
        
        List<Publicaciones> listaPublicaciones = publicacionController.findPublicacionesAvanzadas(texto, categoria, fechaInicial, fechaFinal);
        request.setAttribute("ListaPublicaciones", listaPublicaciones);
        request.getRequestDispatcher("/Dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
