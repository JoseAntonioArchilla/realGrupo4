<%-- 
    Document   : CrearAnalisis
    Created on : 21-abr-2021, 9:50:10
    Author     : carlo
--%>

<%@page import="grupo4app.entity.Filtro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CrearAnalisis</title>
    </head>
    <%
        Filtro filtro = (Filtro)request.getAttribute("filtroEditar");
        String ciudad = "";
        String sexo = "";
        String anyo = "";
        String costeEntrada = "";
        String categorias = "";
        String usuario = "";
        String edadInferior = "";
        String edadSuperior = "";
        
        //Comprobamos si es nueva o hay que editarla.
        if (filtro != null) {
            ciudad = filtro.getCiudad();
            sexo = filtro.getSexo();
            Integer anyoPro = filtro.getAnyo();
            if(anyoPro != 0){
                anyo = anyoPro.toString();
            }
            Integer costeEntradaPro = filtro.getCosteEntrada();
            if(costeEntradaPro != 0){
                costeEntrada = costeEntradaPro.toString();
            }
            
            Integer usuarioPro = 0;
            categorias = filtro.getCategoria();
            try{
                usuarioPro = filtro.getUsuario().getIdusuario();
            }catch(Exception e){
                        
            }
            //Integer usuarioPro = filtro.getUsuario().getIdusuario();
            if(usuarioPro != 0){
                usuario = usuarioPro.toString();
            }
            Integer edadInferiorPro = filtro.getEdadLimInf();
            if(edadInferiorPro != 0){
                edadInferior = edadInferiorPro.toString();
            }
            Integer edadSuperiorPro = filtro.getEdadLimSup();
            if(edadSuperiorPro != 0){
                edadSuperior = edadSuperiorPro.toString();
            }
        }
    %> 
    <body>
        <h1>Creacion de analisis</h1>
        <form method="post" action="ServletFiltroGuardar">
            <label for="opCiudad">Ciudad: </label>
            <input type="text" id="opCiudad" name="ciudad" maxlength="50" values="<%=ciudad%>">
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
            <input type="radio" id="opNinguno" name="sexo" value="">
            <label for="opNinguno"> Ninguno </label>
            <br/>
            <label>Año: <input type="text" id="opAnyo" name="anyo"></label>
            <br/>
            <label>Coste Entrada: <input type="text" id="opEntrada" name="costeEntrada"></label>
            <p>Categorias: </p>
            <select name="categorias">
                <option value="">-----</option>
                <option value="musica">Musica</option>
                <option value="aire_libre">Aire Libre</option>
                <option value="deporte">Deporte</option>
                <option value="teatro">Teatro</option>
                <option value="gaming">Gaming</option>  
            </select>
            <br/>
            <label>Codigo Usuario: <input type="text" id="opUsuario" name="usuario"></label>
            <br/>
            <label>Edad-inf: <input type="text" id="opEdadInf" name="edadInferior"></label>
            <br/>
            <label>Edad-Sup: <input type="text" id="opEdadSup" name="edadSuperior"></label>  
            <br/>
            <input type="reset" value="Resetear"/>
            <input type="submit" value="Crear">
        </form>
    </body>
</html>
