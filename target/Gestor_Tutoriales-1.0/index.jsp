<%-- 
    Document   : index2
    Created on : 17/04/2024, 8:06:17 a. m.
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

        <style>
            section{
                padding-left: 10%;
                padding-right:  10%;
            }
        </style>


    </head>

    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="index.html">Start Bootstrap</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
                        aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="index.html">Home</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="about.html">About</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="post.html">Sample Post</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="contact.html">Contact</a></li>
                    </ul>
                </div>

            </div>
        </nav>

        <!-- Page Header-->
        <header class="masthead" style="background-image: url('assets/img/home-bg.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1>Gestor de tutoriales</h1>
                            <span class="subheading">Aqui podras añadir y listar tus tutoriales</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- Main Content-->
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-6 text-center">
                    <form method="post" action="Sv?p=Agregar" class="row g-3 needs-validation" novalidate>

                        <!-------------------------- Nombre Tutorial --------------->
                        <div class="col-md-6">
                            <label for="validationCustom03" class="form-label">Nombre de Tutorial</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" required>
                            <div class="invalid-feedback">
                                Please provide a valid city.
                            </div>
                        </div>

                        <!-------------------------- Fin Nombre Tutorial --------------->


                        <!-------------------------- Estado Tutorial --------------->
                        <div class="col-md-3">
                            <label for="validationCustom04" class="form-label">Estado</label>
                            <select class="form-select" id="estado" name="estado" required>
                                <option selected disabled value="">Mas...</option>
                                <option>Revisado</option>
                                <option>Por Revisar</option>
                            </select>
                            <div class="invalid-feedback">
                                Please select a valid state.
                            </div>
                        </div>

                        <!-------------------------- Prioridad Tutorial --------------->
                        <div class="col-md-3">
                            <label for="validationCustom01" class="form-label">Prioridad</label>
                            <input type="number" class="form-control" id="prioridad" name="prioridad" value="Mark" required>

                        </div>
                        <!-------------------------- Url Tutorial --------------->
                        <div class="col-md-8">
                            <label for="validationCustom03" class="form-label">url</label>
                            <input type="text" class="form-control" id="url" name="url" required>

                        </div>

                        <!-------------------------- Categoria Tutorial --------------->
                        <div class="col-md-4">
                            <label for="validationCustom04" class="form-label">Categoria</label>
                            <select class="form-select" id="categoria" name="categoria" required>
                                <option selected disabled value="">Mas...</option>
                                <option>Flutter</option>
                                <option>Python</option>
                                <option>Java</option>
                                <option>Dark</option>
                                <option>C++</option>
                                <option>Node.js</option>
                                <option>JavaScript</option>
                                <option>HTML</option>
                                <option>CSS</option>
                            </select>

                        </div>
                        <!-------------------------- Boton Tutorial --------------->
                        <div class="col-12">
                            <button class="btn btn-primary" type="submit">Agregar tutorial</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>

        <!-- Divider-->
        <hr class="my-4" />

        <section>


            <!-- Post preview-->
            <div class="post-preview text-center"> <!-- Agregamos la clase text-center -->
                <a href="">
                    <h2 class="post-title">Listado de los videos</h2>
                </a>
                <table id="myTabla" class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Estado</th>
                            <th scope="col">Prioridad</th>
                            <th scope="col">Categoria</th>
                            <th scope="col">URL</th>
                        </tr>
                    </thead>
                    <tbody >

                        <%
                            List<Tutorial> listaDeTutoriales = Tutorial.listarTutorialesDB();
                            if (listaDeTutoriales != null) {
                                for (Tutorial t : listaDeTutoriales) {


                        %>
                        <tr>
                            <th scope="row"><%= t.getId_T()%></th>
                            <td><%= t.getNombre()%></td>
                            <td><%= t.getEstado()%></td>
                            <td><%= t.getPrioridad()%></td>
                            <td><%= Categoria.darNombreCategoria(t.getId_C())%></td>
                            <td> <a href="<%= t.getUrl()%>"><%= t.getUrl()%></a></td>
                        </tr>
                        <%                                    }
                        } else {

                        %>
                        <tr>
                            No hay datos para mostrar
                        </tr>


                        <%    }

                        %>
                    </tbody>
                </table>
        </section>
    </div>

    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    <!-- data table -->
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/2.0.4/js/dataTables.js"></script>
    <script src="https://cdn.datatables.net/2.0.4/js/dataTables.bootstrap5.js"></script>
    <script >

        new DataTable('#myTabla');
    </script>

</body>

</html>