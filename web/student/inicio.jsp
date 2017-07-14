<%-- 
    Document   : inicio.jsp
    Created on : 13-jul-2017, 19:00:40
    Author     : yodebian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesion=request.getSession();
    if(sesion.getAttribute("conectado")==null || sesion.getAttribute("conectado").equals("false") || sesion.getAttribute("conectado").equals("true-admin") ){
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
         <form method="post" action="../ServletUsuario?accion=cerrar">
            <input type="submit" value="Cerrar Sesion">
        </form>
       <h1>Bienvenido ESTUDIANTE!!!</h1><br>
       
       <a href="#">VER MIS CURSOS</a>
    </body>
</html>
