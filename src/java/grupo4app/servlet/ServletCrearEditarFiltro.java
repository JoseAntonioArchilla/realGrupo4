/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo4app.servlet;

import grupo4app.dao.FiltroFacade;
import grupo4app.entity.Filtro;
import grupo4app.entity.FiltroPK;
import grupo4app.entity.Usuario;
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
 * @author carlo
 */
@WebServlet(name = "ServletCrearEditarFiltro", urlPatterns = {"/ServletCrearEditarFiltro"})
public class ServletCrearEditarFiltro extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         
        //No nos olvidemos del session
        HttpSession session = request.getSession();
        Usuario creadorFiltro = (Usuario)session.getAttribute("usuario");
        int idCreador = creadorFiltro.getIdusuario();
        //Comprueba si es para editar o es nuevo.
        String str = request.getParameter("id");
        //Es editar en vez de guardar.
        if(str != null){
            int idFiltro = new Integer(str);
            FiltroPK busqueda = new FiltroPK(idFiltro, idCreador);
            Filtro filtroEditar = this.filtroFacade.find(busqueda);
            request.setAttribute("filtroEditar", filtroEditar);
        }
            
       //Devuelvo el contrl al controlador.
       String direccion = "CrearAnalisis.jsp";
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
