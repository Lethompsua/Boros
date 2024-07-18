<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login | Boros</title>
    <!-- Incluir hojas de estilo CSS -->
    <link href="master.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="Loginbox">
    <img class="LogonV" src="img/Borosv1.jpg" alt="Logo de Skull">
    <h1>Login Here</h1>
    
    <!-- OLA -->
    
   
    
     <!-- OLA -->
    
    
    
    <form action="login" method="POST">
        <!--  USERNAME   -->
        <label for="username">Username</label>
        <input type="text" id="username" name="username" placeholder="Enter Username" required>
        
        <!--  PASSWORD   -->
        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter Password" required>

        <input type="submit" value="Log In">
        <br>
        <a href="#" id="show-registration">Don't have an account?</a>
    </form>
</div>

<div class="Popup">
    <div class="close-btn">&times;</div>
    <h1>Register</h1>
     <form action="registroServlet" method="POST" enctype="multipart/form-data" onsubmit="return validateForm()">
        <div class="form-element">
            <label for="nombres">Nombre(s)</label>
            <input type="text" id="nombres" name="nombres" placeholder="Ingrese su nombre(s)" required>
            
            <label for="apellidos">Apellidos</label>
            <input type="text" id="apellidos" name="apellidos" placeholder="Ingrese sus apellidos" required>

            <label for="username_reg">Nombre de Usuario</label>
            <input type="text" id="username_reg" name="username" placeholder="Ingrese su nombre de usuario" required>

            <label for="correo">Correo Electrónico</label>
            <input type="email" id="correo" name="correo" placeholder="Ingrese su correo electrónico" required>
            
            <label for="password_reg">Contraseña</label>
            <input type="password" id="password_reg" name="password" placeholder="Ingrese su contraseña" required>
            
            <label for="fecha_nacimiento">Fecha de Nacimiento</label>
            <input type="date" id="fecha_nacimiento" name="fecha_nacimiento" required>
            
            <label for="imagen_perfil">Imagen de Perfil</label>
            <input type="file" id="imagen_perfil" name="imagen_perfil" accept="image/*" required>
            
            <input type="submit" value="Registrarse">
        </div>
    </form>
</div>

<script src="Log.js"></script>

<script>
    // Función para registrar Popup
    document.getElementById("show-registration").addEventListener("click", function(event) {
        event.preventDefault(); // Prevent default anchor behavior
        document.querySelector(".Popup").classList.add("active");
    });

    // Función para cerrar Popup
    document.querySelector(".Popup .close-btn").addEventListener("click", function() {
        document.querySelector(".Popup").classList.remove("active");
    });

    // Función para validar el formato de correo electrónico
    function validateEmail(email) {
        const re = /\S+@\S+\.\S+/;
        return re.test(email);
    }

    // Función para validar la fecha de nacimiento
    function validateDate(date) {
        const currentDate = new Date();
        const selectedDate = new Date(date);
        return selectedDate <= currentDate;
    }

    // Función principal de validación del formulario
    function validateForm() {
        const correo = document.getElementById("correo").value;
        const fechaNacimiento = document.getElementById("fecha_nacimiento").value;

        if (!validateEmail(correo)) {
            alert("Por favor ingrese un correo electrónico válido.");
            return false;
        }

        if (!validateDate(fechaNacimiento)) {
            alert("La fecha de nacimiento no puede ser en el futuro.");
            return false;
        }

        return true; // Envía el formulario si todas las validaciones pasan
    }
</script>
</body>
</html>
