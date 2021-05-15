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
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <%
            Usuario usuario = (Usuario) request.getAttribute("usuario");
            UsuarioEvento usuarioEvento = (UsuarioEvento) request.getAttribute("usuarioEvento");
            List<EventoUsuario> listaEventos = (List) request.getAttribute("listaEventos");
        %>
        <h1>Mi perfil</h1>
        <form action="EditarPerfil.jsp">
            Nombre: <%=usuario.getNickname()%><br>
            Rol: <%=usuario.getRol() == 0 ? "Creador de evento" : (usuario.getRol() == 1 ? "Administrador del sistema" : (usuario.getRol() == 2 ? "Teleoperador" : (usuario.getRol() == 3 ? "Analista de eventos" : "Usuario de evento")))%><br>
            <%
                if(usuarioEvento != null){
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
                                <a href="ServletCancelarEntrada?eventoUsuario=<%= e.getEventoUsuarioPK().getIdeventousuario()%>" style="margin-left:2em;">
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
        </div>
    </body>
</html>
