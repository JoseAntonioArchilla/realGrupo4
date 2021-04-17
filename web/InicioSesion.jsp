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
    </head>
    <body>
        
        <form style="display:flex; align-items: center; justify-content: center; flex-direction: column;"
              method="post" action="/ServletInicioSesion">
            <h1>Inicio de sesion</h1>
            <input type="text" style="margin: 2em" name="usuario">
            <input type="text" style="margin: 2em" name="contraseña">
            <input type="submit" style="margin: 2em" >
        </form>
        
        
        <a href="RegistroUsuario.jsp" style="margin-left: 40%">¿Todavía no tienes una cuenta?</a>
    </body>
</html>
