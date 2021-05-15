/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo4app.servlet;

import grupo4app.dao.ChatFacade;
import grupo4app.dao.UsuarioFacade;
import grupo4app.entity.Chat;
import grupo4app.entity.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
 * @author franc
 */
@WebServlet(name = "ServletListarConversaciones", urlPatterns = {"/ServletListarConversaciones"})
public class ServletListarConversaciones extends HttpServlet {

    @EJB
    private ChatFacade chatFacade;


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
        Usuario usuarioSesion = (Usuario)session.getAttribute("usuario");
        String usBuscar = request.getParameter("usuarioBuscar");
        
        List<Chat> chats;
        if(usBuscar == null || usBuscar.trim().length() == 0){
            if(usuarioSesion != null){
                if(usuarioSesion.getRol() == 2){
                    chats = this.chatFacade.findAll();
                } else {
                    chats = this.chatFacade.findByUsuario(usuarioSesion);
                }
                
                request.setAttribute("chats", chats);
            }
        } else {
            if(usuarioSesion != null){
                if(usuarioSesion.getRol() == 2){
                    chats = this.chatFacade.filtrarTeleoperador(usBuscar);
                } else {
                    chats = this.chatFacade.filtrarUsuario(usBuscar,usuarioSesion);
                }
                
                request.setAttribute("chats", chats);
                request.setAttribute("buscado", true);
            }
        }
        
        if(usuarioSesion.getRol() == 2){
            RequestDispatcher rd = request.getRequestDispatcher("InicioTeleoperador.jsp");
            rd.forward(request, response);  
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("Conversaciones.jsp");
            rd.forward(request, response);
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
