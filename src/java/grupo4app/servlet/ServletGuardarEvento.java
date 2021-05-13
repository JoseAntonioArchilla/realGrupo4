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
import grupo4app.entity.EventoUsuario;
import grupo4app.entity.Usuario;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
        String titulo, descripcion;
        String[] etiquetas = request.getParameterValues("etiqueta");
        Integer precio, dia, mes, anio, diaLi, mesLi, anioLi, aforo, numFila, numCol;

        HttpSession session = request.getSession();
        Usuario usu = (Usuario) session.getAttribute("usuario");

        Evento e = (Evento) session.getAttribute("evento");
        boolean editando = e != null;
        e = editando ? e : new Evento();

        titulo = request.getParameter("titulo");
        descripcion = request.getParameter("descripcion");
        precio = Integer.parseInt(request.getParameter("precio"));
        String fechaInicio = request.getParameter("fechaInicio");
        String fechaFin = request.getParameter("fechaFin");
        String imagen = request.getParameter("imagen");
        int maxEnt = Integer.parseInt(request.getParameter("maxEntradas"));
        String pattern = "yyyy-MM-dd";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

        try {
            Date fi = simpleDateFormat.parse(fechaInicio);
            Date ff = simpleDateFormat.parse(fechaFin);

            boolean asientoFijo = request.getParameter("asientosFijos") != null;

            e.setTitulo(titulo);
            e.setDescripcion(descripcion);
            e.setCosteEntrada(precio);
            e.setFecha(fi);
            e.setFechaReserva(ff);

            e.setMaxNumEntradas(maxEnt);
            e.setEventoUsuarioList(new ArrayList<>());
            e.setDeporte(0);
            e.setMusica(1);
            e.setTeatro(0);
            e.setGaming(0);
            e.setAireLibre(0);
            e.setCreadorevento(usu);

            List<Asientos> listaAsientos = new ArrayList<>();
            e.setAsientosList(listaAsientos);
            // e.setFecha(new Date(anio, mes, dia));
            //e.setFechaReserva(new Date(anioLi, mesLi, diaLi));

            e.setAsientosFijos(asientoFijo);
            if (!asientoFijo) {
                aforo = Integer.parseInt(request.getParameter("aforo"));
                e.setAforo(aforo);

            } else {
                numFila = Integer.parseInt(request.getParameter("numFilas"));
                numCol = Integer.parseInt(request.getParameter("numColumnas"));
                e.setAforo(numFila * numCol);

            }
            if (editando) {
                this.evento.edit(e);
            } else {
                this.evento.create(e);

                if (asientoFijo) {
                    numFila = Integer.parseInt(request.getParameter("numFilas"));
                    numCol = Integer.parseInt(request.getParameter("numColumnas"));
                    for (int i = 0; i < numFila; i++) {
                        for (int j = 0; j < numCol; j++) {
                            AsientosPK aux = new AsientosPK(i, j, e.getIdevento());
                            Asientos as = new Asientos(aux);
                            as.setOcupado(0);
                            as.setEventoUsuarioList(new ArrayList<EventoUsuario>());
                            this.asientos.create(as);
                            listaAsientos.add(as);
                        }
                    }
                    e.setAsientosList(listaAsientos);
                    e.setFilas(numFila);
                    e.setColumnas(numCol);
                    this.evento.edit(e);
                }
            }

            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);

        } catch (ParseException ex) {
            Logger.getLogger(ServletGuardarEvento.class.getName()).log(Level.SEVERE, null, ex);
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
