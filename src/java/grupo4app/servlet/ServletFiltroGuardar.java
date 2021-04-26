/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo4app.servlet;

import grupo4app.dao.FiltroFacade;
import grupo4app.dao.UsuarioFacade;
import grupo4app.entity.Filtro;
import grupo4app.entity.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import static java.util.Optional.empty;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author carlo
 */
@WebServlet(name = "ServletFiltroGuardar", urlPatterns = {"/ServletFiltroGuardar"})
public class ServletFiltroGuardar extends HttpServlet {

    @EJB
    private UsuarioFacade usuarioFacade;

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
      
        //Carga de variables.
        String id = request.getParameter("id");
        Filtro filtro;
        
        String ciudad =  request.getParameter("ciudad");
        String sexo =  request.getParameter("sexo");
        String str = request.getParameter("anyo");
        Integer anyo = 0;
            if(!str.isEmpty()){
                 anyo = Integer.parseInt(str);
            }
        str = request.getParameter("costeEntrada");
        Integer costeEntrada = 0;
        if(!str.isEmpty()){
           costeEntrada = Integer.parseInt(str);
        }
        String categorias = request.getParameter("categorias");
               
        str = request.getParameter("usuario");
        Integer usuario = 0;
        if(!str.isEmpty()){
            usuario = Integer.parseInt(str);
        }
        //Usuario dummy = new Usuario(1,0,"dummy", "dummy");
                
        str = request.getParameter("edadInferior");
        Integer edadInferior = 0;
         if(!str.isEmpty()){
           edadInferior = Integer.parseInt(str);
        }
        str = (String) request.getParameter("edadSuperior");
        Integer edadSuperior = 0;
        if(!str.isEmpty()){
           edadSuperior = Integer.parseInt(str);
        }
        
        //En el caso de un filtro nuevo
        if(id == null || id.isEmpty()){
           filtro = new Filtro();
        }else{ //En el caso de modificarlo.
            filtro = this.filtroFacade.find(Integer.parseInt(id));
        }
        
        
        //Seteo los atributos.
        filtro.setCiudad(ciudad);
        filtro.setSexo(sexo);
        filtro.setAnyo(anyo);
        filtro.setCosteEntrada(costeEntrada);
        filtro.setCategoria(categorias);
        Usuario usuarioFiltrado = this.usuarioFacade.find(usuario);
        filtro.setUsuario(usuarioFiltrado);
        //}
        /*else{
            filtro.setUsuario(dummy);
        }*/
        
        filtro.setEdadLimInf(edadInferior);
        filtro.setEdadLimSup(edadSuperior);
        
        //En el caso de un filtro nuevo
        if(id == null || id.isEmpty()){
           this.filtroFacade.create(filtro);
        }else{ //En el caso de modificarlo.
            this.filtroFacade.edit(filtro);
        }
              
        response.sendRedirect("ServletFiltroListar");
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
