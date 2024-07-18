/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.pw1.servlets;

import com.mycompany.pw1.models.Publicaciones;
import com.mycompany.pw1.models.Usuarios;
import com.mycompany.pw1.persistencia.PublicacionesJpaController;
import com.mycompany.pw1.persistencia.UsuariosJpaController;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author sadam
 */
@WebServlet(name = "crearPublicacionServlet", urlPatterns = {"/crearPublicacionServlet"})
public class crearPublicacionServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
         int idUsuario = (int) request.getSession().getAttribute("idUsuario");
        
         String titulo = request.getParameter("ftitulo");
         String desc = request.getParameter("fdesc");
         String categoria = request.getParameter("fcategoria");
         Date fechaCreacion = new Date();
         Date fechaMovimiento = new Date();
         
         EntityManagerFactory emf = Persistence.createEntityManagerFactory("bdpw1");
         
         UsuariosJpaController usuarioController =  new UsuariosJpaController(emf);
      
         Usuarios usuario = usuarioController.findUsuarios(idUsuario);
         
         PublicacionesJpaController publicacionController =  new PublicacionesJpaController(emf);
         
         Publicaciones publicacion = new Publicaciones();
         
         publicacion.setTitulo(titulo);
         publicacion.setDescripcion(desc);
         publicacion.setCategoria(categoria);
         publicacion.setFechaCreacion(fechaCreacion);
         publicacion.setFechaMovimiento(fechaMovimiento);
         publicacion.setEstatus(true);
         publicacion.setUsuario(usuario);
         publicacionController.create(publicacion);
         
        /* List<Publicaciones> listaPublicaciones = publicacionController.findPublicacionesEntities();
         request.setAttribute("ListaPublicaciones", listaPublicaciones);
         request.getRequestDispatcher("/home.jsp").forward(request, response);*/
         request.getRequestDispatcher("homeServlet").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
