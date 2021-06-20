<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/miestilo.css">
        <title>JSP Page</title>
    </head>
    <body bgColor="#89e8cd">        
   <div class="cabecera">
				<div class="contenedor-superior navegacion">
					<div class="nombre">
						<a href="index.html">Tienda ElectraUTP</a>	
					</div>			
					<nav>
						<a href="Nosotros.jsp">Nosotros</a>	
                                                <a href="control?op=1">Comprar</a>
                                                <a href="Login.jsp">Gestión</a>
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
            <input type="hidden" name="op" value="22">
            <fieldset class="cajas">
        
                <tr><td>Ingrese usuario<br><td><input name="user"><br>
                <tr><td>Ingrese contraseña<br><td><input type="password" name="clave">
                    <br>
                    <br>
            <tr><img src="img/candado.png" height="100" width="100">
            <br>
            <br>
            <tr><td><td><div class="cajas navegacion2"><button type="submit">Iniciar sesión</button></div>
                    <br>
                    <br>
            <tr><td><td><%=mensaje%></td>   
            <br>
            <tr><td><td><a href="javascript:ventanaSecundaria('Login3.jsp')">Crea tu cuenta
            </fieldset>
        </form>
    </center>
    </body>
      <script> 
          
function ventanaSecundaria (URL){ 
   window.open(URL,"ventana2","width=620,height=500,scrollbars=no,resizable=yes ,top=100,left=500") 
} 

</script>
</html>
