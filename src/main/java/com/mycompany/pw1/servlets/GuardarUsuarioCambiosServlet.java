package com.mycompany.pw1.servlets;

import com.mycompany.pw1.models.Usuarios;
import com.mycompany.pw1.persistencia.UsuariosJpaController;
import com.mycompany.pw1.persistencia.exceptions.NonexistentEntityException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import javax.persistence.Persistence;
import java.io.*;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "GuardarUsuarioCambiosServlet", urlPatterns = {"/GuardarUsuarioCambiosServlet"})
@MultipartConfig
public class GuardarUsuarioCambiosServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        // Obtener el ID de usuario de la sesión
        int idUsuario = (int) request.getSession().getAttribute("idUsuario");

        // Obtener los datos del formulario
        String nombreUsuario = request.getParameter("nombreUsuario");
        String pass = request.getParameter("password");
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String correo = request.getParameter("correo");
        String text_fechaNacimiento = request.getParameter("fechaNacimiento");

        // Procesamiento de la imagen
        Part filePart = request.getPart("imagen_perfil");

        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String urlImg = nombreUsuario + "_" + fileName;
            String uploadPath = "C:\\Uploads\\" + urlImg; // Ajustar ruta de acuerdo a tu sistema

            try (OutputStream out = new FileOutputStream(new File(uploadPath));
                 InputStream fileContent = filePart.getInputStream()) {
                int read;
                final byte[] bytes = new byte[1024];
                while ((read = fileContent.read(bytes)) != -1) {
                    out.write(bytes, 0, read);
                }
            } catch (FileNotFoundException fne) {
                System.out.println("Error al subir archivo: " + fne.getMessage());
            }

            String relativePath = "uploads/" + urlImg;

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date fecha_Nacimiento = null;

            try {
                fecha_Nacimiento = dateFormat.parse(text_fechaNacimiento);
            } catch (Exception e) {
                System.out.println("Error al parsear fecha: " + e.getMessage());
            }

            // Obtener la instancia de UsuariosJpaController
            UsuariosJpaController usuarioController = new UsuariosJpaController(Persistence.createEntityManagerFactory("bdpw1"));

            // Obtener el usuario a editar
            Usuarios usuario = usuarioController.findUsuarios(idUsuario);

            // Actualizar los datos del usuario
            usuario.setNombreUsuario(nombreUsuario);
            usuario.setPassword(pass);
            usuario.setUrlImgPerfil(relativePath);
            usuario.setFechaNacimiento(fecha_Nacimiento);
            usuario.setNombres(nombres);
            usuario.setApellidos(apellidos);
            usuario.setCorreo(correo);

            try {
                // Guardar los cambios en la base de datos
                usuarioController.edit(usuario);
            } catch (NonexistentEntityException ex) {
                // Manejar excepción si el usuario no existe
                System.out.println("El usuario con ID " + idUsuario + " no existe.");
            } catch (Exception ex) {
                // Manejar otras excepciones
                System.out.println("Error al editar usuario: " + ex.getMessage());
            }

            response.sendRedirect("Dashboard.jsp"); // Redireccionar al perfil después de la edición
        } else {
            // Manejar el caso cuando filePart es null o vacío
            response.getWriter().println("No file uploaded or file is empty.");
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
