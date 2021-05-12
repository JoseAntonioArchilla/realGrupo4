<%-- 
    Document   : Chat
    Created on : 24-abr-2021, 3:05:59
    Author     : franc
--%>

<%@page import="java.text.SimpleDateFormat"%>
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
        
        <h1>Chat</h1>
        <hr style="width: 100%;"/>
        <%
            for(Mensaje msg : mensajes){
        %>
            <p><b><%=msg.getEmisor().getNickname()%> (<%= new SimpleDateFormat("dd/MM/yyyy 'a las' HH:mm:ss").format(msg.getFechaHora()) %>) :</b> <%=msg.getTexto()%></p>
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
      
        <form method="POST" action="ServletEnviarMensaje">
            <textarea name="mensaje" rows="3" cols="70" maxlength="200"></textarea>
            <input type="hidden" name="idChat" value="<%=ch.getIdchat()%>">
            <input type="submit" name="enviar"/>
        </form>
    </body>
</html>
