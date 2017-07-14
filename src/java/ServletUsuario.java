
import cl.negocio.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ServletUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Usuario usu = new Usuario();
            HttpSession sesion = request.getSession();
            if (request.getParameter("accion").equals("ingresar")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                usu.setUsername(username);
                usu.setPassword(password);
                
                if (usu.validar() == 1) {
                    sesion.setAttribute("conectado", "true-admin");
                    response.sendRedirect("administrator/inicio.jsp");
                }else if(usu.validar()==2){
                    sesion.setAttribute("conectado", "true-student");
                    response.sendRedirect("student/inicio.jsp");
                } else {
                    sesion.setAttribute("conectado", "false");
                    response.sendRedirect("index.jsp");
                }
            }else if(request.getParameter("accion").equals("registrar")){
                String name=request.getParameter("name");
                String apepat=request.getParameter("apepat");
                String apemat=request.getParameter("apemat");
                String username=request.getParameter("username");
                String password=request.getParameter("password");
                String role_id=request.getParameter("role_id");
                usu.setName(name);
                usu.setApepat(apepat);
                usu.setApemat(apemat);
                usu.setUsername(username);
                usu.setPassword(password);
                usu.setRole_id(role_id);
                usu.save();
                response.sendRedirect("administrator/usuarios/index.jsp");
            }else if(request.getParameter("accion").equals("cerrar")){
                sesion.invalidate();
                response.sendRedirect("index.jsp");
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
