<%-- 
    Document   : index
    Created on : 12-may-2021, 13:16:49
    Author     : chinchar@hotmail.es
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Grupo4</title>
        <link rel="stylesheet" href="estilos/estilo.css">
    </head>
    <body>  

        <header>
            <img src="img/Logo.png" alt="logo" id ="logo">
            <input type="search" id="buscador" >
            <nav>
                <ul>
                    <li><a href="index.html">Organizar</a></li>
                    <li><a href="portafolio.html">Ayuda</a></li>
                    <li><a href="RegistroEvento.jsp">Crear Evento</a></li>
                    <li><a href="InicioSesion.jsp">Iniciar Sesion</a></li>
                    <li><a href="ServletUsuarioListar">Administrar</a></li>
                    <li><a href="ServletListarConversaciones">Mensajes</a></li>
                    <li><a href="ServletListarEventos">Eventos</a></li>
                </ul>
            </nav>
        </header>
        <section>
            <div id="eslogan">
                <h3>TEXTO</h3>
                <img src="img/lotad.png" alt="imagenEslogan">
            </div>
            <div id="categoriasEventos">
                <h4>Categorias</h4>
                <ul>
                    <li><a href="index.html">C1</a></li>
                    <li><a href="portafolio.html">C2</a></li>
                    <li><a href="registroEvento.jsp">C3</a></li>
                    <li><a href="contacto.html">C4</a></li>
                </ul>
            </div>
            <a href="ServletListarEventos"><h4>Eventos</h4></a>
            <div id="eventos">
                <article id="evento1">
                    <img src="img/lotad.png" alt="evento1">
                    <p>TEXTO</p>
                </article>
                <article id="evento2">
                    <img src="img/lotad.png" alt="evento2">
                    <p>TEXTO</p>
                </article>
                <article id="evento3">
                    <img src="img/lotad.png" alt="evento3">
                    <p>TEXTO</p>
                </article>
                <article id="evento4">
                    <img src="img/lotad.png" alt="evento3">
                    <p>TEXTO</p>
                </article>
                <article id="evento1">
                    <img src="img/lotad.png" alt="evento1">
                    <p>TEXTO</p>
                </article>
                <article id="evento2">
                    <img src="img/lotad.png" alt="evento2">
                    <p>TEXTO</p>
                </article>
                <article id="evento3">
                    <img src="img/lotad.png" alt="evento3">
                    <p>TEXTO</p>
                </article>
                <article id="evento4">
                    <img src="img/lotad.png" alt="evento3">
                    <p>TEXTO</p>
                </article>
            </div>
        </section>
        <footer>
            <ul>
                <li><a href="index.html">C1</a></li>
                <li><a href="portafolio.html">C2</a></li>
                <li><a href="registroEvento.jsp">C3</a></li>
                <li><a href="contacto.html">C4</a></li>
            </ul>
            <ul>
                <li><a href="index.html">C1</a></li>
                <li><a href="portafolio.html">C2</a></li>
                <li><a href="cursos.html">C3</a></li>
                <li><a href="contacto.html">C4</a></li>
            </ul>
            <ul>
                <li><a href="index.html">C1</a></li>
                <li><a href="portafolio.html">C2</a></li>
                <li><a href="cursos.html">C3</a></li>
                <li><a href="contacto.html">C4</a></li>
            </ul>
            <ul>
                <li><a href="index.html">C1</a></li>
                <li><a href="portafolio.html">C2</a></li>
                <li><a href="cursos.html">C3</a></li>
                <li><a href="contacto.html">C4</a></li>
            </ul>

            <p>Lorem ipsum dolor sit amet consectetur.</p>
            <ul id="listaPie">
                <li><a href="cambio.html">C1</a></li>
                <li><a href="portafolio.html">C2</a></li>
                <li><a href="cursos.html">C3</a></li>
                <li><a href="#.html">C4</a></li>
                <li>metralleta puñetazo</li>
                <li>jose mata al brahydios<li>
            </ul>
        </footer>




        <script>
            var input = document.getElementById("buscador");

            // Execute a function when the user releases a key on the keyboard
            input.addEventListener("keyup", function (event) {
                // Number 13 is the "Enter" key on the keyboard
                if (event.keyCode === 13) {
                    // Cancel the default action, if needed
                    event.preventDefault();
                    // Trigger the button element with a click
                    window.location.href = './ServletListarEventos?nombre=' + input.value;
                }
            });
        </script>
    </body>
</html>