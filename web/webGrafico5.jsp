<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.*, java.util.*,dao.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/miestilo.css" rel="stylesheet" type="text/css"/>
    </head>
    <% Negocio obj=new Negocio();
    %>
    <body class="centrado" background="images/fondo4.jpg">
        <form class="cajas" action="grafico5" target="zona">
            <h4>5 Electrodomésticos más vendidos en general
            <br>
            <h5><input type="radio" name="opc" value="1" onclick="submit()"> Gráfico circular
            <input type="radio" name="opc" value="2" onclick="submit()"> Gráfico de barras
             <input type="radio" name="opc" value="3" onclick="submit()">Gráfico Lineal
        </form>
        <br>
        <iframe name="zona" width="650"  height="500"></iframe>
    </body>
</html>
