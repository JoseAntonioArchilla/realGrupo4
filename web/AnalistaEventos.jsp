<%-- 
    Document   : AnalistaEventos
    Created on : 20-abr-2021, 17:49:40
    Author     : carlo
--%>

<%@page import="grupo4app.entity.Filtro"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AnalistaEventos</title>
    </head>
    <%
        List<Filtro> listaFiltros = (List)request.getAttribute("listaFiltros");
        %>
    <body>
        <h1>Bienvenido analista de eventos</h1>
        <p>Lista de analisis: </p>
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
          <a href="ServletCrearEditarFiltro">Nuevo Filtro</a>
        <!--</form>-->  
    </body>
</html>
