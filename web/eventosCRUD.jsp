<%-- 
    Document   : eventosCRUD
    Created on : 21-abr-2021, 9:49:28
    Author     : josea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <div class="container-fluid navbar-dark bg-primary fixed-top ">
          <nav class="navbar navbar-expand-lg container">
              <a class="navbar-brand" href="index.html">Logo corporativo</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav ml-auto"> <!-- la ultima parte es para "empujar los elementos al lado contrario que pone, l left, r right"-->
                <li class="nav-item active">
                  <a class="nav-link" href="index.html">Inicio </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Nosotros</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Servicios</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Contacto</a>
                </li>
              </ul>
            </div>
          </nav>
        </div><!--navbar-->
        
        <div class=container class = "py-3">
            <table>
                <thead>
                    <tr>
                      <th scope="col">Nombre Evento</th>
                      <th scope="col"></th>
                      <th scope="col">Last</th>
                      <th scope="col">Handle</th>
                    </tr>
            </table>
        </div>
        
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
