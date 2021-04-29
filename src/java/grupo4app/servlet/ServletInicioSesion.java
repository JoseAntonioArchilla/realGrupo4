/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo4app.servlet;

import grupo4app.dao.UsuarioFacade;
import grupo4app.entity.Usuario;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author chinchar@hotmail.es
 */
@WebServlet(name = "ServletInicioSesion", urlPatterns = {"/ServletInicioSesion"})
public class ServletInicioSesion extends HttpServlet {

    @EJB
    private UsuarioFacade usuarioFacade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        String nUsuario = request.getParameter("usuario");
        String password = request.getParameter("contrasena");
        
        if(nUsuario == null || password == null){
            request.setAttribute("error", "Error: Campos vacíos");
                    
            RequestDispatcher rd = request.getRequestDispatcher("InicioSesion.jsp");
            rd.forward(request, response);
        } else {
            nUsuario = nUsuario.trim();
            //password = password.trim();  a una contraseña no se le deberia hacer trim
            
            if(nUsuario.length() == 0 || password.length() == 0){
                request.setAttribute("error", "Error: Campos vacíos");
                    
                RequestDispatcher rd = request.getRequestDispatcher("InicioSesion.jsp");
                rd.forward(request, response);
            } else {
                Usuario usr = this.usuarioFacade.findByNicknameAndPassword(nUsuario,password);
                
                if(usr == null){
                    request.setAttribute("error", "Error: El nombre de usuario o la contraseña son incorrectos");
                    
                    RequestDispatcher rd = request.getRequestDispatcher("InicioSesion.jsp");
                    rd.forward(request, response);
                } else {
                    session.setAttribute("usuario", usr);
                    
                    RequestDispatcher rd = request.getRequestDispatcher("index.html");
                    rd.forward(request, response);
                }
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
