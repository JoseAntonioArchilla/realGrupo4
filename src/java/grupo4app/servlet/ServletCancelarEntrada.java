/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo4app.servlet;

import grupo4app.dao.AsientosFacade;
import grupo4app.dao.EventoUsuarioFacade;
import grupo4app.dao.UsuarioFacade;
import grupo4app.entity.EventoUsuario;
import grupo4app.entity.Usuario;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author chinchar@hotmail.es
 */
@WebServlet(name = "ServletCancelarEntrada", urlPatterns = {"/ServletCancelarEntrada"})
public class ServletCancelarEntrada extends HttpServlet {

    @EJB
    private EventoUsuarioFacade eventoUsuarioFacade;
        @EJB
    private AsientosFacade asientosFacade;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id_usuario = request.getParameter("id_usuario");       
        
        
        Usuario usr = (Usuario)request.getSession().getAttribute("usuario");
        
        if(id_usuario == null) id_usuario =usr.getIdusuario().toString();
        
        EventoUsuario eu = eventoUsuarioFacade.findById(Integer.parseInt(request.getParameter("eventoUsuario")));
        eu.getAsientos().setOcupado(0);
        
        eventoUsuarioFacade.remove(eu);
        asientosFacade.edit(eu.getAsientos());
        switch (usr.getRol()) {
                case 0: // Creador de evento
                    request.getRequestDispatcher("ServletListarEventos").forward(request, response);
                    break;
                case 1: // Administrador
                    response.sendRedirect("ServletUsuarioListar");
                    break;
                case 2: // Teleoperador
                    response.sendRedirect("ServletListarConversaciones");
                    break;
                case 3: // Analista
                    response.sendRedirect("ServletFiltroListar");                    
                    break;
                case 4: // Usuario evento
                    response.sendRedirect("ServletCargarListaEventosUsuario?usuario="+id_usuario);
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
