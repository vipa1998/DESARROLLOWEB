<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
       <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
       <link href="css/adminlte.min.css" rel="stylesheet" type="text/css"/>
    
       <title>JSP Page</title>
    </head>
    <body>

    <center>
        <h1>Combo en cascada</h1>
        <table border="1">
          <tr><td>Categoria<td><select id="cbcat">
                      <option>Elegir</option>
                      <c:forEach var="cat" items="${requestScope.dato}">
                          <option value="${cat.codc}">${cat.nomc}</option>
                      </c:forEach>    
                  </select></td></tr></table>  
                  <div id="tablares">
                  </div>
    </center>
    </body>
</html>
<script src="js/MiCombo.js" type="text/javascript"></script>

