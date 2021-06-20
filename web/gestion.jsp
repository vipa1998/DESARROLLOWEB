    <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/miestilo.css">
        <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>
  <script src="js/MiArticulo.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head> 
    <body background="images/fondo2.jpg" style="background-size: cover" class="centrado">
<div class="cabecera">
				<div class="contenedor-superior navegacion">	
                                    <div class="navbar-header">
                                        <a class="navbar-brand" href="index.html">ELECTRA UTP</a>
                                    </div>
					<nav>
						<a href="Nosotros.jsp">Nosotros</a>	
                                                <a href="control?op=1">Observar area de compras</a>
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

	
    <h1 class="titulo mayuscula">Base de datos de la empresa</h1>

    <h1>"Electra-UTP"</h1>	
    <div class="centrado cajas">
	<div class="contenedor-carrito navegacion2">
	<div><a href="control?op=4"><img src="img/refri.png" width="120">
                <br><button>Registro de categorias</button></a></div>
	<br>
	<div><a href="control?op=16"><img src="img/tienda.png" width="120">
                <br><button>Registro de tiendas</button></a></div>
        <br>
	<div class="contenedor-carrito">
	<div><a href="gArticulos/PagArticulo2.jsp"><img src="img/refri.png" width="120">
                <br><button>Registro de productos</button></a></div>
	<br>
        </div>
        </div>
    </body>
</html>
