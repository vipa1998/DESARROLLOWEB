<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.*,dao.Negocio,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/miestilo.css">

<title>Registra cliente</title>
</head>
<body background="/Final1/images/fondo7.jpg" style="background-size: cover" class="fondo">
        <%
            String mensaje="";
            if(request.getAttribute("dato")!=null)
            mensaje=(String)request.getAttribute("dato");
         %>   
<center>
<h1>Registra Cliente</h1>
 <form action="control" method="post">
     <input type="hidden" name="op" value="24">
<fieldset class="cajas centrado">
            <div class="cajas">	
			<div>
                            <td>Nombre</td>
                            <div><input size="50" type="text" name="nom" placeholder="Ingrese el nombre"></div>
			</div>
                        <br>
                        <div>
                            <td>Correo</td>
                            <div><input size="50" type="email" name="correo" placeholder="Ingrese su correo"></div>
			</div>
                        <div>
				<td>Direccion</td>
                                <div><input size="50" type="text" name="direccion" placeholder="Ingrese la direccion"></div>
			</div>
                        <br>
			<div>
				<td>Contraseña</td>
                                <div><input size="50" type="password"  placeholder="Ingrese su clave" name="clave"></div>
			</div>
                        <br>
                        <div>
                        <div class="cajas navegacion2"><button type="submit">Crear</button></div>
                        </div>
                        <br>
                        <div><%=mensaje%></td></div>
            </div>     
    </fieldset>
</form>
</center>
</body>
</html>
