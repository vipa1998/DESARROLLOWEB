<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.*,dao.Negocio,java.util.*" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="../css/miestilo.css">
<link rel="stylesheet" href="css/bootstrap-theme.css">
<link href="css/bootstrapValidator.css" rel="stylesheet" type="text/css"/>

<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/bootstrapValidator.js"></script>

<title>Registra Articulo</title>
</head>

<body background="images/fondo5.jpg">
    <%
            HttpSession ses=request.getSession();
              Categoria c=(Categoria) ses.getAttribute("datoc");
        List<Articulo> lista=(ArrayList)request.getAttribute("dato");
        %>
<center>
<div class="container">
<h1>Registra Articulo</h1>
<fieldset class="cajas centrado">
	<form action="../control" id="id_form"> 
			<input type="hidden" name="op" value="10">	
                        <input type="hidden" name="cat" value="<%=c.getCodc()%>" >
			<div class="form-group">
                            <label class="control-label" for="icat">Categoría:</label><th><%=c.getNomc()%>
			</div>
                        <br>
                        <div class="form-group">
				<label class="control-label" for="ides">Descripción</label>
                                <div class="cajas medium"><input size="50" class="form-control" type="text" id="descrip" name="des" placeholder="Ingrese el descripcion"></input>
			</div>
                        <br>
                        <div class="form-group">
				<label class="control-label" for="ipre">Precio</label>
                                <div><input size="40" class="form-control" type="text" id="pre_producto" name="pre" placeholder="Ingrese el precio">
			</div>
                        <br>
                        <div class="form-group">
				<label class="control-label" for="imar">Marca</label>
                                <div><input size="40" class="form-control" type="text" id="marca" name="mar" placeholder="Ingrese marca">
			</div>
                        <br>
                        <div class="form-group">
				<label class="control-label" for="istk">Stock</label>
                                <div><input size="40" class="form-control" type="text" id="stk" name="stk" placeholder="Ingrese el stock">
			</div>
                        <br>
			<div class="form-group">
				<label class="control-label" for="iimagen">Imagen</label>
                                <div><input size="40" class="form-control" type="file" id="imagen" name="imagen" placeholder="Archiva la imagen" accept="image/x-png,image/jpeg">
			</div>  
                        <br>
			<div class="form-group">
                            <div class="navegacion2"><button type="submit" class="btn btn-primary" >Crea Articulo</button>
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
