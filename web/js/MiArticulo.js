$(document).ready(function () {
   
    function listarArticulo(consulta) {
        op = "26";
        $.post("control", {op, consulta}, (response) => {
            const misDatos = JSON.parse(response); //recuperar la información que envió el controlador
            let template = "";
            console.log(misDatos);
            template += `
             <table  style="color: black" class="table table-hover">
                                    <thead class="bg-dark">
                                        <tr style="color: black">
                                            <th>Id Art</th>
                                            <th>descripcion</th>
                                            <th>precio</th>
                                            <th>Foto</th>
                                            <th>Comprar</th>
                                           </tr>
                                    </thead>
                                    <tbody>`;
            misDatos.forEach(midato => {
                template += `
                <tr>
                    <td>${midato.coda}</td>
                    <td>${midato.des}</td>
                    <td>${midato.precio}</td>
                    <td><img src="images/${midato.imagen}"  height=90 width=80></td>
                    <td><a style="color: blue" href="control?op=3&id=${midato.coda}">Comprar
                             </tr>`;
            })
            template += `</tbody></table>`;
            $("#tablares").html(template);

        })
    }
     function listarNada() {
          let template = "";
            template += ` `
             $("#tablares").html(template);
     }
     $(document).on('keyup','#txtnom',function(){
        let valor = $(this).val();
        if(valor=="")
            listarNada();
        else
          listarArticulo(valor);  
    });
})