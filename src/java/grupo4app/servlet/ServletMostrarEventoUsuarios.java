/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo4app.servlet;

import grupo4app.dao.EventoUsuarioFacade;
import grupo4app.dao.FiltroFacade;
import grupo4app.dao.UsuarioEventoFacade;
import grupo4app.entity.EventoUsuario;
import grupo4app.entity.Filtro;
import grupo4app.entity.FiltroPK;
import grupo4app.entity.Usuario;
import grupo4app.entity.UsuarioEvento;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
 * @author carlo
 */
@WebServlet(name = "ServletMostrarEventoUsuarios", urlPatterns = {"/ServletMostrarEventoUsuarios"})
public class ServletMostrarEventoUsuarios extends HttpServlet {

    @EJB
    private EventoUsuarioFacade eventoUsuarioFacade;

   

    @EJB
    private FiltroFacade filtroFacade;
    
    

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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        
        //Variables
        String id = request.getParameter("id");
        int idFiltro = Integer.parseInt(id);
        HttpSession session = request.getSession();
        Usuario creadorFiltro = (Usuario)session.getAttribute("usuario");
        int idCreador = creadorFiltro.getIdusuario();
        FiltroPK filtroPk = new FiltroPK(idFiltro, idCreador);
        
        
        Filtro filtroUsado = this.filtroFacade.find(filtroPk);
        List<EventoUsuario> usuariosFiltrados = this.eventoUsuarioFacade.filtrosEventoUsuario(filtroUsado);
        request.setAttribute("filtrados", usuariosFiltrados);
        
        String direccion = "FiltrosUsuariosEventos.jsp";
        RequestDispatcher rd = request.getRequestDispatcher(direccion);
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ServletMostrarEventoUsuarios.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ServletMostrarEventoUsuarios.class.getName()).log(Level.SEVERE, null, ex);
        }
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
