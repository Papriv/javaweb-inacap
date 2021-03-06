<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script
            src="https://code.jquery.com/jquery-3.2.1.js"
            integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
            crossorigin="anonymous">
        </script>
    </head>
    <body>
        <button id="mostrar">Mostrar Lista</button>
        
        <table id="mi-tabla" border="1">
            <thead>
                <th>ID</th>
                <th>NOMBRE</th>
            </thead>
        </table>
        
        <select id="mis-usuarios">
            
        </select>
        
        <select id="paises">
            <option value="0"> SELECCIONAR OPCION</option>
            <option value="1"> CHILE</option>
            <option value="2"> ARGENTINA</option>
        </select>
        <select id="ciudades">
            
        </select>
        
        
    </body>
</html>

<script>
    $(document).ready(function () {
        $("#mostrar").click(function(){
           listar();
        });
        
        $("#paises").change(function(){
            var id_pais=$("#paises").val();
            buscar_ciudad(id_pais);
        });
        
        function buscar_ciudad($id){
            $("#ciudades").empty();
            $.ajax("ServletJSONCiudad?pais_id="+$id, {
                type: "get",
                dataType: 'json',
                contentType: 'application/json',
                mimeType: 'application/json',
                success: function (result) {
                    
                    $.each(result, function (index, value) {
                        $("#ciudades").append("<option>"+value.name+"</option>");
                          
                     });
                },
                error: function (result) {
                    console.error("Errores:", result);
                }
            });
            
        }
        
        function listar() {
            $.ajax("ServletJSONUsuario", {
                type: "post",
                dataType: 'json',
                contentType: 'application/json',
                mimeType: 'application/json',
                success: function (result) {
                    $.each(result, function (index, value) {
                         $("#mi-tabla").append("<tbody>");
                            $("#mi-tabla").append("<td>"+value.id+"</td>");
                            $("#mi-tabla").append("<td>"+value.name+"</td>>");
                         $("#mi-tabla").append("</tbody>");
                         
                         $("#mis-usuarios").append("<option>"+value.name+"</option>");
                          
                     });
                },
                error: function (result) {
                    console.error("Errores:", result);
                }
            });
           }
    });


</script>