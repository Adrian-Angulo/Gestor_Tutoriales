<%-- 
    Document   : Head
    Created on : 18/04/2024, 2:52:06 p. m.
    Author     : ADRIAN CASTILLO
--%>


<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="Modelo.Tutorial"%>
<%@page import="Modelo.Categoria"%>


<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Título de la página</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/2.0.4/css/dataTables.bootstrap5.css">

        <!-- iconos boostrap -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

        <style>
            section{
                padding-left: 10%;
                padding-right:  10%;
            }


            #btn-modal-editar{

                font-weight: bold;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }
            #btn-modal-editar:hover{
                color: black;

                background-color: white;
            }

            .modal-content{
                border: 10px solid white;
                border-radius: 30px;
            }

            .container1{
                margin-top: 5%;
                padding:5%;
            }

            .categoria {

            }


        </style>


    </head>
    <body style="background-color: #e9edf3ef" >