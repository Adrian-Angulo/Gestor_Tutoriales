/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
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
 *
 * @author ADRIAN CASTILLO
 */
public class Tutorial {

    private int idTutoriales;
    private String nombre;
    private String prioridad;
    private String estado;
    private String url;
    private int id_C;

    public Tutorial() {
    }

    public Tutorial(String nombre, String prioridad, String estado, String url, int id_C) {

        this.nombre = nombre;
        this.prioridad = prioridad;
        this.estado = estado;
        this.url = url;
        this.id_C = id_C;
    }

    public int getId_T() {
        return idTutoriales;
    }

    public void setId_T(int idTutoriales) {
        this.idTutoriales = idTutoriales;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(String prioridad) {
        this.prioridad = prioridad;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getId_C() {
        return id_C;
    }

    public void setId_C(int id_C) {
        this.id_C = id_C;
    }

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

}
