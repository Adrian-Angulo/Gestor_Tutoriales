


<%@page import="java.util.List"%>
<%@page import="Modelo.Tutorial"%>
<%@page import="Modelo.Categoria"%>

<div style="height: 20px; background-color: white;"> </div>
        <br>




        <section  class="container" style="background-color: #e9edf3ef">


            <!-- Post preview-->
            <!-- Agregamos la clase text-center -->
            <div class="row">
                <div class="d-flex">
                    <div class="p-2 flex-grow-1"><h2>Lista Tutoriales</h2></div>

                    <div class="p-2">
                        <!-- Agregar mensaje  -->
                    </div>
                </div>
            </div>

            </div>
            <table id="myTabla" class="table table-striped" style="background-color: #e9edf3ef">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Estado</th>
                        <th scope="col">Prioridad</th>
                        <th scope="col">Categoria</th>
                        <th scope="col">URL</th>
                        <th scope="col">Opciones</th>
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
                        <td> <a href="<%= t.getUrl()%>" target="_blank"> Enlace </a></td>
                        <td>

                <center>


                    <!-- Boton para editar el tutorial -->
                    <a href="Sv?p=Editar&id=<%= t.getId_T()%>" class="btn btn-outline-warning"><i class="bi bi-pencil-fill"></i></a>                                        
                    <!-- Boton para eliminar el tutorial -->
                    <a href="#" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#eliminar<%= t.getId_T()%>" data-nombre="<%= t.getId_T()%>"><i class="bi bi-trash3-fill"></i></a>
                    
                    
                   
                </center>
                </td>
                </tr>
                



                <!-- modal de confimacion para eliminar un tutorial -->

                <div class="modal fade" id="eliminar<%= t.getId_T()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Confirmacion</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                seguro que desea eliminar el tutorial <%= t.getNombre()%>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <a href="Sv?p=Eliminar&id=<%= t.getId_T()%>" class="btn btn-outline-danger"> Eliminar </a>
                            </div>
                        </div>
                    </div>
                </div>


                <!---------------------------------- Modal para editar informacion ------------------------>
                <div class="modal fade" id="editar<%= t.getId_T()%>" tabindex="-1" aria-labelledby="staticBackdropLabel" data-bs-backdrop="static" data-bs-target="#staticBackdrop"  aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content" style=" font-weight: bold;">
                            <div class="modal-header ">
                                <div class="container text-center">

                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Editar Informacion de tutorial</h1>
                                </div>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body" style="padding:10%;">

                                <form method="post" action="Sv?p=Editar&id=<%= t.getId_T()%>" class="row g-3 needs-validation" novalidate>

                                    <!-------------------------- Nombre Tutorial --------------->
                                    <div class="col">
                                        <label for="validationCustom03" class="form-label">Nombre de Tutorial</label>
                                        <input type="text" class="form-control" id="nombre" name="nombre" value="<%= t.getNombre()%>" required maxlength="50">
                                        <div class="invalid-feedback">
                                            Please provide a valid city.
                                        </div>
                                    </div>

                                    <!-------------------------- Fin Nombre Tutorial --------------->

                                    <div class="row">


                                        <!-------------------------- Estado Tutorial --------------->
                                        <div class="col-4">
                                            <label for="validationCustom04" class="form-label">Estado</label>
                                            <select class="form-select" id="estado" name="estado" required >
                                                <option selected disabled value="">Mas...</option>
                                                <option>Revisado</option>
                                                <option>Por Revisar</option>
                                            </select>
                                            <div class="invalid-feedback">
                                                Please select a valid state.
                                            </div>
                                        </div>

                                        <!-------------------------- Prioridad Tutorial --------------->
                                        <div class="col-4">
                                            <label for="validationCustom01" class="form-label">Prioridad</label>
                                            <input type="number" class="form-control" id="prioridad" name="prioridad" value="<%= t.getPrioridad()%>" required>

                                        </div>
                                        <!-------------------------- Categoria Tutorial --------------->
                                        <div class="col-4">
                                            <label for="validationCustom04" class="form-label">Categoria</label>
                                            <select class="form-select" id="categoria" name="categoria" required>
                                                <option selected disabled value="">Mas...</option>
                                                <%
                                                    for (Categoria c : Categoria.listarCategoria()) {


                                                %>
                                                <option><%= c.getNombre()%></option>

                                                <%                                                        }
                                                %>
                                            </select>

                                        </div>
                                    </div>

                                    <!-------------------------- Url Tutorial --------------->
                                    <div class="col">
                                        <label for="validationCustom03" class="form-label">url</label>
                                        <input type="text" class="form-control" id="url" name="url" value="<%= t.getUrl()%>" required>

                                    </div>

                                    <!-------------------------- Boton Tutorial --------------->
                                    <br>

                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">Actualizar</button>

                                    </div>
                                </form>



                            </div>

                        </div>
                    </div>
                </div>

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