package com.mycompany.pw1.servlets;

import com.mycompany.pw1.models.Usuarios;
import com.mycompany.pw1.persistencia.UsuariosJpaController;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javax.persistence.Persistence;



@WebServlet(name = "ModificaServlet", urlPatterns = {"/ModificaServlet"})
public class ModificaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener el ID del usuario de la sesión
        Integer idUsuario = (Integer) request.getSession().getAttribute("idUsuario");

        if (idUsuario != null) {
            // Crear una instancia del controlador JPA de Usuarios
            UsuariosJpaController usuarioController = new UsuariosJpaController(Persistence.createEntityManagerFactory("bdpw1"));

            // Buscar al usuario por su ID en la base de datos
            Usuarios usuario = usuarioController.findUsuarios(idUsuario);

            // Verificar si el usuario existe
            if (usuario != null) {
                // Si el usuario existe, configurar el atributo "Usuario" en la solicitud
                request.setAttribute("Usuario", usuario);
                // Redirigir a la página de perfil para mostrar los datos
                request.getRequestDispatcher("editarPerfil.jsp").forward(request, response);
            } else {
                // Si el usuario no existe, redirigir a una página de error
                response.sendRedirect("error.jsp");
            }
        } else {
            // Si no hay ID de usuario en la sesión, redirigir a la página de inicio de sesión
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Perfil Servlet";
    }
}
