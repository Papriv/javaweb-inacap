
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cl.accesodato.Conexion"%>
<!DOCTYPE html>
<%
    HttpSession sesion=request.getSession();
    if(sesion.getAttribute("conectado")==null || sesion.getAttribute("conectado").equals("false") || sesion.getAttribute("conectado").equals("true-student") ){
        response.sendRedirect("../../index.jsp");
    }else{
    
    }
 %>


<%
        String id=request.getParameter("edit");
        out.println("EL ID ENVIADO ES:"+ id);
         Conexion con=new Conexion();
              con.setSQL("select * from courses where id='"+id+"'");
              while(con.getRs().next()){
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
        <h1>EDITAR CURSO</h1><br>
        <form method="post" action="../../ServletCurso?accion=actualizar">
            <table>
                 <tr>
                    <td>ID:</td>    
                    <td><input type="text" name="id" value="<% out.println(""+id);  %>" readonly></td>
                </tr>
                <tr>
                    <td>Nombre:</td>    
                    <td><input type="text" name="name" value="<% out.println(""+con.getRs().getString("name")); %>" required></td>
                </tr>
                <tr>
                    <td>Descripcion</td>
                    <td><input type="text" name="description" value="<% out.println(""+con.getRs().getString("description")); %>"></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Actualizar curso"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
<%   } %>