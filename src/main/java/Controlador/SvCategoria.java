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
            response.sendRedirect("Categorias.jsp");

        } else {
            response.sendRedirect("Categorias.jsp");
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
                if (Categoria.agregarCategoria(nombreC)) {
                    response.sendRedirect("Categorias.jsp");
                } else {
                    response.sendRedirect("Categorias.jsp");
                }

                break;
            case "Editar":
                nombreC = request.getParameter("nombreC");
                id = Integer.parseInt(request.getParameter("id"));
                if (Categoria.editarCategoria(id, nombreC)) {
                    response.sendRedirect("Categorias.jsp");
                } else {
                    response.sendRedirect("Categorias.jsp");
                }

                break;
            default:
                throw new AssertionError();
        }

    }

}
