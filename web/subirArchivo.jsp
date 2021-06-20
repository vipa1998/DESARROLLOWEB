<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%String mensaje="";
        if(request.getAttribute("dato")!=null)
        mensaje=(String)request.getAttribute("dato");%>
        
        <h1>subir Archivos</h1>
        <form name="fr" action="sube" method="post" enctype="multipart/form-data">
            <table><tr><td><input type="file" name="file">
                       <td><input type="submit" value="enviar" onclick="valida()">
                    <tr><td colspan="2"><%=mensaje%>
            </table>
        </form>
    
                <script>
                    function valida(){
                        archivo=fr.file.value;
                    }// alert(archivo);n=archivo.length;tipo=archivo.substring(n-3,n);if(tipo=="jpg" || tipo=="gif")fr.submit();elsealert("solo jpg o gif");}</script>
    </body>
    
</html>
