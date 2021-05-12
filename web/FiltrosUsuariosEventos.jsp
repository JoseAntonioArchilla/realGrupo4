<%-- 
    Document   : FiltrosUsuariosEventos
    Created on : 08-may-2021, 0:22:09
    Author     : carlo
--%>

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
        List<UsuarioEvento> listaUsuarios = (List)request.getAttribute("usuarios");
        %>
    <body>
        <h1>Usuarios filtrados: </h1>
        <table>
        <tr>
            <th>Filtros</th>
        <tr/>
        <%
            if(!listaUsuarios.isEmpty()){
            for(UsuarioEvento filtrado : listaUsuarios){
        %>
        <tr>
            <%= filtrado.getCiudad()%>            
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
