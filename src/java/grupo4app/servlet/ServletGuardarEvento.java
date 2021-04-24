/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo4app.servlet;

import grupo4app.dao.AsientosFacade;
import grupo4app.dao.EventoFacade;
import grupo4app.entity.Asientos;
import grupo4app.entity.AsientosPK;
import grupo4app.entity.Evento;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author josea
 */



@WebServlet(name = "ServletGuardarEvento", urlPatterns = {"/ServletGuardarEvento"})
public class ServletGuardarEvento extends HttpServlet {
@EJB 
EventoFacade evento;

@EJB
AsientosFacade asientos;
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
        String titulo,descripcion,asientoFijo;
        String [] etiquetas = request.getParameterValues("etiqueta");
        Integer precio, dia, mes, anio, diaLi, mesLi, anioLi,aforo, numFila, numCol;
        Evento e = new Evento();
        Asientos a = new Asientos();
        
       titulo = request.getParameter("tituloEvento");
       descripcion = request.getParameter("descripcionEvento");
       precio = Integer.parseInt(request.getParameter("tituloEvento"));
       dia = Integer.parseInt(request.getParameter("tituloEvento"));
       mes = Integer.parseInt(request.getParameter("tituloEvento"));
       anio = Integer.parseInt(request.getParameter("tituloEvento"));
       diaLi = Integer.parseInt(request.getParameter("tituloEvento"));
       mesLi = Integer.parseInt(request.getParameter("tituloEvento"));
       anioLi = Integer.parseInt(request.getParameter("tituloEvento"));
       aforo = Integer.parseInt(request.getParameter("tituloEvento"));
       asientoFijo = request.getParameter("asientoFijo");


       e.setTitulo(titulo);
       e.setDescripcion(descripcion);
       e.setCosteEntrada(precio);
       e.setFecha(new Date(anio, mes, dia));
       e.setFechaReserva(new Date(anioLi, mesLi, diaLi));
       e.setAforo(aforo);
       e.setMaxNumEntradas(aforo);  //TODO ESTO PUEDE QUE SOBRE EL MAXIMO NUMERO DE ENTRADAS


       if(asientoFijo.equalsIgnoreCase("si")){

          numFila = Integer.parseInt(request.getParameter("tituloEvento"));
          numCol = Integer.parseInt(request.getParameter("tituloEvento"));

         /* asientosPK.setFila(numFila);
          asientosPK.setColumna(numCol);
          asientosPK.setEvento(evento.getIdevento());
          asientos.setAsientosPK(asientosPK);*/
        ///LO DE LOS ASIENTOS ES CONFUSO Y NO SE QUE HACER EXACTAMENTE
       }
        this.evento.create(e);

        RequestDispatcher rd = request.getRequestDispatcher("index.html");
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
