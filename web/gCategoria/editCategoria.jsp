<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.*,dao.Negocio" %>
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

<title>MOdificacion de Datos</title>
</head>

<body background="/Final1/images/fondo7.jpg" style="background-size: cover">
    <%   Categoria cat=(Categoria)request.getAttribute("dato");
         Negocio  obj=new Negocio();
     %>
<center>
<div class="container">
<h1>Modificacion de Categoria</h1>
<fieldset class="cajas centrado">
	<form action="control" id="id_form"> 
            <input name="codc" type="hidden" value="<%=cat.getCodc()%>">
			<input type="hidden" name="op" value="7">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombre de Categoria</label>
                                <div><input class="form-control" type="text" id="id_nombre" name="nomc" value="<%=cat.getNomc()%>"></div>
			</div>
                        <br>
			<div class="form-group">
				<label class="control-label" for="id_imagen">Imagenes de Categorias</label>
                                <div><input class="form-control" type="file" id="id_imagen" name="imagen" value="images/<%=cat.getImagen()%>"></div>
			</div>
                        <br>
			<div class="form-group">
                            <div class="navegacion2"><button type="submit" class="btn btn-primary" >Actualiza Categoria</button></div>
			</div>
                        <button onclick="goBack()">Atras</button>



<script>
function goBack() {
  window.history.back();
}
</script>
	</form>
</div>
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