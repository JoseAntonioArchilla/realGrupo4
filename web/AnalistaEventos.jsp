<%-- 
    Document   : AnalistaEventos
    Created on : 20-abr-2021, 17:49:40
    Author     : carlo
--%>

<%@page import="grupo4app.entity.Usuario"%>
<%@page import="grupo4app.entity.Filtro"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AnalistaEventos</title>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <%
        List<Filtro> listaFiltros = (List)request.getAttribute("listaFiltros");
        Usuario u = (Usuario) session.getAttribute("usuario");
        %>
    <body>
        <!-- Navbar -->      
        <div class="row py-2 text-center" style="background: #de7ebf">
            <style>
                body{
                background-image: url("img/pattern.jpg");
            }
                
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
            <a class="col-2  text-decoration-none" href="ServletInicioSesion?usuario=<%= u.getNickname()%>&contrasena=<%= u.getPassword()%>">
                <img src="img/Logo.png" style="width:2em; height:2em;">
            </a>
                <div class="col-4"></div>
                <%
                if(u.getRol() == 3){
            %>
                <div class="col-4 d-flex justify-content-center ">
                    <a class="text-decoration-none" href="CrearAnalisis.jsp">Crear analisis</a>
                </div>
            <%
                } else {
            %>
                <div class="col-4"></div>
            <%
                }
                %>                          
                <div  class="col-2 dropdown">
                <img src="img/avatar.png" style="width:2em; height:2em;">
                <div class="dropdown-content">
                    <a class="row dropdown-element text-decoration-none" href="ServletCargarListaEventosUsuario">Mi perfil</a>
                    <%
                        if(u.getRol() != 1){
                            %><a class="row dropdown-element text-decoration-none" href="ServletListarConversaciones">Mensajes</a><%
                        }
                    %>
                    <a class="row dropdown-element text-decoration-none" href="ServletCerrarSesion">Cerrar sesion</a>
                </div>
            </div>
        </div>
        <h1>Bienvenido analista de eventos</h1>
        <h4>Lista de analisis: </h4>
        <hr style="width: 100%">
        <table>
        <tr>
            <th>Filtros</th>
        <tr/>
        <%
            for(Filtro filtro : listaFiltros){
        %>
        <tr>
            <td><%= filtro.getFiltroPK().getIdfiltro()%></td>
            <td><%= filtro.getNombre()%></td>
            <td><a href="ServletBorrarFiltro?id=<%=filtro.getFiltroPK().getIdfiltro()%>">Borrar</a></td>
            <td><a href="ServletCrearEditarFiltro?id=<%=filtro.getFiltroPK().getIdfiltro()%>">Editar</a></td>
            <td><a href="ServletMostrarEventoUsuarios?id=<%=filtro.getFiltroPK().getIdfiltro()%>">Mostrar</a></td>"
        </tr>     
        <%
            }    
        %>   
        </table>
        <!--<form>-->  
          <!-- <input type="button" value="NuevoAnalisis" onclick="location.href='ServletCrearEditarFiltro'"> -->
          <!--<a href="ServletCrearEditarFiltro">Nuevo Filtro</a> -->
        <!--</form>--> 
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
