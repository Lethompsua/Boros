<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Error</title>
</head>
<body>
    <div class="error-container">
      
    </div>
    <script type="text/javascript">
        // Esta función se ejecuta cuando se carga la página
        window.onload = function() {
            // Esta línea muestra una alerta cuando la página está completamente cargada
            alert("Ha ocurrido un error al procesar tu solicitud. Haz clic en Aceptar para volver a la página principal.");
            // Redirige al usuario a homeServlet después de que acepte la alerta
            window.location.href = '<%= request.getContextPath() %>/homeServlet';
        };
    </script>
</body>
</html>
