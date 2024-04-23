/*
 * Esta clase representa un tutorial, con métodos para agregar, listar, editar y eliminar tutoriales en la base de datos.
 */
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/**
 * La clase Tutorial representa un tutorial.
 */
public class Tutorial {

    private int idTutoriales; // ID del tutorial
    private String nombre; // Nombre del tutorial
    private String prioridad; // Prioridad del tutorial
    private String estado; // Estado del tutorial
    private String url; // URL del tutorial
    private int id_C; // ID de la categoría del tutorial

    /**
     * Constructor vacío de la clase Tutorial.
     */
    public Tutorial() {
    }

    /**
     * Constructor de la clase Tutorial.
     *
     * @param nombre Nombre del tutorial.
     * @param prioridad Prioridad del tutorial.
     * @param estado Estado del tutorial.
     * @param url URL del tutorial.
     * @param id_C ID de la categoría del tutorial.
     */
    public Tutorial(String nombre, String prioridad, String estado, String url, int id_C) {
        this.nombre = nombre;
        this.prioridad = prioridad;
        this.estado = estado;
        this.url = url;
        this.id_C = id_C;
    }

    /**
     * Método getter para obtener el ID del tutorial.
     *
     * @return El ID del tutorial.
     */
    public int getId_T() {
        return idTutoriales;
    }

    /**
     * Método setter para establecer el ID del tutorial.
     *
     * @param idTutoriales El ID del tutorial.
     */
    public void setId_T(int idTutoriales) {
        this.idTutoriales = idTutoriales;
    }

    /**
     * Método getter para obtener el nombre del tutorial.
     *
     * @return El nombre del tutorial.
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * Método setter para establecer el nombre del tutorial.
     *
     * @param nombre El nombre del tutorial.
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * Método getter para obtener la prioridad del tutorial.
     *
     * @return La prioridad del tutorial.
     */
    public String getPrioridad() {
        return prioridad;
    }

    /**
     * Método setter para establecer la prioridad del tutorial.
     *
     * @param prioridad La prioridad del tutorial.
     */
    public void setPrioridad(String prioridad) {
        this.prioridad = prioridad;
    }

    /**
     * Método getter para obtener el estado del tutorial.
     *
     * @return El estado del tutorial.
     */
    public String getEstado() {
        return estado;
    }

    /**
     * Método setter para establecer el estado del tutorial.
     *
     * @param estado El estado del tutorial.
     */
    public void setEstado(String estado) {
        this.estado = estado;
    }

    /**
     * Método getter para obtener la URL del tutorial.
     *
     * @return La URL del tutorial.
     */
    public String getUrl() {
        return url;
    }

    /**
     * Método setter para establecer la URL del tutorial.
     *
     * @param url La URL del tutorial.
     */
    public void setUrl(String url) {
        this.url = url;
    }

    /**
     * Método getter para obtener el ID de la categoría del tutorial.
     *
     * @return El ID de la categoría del tutorial.
     */
    public int getId_C() {
        return id_C;
    }

    /**
     * Método setter para establecer el ID de la categoría del tutorial.
     *
     * @param id_C El ID de la categoría del tutorial.
     */
    public void setId_C(int id_C) {
        this.id_C = id_C;
    }

    /**
     * Método estático para agregar un nuevo tutorial a la base de datos.
     *
     * @param t Objeto Tutorial que representa el tutorial a agregar.
     * @return true si el tutorial fue agregado correctamente, false si ocurrió
     * algún error.
     */
    public static boolean agregarTutorial(Tutorial t) {
        Conexion db_connect = new Conexion();
        boolean bol = false;
        try (Connection conexion = db_connect.get_connection()) {
            PreparedStatement ps = null;
            try {
                String query = "INSERT INTO tutoriales (nombre, prioridad, estado, URL, idCategoria) VALUES (?,?,?,?,?)";
                ps = conexion.prepareStatement(query);
                ps.setString(1, t.getNombre());
                ps.setString(2, t.getPrioridad());
                ps.setString(3, t.getEstado());
                ps.setString(4, t.getUrl());
                ps.setInt(5, t.getId_C());
                ps.executeUpdate();
                System.out.println("Tutorial Agregado");
                bol = true;
            } catch (SQLIntegrityConstraintViolationException e) {
                System.out.println(" \nError: el numero que desea resgistrar ya se encuentra registrado " + e);
            } catch (SQLException ex) {
                System.out.println(ex + "el Tutorial no se puedo agregar");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return bol;
    }

    /**
     * Método estático para obtener una lista de todos los tutoriales
     * almacenados en la base de datos.
     *
     * @return Una lista de objetos Tutorial que representan los tutoriales
     * almacenados.
     */
    public static List<Tutorial> listarTutorialesDB() {
        List<Tutorial> listaTutoriales = new LinkedList<>();

        Conexion db_connect = new Conexion();

        PreparedStatement ps = null;
        ResultSet rs = null;

        try (Connection conexion = db_connect.get_connection()) {
            String query = "SELECT * FROM tutoriales";
            ps = conexion.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Tutorial t;
                t = new Tutorial(rs.getString("nombre"), rs.getString("prioridad"), rs.getString("estado"), rs.getString("URL"), rs.getInt("idCategoria"));

                t.setId_T(rs.getInt("idTutoriales"));

                listaTutoriales.add(t);

            }
        } catch (SQLException ex) {

            System.out.println("no se pudo traer la informacion " + ex);
        }
        return listaTutoriales;
    }

    /**
     * Método estático para eliminar un tutorial de la base de datos.
     *
     * @param id ID del tutorial a eliminar.
     * @return true si el tutorial fue eliminado correctamente, false si ocurrió
     * algún error.
     */
    public static boolean eliminarTutorial(int id) {
        Conexion db_connect = new Conexion();
        boolean eliminar = false;

        try (Connection conexion = db_connect.get_connection()) {
            PreparedStatement ps = null;
            try {
                String query = "DELETE FROM tutoriales WHERE idTutoriales = ?";
                ps = conexion.prepareStatement(query);
                ps.setInt(1, id);
                int rowsDeleted = ps.executeUpdate();
                if (rowsDeleted > 0) {
                    System.out.println("Tutorial eliminado correctamente.");
                    eliminar = true;
                } else {
                    System.out.println("No se encontró el tutorial con el ID especificado.");
                }
            } catch (SQLException ex) {
                System.out.println("Error al eliminar el tutorial: " + ex);
            }
        } catch (SQLException e) {
            System.out.println("Error de conexión: " + e);
        }
        return eliminar;
    }

    /**
     * Método estático para editar un tutorial en la base de datos.
     *
     * @param t Objeto Tutorial que representa el tutorial a editar.
     * @return true si el tutorial fue editado correctamente, false si ocurrió
     * algún error.
     */
    public static boolean editarTutorial(Tutorial t) {
        Conexion db_connect = new Conexion();
        boolean updated = false;

        try (Connection conexion = db_connect.get_connection()) {
            PreparedStatement ps = null;
            try {
                String query = "UPDATE tutoriales SET nombre = ?, prioridad = ?, estado = ?, URL = ?, idCategoria = ? WHERE idTutoriales = ?";
                ps = conexion.prepareStatement(query);
                ps.setString(1, t.getNombre());
                ps.setString(2, t.getPrioridad());
                ps.setString(3, t.getEstado());
                ps.setString(4, t.getUrl());
                ps.setInt(5, t.getId_C());
                ps.setInt(6, t.getId_T());
                int rowsUpdated = ps.executeUpdate();
                if (rowsUpdated > 0) {
                    System.out.println("Tutorial actualizado correctamente.");
                    updated = true;
                } else {
                    System.out.println("No se encontró el tutorial con el ID especificado.");
                }
            } catch (SQLException ex) {
                System.out.println("Error al editar el tutorial: " + ex);
            }
        } catch (SQLException e) {
            System.out.println("Error de conexión: " + e);
        }

        return updated;
    }

    /**
     * Método estático para obtener un tutorial a partir de su ID.
     *
     * @param id ID del tutorial a obtener.
     * @return El objeto Tutorial correspondiente al ID especificado, o null si
     * no se encontró.
     */
    public static Tutorial darTutorial(int id) {

        for (Tutorial tutorial : listarTutorialesDB()) {
            if (tutorial.getId_T() == id) {
                return tutorial;
            }
        }
        return null;
    }

}
