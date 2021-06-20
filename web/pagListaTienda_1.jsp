<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.*, java.util.*,dao.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/miestilo.css">
           
    <div class="navbar-header">
        <title>JSP Page</title>
    </head>
    <body bgColor="#51d1f6">
    <center>
        <%
            Negocio obj=new Negocio();
            int cuenta=0;
        %>
        <div class="cabecera">
				<div class="contenedor-superior navegacion">
                                <div class="navbar-header">
<a class="navbar-brand" href="index.html">ELECTRA UTP</a>
</div>		
					<nav>
						<a href="Nosotros.jsp">Nosotros</a>	
						  <a href="control?op=1">Comprar</a>
						<a href="Login.jsp">Gestión</a>
					</nav>
				</div>			
			</div>
        <h1>Lista de Tiendas</h1>
        <table bgColor="white" class="tabla"  border="2" cellspacing="15" cellpadding="15">
            <tr>
                <%
                    for(Tienda x:obj.lisTiendita()){
                    %>
         
                    <td>
                    <center>
                    <img src="images/<%=x.getImagen()%>" height="180" width="180">
                    <br><p><%=x.getNom_tienda()%>
                    <br><p>Dirección: <%=x.getDir_tienda()%>
                    <br><p>Teléfono: <%=x.getTel()%>
                    </center>
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
