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
        <link href="estilos/estiloFormulario.css" rel="stylesheet">
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
        String id = "";
        String nombre = "";
        
        //Comprobamos si es nueva o hay que editarla.
        if (filtro != null) {
            
            try{
                 id =  String.valueOf(filtro.getFiltroPK().getIdfiltro());
            }catch(Exception e){
                
            }
            
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
            
            categorias = filtro.getCategoria();
                      
            usuario = "0";
            try{
                usuario = filtro.getUsuario1().getIdusuario().toString();              
            }catch(Exception e){
                        
            }
          
            try{
                nombre = filtro.getNombre();
            }catch(Exception e){
                
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
        <div class="contact_form">
            <div class="formulario"> 
        <h1>Creacion de analisis</h1>
        <form method="post" action="ServletFiltroGuardar">
            <input type="hidden" name="id" value=<%=id%>>
            <label for="opCiudad">Ciudad: </label>
            <input type="text" id="opCiudad" name="ciudad" maxlength="50" value="<%=ciudad%>">
            <br/>
            <label for="idNombre">Nombre: </label>
            <input type="text" name="nombre" id="idNombre" maxlength="200" value="<%=nombre%>">           
            <br/>
            <p>Sexo: </p>
            
            <%
                if(sexo.equals("hombre")){
                %>
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
            
            <%
                }else if(sexo.equals("mujer")){
                %>
                <input type="radio" id="opMasculino" name="sexo" value="hombre" >
            <label for="opMasculino"> Hombre </label>
            <br/>
            <input type="radio" id="opMujer" name="sexo" value="mujer" checked>
            <label for="opMujer"> Mujer </label>
            <br/>
            <input type="radio" id="opOtro" name="sexo" value="otro">
            <label for="opOtro"> Otro </label>
            <br/>
            <input type="radio" id="opNinguno" name="sexo" value="">
            <label for="opNinguno"> Ninguno </label>
            
            <%
                }else if(sexo.equals("otro")){
                  %>
              <input type="radio" id="opMasculino" name="sexo" value="hombre" >
            <label for="opMasculino"> Hombre </label>
            <br/>
            <input type="radio" id="opMujer" name="sexo" value="mujer">
            <label for="opMujer"> Mujer </label>
            <br/>
            <input type="radio" id="opOtro" name="sexo" value="otro" checked>
            <label for="opOtro"> Otro </label>
            <br/>
            <input type="radio" id="opNinguno" name="sexo" value="">
            <label for="opNinguno"> Ninguno </label>
            
            <%
                }else{
                %>
             <input type="radio" id="opMasculino" name="sexo" value="hombre" >
            <label for="opMasculino"> Hombre </label>
            <br/>
            <input type="radio" id="opMujer" name="sexo" value="mujer" >
            <label for="opMujer"> Mujer </label>
            <br/>
            <input type="radio" id="opOtro" name="sexo" value="otro">
            <label for="opOtro"> Otro </label>
            <br/>
            <input type="radio" id="opNinguno" name="sexo" value="" checked>
            <label for="opNinguno"> Ninguno </label>
            
            <%
                }
                %>
                      
            <br/>
            <label>Año: <input type="text" id="opAnyo" name="anyo" value=<%=anyo%>></label>
            <br/>
            <label>Coste Entrada: <input type="text" id="opEntrada" name="costeEntrada" value=<%=costeEntrada%>></label>
            <p>Categorias: </p>
            
            <%
                if(categorias.equals("musica")){
                %>
                <select name="categorias">
                    <option value="musica">Musica</option>
                    <option value="">-----</option>
                    <option value="aire_libre">Aire Libre</option>
                    <option value="deporte">Deporte</option>
                    <option value="teatro">Teatro</option>
                    <option value="gaming">Gaming</option>    
                </select>
            <%
                }else if(categorias.equals("aire_libre")){
                %>  
                <select name="categorias">
                    <option value="aire_libre">Aire Libre</option>
                    <option value="">-----</option>
                    <option value="musica">Musica</option>               
                    <option value="deporte">Deporte</option>
                    <option value="teatro">Teatro</option>
                    <option value="gaming">Gaming</option>  
                </select>
            <%
                }else if(categorias.equals("deporte")){
                %> 
                <select name="categorias">
                    <option value="deporte">Deporte</option>
                    <option value="aire_libre">Aire Libre</option>
                    <option value="">-----</option>
                    <option value="musica">Musica</option>                              
                    <option value="teatro">Teatro</option>
                    <option value="gaming">Gaming</option>   
                </select>
            <%
                }else if(categorias.equals("teatro")){
                %>
                <select name="categorias">
                    <option value="teatro">Teatro</option>
                    <option value="deporte">Deporte</option>
                    <option value="aire_libre">Aire Libre</option>
                    <option value="">-----</option>
                    <option value="musica">Musica</option>                                             
                    <option value="gaming">Gaming</option>   
                </select>
            <%
                }else if(categorias.equals("gaming")){
                %>
                <select name="categorias">
                    <option value="gaming">Gaming</option> 
                    <option value="teatro">Teatro</option>
                    <option value="deporte">Deporte</option>
                    <option value="aire_libre">Aire Libre</option>
                    <option value="">-----</option>
                    <option value="musica">Musica</option> 
                </select>
            <%
                }else{
                %>
                <select name="categorias">
                    <option value="">-----</option>
                    <option value="gaming">Gaming</option> 
                    <option value="teatro">Teatro</option>
                    <option value="deporte">Deporte</option>
                    <option value="aire_libre">Aire Libre</option>                
                    <option value="musica">Musica</option>  
                </select>
            <%
                }
                %>
                
            
            <!--<select name="categorias">
                <option value="">-----</option>
                <option value="musica">Musica</option>
                <option value="aire_libre">Aire Libre</option>
                <option value="deporte">Deporte</option>
                <option value="teatro">Teatro</option>
                <option value="gaming">Gaming</option>  
            </select> -->
            <br/>
            <label>Codigo Usuario: <input type="text" id="opUsuario" name="usuario" value=<%=usuario%>></label>
            <br/>
            <label>Edad-inf: <input type="text" id="opEdadInf" name="edadInferior" value=<%=edadInferior%>></label>
            <br/>
            <label>Edad-Sup: <input type="text" id="opEdadSup" name="edadSuperior" value=<%=edadSuperior%>></label>  
            <br/>
            <input type="reset" value="Resetear"/>
            <input type="submit" value="Guardar">
        </form>
            </div>
        </div>
    </body>
</html>
