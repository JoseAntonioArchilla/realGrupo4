<%-- 
    Document   : Chat
    Created on : 24-abr-2021, 3:05:59
    Author     : franc
--%>

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
        
        <div class="container">
            <div style="margin-left: 45%; border: 2px solid grey; width: 150px;">
                <b>Teleoperador</b><br/>
                Juanaaaaaaaaaaaaaa<br/>
                <b>Usuario</b></br>
                Pepe
            </div>
        </div>
      
        <form method="GET" action="ServletEnviarMensaje?id1=&id2=">
            <input type="text" name="mensaje" size="100"/>
            <input type="submit" name="enviar"/>
        </form>
    </body>
</html>
