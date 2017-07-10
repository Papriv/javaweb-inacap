<%-- 
    Document   : crear.jsp
    Created on : 10-jul-2017, 18:25:41
    Author     : yodebian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Nuevo Usuario</h1>
        <br>
         <h1>Crear nuevo usuario</h1>
        <form method="post" action="../ServletUsuario?accion=registrar">
            <table>
                <tr>
                    <td>Nombre</td>
                    <td><input type="text" name="name"></td>
                </tr>
                <tr>
                    <td>1er Apellido</td>
                    <td><input type="text" name="apepat"></td>
                </tr>
                <tr>
                    <td>2do Apellido</td>
                    <td><input type="text" name="apemat"></td>
                </tr>
                <tr>
                    <td>Cuenta Usuario</td>
                    <td><input type="text" name="username"></td>
                </tr>
                <tr>
                    <td>Clave</td>
                    <td><input type="password" name="password"></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Crear Usuario"></td>  
                </tr>
            </table>
        </form>
    </body>
</html>
