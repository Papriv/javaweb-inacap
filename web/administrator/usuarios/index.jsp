<%@page import="cl.accesodato.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="cl.negocio.Usuario" %>
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
        <h1>Modulo Usuario</h1>
        <br>
        <a href="crear.jsp">Crear Nueva cuenta</a>
        <table border="1">
            <thead>
                <th>ID</th>
                <th>NOMBRE</th>
                <th>1ER APELLIDO</th>
                <th>2do APELLIDO</th>
                <th>ROL USUARIO</th>
            </thead>
            <tbody>
            <%
            //Course course=new Course();
              Conexion con=new Conexion();
              con.setSQL("select users.id,users.name,users.apepat,users.apemat,roles.type as type from users,roles where users.role_id=roles.id and state='activo'");
              while(con.getRs().next()){
                  out.println("<tr>");
                    out.println("<td>"+con.getRs().getString("id")+"</td>");
                    out.println("<td>"+con.getRs().getString("name")+"</td>");
                    out.println("<td>"+con.getRs().getString("apepat")+"</td>");
                    out.println("<td>"+con.getRs().getString("apemat")+"</td>");
                    out.println("<td>"+con.getRs().getString("type")+"</td>");
                  out.println("</tr>");
              }

                %>
            </body>
        </table>
        
        
    </body>
</html>
