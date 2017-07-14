
<%@page import="cl.accesodato.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="cl.negocio.Course" %>
<%
    HttpSession sesion=request.getSession();
    if(sesion.getAttribute("conectado")==null || sesion.getAttribute("conectado").equals("false") || sesion.getAttribute("conectado").equals("true-student") ){
        response.sendRedirect("../../index.jsp");
    }else{
    
    }
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
        <h1>MODULO DE CURSOS</h1><br>
        
        <a href="crear.jsp">NUEVO CURSO</a><br>
        
        <h2>LISTADO CURSOS</h2>
        <table border="1">
            <thead>
                <th>ID</th>
                <th>NOMBRE</th>
                <th>DESCRIPCION</th>
                <th>EDITAR</th>
                <th>ELIMINAR</th>
            </thead>
            <tbody>
            <%
            //Course course=new Course();
              Conexion con=new Conexion();
              con.setSQL("select * from courses where state='activo'");
              while(con.getRs().next()){
                  out.println("<tr>");
                    out.println("<td>"+con.getRs().getString("id")+"</td>");
                    out.println("<td>"+con.getRs().getString("name")+"</td>");
                    out.println("<td>"+con.getRs().getString("description")+"</td>");
                    out.println("<td><a href=editar.jsp?edit="+con.getRs().getString("id")+">editar</a></td>");
                    out.println("<td><a href=../ServletCurso?delete="+con.getRs().getString("id")+">eliminar</a></td>");
                  out.println("</tr>");
              }

                %>
            </body>
        </table>
        
    </body>
</html>
