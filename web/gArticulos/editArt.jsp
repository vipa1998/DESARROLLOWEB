<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.*,dao.Negocio,java.util.*" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.css">
<link rel="stylesheet" href="css/miestilo.css">
<link href="css/bootstrapValidator.css" rel="stylesheet" type="text/css"/>

<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/bootstrapValidator.js"></script>

<title>Modificación de Articulo</title>
</head>

<body background="/Final1/images/fondo7.jpg" style="background-size: cover">
    <%   
        Articulo cat=(Articulo)request.getAttribute("dato");
         
     %>
       <%
            HttpSession ses=request.getSession();
              Categoria c=(Categoria) ses.getAttribute("datoc");
       
        %>
        <% String mensaje="";
        if(request.getAttribute("dato1")!=null)
            mensaje=(String)request.getAttribute("dato1");
        %>
     
<div class="container">
<center>
    <fieldset  class="cajas centrado"><h1>Modificacion de Artículo:<%=cat.getCoda()%></h1>
        <form action="control" id="id_form" name="fr" enctype="multipart/form-data">
            <input type="hidden" name="op" value="13">

            <input type="hidden" name="coda" value="<%=cat.getCoda()%>">
            <div><label>Categoría: <%=c.getCodc()%>-> <%=c.getNomc()%>
            <input type="hidden" name="cat" value="<%=c.getCodc()%>">
            <br>
            <br>
				
			<div class="form-group">
			<label class="control-label" >Descripción</label>
                        <div class="cajas medium"><input size="50" class="form-control" type="text" id="descrip" name="des" value="<%=cat.getDes()%>">
			</div>
                        <br>
                        <div>
                        <label class="control-label" >Precio</label>
                        <div><input size="40" class="form-control" type="text" id="id_nombre" name="pre" value="<%=cat.getPrecio()%>">
			</div>
                        <br>
                        <div>
                        <label class="control-label">Marca</label>
                        <div><input size="40" class="form-control" type="text" id="id_nombre" name="mar" value="<%=cat.getMarca()%>">
			</div>
                        <br>
                        <div>
                        <label class="control-label" >Stock</label>
                        <div><input size="40" class="form-control" type="text" id="id_nombre" name="stk" value="<%=cat.getStk()%>">
			</div>
                        <br>
			<div class="form-group">
				<label class="control-label" for="id_imagen">Imagen</label>
                                <div><input class="form-control" type="file" id="id_imagen" name="imagen" value="images/<%=cat.getImagen()%>"></div>
			</div>
                        <br>
			<div class="form-group">
                            <div class="navegacion2"><button type="submit" class="btn btn-primary" >Actualiza Articulo</button>
                                <tr><td colspan="2">
                            </div>
                            <button onclick="goBack()">Atras</button>



<script>
function goBack() {
  window.history.back();
}
</script>
	</form>
</div>
</fieldset>
</center>
<script>

<script type="text/javascript">
$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	nombre: {
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    },
              regexp:{
            	  regexp: /^[A-Za-z ñÑ]+$/,
            	  message: 'Solo letras o espacios'
            	  
              }
                }
            },
        	apellido: {
                validators: {
                    notEmpty: {
                        message: 'El apellido es un campo obligatorio'
                    },
                     regexp:{
            	  regexp: /^[A-Za-z ñÑ]+$/,
            	  message: 'Solo letras o espacios'
            	  
                        }
                }
            },
        	edad: {
                validators: {
                    notEmpty: {
                        message: 'La edad es un campo obligatorio'
                    },
		            lessThan: {
		                value: 45,
		                inclusive: true,
		                message: 'La edad es menor a 45'
		            },
		            greaterThan: {
		                value: 18,
		                inclusive: true,
		                message: 'La edad es mayor a 18'
		            }
                }
            },            
        }   
    });

    // Validate the form manually
    $('#validateBtn').click(function() {
        $('#id_form').bootstrapValidator('validate');
    });
});
</script>

</body>
</html>