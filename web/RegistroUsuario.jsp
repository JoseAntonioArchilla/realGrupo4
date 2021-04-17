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
    </head>
    
    <script>
        function mostrar_extra()
        {
            let cosa = document.getElementById("extra")
            let value = document.getElementById("seleccionador").value
                     
            cosa.style.visibility = value == "usuario" ? "visible" : "hidden"
        }
    </script>
    
    <body>
        <form style="display:flex; align-items: center; justify-content: center; flex-direction: column;"
              method="post" action="/ServletRegistroUsuario">
            <h1>Registro</h1>
            <input type="text" style="margin: 2em" name="usuario">
            <input type="text" style="margin: 2em" name="contraseña">
            <select id="seleccionador" name="rol" onchange="mostrar_extra()">
                <option value="0">Creador de evento</option>
                <option value="1">Administrador del sistema</option>
                <option value="2">Teleoperador</option>
                <option value="3">Analista de eventos</option>
                <option value="4">Usuario de evento</option>
            </select>
           
            <div id="extra" style="visibility: hidden">
                <input type="text" style="margin: 2em" name="Apellidos">
                <input type="text" style="margin: 2em" name="Domicilio">
                <input type="text" style="margin: 2em" name="Ciudad">
                <input type="text" style="margin: 2em" name="Edad">
                <input type="radio" style="margin: 2em" name="Sexo" value="Hombre"> Hombre
                <input type="radio" style="margin: 2em" name="Sexo" value="Mujer"> Mujer
                <input type="radio" style="margin: 2em" name="Sexo" value="Otro"> Otro
            </div>        
                
            <input type="submit" style="margin: 2em" >
        </form>
    </body>
    
</html>
