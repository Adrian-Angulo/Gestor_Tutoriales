
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
        // Se recibe los parametros del formulario tutoriales y se guardan en variables
        String respuesta = request.getParameter("p");
        int id = Integer.parseInt(request.getParameter("id"));
        
        // se evual el dato de la respuesta
        switch (respuesta) {
            
            // si la respuesta es eliminar 
            case "Eliminar":
                
                // Utilizamos el metodo elimianrTuotriales de la clase tutoriales pasando le el id de tutorial como parametro
                if (Tutorial.eliminarTutorial(id)) {
                    
                    // Si se elimina el tutorial mandara un mensaje de alerta 
                    request.setAttribute("alerta", "EliminadoT");
                    
                    //redireccionar a la pagina de tutoriless
                    request.getRequestDispatcher("Tutoriales.jsp").forward(request, response);
                } else {
                    request.setAttribute("alerta", "NoEliminadoT");

                    request.getRequestDispatcher("Tutoriales.jsp").forward(request, response);
                }

                break;
                // si la respuesta es editar
            case "Editar":
                //obtenemos el tutorial por medio del id
                Tutorial t = Tutorial.darTutorial(id);
                if (t != null) { // evaualmos si el tutorial existe
                    
                    // si existe se manda el tutorial al jsp
                    request.getSession().setAttribute("tutorial_E", t);
                    response.sendRedirect("Form_Editar.jsp");
                } else {
                    //si no se recarga la pagina, Este error es menos probable que suceda
                    response.sendRedirect("Form_Editar.jsp");
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
        
        // recibimos el parametro p
        String respuesta = request.getParameter("p");

     //evabluamos la respuesta
        switch (respuesta) {
            //si la respuesta es agregar
            case "Agregar":
                // guadamos los parametros en variables
                String nombre = request.getParameter("nombre");
                String prioridad = request.getParameter("prioridad");
                String estado = request.getParameter("estado");
                String url = request.getParameter("url");
                String categoria = request.getParameter("categoria");

                //creamos un nuevo tutorial
                Tutorial t = new Tutorial(nombre, prioridad, estado, url, Categoria.darIdCategoria(categoria));
                
                // si la categoria del tutorial es difrente de cero
                if (t.getId_C() != 0) {
                    // evaluamos agregamos el tutorias 
                    if (Tutorial.agregarTutorial(t)) {
                        // si el tutorail es agregado, mandamos un mensaje de aleta y redireccionamos al tutoriales.jsp
                        request.setAttribute("alerta", "AgregadoT");

                        request.getRequestDispatcher("Tutoriales.jsp").forward(request, response);

                    } else {
                        // si no mandamos un mensaje de alerta y redireccionamos al jsp
                        request.setAttribute("alerta", "NoAgregadoT");

                        request.getRequestDispatcher("Tutoriales.jsp").forward(request, response);
                    }

                }

                // System.out.println(nombre+","+prioridad+","+estado+","+url+","+categoria );
                break;

                
                // si la respuesta es editar
            case "Editar":
                //recibimos parametros 
                int id_T = Integer.parseInt(request.getParameter("id"));
                prioridad = request.getParameter("prioridad");
                nombre = request.getParameter("nombre");
                estado = request.getParameter("estado");
                url = request.getParameter("url");
                categoria = request.getParameter("categoria");
                
                // verificamos si estan recibiendo bien
                System.out.println(nombre+","+prioridad+","+estado+","+url+","+categoria);

                //Agregamos un tutorial
                Tutorial t1 = new Tutorial(nombre, prioridad, estado, url, Categoria.darIdCategoria(categoria));
                t1.setId_T(id_T);

                
                // verificamos si los campos no estan vacios
                if (!(nombre.isEmpty() || prioridad.isEmpty() || estado.isEmpty() || url.isEmpty() || categoria.isEmpty())) {
                    
                    // agregamos el tutorial a metodo editarTutoral
                    if (Tutorial.editarTutorial(t1)) {
                        // si el tutorial se edita mandamos un mensaje y redireccionamos a la pagina
                        request.setAttribute("alerta", "EditadoT");

                        request.getRequestDispatcher("Tutoriales.jsp").forward(request, response);
                    } else {
                        // si el tutorial no se edita mandamos un mensaje y redireccionamos a la pagina
                        request.setAttribute("alerta", "NoEditadoT");

                        request.getRequestDispatcher("Tutoriales.jsp").forward(request, response);
                    }
                } else {
                    // en caso de que un campo este vacio redireccionamos
                    response.sendRedirect("Tutoriales.jsp");

                }

                break;

            default:
                throw new AssertionError();
        }
    }

}
