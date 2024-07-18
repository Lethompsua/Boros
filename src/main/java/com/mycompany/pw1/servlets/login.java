/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.pw1.servlets;

import com.mycompany.pw1.classes.Conexion;
import com.mycompany.pw1.models.Usuarios;
import com.mycompany.pw1.persistencia.UsuariosJpaController;
import jakarta.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author sadam
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String nombreUsuario = request.getParameter("username");
        String pass = request.getParameter("password");

        UsuariosJpaController usuarioController = new UsuariosJpaController(Persistence.createEntityManagerFactory("bdpw1"));
        Usuarios usuario = usuarioController.findUsuario(nombreUsuario, pass);

        if (usuario != null) {
            request.getSession().setAttribute("idUsuario", usuario.getIdUsuario());
            request.getSession().setAttribute("usuarioLogueado", usuario);
            request.getRequestDispatcher("homeServlet").forward(request, response);
        } else {
            // Si el usuario es nulo, significa que el nombre de usuario o contraseña son incorrectos
            String errorMessage = "Usuario o contraseña incorrectos";
            response.sendRedirect(request.getContextPath() + "/AlertInicioInco.jsp?errorMessage=" + errorMessage);
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
        return "Short description";
    }
}

