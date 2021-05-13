/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
@WebServlet(urlPatterns = {"/ServletEditarPerfil"})
public class ServletEditarPerfil extends HttpServlet {

    @EJB
    private UsuarioFacade usuarioFacade;
    
    @EJB
    private UsuarioEventoFacade usuarioEventoFacade;
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
        
        HttpSession sesion = request.getSession();
        Usuario usuario = (Usuario) sesion.getAttribute("usuario");
        
        String nickname = request.getParameter("usuario");
        String password = request.getParameter("password");
        String rol = request.getParameter("rol");
        
        usuario.setNickname(nickname);
        usuario.setPassword(password);
        usuario.setRol(Integer.parseInt(rol));
        
        usuarioFacade.edit(usuario);
        
        if(rol.equals("4")){
            UsuarioEvento usuarioEvento = (UsuarioEvento) sesion.getAttribute("usuarioEvento");
            
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            String edad = request.getParameter("edad");
            String sexo = request.getParameter("sexo");
            String domicilio = request.getParameter("domicilio");
            String ciudad = request.getParameter("ciudad");
            
            boolean nuevo = false;
            
            if(usuarioEvento == null){
                usuarioEvento = new UsuarioEvento();
                nuevo = true;
            }
            
            usuarioEvento.setNombre(nombre);
            usuarioEvento.setApellido(apellidos);
            usuarioEvento.setEdad(Integer.parseInt(edad));
            usuarioEvento.setSexo(sexo);
            usuarioEvento.setDomicilio(domicilio);
            usuarioEvento.setCiudad(ciudad);
            
            if(nuevo){
                usuarioEvento.setUsuario(usuario.getIdusuario());
                usuarioEventoFacade.create(usuarioEvento);
                sesion.setAttribute("usuarioEvento", usuarioEvento);
            }else{
               usuarioEventoFacade.edit(usuarioEvento); 
            }   
        }else{
            try{usuarioEventoFacade.remove((UsuarioEvento) sesion.getAttribute("usuarioEvento"));}catch(Exception e){}
            sesion.setAttribute("usuarioEvento", null);
        }
        
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
