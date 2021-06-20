<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.*, java.util.*"%>
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
            List<Tienda> lis=(ArrayList)request.getAttribute("dato");
            int cuenta=0;
        %>
          <h1 class="titulo">Tiendas</h1>
        <div class="navegacion3"><a href="gTienda/regTienda.jsp">Registrar nueva tienda</a></div><br>
        <table style="border-collapse: separate" border="1" class="tabla2 navegacion3" cellspacing="15" cellpadding="15">
                 <tr>
                     <%
                    for(Tienda x:lis){
                    %>
                   
                    <td>
                    <center>
                    <img src="images/<%=x.getImagen()%>" height="220" width="280">
                    <br><p><%=x.getNom_tienda()%>
                    <br><p>Dirección: <%=x.getDir_tienda()%>
                    <br><p>Teléfono: <%=x.getTel()%>
                    <br><p><a href="control?op=20&id=<%=x.getId_tienda()%>">Editar</a>
                    <br><p><a href="control?op=18&id=<%=x.getId_tienda()%>">Eliminar</a>
                    </center>
                    </a>
                    </td>
                    <%
                        cuenta++;
                        if(cuenta%3==0)out.print("<tr>");
                        }
                        %>
        </table>
    </center>
    </body>
</html>
