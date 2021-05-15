<%-- 
    Document   : FiltrosUsuariosEventos
    Created on : 08-may-2021, 0:22:09
    Author     : carlo
--%>

<%@page import="grupo4app.entity.EventoUsuario"%>
<%@page import="grupo4app.entity.UsuarioEvento"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Muestro los usuarios filtrados</title>
    </head>
    <%
        List<EventoUsuario> listaUsuarios = (List)request.getAttribute("filtrados");
        %>
    <body>
        <h1>Usuarios filtrados: </h1>
        <table border="1">
        <tr>
            <th>Nombre usuario</th>
            <th>Nombre evento</th>
        <tr/>
        <%
            if(!listaUsuarios.isEmpty()){
            for(EventoUsuario filtrado : listaUsuarios){
        %>
        <tr>
            <td><%= filtrado.getUsuarioEvento().getNombre() %></td>
            <td><%= filtrado.getEvento().getTitulo() %></td>
        </tr>     
        <%
            }  
        } else{
        %>   
        <p>Nada de nada</p>       
        <%
            }      
        %> 
        
        </table>
    </body>
</html>
