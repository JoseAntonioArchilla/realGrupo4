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
@WebServlet(name = "ServletCrearChat", urlPatterns = {"/ServletCrearChat"})
public class ServletCrearChat extends HttpServlet {

    @EJB
    private ChatFacade chatFacade;

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
        HttpSession ses = request.getSession();
        Usuario usuarioIniciado = (Usuario)ses.getAttribute("usuario");
        
        if(request.getParameter("teleoperador") != null && request.getParameter("usuario") != null){
            Usuario tele = this.usuarioFacade.find(Integer.parseInt(request.getParameter("teleoperador")));
            Usuario usr = this.usuarioFacade.find(Integer.parseInt(request.getParameter("usuario")));
            
            if(this.chatFacade.findByTeleoperadorAndUsuario(tele, usr) != null){
                
                request.setAttribute("error","Error: Esa conversaci??n ya est?? creada");

                List<Usuario> teleOps = this.usuarioFacade.findAllTeleoperadores();
                List<Usuario> usrs = this.usuarioFacade.findAllCreadoresUsuariosEventos();
        
                request.setAttribute("teleoperadores", teleOps);
                request.setAttribute("usuarios", usrs); 
               
                RequestDispatcher rd = request.getRequestDispatcher("CrearChatManual.jsp");
                rd.forward(request, response); 

            } else {
                 Chat nuevoChat = new Chat();
                nuevoChat.setUsuario1(tele);
                nuevoChat.setUsuario2(usr);

                this.chatFacade.create(nuevoChat);

                response.sendRedirect("ServletListarConversaciones");
            }
            
        } else {
            
            Usuario teleOpRandom = this.usuarioFacade.findRandomTeleoperador(usuarioIniciado);
            if(teleOpRandom != null){
                Chat nuevoChat = new Chat();
                nuevoChat.setUsuario1(teleOpRandom);
                nuevoChat.setUsuario2(usuarioIniciado);

                this.chatFacade.create(nuevoChat);

                response.sendRedirect("ServletMostrarChat?idChat=" + nuevoChat.getIdchat());

            } else {

               request.setAttribute("error","Error: No hay teleoperadores adicionales disponibles");

               List<Chat> chats;

               if(usuarioIniciado.getRol() == 2){
                    chats = this.chatFacade.findAll();
               } else {
                    chats = this.chatFacade.findByUsuario(usuarioIniciado);
               }

                request.setAttribute("chats", chats);

                RequestDispatcher rd = request.getRequestDispatcher("Conversaciones.jsp");
               rd.forward(request, response); 
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
