<%@page import="cl.accesodato.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="cl.negocio.Usuario" %>
<%
    HttpSession sesion=request.getSession();
    if(sesion.getAttribute("conectado")==null || sesion.getAttribute("conectado").equals("false")  ){
        response.sendRedirect("../index.jsp");
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
        
        <h1>Modulo Usuario</h1>
        <br>
        <a href="crear.jsp">Crear Nueva cuenta</a>
        <table border="1">
            <thead>
                <th>ID</th>
                <th>NOMBRE</th>
                <th>1ER APELLIDO</th>
            </thead>
            <tbody>
            <%
            //Course course=new Course();
              Conexion con=new Conexion();
              con.setSQL("select * from users");
              while(con.getRs().next()){
                  out.println("<tr>");
                    out.println("<td>"+con.getRs().getString("id")+"</td>");
                    out.println("<td>"+con.getRs().getString("name")+"</td>");
                    out.println("<td>"+con.getRs().getString("apepat")+"</td>");
                  out.println("</tr>");
              }

                %>
            </body>
        </table>
        
        
    </body>
</html>
