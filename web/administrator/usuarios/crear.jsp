<%-- 
    Document   : crear.jsp
    Created on : 10-jul-2017, 18:25:41
    Author     : yodebian
--%>

<%@page import="cl.accesodato.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion=request.getSession();
    if(sesion.getAttribute("conectado")==null || sesion.getAttribute("conectado").equals("false") || sesion.getAttribute("conectado").equals("true-student") ){
        response.sendRedirect("../../index.jsp");
    }else{
    
    }
 %>
<%

    //Course course=new Course();
    Conexion con = new Conexion();


%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="../../ServletUsuario?accion=cerrar">
            <input type="submit" value="Cerrar Sesion">
        </form>    
        <h1>Nuevo Usuario</h1>
        <br>
        <form method="post" action="../../ServletUsuario?accion=registrar">
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
                    <td>Rol de Usuario</td>
                    <td>
                        <select name="role_id">
                            <%   con.setSQL("select * from roles");
                                while (con.getRs().next()) {
                            %>
                            <option value="<% out.println(con.getRs().getString("id"));  %>"><% out.println(con.getRs().getString("type"));  %></option>
                            <%    }   %>
                        </select>

                    </td>
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
