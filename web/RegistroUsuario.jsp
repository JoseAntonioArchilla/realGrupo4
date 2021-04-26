<%-- 
    Document   : RegistroUsuario
    Created on : 17-abr-2021, 11:52:08
    Author     : chinchar@hotmail.es
--%>

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
            document.getElementById("email").required = visible;
            document.getElementById("edad").required = visible;
            document.getElementById("domicilio").required = visible;
            document.getElementById("ciudad").required = visible;
        }
    </script>
    
    <body>
        <div class="contact_form">

            <div class="formulario">      
              <h1>Registro</h1>
                  <form method="post" action="ServletRegistroUsuario">  
                        <p>
                            <label for="usuario" >Usuario</label>
                            <input type="text" name="usuario" id="usuario" required placeholder="Escribe tu usuario">
                        </p>

                        <p>
                            <label for="contraseña" >Contraseña</label>
                            <input type="password" name="contraseña" id="contraseña" required placeholder="Escribe tu contraseña">
                        </p>

                        <select class='col-6 my-1' id="seleccionador" name="rol" onchange="mostrar_extra()">
                            <option value="0">Creador de evento</option>
                            <option value="1">Administrador del sistema</option>
                            <option value="2">Teleoperador</option>
                            <option value="3">Analista de eventos</option>
                            <option value="4">Usuario de evento</option>
                        </select>
                        
                        <div id="extra" style="display:none;">
                            <p>
                                <label for="nombre" >Nombre</label>
                                <input type="text" name="nombre" id="nombre" placeholder="Escribe tu nombre">
                            </p>
                            
                            <p>
                                <label for="apellidos" >Apellidos</label>
                                <input type="text" name="apellidos" id="apellidos" placeholder="Escribe tus apellidos">
                            </p>
                            
                            <p>
                                <label for="edad" >Edad</label>
                                <input type="text" name="edad" id="edad" placeholder="Escribe tu edad">
                            </p>
                            
                            <p>
                                <label for="email" >Email</label>
                                <input type="text" name="email" id="email" placeholder="Escribe tu email">
                            </p>
                            
                            <p>
                                <label for="domicilio" >Domicilio</label>
                                <input type="text" name="domicilio" id="domicilio" placeholder="Escribe tu domicilio">
                            </p>
                            
                            <p>
                                <label for="ciudad" >Ciudad</label>
                                <input type="text" name="ciudad" id="ciudad" placeholder="Escribe tu ciudad">
                            </p>
                            
                        </div>
                        
                        <button type="submit" name="enviar_formulario" id="enviar"><p>Enviar</p></button>
                  </form>
            </div>  
          </div>

        <!--
        
        <div class='d-flex justify-content-between'>
            <img class='col-1' src="data:image/jpeg;base64,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">

            <h1 class='col-5 text-center'>Registro</h1>

            <div class="col-1"></div>
        </div>

        <hr style='width: 100%;'>

        <form class='row justify-content-center' method="post" action="ServletRegistroUsuario">
            <div class='row'>
                <p class="col-6">Usuario</p>
                <input class='col-6 my-1' type="text" name="usuario">
            </div>
            <div class='row'>
                <p class="col-6">Contraseña</p>
                <input class='col-6 my-1' type="password" name="contraseña">
            </div>
            <div class='row'>
                <p class="col-6">Rol</p>
                <select class='col-6 my-1' id="seleccionador" name="rol" onchange="mostrar_extra()">
                    <option value="0">Creador de evento</option>
                    <option value="1">Administrador del sistema</option>
                    <option value="2">Teleoperador</option>
                    <option value="3">Analista de eventos</option>
                    <option value="4">Usuario de evento</option>
                </select>
            </div>

            <div id="extra" style="display:none;">

                <hr style='width: 100%;'>                    

                <div class='row'>
                    <p class="col-6">Apellidos</p>
                    <input class="my-1 col-6" type="text" name="Apellidos">
                </div>
                <div class='row'>
                    <p class="col-6">Domicilio</p>
                    <input class="my-1 col-6" type="text" name="Domicilio">
                </div>
                <div class='row'>
                    <p class="col-6">Ciudad</p>
                    <input class="my-1 col-6" type="text" name="Ciudad">
                </div>
                <div class='row'>
                    <p class="col-6">Edad</p>
                    <input class="my-1 col-6" type="text" name="number" min="0" max="122">
                </div>
                <div class='row'>
                    <p class="col-6">Sexo</p>
                    <select class="my-1 col-6" name="Sexo">
                        <option value="0">Hombre</option>
                        <option value="1">Mujer</option>
                        <option value="2">Otro</option>
                    </select>
                </div>  
            </div>        

            <input class="col-2 my-5" type="submit">
        </form> 
        
        -->
    </body>
    
</html>
