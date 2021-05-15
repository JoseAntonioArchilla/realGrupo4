/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo4app.servlet;

import grupo4app.dao.AsientosFacade;
import grupo4app.dao.EventoFacade;
import grupo4app.dao.EventoUsuarioFacade;
import grupo4app.entity.Asientos;
import grupo4app.entity.AsientosPK;
import grupo4app.entity.Evento;
import grupo4app.entity.EventoUsuario;
import grupo4app.entity.EventoUsuarioPK;
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
 * @author chinchar@hotmail.es
 */
@WebServlet(name = "ServletRegistrarPersonaEnEvento", urlPatterns = {"/ServletRegistrarPersonaEnEvento"})
public class ServletRegistrarPersonaEnEvento extends HttpServlet {

    @EJB
    private AsientosFacade asientosFacade;

    @EJB
    private EventoUsuarioFacade eventoUsuarioFacade;

    @EJB
    private EventoFacade eventoFacade;

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        HttpSession ses = request.getSession();
        Usuario u = (Usuario)ses.getAttribute("usuario");
        String asiento_s = request.getParameter("asiento");
        int e = Integer.parseInt(request.getParameter("evento"));
        Evento evento = eventoFacade.find(e);
        EventoUsuarioPK lotad = new EventoUsuarioPK();
        lotad.setIdevento(e);
        lotad.setUsuario(u.getIdusuario());
        EventoUsuario eu = new EventoUsuario(lotad);
        eu.setEvento(evento);
        eu.setUsuarioEvento(u.getUsuarioEvento());
                
        if(evento.getAsientosFijos())
        {
            String[] asiento = asiento_s.split(" ");
            Asientos a = asientosFacade.find(new AsientosPK(Integer.parseInt(asiento[0]),Integer.parseInt(asiento[1]), e));
            eu.setAsientos(a);
            
            a.setOcupado(1);
            asientosFacade.edit(a);
        }
        eventoUsuarioFacade.create(eu);
        
        request.setAttribute("evento", eventoFacade.find(e));
        
        request.getRequestDispatcher("ServletListarEventos").forward(request, response);
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
