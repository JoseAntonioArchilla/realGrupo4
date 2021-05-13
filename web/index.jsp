<%-- 
    Document   : index
    Created on : 12-may-2021, 13:16:49
    Author     : chinchar@hotmail.es
--%>

<%@page import="grupo4app.entity.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Grupo4</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <link rel="stylesheet" href="estilos/estilo.css">
    </head>

    <%
        Usuario u = (Usuario) session.getAttribute("usuario");
    %>

    <body>  

        <!-- Navbar -->      
        <div class="row py-2 text-center" style="background: #de7ebf">
            <style>
                body{
                    background-image: url("img/pattern.jpg");
                }
                a{
                    font-size: 1.3em;
                    color: black
                }

                span{
                    border-radius: 5px;  
                    border-style: solid; 
                    border-width: 1px; 
                    border-color: #ab4493;
                    background: white;
                    padding: .2em;
                }

                a:hover{
                    font-weight: bold;
                    color: black;
                    text-decoration: none;
                }
                button{
                    border-radius: 15px;
                    background: #f48542;
                    font-weight: bold;
                    cursor: pointer;
                }
                .dropdown{
                    position: relative;display: inline-block;
                }
                .dropdown-content{
                    display: none; position: absolute; z-index: 1
                }
                .dropdown:hover .dropdown-content{
                    display: block;
                }
                .dropdown-element
                {
                    background: #eccbe8;
                    text-align: center;
                    padding:  .3em;
                }
                .fondito {
                    background: #f2f2f2;
                }
            </style>

            <a class="col-2  text-decoration-none" href="index.html">
                Logo
            </a>
            <input class="col-4" style="width: 100%; border-radius: 25px" type="search" id="buscador">

            <div class="col-4 d-flex justify-content-around ">
                <a href="index.html">Inicio </a>
                <a href="index.html">Servicios </a>
                <a href="#">Contacto</a>
            </div>
            <%
                if (u == null) {
            %>
            <div  class="col-2 ">
                <a href="InicioSesion.jsp">Iniciar sesión </a>
            </div>
            <%
            } else {
            %>
            <div  class="col-2 dropdown">

                <img src="img/Logo.png" style="width:2em; height:2em;">
                <div class="dropdown-content">
                    <a class="row dropdown-element" href="index.html">Mi perfil</a>
                    <a class="row dropdown-element" href="index.html">Mensajes</a>
                    <a class="row dropdown-element" href="index.html">Ajustes</a>
                    <a class="row dropdown-element" href="index.html">Cerrar sesion</a>
                </div>
            </div>   
            <%
                }
            %>

        </div>
        <!-- End NavBar -->
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


        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
