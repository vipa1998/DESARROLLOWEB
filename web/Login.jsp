<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/miestilo.css">
        <title>JSP Page</title>
    </head>
    <body background="images/fondodepantalla.jpg">
        <div class="cabecera">
				<div class="contenedor-superior navegacion">
					<div class="nombre">
						<a href="index.html">Tienda ElectraUTP</a>	
					</div>			
					<nav>
						<a href="Nosotros.jsp">Nosotros</a>	
                                                <a href="control?op=1">Comprar</a>
					</nav>
				</div>			
           </div>
        <%
            String mensaje="";
            if(request.getAttribute("dato")!=null)
            mensaje=(String)request.getAttribute("dato");
         %>   
   <center>
        <form action="control" method="post">
            <input type="hidden" name="op" value="21">
            <fieldset class="cajas">
        
                <tr><td>Ingrese usuario<td><br><input name="user"><br><br>
                <tr><td>Ingrese contraseña<td><br><input type="password" name="clave">
                    <br>
                    <br>
            <tr><img src="img/usu.png" height="100" width="100">
            <br>
            <br>
            <tr><td><td><div class="cajas navegacion2"><button type="submit">Iniciar sesión</button></div>
                    <br>
                    <br>
            <tr><td><td><%=mensaje%></td> 
            
            </fieldset>
        </form>
    </center>
    </body>
</html>
