<%-- 
    Document   : Conversaciones
    Created on : 22-abr-2021, 20:51:37
    Author     : franc
--%>

<%@page import="grupo4app.entity.Usuario"%>
<%@page import="grupo4app.entity.Chat"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Conversaciones</title>
        <style>
            li{
                display: inline;
                padding: 1em;
            }
            
            .barra{
                margin-left: 70%;
            }
            
            th{
                padding-left: 10px;
                padding-right: 10px;
            }
            
            td{
                padding-left: 10px;
                padding-right: 10px;
            }
        </style>
    </head>
    <%
        List<Chat> conversaciones = (List<Chat>)request.getAttribute("chats");
        String error = (String)request.getAttribute("error");
        HttpSession ses = request.getSession();
        Usuario usuarioIniciado = (Usuario)ses.getAttribute("usuario");
    %>
    <body>
        <nav class="barra">
            <ul>
                <li><a href="index.html">Inicio</a></li>
                <li><a href="portafolio.html">Ayuda</a></li>
                <li><a href="#">Mi Perfil</a></li>
                <li><a href="#">Cerrar Sesión</a></li>
            </ul>
        </nav>
        <div>
            <h1>Conversaciones</h1>
            <form method="POST" action="ServletListarConversaciones">
                <input type="search" name="usuarioBuscar" placeholder="Buscar por usuario"/>
                <input type="submit" value="Buscar"/>
            </form>
            <% if(request.getAttribute("buscado") != null) {
            %>
                <br/>
                <button onclick="location.href='ServletListarConversaciones';">Mostrar todos</button>
            <% }
            %>
        </div>
        <hr style="width: 100%">
        <% if(usuarioIniciado != null && (usuarioIniciado.getRol() == 0 || usuarioIniciado.getRol() == 4)) {
        %>   
            <form method="POST" action="ServletCrearChat">
                <input type="submit" value="Inicia una conversación con un nuevo teleoperador">
            </form>
        <% }

        if (error != null) {
        %>
            <p style="color: red;"><%=error%></p>
        <%
        }
        
    if(conversaciones != null && conversaciones.size() > 0) {  
    %>
         <table>
            <tr>
                <th>Teleoperador</th>
                <th>Usuario atendido</th>
                <th></th>
                <% if(usuarioIniciado.getRol() == 2) {
                %> 
                    <th></th>
                <% }
                %>
            </tr>
            <% for(Chat ch : conversaciones) {
            %>    
                <tr>
                    <td><%=ch.getUsuario1().getNickname()%></td>
                    <td><%=ch.getUsuario2().getNickname()%></td>
                    <td><a href="ServletMostrarChat?idChat=<%=ch.getIdchat()%>">Ver</a></td>
                    <% if(usuarioIniciado.getRol() == 2) {
                    %>    
                        <td><a href="ServletBorrarChat?idChat=<%=ch.getIdchat()%>">Borrar</a></td>
                    <% }
                    %>
                </tr>
            <% }
            %>
        </table>
    <% } else {
    %>
        <p>No hay conversaciones que mostrar</p>
    <% }
    %>
    </body>
</html>
