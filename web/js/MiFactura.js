/* global tablares */

$(document).ready(function () {
   
    function listarFactura(id) {
        op = "29";
        $.post("control", {op, id}, (response) => {
            const misDatos = JSON.parse(response); //recuperar la información que envió el controlador
                    let template = "";
            console.log(misDatos);
            template += `
              <table class="tabla" border="1">
                                    <thead class="text-white bg-dark">
                                        <tr>
                                            <th>CÓDIGO</th>
                                            <th>DESCRIPCIÓN</th>
                                            <th>CANTIDAD</th>
                                            <th>PRECIO</th>
                                            <th>SUBTOTAL</th>
                                        </tr>
                                    </thead>
                                    <tbody>`;
            misDatos.forEach(miFactura => {
                template += `
                <tr>
                    <td>${miFactura.coda}</td>
                    <td>${miFactura.des}</td>
                    <td>${miFactura.can}</td>
                    <td>${miFactura.precio}</td>
                    <td>${miFactura.subt}</td>
                </tr>
                `;
            })
            template += `</tbody></table>`;
            $("#tablares").html(template);

        })
    }
    
    
    $(document).on('click','#txtnom',function(){
        let valor = $(this).val();
            listarFactura(valor);
    
    });
     $(document).on('click','#btn',function(){
        let valor = $(this).val();
       print();
     });
       
})