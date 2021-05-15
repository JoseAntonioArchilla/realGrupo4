/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo4app.servlet;

import grupo4app.dao.EventoUsuarioFacade;
import grupo4app.dao.UsuarioEventoFacade;
import grupo4app.dao.UsuarioFacade;
import grupo4app.entity.Usuario;
import grupo4app.entity.UsuarioEvento;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author nieto
 */
@WebServlet(name = "ServletCargarListaEventosUsuario", urlPatterns = {"/ServletCargarListaEventosUsuario"})
public class ServletCargarListaEventosUsuario extends HttpServlet {

    @EJB
    private UsuarioFacade usuarioFacade;
    @EJB
    private UsuarioEventoFacade usuarioEventoFacade;
    @EJB
    private EventoUsuarioFacade eventoUsuarioFacade;
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
        String id = request.getParameter("usuario");
        Usuario usuario;
        UsuarioEvento usuarioEvento;
        if(id == null){
            HttpSession sesion = request.getSession();
            usuario = (Usuario) sesion.getAttribute("usuario");
            usuarioEvento = (UsuarioEvento) sesion.getAttribute("usuarioEvento");
        }else{
            usuario = usuarioFacade.find(Integer.parseInt(id));
            usuarioEvento = usuarioEventoFacade.find(Integer.parseInt(id));
        }
        
        request.setAttribute("usuario", usuario);
        request.setAttribute("usuarioEvento", usuarioEvento);
        request.setAttribute("listaEventos", eventoUsuarioFacade.findByUsuario(usuarioEvento));
        
        RequestDispatcher rd = request.getRequestDispatcher("Perfil.jsp");
        rd.forward(request, response);
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
