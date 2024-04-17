<%-- Document : index Created on : 15/04/2024, 11:09:50 a. m. Author : ADRIAN CASTILLO --%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="Modelo.Tutorial"%>
<%@page import="Modelo.Categoria"%>

<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap demo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/2.0.4/css/dataTables.bootstrap5.css">
        
        

        
        <style>
            form {
                border: 2px solid black;
                border-radius: 30px;

                padding: 5%;
            }

            section {
                margin-top: 5%;
            }
        </style>
    </head>

    <body class="container">
        <a href="index2.jsp"> pagina2 </a>
        <div>
            <h1>Agregar tutorial</h1>
            <br>
            <!-- -----------------------------formulario para agregar tutorial ------------------------------------>
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


            <section>
                <h2 class="text-center">Lista de Tutoriales</h2>

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


        <!-- -----------------------------formulario fin------------------------------------>







        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
                integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

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