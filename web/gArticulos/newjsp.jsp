<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.*,dao.*, java.util.*" %>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../css/miestilo.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>
  <script src="js/MiArticulo.js" type="text/javascript"></script>
    </head>
          <body background="/Final1/images/fondo7.jpg" style="background-size: cover">
<div class="cabecera">
				<div class="contenedor-superior navegacion">
					<div class="nombre">
						<a href="/Final1/index.html">Tienda ElectraUTP</a>	
					</div>			
					<nav>
						<a href="/Final1/Nosotros.jsp">Nosotros</a>	
                                                <a href="/Final1/control?op=1">Comprar</a>
					</nav>
				</div>			
           </div>
  <nav class="navbar navbar-inverse navegacion">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">ELECTRA UTP</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="/Final1/gestion.jsp">INICIO</a></li>
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
   window.open(URL,"ventana1","width=620,height=600,scrollbars=no,resizable=yes ,top=100,left=500") 
} 
</script>
        </ul>
         </ul>
   <ul class="nav navbar-nav">
   <li class="active"><a href="/Final1/control?op=4">Registro de categorias</a></li>
   </ul>
   <ul class="nav navbar-nav">
   <li class="active"> <a href="/Final1/control?op=16">Registro de tiendas</a></li>
   </ul>
   <ul class="nav navbar-nav">
   <li class="active"><a href="/Final1/gArticulos/PagArticulo2.jsp">Registro de productos</a></li>
   </ul>
    <ul class="nav navbar-nav">
   <li class="active"><a href="/Final1/Login.jsp">Cerrar sesión</a></li>
   </ul>
</nav>
         <br><a href="../control?op=27">Combo de categorias</a><br>
    </body>
</html>
