<%-- 
    Document   : Chat
    Created on : 24-abr-2021, 3:05:59
    Author     : franc
--%>

<%@page import="grupo4app.entity.Mensaje"%>
<%@page import="java.util.List"%>
<%@page import="grupo4app.entity.Chat"%>
<%@page import="grupo4app.entity.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chat</title>
        <style>
            li{
                display: inline;
                padding: 1em;
            }
            
            .barra{
                margin-left: 70%;
            }
            
            .container{
                
            }
        </style>
    </head>
    <%
        Chat ch = (Chat)request.getAttribute("chat");
        List<Mensaje> mensajes = (List<Mensaje>)request.getAttribute("mensajes");
        Usuario teleOp = ch.getUsuario1();
        Usuario usr = ch.getUsuario2();
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
        
        <h1>Chat</h1>
        <hr style="width: 100%;"/>
        <%
            for(Mensaje msg : mensajes){
        %>
            <p><b><%=msg.getEmisor().getNickname()%>:</b> <%=msg.getTexto()%></p>
        <%
            }
        %>
        <div class="container">
            <div style="margin-left: 45%; border: 2px solid grey; width: 150px;">
                <b>Teleoperador</b><br/>
                <%=teleOp.getNickname()%><br/>
                <b>Usuario</b></br>
                <%=usr.getNickname()%>
            </div>
        </div>
      
        <form method="GET" action="#">
            <input type="text" name="mensaje" size="100"/>
            <input type="submit" name="enviar"/>
        </form>
    </body>
</html>
