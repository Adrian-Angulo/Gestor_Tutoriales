
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
        String respuesta = request.getParameter("p");
        int id = Integer.parseInt(request.getParameter("id"));

        switch (respuesta) {
            case "Eliminar":
                if (Tutorial.eliminarTutorial(id)) {
                    request.setAttribute("alerta", "EliminadoT");

                    request.getRequestDispatcher("Tutoriales.jsp").forward(request, response);
                } else {
                    request.setAttribute("alerta", "NoEliminadoT");

                    request.getRequestDispatcher("Tutoriales.jsp").forward(request, response);
                }

                break;

            case "Editar":
                Tutorial t = Tutorial.darTutorial(id);
                if (t != null) {
                    request.getSession().setAttribute("tutorial_E", t);
                    response.sendRedirect("Form_Editar.jsp");
                } else {
                    System.out.println("no se pudo encontrar el tutorial");
                }

                break;
            default:
                throw new AssertionError();
        }

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

        System.out.println(respuesta);

        System.out.println(respuesta);
        switch (respuesta) {
            case "Agregar":
                String nombre = request.getParameter("nombre");
                String prioridad = request.getParameter("prioridad");
                String estado = request.getParameter("estado");
                String url = request.getParameter("url");
                String categoria = request.getParameter("categoria");

                Tutorial t = new Tutorial(nombre, prioridad, estado, url, Categoria.darIdCategoria(categoria));

                if (t.getId_C() != 0) {

                    if (Tutorial.agregarTutorial(t)) {

                        request.setAttribute("alerta", "AgregadoT");

                        request.getRequestDispatcher("Tutoriales.jsp").forward(request, response);

                    } else {
                        request.setAttribute("alerta", "NoAgregadoT");

                        request.getRequestDispatcher("Tutoriales.jsp").forward(request, response);
                    }

                }

                // System.out.println(nombre+","+prioridad+","+estado+","+url+","+categoria );
                break;

            case "Editar":
                int id_T = Integer.parseInt(request.getParameter("id"));
                prioridad = request.getParameter("prioridad");
                nombre = request.getParameter("nombre");
                estado = request.getParameter("estado");
                url = request.getParameter("url");
                categoria = request.getParameter("categoria");
                
                System.out.println(nombre+","+prioridad+","+estado+","+url+","+categoria);

                Tutorial t1 = new Tutorial(nombre, prioridad, estado, url, Categoria.darIdCategoria(categoria));
                t1.setId_T(id_T);

                if (!(nombre.isEmpty() || prioridad.isEmpty() || estado.isEmpty() || url.isEmpty() || categoria.isEmpty())) {

                    if (Tutorial.editarTutorial(t1)) {
                        request.setAttribute("alerta", "EditadoT");

                        request.getRequestDispatcher("Tutoriales.jsp").forward(request, response);
                    } else {
                        request.setAttribute("alerta", "NoEditadoT");

                        request.getRequestDispatcher("Tutoriales.jsp").forward(request, response);
                    }
                } else {
                    response.sendRedirect("Tutoriales.jsp");

                }

                break;

            default:
                throw new AssertionError();
        }
    }

}
