/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo4app.servlet;

import grupo4app.dao.EventoFacade;
import grupo4app.dao.UsuarioFacade;
import grupo4app.entity.Evento;
import grupo4app.entity.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author josea
 */
@WebServlet(name = "ServletBorrarEvento", urlPatterns = {"/ServletBorrarEvento"})
public class ServletBorrarEvento extends HttpServlet {

    
    @EJB
    private EventoFacade ef;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        Evento e = ef.find(id);
        ef.remove(e);
        
        HttpSession session = request.getSession();        
        Usuario usr = (Usuario)session.getAttribute("usuario");        

        switch (usr.getRol()) {
            case 0: // Creador de evento
                request.getRequestDispatcher("ServletListarEventos").forward(request, response);
                break;
            case 1: // Administrador
                request.getRequestDispatcher("ServletListarEventos").forward(request, response);
                break;
            case 2: // Teleoperador
                response.sendRedirect("ServletListarConversaciones");
                break;
            case 3: // Analista
                response.sendRedirect("ServletFiltroListar");
                break;
            case 4: // Usuario evento
                response.sendRedirect("ServletListarEventos");
                break;
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
