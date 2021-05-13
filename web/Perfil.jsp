<%-- 
    Document   : Perfil
    Created on : 13-may-2021, 18:25:43
    Author     : nieto
--%>

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
            HttpSession sesion = request.getSession();
            Usuario usuario = (Usuario) sesion.getAttribute("usuario");
            UsuarioEvento usuarioEvento = (UsuarioEvento) sesion.getAttribute("usuarioEvento");
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
    </body>
</html>
