<%-- 
    Document   : CrearAnalisis
    Created on : 21-abr-2021, 9:50:10
    Author     : carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CrearAnalisis</title>
    </head>
    <body>
        <h1>Creacion de analisis</h1>
        <form method="post">
            <label>Ciudad: <input type="text" id="opCiudad" name="ciudad"></label>
            <br/>
            <p>Sexo: </p>
            <input type="radio" id="opMasculino" name="sexo" value="hombre" checked>
            <label for="opMasculino"> Hombre </label>
            <br/>
            <input type="radio" id="opMujer" name="sexo" value="mujer">
            <label for="opMujer"> Mujer </label>
            <br/>
            <input type="radio" id="opOtro" name="sexo" value="otro">
            <label for="opOtro"> Otro </label>
            <br/>
            <label>Año: <input type="text" id="opAnyo" name="anyo"></label>
            <br/>
            <label>Coste Entrada: <input type="text" id="opEntrada" name="costeEntrada"></label>
            <p>Categorias: </p>
            <select name="categorias">
                <option value="0">-----</option>
                <option value="musica">Musica</option>
                <option value="">-----</option>
                
            </select>
            <br/>
            <label>Usuario: <input type="text" id="opUsuario" name="usuario"></label>
           
            
        </form>
    </body>
</html>
