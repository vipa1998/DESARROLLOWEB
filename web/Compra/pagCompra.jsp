<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/miestilo.css">
        <link rel="stylesheet" href="css/adminlte.min.css">
        <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>
    </head>
     <body background="/Final1/images/fondo7.jpg" style="background-size: cover" class="fondo">
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
            <div class="nombre"><h2>Descripción</h2></div>
            <div><input size="130" id="txtnom" placeholder="Ingrese descripción"></div>
    </div>
</div>
</div>
        <div id="tablares"></div> 
       
    <center>
        <%
            HttpSession ses=request.getSession();
            List <Compra> lista=(ArrayList)ses.getAttribute("canasta");
          
        %>
        <br>
        <div class="contenedor-carrito"> 
        <div class="navegacion nombre"><a style="color: black" href="control?op=1">SEGUIR COMPRANDO</a></div>
        <div class="navegacion nombre"><a style="color: black" href="Login2.jsp">FINALIZAR COMPRAR</a></div>
        </div>
        <br>
       
        <br><table border="1" class="table centrado tableStriped table-hover">
            <tr><th>Código<th>Descripción<th>Precio<th>Cantidad<th>Total<th>Imagen<th>Borrar
            
        <%
            int indice=0;
          for(Compra x:lista){
           out.print("<tr><td>"+x.getCoda()+"<td>"+x.getDes()+"<td>"+x.getPrecio()+"<td>"+x.getCantidad()+"<td>"+x.total());
        %>
        <td><img src="images/<%=x.getImagen()%>" height="90" width="90">
        <td><a style="color: black" href="control?op=15&id=<%=indice%>">Del</a>                    
        <%
            indice++;
            }
        %>
      </table>
    
      <script src="js/MiArticulo.js" type="text/javascript"></script>
    </center>
    </body>
</html>
