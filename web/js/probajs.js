$(document).ready(function () {
    $("#cbcat").click(function () {
        var catcod = $(this).val();
        alert(catcod)
        $.ajax({
            url: "Controlador?op=7&cod=" + catcod,
            type: "get",
            cache: false,
            async: true,
            success: function (data) {
                $("#cbopcsub").empty();
                $.each(data, function (indice, prod) {
                    $("#cbopcsub").append(" <label>" +
                            "<input class='chkoption' type='checkbox' name='chkoption[]' id='chkoption' value=" + prod.sub_cod + "> " +
                            "<span>" + prod.descripcion + "</span>" +
                            "</label>");
                });
            }
        });
    });
    $("#cbopcsub").click(function () { 
        var sub_cod = $(this).val();
        alert(sub_cod);
//       $.ajax({
//            url: "ConsultarMarca?sub_cod=" + sub_cod,
//            type: "get",
//            cache: false,
//            async: true,
//            success: function (data) {
//                $.each(data, function (indice, prod) {
//                    $("#cbopcmar").append(" <label>" +
//                            " <input class='chkoption' type='checkbox' name='chkoption[]' id='chkoption' value=" + prod.mar_cod + "> " +
//                            "<span>" + prod.descripcion + "</span>" +
//                            "  </label>");
//                });
//            } 
//        }); 
    });
});

