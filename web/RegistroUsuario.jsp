<%-- 
    Document   : RegistroUsuario
    Created on : 17-abr-2021, 11:52:08
    Author     : chinchar@hotmail.es
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Registro</title>
        
        <link href="estilos/estiloFormulario.css" rel="stylesheet">
    </head>
    
    <script>
        function mostrar_extra()
        {
            let value = document.getElementById("seleccionador").value;
            const visible = value === "4";
            document.getElementById("extra").style.display = visible ? "block" : "none";
            document.getElementById("nombre").required = visible;
            document.getElementById("apellidos").required = visible;
            document.getElementById("email").required = visible;
            document.getElementById("edad").required = visible;
            document.getElementById("domicilio").required = visible;
            document.getElementById("ciudad").required = visible;
        }
    </script>
    
    <body>
        <div class="contact_form">
            <div class="formulario">      
                <h1>Registro</h1>
                <form method="post" action="ServletRegistroUsuario">  
                    <p>
                        <label for="usuario" >Usuario</label>
                        <input type="text" name="usuario" id="usuario" required placeholder="Escribe tu usuario">
                    </p>

                    <p>
                        <label for="contraseña" >Contraseña</label>
                        <input type="password" name="password" id="contraseña" required placeholder="Escribe tu contraseña">
                    </p>

                    <select id="seleccionador" name="rol" onchange="mostrar_extra()">
                        <option value="0">Creador de evento</option>
                        <option value="1">Administrador del sistema</option>
                        <option value="2">Teleoperador</option>
                        <option value="3">Analista de eventos</option>
                        <option value="4">Usuario de evento</option>
                    </select>

                    <div id="extra" style="display:none;">
                        <p>
                            <label for="nombre" >Nombre</label>
                            <input type="text" name="Nombre" id="nombre" placeholder="Escribe tu nombre">
                        </p>

                        <p>
                            <label for="apellidos" >Apellidos</label>
                            <input type="text" name="Apellidos" id="apellidos" placeholder="Escribe tus apellidos">
                        </p>

                        <p>
                            <label for="edad" >Edad</label>
                            <input type="number" name="Edad" id="edad" placeholder="Escribe tu edad">
                        </p>

                        <p>
                            <label for="email" >Email</label>
                            <input type="email" name="Email" id="email" placeholder="Escribe tu email">
                        </p>

                        <p>
                            <label for="domicilio" >Domicilio</label>
                            <input type="text" name="Domicilio" id="domicilio" placeholder="Escribe tu domicilio">
                        </p>

                        <p>
                            <label for="ciudad" >Ciudad</label>
                            <input type="text" name="Ciudad" id="ciudad" placeholder="Escribe tu ciudad">
                        </p>

                    </div>

                    <button type="submit" name="enviar_formulario" id="enviar"><p>Enviar</p></button>
                </form>
            </div>  
        </div>
    </body>
    
</html>
