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
          int code=0;
            if(request.getParameter("cbe")!=null)
              code=Integer.parseInt(request.getParameter("cbe"));
    %>
    <body background="images/fondo4.jpg">
    <center>
       
        <form class="cajas" action="grafico4" target="zona">
              <h4>Articulos más vendidos al año:<select name="an">
                <option>Elegir</option>
                <%
                  for(Resumen x:obj.listAño()){
                  if(x.getAño()==(code))
                  out.print("<option value="+x.getAño()+" selected>"+x.getAño());
                  else
                  out.print("<option value="+x.getAño()+">"+x.getAño());
                  }
                 %>    
            </select>
            <br>
            <h5>
            <input type="radio" name="opc" value="1" onclick="submit()"> Gráfico circular
            <input type="radio" name="opc" value="2" onclick="submit()"> Gráfico de barras
             <input type="radio" name="opc" value="3" onclick="submit()">Gráfico Lineal
            
        </form>
            <br>
            <iframe class="centrado" name="zona" width="650"  height="500"></iframe>
    </center>
    </body>
</html>
