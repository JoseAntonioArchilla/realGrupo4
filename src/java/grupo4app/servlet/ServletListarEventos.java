/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo4app.servlet;

import grupo4app.dao.EventoFacade;
import grupo4app.entity.Evento;
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
 * @author josea
 */
@WebServlet(name = "ServletListarEventos", urlPatterns = {"/ServletListarEventos"})
public class ServletListarEventos extends HttpServlet {

    @EJB
    EventoFacade evento;
    
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
        
        String min = request.getParameter("minimoPrecio");
        String max = request.getParameter("maximoPrecio");
        String dis = request.getParameter("disponible");
        String nombre = request.getParameter("nombre");
        String musica = request.getParameter("musica");
        String aire_libre = request.getParameter("aire_libre");
        String deporte = request.getParameter("deporte");
        String teatro = request.getParameter("teatro");
        String gaming = request.getParameter("gaming");
        String lectura = request.getParameter("lectura");
        String formacion = request.getParameter("formacion");
        String conferencia = request.getParameter("conferencia");
        String beneficico = request.getParameter("beneficico");
        String arte = request.getParameter("arte");
        String turismo = request.getParameter("turismo");
        
        int maximo = max ==null || max.isEmpty() ? Integer.MAX_VALUE : Integer.parseInt(max);
        int minimo = min ==null || min.isEmpty() ? 0 : Integer.parseInt(min);
        nombre = nombre == null ? "" : nombre;
        boolean disponible =  dis != null && dis.equals("on");
        
       
       HttpSession session = request.getSession();        
       Usuario usr = (Usuario)session.getAttribute("usuario"); 
        
       List<Evento> listaEventos = this.evento.filtrarEventos(
               minimo, maximo, disponible, nombre,musica,aire_libre,deporte,teatro,gaming,
               lectura,formacion,conferencia,beneficico,arte,turismo, usr.getRol() == 0 ? usr : null);
       request.setAttribute("eventos", listaEventos);
       
       switch (usr.getRol()) {
            case 0: // Creador de evento
                request.getRequestDispatcher("InicioCreadorEvento.jsp").forward(request, response);
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
                request.getRequestDispatcher("InicioUsuarioEvento.jsp").forward(request, response);
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
