/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo4app.servlet;

import javax.ejb.EJB;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import grupo4app.dao.UsuarioFacade;
import grupo4app.entity.Usuario;

import grupo4app.dao.UsuarioEventoFacade;
import grupo4app.entity.UsuarioEvento;
import javax.ejb.EJBException;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author nieto
 */
@WebServlet(name = "ServletAñadirUsuario", urlPatterns = {"/ServletAñadirUsuario"})
public class ServletAñadirUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    @EJB
    private UsuarioFacade usuarioFacade;
    
    @EJB
    private UsuarioEventoFacade usuarioEventoFacade;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nickname = request.getParameter("usuario");
        String contraseña = request.getParameter("password");
        int rol = Integer.parseInt(request.getParameter("rol"));
        
        if(nickname.equals("")){
            request.setAttribute("error", "Debe rellenar todos los campos");
            RequestDispatcher rd = request.getRequestDispatcher("Administrador.jsp");
            rd.forward(request, response);
        }
        if(contraseña.equals("")){
            request.setAttribute("error", "Debe rellenar todos los campos");
            RequestDispatcher rd = request.getRequestDispatcher("Administrador.jsp");
            rd.forward(request, response);
        }
        
        Usuario user = new Usuario();
        
        user.setNickname(nickname);
        user.setPassword(contraseña);
        user.setRol(rol);
        this.usuarioFacade.create(user);

        if(rol == 4){
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            String domicilio = request.getParameter("domicilio");
            String ciudad = request.getParameter("ciudad");
            int edad = Integer.parseInt(request.getParameter("edad"));
            String sexo = request.getParameter("sexo");
            UsuarioEvento usuarioEvento = new UsuarioEvento();

            usuarioEvento.setNombre(nombre);
            usuarioEvento.setApellido(apellidos);
            usuarioEvento.setDomicilio(domicilio);
            usuarioEvento.setCiudad(ciudad);
            usuarioEvento.setEdad(edad);
            usuarioEvento.setSexo(sexo);

            this.usuarioEventoFacade.create(usuarioEvento);
        }
        RequestDispatcher rd = request.getRequestDispatcher("ServletUsuarioListar");
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
