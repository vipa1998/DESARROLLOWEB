<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Estadísticas ElectraUTP</h1>
        <div><a href="javascript:ventanaSecundaria('webGrafico1.jsp')">Mostrar los primeros N electrodomésticos</a>
        <div><a href="javascript:ventanaSecundaria('webGrafico2.jsp')">Ventas por mes</a>
        <div><a href="javascript:ventanaSecundaria('webGrafico3.jsp')">5 Electrodomésticos más vendidos por año</a>
        <div><a href="javascript:ventanaSecundaria('webGrafico4.jsp')">Clientes con más compras por año</a>
        <div><a href="javascript:ventanaSecundaria('webGrafico5.jsp')">5 Electrodomésticos más vendidos en general</a>
  <script> 
function ventanaSecundaria (URL){ 
   window.open(URL,"ventana1","width=620,height=600,scrollbars=no,resizable=yes ,top=100,left=500") 
} 
</script>
    </body>
</html>
