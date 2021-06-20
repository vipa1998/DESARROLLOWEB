<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/miestilo.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>
  <script src="js/MiArticulo.js" type="text/javascript"></script>
    </head>
        <body background="images/fondo7.jpg" style="background-size: cover" class="centrado">
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
  <nav class="navbar navbar-inverse navegacion">
  <div class="container-fluid">
    <ul class="nav navbar-nav">
      <li class="active"><a href="gestion.jsp">INICIO</a></li>
    </ul>
      <ul class="nav navbar-nav">
     <li class="active"><a class="dropdown-toggle" data-toggle="dropdown" href="#">GRÁFICOS<span class="caret"></span></a>
        <ul class="dropdown-menu">
        <li><a href="javascript:ventanaSecundaria('webGrafico1.jsp')">Mostrar los primeros N electrodomésticos</li>
        <li><a href="javascript:ventanaSecundaria('webGrafico2.jsp')">Ventas por mes</a>
        <li><a href="javascript:ventanaSecundaria('webGrafico3.jsp')">5 Electrodomésticos más vendidos por año</a>
        <li><a href="javascript:ventanaSecundaria('webGrafico4.jsp')">Clientes con más compras por año</a>
        <li><a href="javascript:ventanaSecundaria('webGrafico5.jsp')">5 Electrodomésticos más vendidos en general</a>
  <script> 
function ventanaSecundaria (URL){ 
   window.open(URL,"ventana1","width=750,height=750,scrollbars=no,resizable=yes ,top=100,left=500") 
} 
</script>
        </ul>
         </ul>
   <ul class="nav navbar-nav">
   <li class="active"><a href="control?op=4">Registro de categorias</a></li>
   </ul>
   <ul class="nav navbar-nav">
   <li class="active"> <a href="control?op=16">Registro de tiendas</a></li>
   </ul>
   <ul class="nav navbar-nav">
   <li class="active"><a href="gArticulos/PagArticulo2.jsp">Registro de productos</a></li>
   </ul>
    <ul class="nav navbar-nav">
   <li class="active"><a href="Login.jsp">Cerrar sesión</a></li>
   </ul>
</nav>
    <center>
        <%
           List<Categoria> lis=(ArrayList) request.getAttribute("dato");
         %>   
         <div class="navegacion3"><a href="gestion.jsp">Inicio</a></div>
        <h1>Lista de Categorias</h1>
        <div class="navegacion3"><a href="gCategoria/regCategoria.jsp">Registrar Categorias</a></div>
        <br>
        <div class="tabla">
            <table class="centrado" border="1">
            <tr><th>Codigo de Categoria<th>Nombre de Categoria<th>Imagen de Categoria<th>Modificar Categoria<th>Eliminar Categoria
            <%
               for(Categoria x:lis){
               out.print("<tr><td>"+x.getCodc()+"<td>"+x.getNomc());
               %>
                <td><img src="images/<%=x.getImagen()%>" height="90" width="90">
                <td><a href="control?op=6&id=<%=x.getCodc()%>">Editar</a>
                <td><a href="control?op=5&id=<%=x.getCodc()%>">Eliminar</a>                        
               <%
                } 
                
             %>   
            
        </table>
        </div>
        
    </center>
        
    </body>
</html>
