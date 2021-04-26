<%-- 
    Document   : Administrador
    Created on : 21-abr-2021, 13:54:05
    Author     : nieto
--%>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="grupo4app.entity.Usuario"%>
<%@page import="grupo4app.entity.UsuarioEvento"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
        <link rel="stylesheet" href="estilos/estiloAdministrador.css">

        
        
        
         <%
        List<Usuario> listaUsuarios = (List)request.getAttribute("listaUsuarios");
        if(listaUsuarios == null){
            response.sendRedirect("ServletUsuarioListar");
        }
    %>
    <script>
        console.log("adios");
        <%
            if(request.getAttribute("error") != null){
        %>
        alert(<%=request.getAttribute("error")%>);
        console.log("hola");
        <%
            }
        %>
    </script>
    </head>
    
    <body class='container py-5'>
       
        
        <img src="img/Logo.png" alt="logo" id ="logo">
        
        Buscar: <input type="search" id="buscador">
        
        <div class='d-flex justify-content-between'>
            <h1 class='col-5 text-center'>USUARIOS</h1>

            <div class="col-1"></div>
        </div>
        
        <hr style='width: 100%;'>
        
        <table border="1">
            <row span="1" class="fondoTabla"></row>
            <tr>
                <td>Nickname</td>
                <td>Rol</td>
            </tr>
            <%
                if(listaUsuarios != null){
                    for(Usuario us: listaUsuarios){  
                        if(us != null){
            %>
                    <tr>
                        <td><%=us.getNickname()%></td>
                        <td><%=us.getRol()%></td>
                    </tr>
            <%
                        }
                    }
                }
            %>
        </table>
            
        <script>
            function mostrar_extra()
            {
                let cosa = document.getElementById("extra");
                let value = document.getElementById("seleccionador").value;
                cosa.style.display = value === "4" ? "block" : "none"
            }
        </script>

        <form class='row justify-content-center' method="post" action="ServletAñadirUsuario">
            <div class='row'>
                <p class="col-6">Usuario</p>
                <input class='col-6 my-1' type="text" name="usuario">
            </div>
            <div class='row'>
                <p class="col-6">Contraseña</p>
                <input class='col-6 my-1' type="password" name="password">
            </div>
            <div class='row'>
                <p class="col-6">Rol</p>
                <select class='col-6 my-1' id="seleccionador" name="rol" onchange="mostrar_extra()">
                    <option value="0">Creador de evento</option>
                    <option value="1">Administrador del sistema</option>
                    <option value="2">Teleoperador</option>
                    <option value="3">Analista de eventos</option>
                    <option value="4">Usuario de evento</option>
                </select>
            </div>

            <div id="extra" style="display:none;">

                <hr style='width: 100%;'>                    

                <div class='row'>
                    <p class="col-6">Apellidos</p>
                    <input class="my-1 col-6" type="text" name="apellidos">
                </div>
                <div class='row'>
                    <p class="col-6">Domicilio</p>
                    <input class="my-1 col-6" type="text" name="domicilio">
                </div>
                <div class='row'>
                    <p class="col-6">Ciudad</p>
                    <input class="my-1 col-6" type="text" name="ciudad">
                </div>
                <div class='row'>
                    <p class="col-6">Edad</p>
                    <input class="my-1 col-6" type="text" name="number" min="0" max="122">
                </div>
                <div class='row'>
                    <p class="col-6">Sexo</p>
                    <select class="my-1 col-6" name="sexo">
                        <option value="0">Hombre</option>
                        <option value="1">Mujer</option>
                        <option value="2">Otro</option>
                    </select>
                </div>  
            </div>
            
            <input type = "submit" value="Añadir"/>
            <button name="mostrar">Mostrar</button>
            <button name="modificar">Modificar</button>
            <button name="borrar">Borrar</button>
        </form>
    </body>
</html>
