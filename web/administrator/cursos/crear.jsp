
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion=request.getSession();
    if(sesion.getAttribute("conectado")==null || sesion.getAttribute("conectado").equals("false") || sesion.getAttribute("conectado").equals("true-student") ){
        response.sendRedirect("../../index.jsp");
    }else{
    
    }
 %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="../../ServletUsuario?accion=cerrar">
            <input type="submit" value="Cerrar Sesion">
        </form>
        <h1>CREAR NUEVO CURSO</h1><br>
        <form method="post" action="../../ServletCurso?accion=registrar">
            <table>
                <tr>
                    <td>Nombre:</td>    
                    <td><input type="text" name="name"></td>
                </tr>
                <tr>
                    <td>Descripcion</td>
                    <td><input type="text" name="description"></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Crear curso"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
