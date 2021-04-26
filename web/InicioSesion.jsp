<%-- 
    Document   : InicioSesion
    Created on : 17-abr-2021, 11:40:09
    Author     : chinchar@hotmail.es
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de sesion</title>
        
        <link href="estilos/estiloFormulario.css" rel="stylesheet">
         
    </head>
    
    <body>        
        <div class="contact_form">

            <div class="formulario">      
              <h1>Incicio de sesión</h1>               

                <form method="post" action="ServletInicioSesion">       
                    <p>
                        <label for="usuario" class="colocar_nombre">Usuario</label>
                        <input type="text" name="usuario" id="usuario" required placeholder="Escribe tu usuario">
                    </p>
                      
                    <p>
                        <label for="contraseña" class="colocar_nombre">Contraseña</label>
                        <input type="password" name="contraseña" id="contraseña" required placeholder="Escribe tu contraseña">
                    </p>

                    <button type="submit" name="enviar_formulario" id="enviar"><p>Enviar</p></button>
                </form>
              
                <a href="RegistroUsuario.jsp">¿Todavía no tienes una cuenta?</a>
            </div>  
        </div>               
    </body>
</html>
