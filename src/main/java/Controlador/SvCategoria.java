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
import Modelo.Categoria;

/**
 *
 * @author ADRIAN CASTILLO
 */
@WebServlet(name = "SvCategoria", urlPatterns = {"/SvCategoria"})
public class SvCategoria extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("el id es: " + id);
        if (Categoria.eliminarCategoria(id)) {
            request.setAttribute("alerta", "ElinimarC");

            request.getRequestDispatcher("Categorias.jsp").forward(request, response);

        } else {
            request.setAttribute("alerta", "NoEliminarC");

            request.getRequestDispatcher("Categorias.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String opc = request.getParameter("p");
        String nombreC;
        int id;

        switch (opc) {

            case "Agregar":
                nombreC = request.getParameter("nombreC");
                if (nombreC.isEmpty() || nombreC == "") {

                    System.out.println("nombre vacio");
                    response.sendRedirect("Categorias.jsp");

                } else {
                    if (Categoria.verExistencia(nombreC)) {
                        request.setAttribute("alerta", "ExisteC");

                        request.getRequestDispatcher("Categorias.jsp").forward(request, response);
                    }else{
                        
                        if (Categoria.agregarCategoria(nombreC)) {
                            request.setAttribute("alerta", "AgregadoC");

                            request.getRequestDispatcher("Categorias.jsp").forward(request, response);
                        } else {
                            request.setAttribute("alerta", "NoAgregadoC");

                            request.getRequestDispatcher("Categorias.jsp").forward(request, response);
                        }
                    }

                }

                break;
            case "Editar":
                nombreC = request.getParameter("nombreC");
                id = Integer.parseInt(request.getParameter("id"));
                if (Categoria.editarCategoria(id, nombreC)) {
                    request.setAttribute("alerta", "EditadoC");

                    request.getRequestDispatcher("Categorias.jsp").forward(request, response);
                } else {
                    request.setAttribute("alerta", "NoEditadoC");

                        request.getRequestDispatcher("Categorias.jsp").forward(request, response);
                }

                break;
            default:
                throw new AssertionError();
        }

    }

}
