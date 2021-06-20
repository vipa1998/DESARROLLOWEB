<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JSP Page</title>
         <link rel="stylesheet" href="css/miestilo.css">
<script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <script src="js/MiArticulo.js" type="text/javascript"></script>
    <style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Button used to open the chat form - fixed at the bottom of the page */
.open-button {
  background-color: #555;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  position: fixed;
  bottom: 23px;
  right: 28px;
  width: 280px;
}

/* The popup chat - hidden by default */
.chat-popup {
  display: none;
  position: fixed;
  bottom: 0;
  right: 15px;
  border: 3px solid #f1f1f1;
  z-index: 9;
}

/* Add styles to the form container */
.form-container {
  max-width: 300px;
  padding: 10px;
  background-color: white;
}

/* Full-width textarea */
.form-container textarea {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
  resize: none;
  min-height: 200px;
}

/* When the textarea gets focus, do something */
.form-container textarea:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit/send button */
.form-container .btn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  margin-bottom:10px;
  opacity: 0.8;
}

/* Add a red background color to the cancel button */
.form-container .cancel {
  background-color: red;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}
</style>
    </head>
    <script src="js/MiFactura.js" type="text/javascript"></script>
    <body background="/Final1/images/fondo7.jpg" style="background-size: cover">

    <center>
        <h1 class="titulo">Datos de la compra</h1>
        <%
            String cli=(String)request.getAttribute("cli");
            String fac=(String)request.getAttribute("factura");
            double tot=(double)request.getAttribute("total");
        %>
        <div class="tabla2">
        <table class="centrado" border="1">
            <tr><td>Factura nro: <td><%=fac%>
            <br><tr><td>Cliente: <td><%=cli%>
            <br><tr><td>Total a pagar: <td><%=tot%>
       </table>
       </div>
       <br>
       <br>
       <div class="navegacion2"><button class="btn btn-primary" id="txtnom" value="<%=fac%>">Ver detalle</button></div>
       <br>
       <br>
       <div class="tabla2" id="tablares"></div>
       <br>
       <br>
       <div class="navegacion2"><button id="btn" class="btn btn-primary" value="Imprimir">Imprimir</button></div>
       <br>
       <br>
       <div class="navegacion3"><a href="control?op=1">Pagina Inicial</a></div>
    </center>
    <button class="open-button" onclick="openForm()">Comunicate con nosotros</button>

<div class="chat-popup" id="myForm">
  <form action="/action_page.php" class="form-container">
    <h1>Chat</h1>

    <label for="msg"><b>Escribe tu mensaje:</b></label>
    <textarea placeholder="Escribe..." name="msg" required></textarea>

    <button type="submit" class="btn">Enviar</button>
    <button type="button" class="btn cancel" onclick="closeForm()">Cerrar</button>
  </form>
</div>

<script>
function openForm() {
  document.getElementById("myForm").style.display = "block";
}

function closeForm() {
  document.getElementById("myForm").style.display = "none";
}
</script>
 </body>
    
</html>
