/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelo.Tutorial;
import Modelo.Categoria;
/**
 *
 * @author ADRIAN CASTILLO
 */
@WebServlet(name = "Sv", urlPatterns = {"/Sv"})
public class Sv extends HttpServlet {



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
        String respuesta = request.getParameter("p");
        switch (respuesta) {
            case "Agregar":
                    String nombre = request.getParameter("nombre");
                    String prioridad =request.getParameter("prioridad");
                    String estado = request.getParameter("estado");
                    String url = request.getParameter("url");
                    String categoria = request.getParameter("categoria");
                    
                    
                    Tutorial t = new Tutorial(nombre, prioridad, estado, url, Categoria.darIdCategoria(categoria));
                    
                    if(t.getId_C()!=0){
                        
                        
                        if(Tutorial.agregarTutorial(t)){
                            response.sendRedirect("index.jsp");
                            
                        }
                    }else{
                        response.sendRedirect("index.jsp");
                        System.out.println("no se encuentra la categoria");
                    }
                    
                    
                   // System.out.println(nombre+","+prioridad+","+estado+","+url+","+categoria );
                    
                   
                break;

            case "Editar":
                
                
                break;
            default:
                throw new AssertionError();
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