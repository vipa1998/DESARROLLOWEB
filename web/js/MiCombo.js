$(document).ready(function () {
   
    function listarArticulo(id) {
        op = "28";
        $.post("control", {op, id}, (response) => {
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
                                            <th>Categoría<th>
                                            <th>Editar</th>
                                            <th>Del</th>
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
                    <td>${midato.cat}</td>
                    <td><a style="color: blue" href="control?op=12&id=${midato.coda}">Editar</a>
                    <td><a style="color: blue" href="control?op=11&id=${midato.coda}">Del</a>
                             </tr>`;    
          })
            template += `</tbody></table>`;
            $("#tablares").html(template);
            
        })
    }
    
    $(document).on('change','#cbcat',function(){
        let valor = $(this).val();
        if(valor!="Elegir")
            listarArticulo(valor);
    });
})