<%-- 
    Document   : registsroEvento
    Created on : 21-abr-2021, 10:27:38
    Author     : josea
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.ejb.EJB"%>
<%@page import="grupo4app.dao.EventoFacade"%>
<%@page import="java.util.Date"%>
<%@page import="grupo4app.entity.Evento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Registro Evento </title>

        <link href="estilos/estiloFormulario.css" rel="stylesheet">

        <script>
            function mostrar_extra()
            {
                const visible = document.getElementById("seleccionador").checked;
                document.getElementById("extra").style.display = visible ? "block" : "none";
                document.getElementById("numFilas").required = visible;
                document.getElementById("numColumnas").required = visible;
                document.getElementById("aforo").required = !visible;
                document.getElementById("pAforo").style.display = !visible ? "block" : "none";
            }
        </script>
    </head>

    <%
        Evento e = (Evento) session.getAttribute("evento");
        String titulo = "";
        int precio = 0;
        Date inicio = new Date();
        Date fin = new Date();
        int aforo = 0;
        String imagen = "";
        String descripcion = "";
        String asientos_fijos = "";
        int filas = 0;
        int columnas = 0;
        int maxEntradas = 0;
        if (e != null) {
            titulo = e.getTitulo();
            precio = e.getCosteEntrada();
            inicio = e.getFecha();
            fin = e.getFechaReserva();
            aforo = e.getAforo();
            //imagen = e.getI;  TODO
            descripcion = e.getDescripcion();
            asientos_fijos = e.getAsientosList().size() != 0 ? "on" : "";
            filas = e.getFilas();
            columnas = e.getColumnas(); 
            maxEntradas = e.getMaxNumEntradas();
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    %>


    <body > 


        <div class="contact_form">

            <div class="formulario">      
                <h1>Registro de Evento</h1>

                <form method="post" action="ServletGuardarEvento">  
                    <p>
                        <label for="titulo">Titulo Evento</label>
                        <input type="text" name="titulo" id="titulo" required placeholder="Escribe el titulo del Evento" value="<%= titulo%>">
                    </p>

                    <p>
                        <label for="precio">Precio evento</label>
                        <input type="number" name="precio" id="precio" required placeholder="Escribe el precio del evento" value="<%= precio%>">
                    </p>


                    <p>
                        <label for="fechaInicio">Comienzo de la compra de entradas</label>
                        <input type="date" name="fechaInicio" id="fechaInicio" required placeholder="Escribe el comienzo de la compra de las entradas" value="<%=sdf.format(inicio)%>">
                    </p>


                    <p>
                        <label for="fechaFin">Fin de la compra de entradas</label>
                        <input type="date" name="fechaFin" id="fechaFin" required placeholder="Escribe el fin de la compra de las entradas" value="<%= sdf.format(fin)%>">
                    </p> 

                    <p>
                        <label for="imagen">Imagen del Evento</label>
                        <input type="file"
                               id="imagen" name="imagen"
                               accept="image/png, image/jpeg" value="<%= imagen%>">
                    </p>
                    <p>
                        <label for="descripcion" class="colocar_mensaje">Descripcion</label>                     
                        <textarea name="descripcion" class="texto_mensaje" id="descripcion" required="obligatorio" placeholder="Deja aquí la descripción del evento..." ><%= descripcion%></textarea> 
                    </p>     

                    <p>
                        <label for="maxEntradas">Numero de columnas de asientos</label>
                        <input type="number" name="maxEntradas" id="maxEntradas"  placeholder="Escribe el numero de entradas por persona que puede compra un usuario" value="<%= maxEntradas%>">
                    </p>

                    <p>
                        <label for="seleccionador" class="colocar_asunto">Asientos fijos </label>
                        <input type="checkbox" name="asientosFijos" onchange="mostrar_extra()" id="seleccionador"  placeholder="Escribe un asunto">                       
                    </p>

                    <p id="pAforo">
                        <label for="aforo">Aforo máximo</label>
                        <input type="number" name="aforo" id="aforo" required placeholder="Escribe el aforo del evento" value="<%= aforo%>">
                    </p>
                    <div id="extra" style="display:none;">
                        <p>
                            <label for="numFilas">Numero de filas de asientos</label>
                            <input type="number" name="numFilas" id="numFilas"  placeholder="Escribe el numero de filas" value="<%= filas%>">
                        </p>

                        <p>
                            <label for="numColumnas">Numero de columnas de asientos</label>
                            <input type="number" name="numColumnas" id="numColumnas"  placeholder="Escribe el numero de columnas" value="<%= columnas%>">
                        </p>
                    </div>
                    <button type="submit" name="enviar_formulario" id="enviar"><p>Enviar</p></button>


                    <%
                        if (!asientos_fijos.equals("")) {
                    %>

                    <script>
                        document.getElementById("seleccionador").checked = true;
                        mostrar_extra();
                    </script>
                    <%
                        }
                    %>
                </form>
            </div>  
        </div>
    </body>
</html>
