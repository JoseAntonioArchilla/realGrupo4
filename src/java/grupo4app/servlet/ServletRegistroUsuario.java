/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo4app.servlet;

import grupo4app.entity.Usuario;
import grupo4app.entity.UsuarioEvento;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ServletRegistroUsuario", urlPatterns = {"/ServletRegistroUsuario"})
public class ServletRegistroUsuario extends HttpServlet {

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
        String nombre = request.getParameter("usuario");
        String contrasenia = request.getParameter("contraseña");
        int rol = Integer.parseInt(request.getParameter("rol"));        
        
        
        Usuario u = new Usuario();
        u.setPassword(contrasenia);
        u.setNickname(nombre);
        u.setRol(rol);
        
        if(rol == 4){
            String apellido = request.getParameter("Apellidos");
            String domicilio = request.getParameter("Domicilio");
            String ciudad = request.getParameter("Ciudad");
            int edad = Integer.parseInt(request.getParameter("Edad"));
            String sexo = request.getParameter("Sexo");
            UsuarioEvento ue = new UsuarioEvento();
            ue.setApellido(apellido);
            ue.setCiudad(ciudad);
            ue.setEdad(edad);
            ue.setDomicilio(domicilio);
            ue.setSexo(sexo);
            ue.setUsuario1(u);
        }
        
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
