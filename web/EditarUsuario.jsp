<%-- 
    Document   : EditarUsuario
    Created on : 11-may-2021, 10:26:18
    Author     : nieto
--%>

<%@page import="grupo4app.entity.UsuarioEvento"%>
<%@page import="grupo4app.entity.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Registro</title>
        
        <link href="estilos/estiloFormulario.css" rel="stylesheet">
    </head>
    
    <script>
        function mostrar_extra()
        {
            let value = document.getElementById("seleccionador").value;
            const visible = value === "4";
            document.getElementById("extra").style.display = visible ? "block" : "none";
            document.getElementById("nombre").required = visible;
            document.getElementById("apellidos").required = visible;
            document.getElementById("sexo").required = visible;
            document.getElementById("edad").required = visible;
            document.getElementById("domicilio").required = visible;
            document.getElementById("ciudad").required = visible;
        }
    </script>
    
    <body>
        <%
            Usuario usuario = (Usuario) request.getAttribute("usuario");
            UsuarioEvento usuarioEvento = (UsuarioEvento) request.getAttribute("usuarioEvento");
        %>
        
        <div class="contact_form">
            <div class="formulario">      
                <h1>Edición</h1>
                <form method="post" action="ServletEditarUsuario?id=<%=usuario.getIdusuario()%>">  
                    <p>
                        <label for="usuario" >Usuario</label>
                        <input type="text" name="usuario" id="usuario" value=<%=usuario.getNickname()%>>
                    </p>

                    <p>
                        <label for="contraseña" >Contraseña</label>
                        <input type="password" name="password" id="contraseña" value=<%=usuario.getPassword()%>>
                    </p>

                    <select id="seleccionador" name="rol" onchange="mostrar_extra()" selected=<%=usuario.getRol()%>><--Hay que ver como hacer esto
                        <option value="0">Creador de evento</option>
                        <option value="1">Administrador del sistema</option>
                        <option value="2">Teleoperador</option>
                        <option value="3">Analista de eventos</option>
                        <option value="4">Usuario de evento</option>
                    </select>

                    <div id="extra" style="display:none;">
                            <%
                                if(usuarioEvento == null){
                            %>
                        <p>
                            <label for="nombre" >Nombre</label>
                            <input type="text" name="Nombre" id="nombre" placeholder="Escribe tu nombre">
                        </p>

                        <p>
                            <label for="apellidos" >Apellidos</label>
                            <input type="text" name="Apellidos" id="apellidos" placeholder="Escribe tus apellidos">
                        </p>

                        <p>
                            <label for="edad" >Edad</label>
                            <input type="number" name="Edad" id="edad" placeholder="Escribe tu edad">
                        </p>

                        <p>
                            <label for="sexo" >Sexo</label>
                            <select id="seleccionador" name="sexo" onchange="mostrar_extra()"><--Hay que ver como hacer esto
                                <option value="" selected disabled hidden>Elija una opción</option>
                                <option value="Hombre">Hombre</option>
                                <option value="Mujer">Mujer</option>
                                <option value="Otro">Otro</option>
                            </select>
                        </p>

                        <p>
                            <label for="domicilio" >Domicilio</label>
                            <input type="text" name="Domicilio" id="domicilio" placeholder="Escribe tu domicilio">
                        </p>

                        <p>
                            <label for="ciudad" >Ciudad</label>
                            <input type="text" name="Ciudad" id="ciudad" placeholder="Escribe tu ciudad">
                        </p>
                            <%}else{%>
                        <p>
                            <label for="nombre" >Nombre</label>
                            <input type="text" name="Nombre" id="nombre" value=<%=usuarioEvento.getNombre()%>>
                        </p>

                        <p>
                            <label for="apellidos" >Apellidos</label>
                            <input type="text" name="Apellidos" id="apellidos" value=<%=usuarioEvento.getApellido()%>>
                        </p>

                        <p>
                            <label for="edad" >Edad</label>
                            <input type="number" name="Edad" id="edad" value=<%=usuarioEvento.getEdad()%>>
                        </p>

                        <p>
                            <label for="sexo" >Sexo</label>
                            <select id="seleccionador" name="sexo" onchange="mostrar_extra()" selected=<%=usuarioEvento.getSexo()%>><--Hay que ver como hacer esto
                                <option value="Hombre">Hombre</option>
                                <option value="Mujer">Mujer</option>
                                <option value="Otro">Otro</option>
                            </select>
                        </p>

                        <p>
                            <label for="domicilio" >Domicilio</label>
                            <input type="text" name="Domicilio" id="domicilio" value=<%=usuarioEvento.getDomicilio()%>>
                        </p>

                        <p>
                            <label for="ciudad" >Ciudad</label>
                            <input type="text" name="Ciudad" id="ciudad" value=<%=usuarioEvento.getCiudad()%>>
                        </p>
                            <%}%>
                    </div>

                    <button type="submit" name="enviar_formulario" id="enviar"><p>Enviar</p></button>
                </form>
            </div>  
        </div>
    </body>
    
</html>
