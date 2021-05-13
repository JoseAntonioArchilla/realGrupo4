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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">    
    <%
        HttpSession sesionUsuario = request.getSession();
        List<Usuario> listaUsuarios = (List)sesionUsuario.getAttribute("listaUsuarios");
        if(listaUsuarios == null){
            response.sendRedirect("ServletUsuarioListar");
        }
    %>

    </head>
    
    <body>     
        <div class="row py-2 text-center" style="background: #de7ebf">
             <style>
                 a{
                     font-size: 1.3em;
                     color: black
                 }
                a:hover{
                    font-weight: bold;
                    color: black;
                    text-decoration: none;
                }
                .dropdown{
                    position: relative;display: inline-block;
                }
                .dropdown-content{
                    display: none; position: absolute; z-index: 1
                }
                .dropdown:hover .dropdown-content{
                    display: block;
                }
                .dropdown-element
                {
                    background: #eccbe8;
                    text-align: center;
                    padding:  .3em;
                }
            </style>
            
            <a class="col-2  text-decoration-none" href="index.html">
                Logo
            </a>
            <form class="col-4">
                <input style="width: 100%; border-radius: 25px" type="text">
            </form>
            <div class="col-4 d-flex justify-content-around ">
                <a href="index.html">Inicio </a>
                <a href="index.html">Servicios </a>
                <a href="#">Contacto</a>
            </div>
            <div  class="col-2 dropdown">
                <img src="img/Logo.png" style="width:2em; height:2em;">
                <div class="dropdown-content">
                    <a class="row dropdown-element" href="index.html">Mi perfil</a>
                    <a class="row dropdown-element" href="index.html">Mensajes</a>
                    <a class="row dropdown-element" href="index.html">Ajustes</a>
                    <a class="row dropdown-element" href="index.html">Cerrar sesion</a>
                </div>
            </div>       
        </div>
        
        <div class='d-flex justify-content-between'>
            <h1 class='col-5 text-center'>USUARIOS</h1>

            <div class="col-1"></div>
        </div>
        
        <hr style='width: 100%;'>
        
        <!-- Contenido -->
        
        <div class="py-3 row">  
            <!-- Grid -->
            <div class="col-10">
                <div class="row">
                    <%
                    for(Usuario e : listaUsuarios){
                    %>
                    <div class="col-4">
                        <div class="row">
                            <a href="index.html" class="col-6"><img width="100%" height="100%" src="img/Logo.png"></a>
                            <div class="col-6">
                                <h2><%=e.getNickname()%></h2>
                                <p><%=e.getRol()%> </p>
                                <a href="ServletMostrarUsuario?id=<%= e.getIdusuario()%>">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                        <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
                                    </svg>
                                </a>                
                                <a href="ServletEliminarUsuario?usuario=<%= e.getIdusuario()%>" style="margin-left:2em;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                        <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                      </svg>
                                </a>

                            </div>
                        </div>
                    </div>
                    <%
                        }                       
                    %>
                </div>                
            </div>  
            <div class="col-2">
                <form method="post" action="ServletAñadirUsuario">
                    <div class='row'>
                        <p class="col-6 m-1">Usuario</p>
                        <input class='col-6 px-1 m-1' type="text" name="usuario">
                    </div>
                    <div class='row'>
                        <p class="col-6 m-1">Contraseña</p>
                        <input class='col-6 px-1 m-1' type="password" name="password">
                    </div>
                    <div class='row'>
                        <p class="col-6 m-1">Rol</p>
                        <select class='col-8 px-1 m-1' id="seleccionador" name="rol" onchange="mostrar_extra()">
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
                            <p class="col-6 m-1">Nombre</p>
                            <input class="m-1 px-1 col-6" type="text" name="nombre">
                        </div>
                        <div class='row'>
                            <p class="col-6 m-1">Apellidos</p>
                            <input class="m-1 px-1 col-6" type="text" name="apellidos">
                        </div>
                        <div class='row'>
                            <p class="col-6 m-1">Domicilio</p>
                            <input class="m-1 px-1 col-6" type="text" name="domicilio">
                        </div>
                        <div class='row'>
                            <p class="col-6 m-1">Ciudad</p>
                            <input class="m-1 px-1 col-6" type="text" name="ciudad">
                        </div>
                        <div class='row'>
                            <p class="col-6 m-1">Edad</p>
                            <input class="m-1 px-1 col-6" type="text" name="number" min="0" max="122">
                        </div>
                        <div class='row'>
                            <p class="col-6 m-1">Sexo</p>
                            <select class="m-1 px-1 col-6" name="sexo">
                                <option value="0">Hombre</option>
                                <option value="1">Mujer</option>
                                <option value="2">Otro</option>
                            </select>
                        </div>  
                    </div>
                    <div class="row justify-content-start px-1 my-3">
                        <input type = "submit" value="Añadir"/>
                    </div>
                </form>
                </div>
            </div>
        </div>
             <%
            if(request.getAttribute("error") != null){
        %>
        <p style="color:red"><%=request.getAttribute("error")%>
        <%
            }
        %>
        <script>
            function mostrar_extra()
            {
                let cosa = document.getElementById("extra");
                let value = document.getElementById("seleccionador").value;
                cosa.style.display = value === "4" ? "block" : "none"
            }
        </script>

        
    </body>
</html>
