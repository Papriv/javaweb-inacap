<%@page import="cl.negocio.Course"%>
<%@page import="cl.accesodato.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="ServletUsuario?accion=ingresar">
            <table>
                <tr>
                    <td>Usuario</td>
                    <td><input name="username" type="text"></td>
                </tr>
                <tr>
                    <td>Clave:</td>
                    <td><input name="password" type="password"></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Iniciar"></td>
                </tr>
                
            </table>
        </form>
    </body>
</html>
