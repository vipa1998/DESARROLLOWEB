<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.*, java.util.*"%>
<!DOCTYPE html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/miestilo.css">
        <meta charset="utf-8">          
        <link href="css/adminlte.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>
    </head>
    <body background="/Final1/images/fondo7.jpg" style="background-size: cover">        
        
      <div class="cabecera"><div class="cabecera">
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
<div class="cabecera">
	<div class="contenedor-carrito navegacion">
            <div class="nombre"><h1>Descripción</div>
            <div><input size="130" id="txtnom" placeholder="Ingrese descripción"></div>
    </div>
</div>
</div>
        <div id="tablares"></div> 
    <center>
        <%
            List<Articulo> lis=(ArrayList)request.getAttribute("dato");
            int cuenta=0;
        %>
        <h1>Lista de Articulos</h1>
      
        <table border="1" style="border-collapse: separate;" class="centrado" cellspacing="15" cellpadding="15">
            <tr>
                <%
                    for(Articulo x:lis){
                    %>
                    <td>
                        <div class="navegacion3"><a href="control?op=3&id=<%=x.getCoda()%>">
                    <img src="images/<%=x.getImagen()%>" height="200" width="200">
                    <br><%=x.getDes()%>
                    </a></div>
                    </td>
                    <%
                        cuenta++;
                        if(cuenta%3==0)out.print("<tr>");
                        }
                        %>
        </table>
    </center>
   <script src="js/MiArticulo.js" type="text/javascript"></script>
    </body>
</html>
