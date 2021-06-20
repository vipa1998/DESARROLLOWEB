<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/miestilo.css">
         <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>
             <link href="css/adminlte.min.css" rel="stylesheet" type="text/css"/>
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
            <div><input size="135" id="txtnom" placeholder="Ingrese descripción"></div>
    </div>
</div>     
</div>
        <div id="tablares"></div>
        <%
            Articulo ar=(Articulo)request.getAttribute("dato");
            int cuenta=0;
        %>
        <center>
        <h1>Detalle de articulo</h1>
        <br>
        <form name="fr" action="control"> 
            <div style="margin: 0px;">
   <div style="float:left;width: 50%">
    <img src="images/<%=ar.getImagen()%>" height=300></div>
    <div style="margin: 0px;" style="float:left;width: 50%" >
        <div class="tabla2 cajas">
                <table border="1">
                <input type="hidden" name="op" value="14">
                <input type="hidden" name="coda" value="<%=ar.getCoda()%>">
                <tr><td>Descripcion: <td><br> <%=ar.getDes()%>
                <br><br>
                <tr><td>Marca: <td> <%=ar.getMarca()%>
                <tr><td>Precio unitario:<td><%=ar.getPrecio()%>
                <tr><td>Stock disponible:<td><%=ar.getStk()%>
                <tr><td>Cantidad:<td><input type="number" name="cantidad">
                <tr><td colspan="2"><div class="navegacion"><a href="#" onclick="compra()">
                        Añadir a carrito<img src="img/carrito.png" width="30" height="30">
                        </a>
           
                </table>
         </div>
      </div>
      </div>
                </center>
        </form>
           <script>
               function compra(){
                  can= Number(fr.cantidad.value);
                  stk= <%=ar.getStk()%>;
                  if(can>stk){
                      alert('cantidad no disponible ');
                    }else
                        fr.submit();
                    
                }
            </script> 
    </center>
    <script src="js/MiArticulo.js" type="text/javascript"></script>
    </body>
</html>
