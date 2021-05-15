<%-- 
    Document   : Perfil
    Created on : 13-may-2021, 18:25:43
    Author     : nieto
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="grupo4app.entity.EventoUsuario"%>
<%@page import="grupo4app.entity.UsuarioEvento"%>
<%@page import="grupo4app.entity.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Usuario usuario = (Usuario) request.getAttribute("usuario");
            UsuarioEvento usuarioEvento = (UsuarioEvento) request.getAttribute("usuarioEvento");
            
            if(usuario == null){
                HttpSession sesion = request.getSession();
                usuario = (Usuario) sesion.getAttribute("usuario");
                usuarioEvento = (UsuarioEvento) sesion.getAttribute("usuarioEvento");
            }
            List<EventoUsuario> listaEventos = new ArrayList<EventoUsuario>();
        %>
        <h1>Mi perfil</h1>
        <form action="EditarPerfil.jsp">
            Nombre: <%=usuario.getNickname()%><br>
            Rol: <%=usuario.getRol() == 0 ? "Creador de evento" : (usuario.getRol() == 1 ? "Administrador del sistema" : (usuario.getRol() == 2 ? "Teleoperador" : (usuario.getRol() == 3 ? "Analista de eventos" : "Usuario de evento")))%><br>
            <%
                if(usuarioEvento != null){
                    listaEventos = usuarioEvento.getEventoUsuarioList();
            %>
            Nombre: <%=usuarioEvento.getNombre()%><br>
            Apellido: <%=usuarioEvento.getApellido()%><br>
            Ciudad: <%=usuarioEvento.getCiudad()%><br>
            Domicilio: <%=usuarioEvento.getDomicilio()%><br>
            Edad: <%=usuarioEvento.getEdad()%><br>
            Sexo: <%=usuarioEvento.getSexo()%><br>
            <%
                }
            %>
            <button>Editar</button>
        </form>          
        <div class="py-3 row">  
            <!-- Grid -->
            <div class="col-10">
                <div class="row">
                    <%
                    for(EventoUsuario e : listaEventos){
                    %>
                    <div class="col-4">
                        <div class="row">
                            <a href="ServletMostrarEvento?idEvento=<%=e.getEvento().getIdevento()%>" class="col-6"><img width="100%" height="100%" src="img/Logo.png"></a>
                            <div class="col-6">
                                <h2><%=e.getEvento().getTitulo()%></h2>
                                <p><%=e.getEvento().getDescripcion()%>
                                <a href="ServletMostrarUsuario">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                        <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
                                    </svg>
                                </a>                
                                <a href="ServletEliminarUsuario>" style="margin-left:2em;">
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
                <form action="">
                    <br>
                    <br>
                    <br>
                    <div>
                        <h3>Todos los eventos</h3>
                        <div class="row justify-content-start px-1 my-3">
                            <input type = "submit" value="Mostrar todos los eventos"/>
                        </div>
                    </div>
                    
                </form>
                </div>
        </div>
    </body>
</html>
