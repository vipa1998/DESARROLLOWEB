<%@page import="beans.*, java.util.*,dao.*"%>
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/miestilo.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="centrado" background="images/fondo4.jpg">
         <% Negocio obj=new Negocio();
          int code=0;
            if(request.getParameter("cbe")!=null)
              code=Integer.parseInt(request.getParameter("cbe"));
    %>
    <form class="cajas" action="grafico3" target="zona">
            <h4> Articulos m�s vendidos al a�o:<select name="an">
                <option>Elegir</option>
                <%
                  for(Resumen x:obj.listA�o()){
                  if(x.getA�o()==(code))
                  out.print("<option value="+x.getA�o()+" selected>"+x.getA�o());
                  else
                  out.print("<option value="+x.getA�o()+">"+x.getA�o());
                  
                    }  
                 %>    
            </select>
            <br>
            <h5><input type="radio" name="opc" value="1" onclick="submit()"> Gr�fico circular
            <input type="radio" name="opc" value="2" onclick="submit()"> Gr�fico de barras
             <input type="radio" name="opc" value="3" onclick="submit()">Gr�fico Lineal
            
        </form>
            <br>
        <iframe name="zona" width="650"  height="500"></iframe>
    </body>
</html>
