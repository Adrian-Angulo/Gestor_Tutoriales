/*
 * Este archivo contiene la definición de la clase Categoria, la cual representa una categoría de tutoriales.
 * La clase incluye métodos para agregar, listar, editar y eliminar categorías, así como para obtener
 * información sobre las categorías existentes.
 */
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

/**
 * La clase Categoria representa una categoría de tutoriales.
 */
public class Categoria {

    private int id_C; // ID de la categoría
    private String nombre; // Nombre de la categoría

    /**
     * Constructor de la clase Categoria.
     *
     * @param nombre El nombre de la categoría.
     */
    public Categoria(String nombre) {
        this.nombre = nombre;
    }

    /**
     * Constructor vacío de la clase Categoria.
     */
    public Categoria() {
    }

    /**
     * Método getter para obtener el ID de la categoría.
     *
     * @return El ID de la categoría.
     */
    public int getId_C() {
        return id_C;
    }

    /**
     * Método setter para establecer el ID de la categoría.
     *
     * @param id_C El ID de la categoría.
     */
    public void setId_C(int id_C) {
        this.id_C = id_C;
    }

    /**
     * Método getter para obtener el nombre de la categoría.
     *
     * @return El nombre de la categoría.
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * Método setter para establecer el nombre de la categoría.
     *
     * @param nombre El nombre de la categoría.
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * Método estático para agregar una nueva categoría a la base de datos.
     *
     * @param nombre El nombre de la nueva categoría.
     * @return true si la categoría fue agregada correctamente, false si ocurrió
     * algún error.
     */
    public static boolean agregarCategoria(String nombre) {
        Conexion db_connect = new Conexion();
        boolean agregado = false;
        try (Connection conexion = db_connect.get_connection()) {
            PreparedStatement ps = null;
            try {
                String query = "INSERT INTO categoria (nombre) VALUES (?)";
                ps = conexion.prepareStatement(query);
                ps.setString(1, nombre);

                ps.executeUpdate();
                System.out.println("Categoria registrada");
                agregado = true;
            } catch (SQLIntegrityConstraintViolationException e) {
                System.out.println(" \nError: el numero que desea resgistrar ya se encuentra registrado " + e);
            } catch (SQLException ex) {
                System.out.println(ex + "la categoria no se puedo agregar");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return agregado;
    }

    /**
     * Método estático para obtener una lista de todas las categorías
     * existentes.
     *
     * @return Una lista de objetos Categoria que representan las categorías
     * existentes.
     */
    public static List<Categoria> listarCategoria() {
        List<Categoria> listaCategoria = new ArrayList<>();

        Conexion db_connect = new Conexion();

        PreparedStatement ps = null;
        ResultSet rs = null;

        try (Connection conexion = db_connect.get_connection()) {
            String query = "SELECT * FROM categoria";
            ps = conexion.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Categoria c = new Categoria(rs.getString("nombre"));
                c.setId_C(rs.getInt("idCategoria"));

                listaCategoria.add(c);

            }
        } catch (SQLException ex) {

            System.out.println("no se pudo traer la informacion " + ex);
        }
        return listaCategoria;
    }

    /**
     * Método estático para editar el nombre de una categoría existente.
     *
     * @param id El ID de la categoría a editar.
     * @param nombre El nuevo nombre de la categoría.
     * @return true si la categoría fue editada correctamente, false si ocurrió
     * algún error.
     */
    public static boolean editarCategoria(int id, String nombre) {
        Conexion db_connect = new Conexion();
        boolean actualizado = false;

        try (Connection conexion = db_connect.get_connection()) {
            PreparedStatement ps = null;
            try {
                String query = "UPDATE categoria SET nombre = ? WHERE idCategoria = ?";
                ps = conexion.prepareStatement(query);
                ps.setString(1, nombre);
                ps.setInt(2, id);

                int filaActualizada = ps.executeUpdate();
                if (filaActualizada > 0) {
                    System.out.println("Tutorial actualizado correctamente.");
                    actualizado = true;
                } else {
                    System.out.println("No se encontró el tutorial con el ID especificado.");
                }
            } catch (SQLException ex) {
                System.out.println("Error al editar el tutorial: " + ex);
            }
        } catch (SQLException e) {
            System.out.println("Error de conexión: " + e);
        }

        return actualizado;
    }

    /**
     * Método estático para eliminar una categoría existente.
     *
     * @param id_C El ID de la categoría a eliminar.
     * @return true si la categoría fue eliminada correctamente, false si
     * ocurrió algún error.
     */
    public static boolean eliminarCategoria(int id_C) {
        Conexion db_connect = new Conexion();
        boolean eliminado = false;
        try (Connection conexion = db_connect.get_connection()) {
            PreparedStatement ps = null;
            try {
                String query = "DELETE FROM categoria WHERE idCategoria= ?";
                ps = conexion.prepareStatement(query);
                ps.setInt(1, id_C);
                ps.executeUpdate();
                eliminado = true;
                System.out.println("La categoria ha sido borrada");
            } catch (Exception e) {
                System.out.println("No se pudo eliminar la categoria " + e);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return eliminado;
    }

    /**
     * Método estático para obtener el ID de una categoría a partir de su
     * nombre.
     *
     * @param nombreC El nombre de la categoría.
     * @return El ID de la categoría, o 0 si no se encontró la categoría.
     */
    public static int darIdCategoria(String nombreC) {
        for (Categoria c : listarCategoria()) {
            if (c.getNombre().equalsIgnoreCase(nombreC)) {
                return c.getId_C();
            }
        }
        return 0;
    }

    /**
     * Método estático para obtener el nombre de una categoría a partir de su
     * ID.
     *
     * @param id El ID de la categoría.
     * @return El nombre de la categoría, o null si no se encontró la categoría.
     */
    public static String darNombreCategoria(int id) {
        for (Categoria c : listarCategoria()) {
            if (c.getId_C() == id) {
                return c.getNombre();
            }
        }
        return null;
    }

    /**
     * Método estático para verificar la existencia de una categoría en la base
     * de datos.
     *
     * @param nombre El nombre de la categoría a verificar.
     * @return true si la categoría existe, false si no existe.
     */
    public static boolean verExistencia(String nombre) {
        boolean existencia = false;
        for (Categoria categoria : listarCategoria()) {
            if (categoria.nombre.equalsIgnoreCase(nombre)) {
                existencia = true;
            }
        }

        return existencia;
    }
}
