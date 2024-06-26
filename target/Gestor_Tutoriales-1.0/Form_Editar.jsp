
<%@include file="Templates/Head.jsp"%>
<%@include file="Templates/header.jsp" %>

<!-- seccion para el formulario de editar -->

<section class="row d-flex justify-content-center" style="border: none; background: linear-gradient(rgba(0, 0, 0, 2) 2%,rgba(208, 198, 193,3) 40% );">


    <div class="col-6" style="padding: 3%;">

        <h2 class="text-center">Editar Tutorial</h2>

        <div class="form" style="border: 3px solid white; border-radius: 30px; padding: 10px;">
            <% Tutorial t1 = (Tutorial) request.getSession().getAttribute("tutorial_E");%>

            <form id="fomulario" method="post" action="Sv?p=Editar&id=<%= t1.getId_T()%>" class="row g-3 needs-validation" novalidate >

                <!-------------------------- Nombre Tutorial --------------->
                <div class="col-md-6">
                    <label for="validationCustom03" class="form-label">Editar Tutorial</label>
                    <input type="text" class="form-control" id="nombre" maxlength="50" name="nombre" value="<%= t1.getNombre()%>" required>
                    <div class="invalid-feedback">
                        El nombre esta muy largo
                    </div>
                    <div class="valid-feedback">
                        Buen nombre
                    </div>

                </div>

                <!-------------------------- Fin Nombre Tutorial --------------->


                <!-------------------------- Estado Tutorial --------------->
                <div class="col-md-3">
                    <label for="validationCustom04" class="form-label">Estado</label>
                    <select class="form-select" id="estado" name="estado"  required>
                        <option selected disabled value="">Mas...</option>
                        <option>Revisado</option>
                        <option>Por Revisar</option>
                    </select>
                    <div class="invalid-feedback">
                        Escojer un estado por favor
                    </div>
                    <div class="valid-feedback">
                        Muy bien
                    </div>
                </div>

                <!-------------------------- Prioridad Tutorial --------------->
                <div class="col-md-3">
                    <label for="validationCustom01" class="form-label">Prioridad</label>
                    <input type="number" class="form-control" id="prioridad" maxlength="10" value="<%= t1.getPrioridad()%>" name="prioridad" min="1" max="10" required>
                    <div class="invalid-feedback">
                        Solo numeros del 1 al 10.
                    </div>
                    <div class="valid-feedback">
                        Muy bien
                    </div>
                </div>
                <!-------------------------- Url Tutorial --------------->
                <div class="col-md-8">
                    <label for="validationCustom03" class="form-label">url</label>
                    <input type="url" class="form-control" id="url" name="url" value="<%= t1.getUrl()%> pattern="https?://.+" required>
                           <div class="invalid-feedback">
                        Por favor ingresar una Url
                    </div>
                    <div class="valid-feedback">
                        Muy bien
                    </div>
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
                    <div class="invalid-feedback">
                        Seleccionar una categoria por favor
                    </div>


                </div>
                <!-------------------------- Boton Tutorial --------------->
                <div class="text-center">
                    <button class="btn  btn-outline-light" type="submit"> <strong> Editar </strong></button>
                    <a href="Tutoriales.jsp" class="btn  btn-outline-light"  ><strong> Cancelar </strong></a>

                </div>
            </form>
        </div>

    </div>
    <br>


</section>

<section class="row d-flex justify-content-center">


    <div class="col-10">

        <div class="tabla" style="margin-top: 20px;">
            <div class="row d-flex justify-content-between">
                <div class="col">
                    <h2>Lista de tutoriales</h2>

                </div>
                <div class="col d-flex justify-content-end">



                    <%     String alerta = (String) request.getAttribute("alerta");
                        if (alerta != null) {

                            switch (alerta) {

                                case "EditadoT":
                    %>

                    <div class="alert alert-success d-flex align-items-center"id="alerta" role="alert">

                        Se ha editado el tutorial
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>

                    <%
                            break;
                        case "NoEditadoT":
                    %>

                    <div class="alert alert-warning d-flex align-items-center"id="alerta" role="alert">

                        No se pudo editar el tutorial
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </div>

                <%
                                break;
                            default:

                        }
                    }

                %>





            </div>

        </div>

    </div>
                
                <!-- tabla del formulario editar -->

    <table id="myTabla" class="table table-striped" >
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
        <tbody>

            <%                    List<Tutorial> listaDeTutoriales = Tutorial.listarTutorialesDB();
                if (listaDeTutoriales != null) {
                    for (Tutorial t : listaDeTutoriales) {


            %>
            <tr>
                <th scope="row">
                    <%= t.getId_T()%>
                </th>
                <td>
                    <%= t.getNombre()%>
                </td>
                <td>
                    <%= t.getEstado()%>
                </td>
                <td>
                    <%= t.getPrioridad()%>
                </td>
                <td>
                    <%= Categoria.darNombreCategoria(t.getId_C())%>
                </td>
                <td> <a href="<%= t.getUrl()%>" target="_blank"> Enlace </a></td>
                <td>

        <center>


            <!-- Boton para editar el tutorial -->
            <a href="Sv?p=Editar&id=<%= t.getId_T()%>" class="btn btn-outline-warning"><i
                    class="bi bi-pencil-fill"></i></a>
            <!-- Boton para eliminar el tutorial -->
            <a href="#" class="btn btn-outline-danger" data-bs-toggle="modal"
               data-bs-target="#eliminar<%= t.getId_T()%>" data-nombre="<%= t.getId_T()%>"><i
                    class="bi bi-trash3-fill"></i></a>



        </center>
        </td>
        </tr>




        <!-- modal de confimacion para eliminar un tutorial -->

        <div class="modal fade" id="eliminar<%= t.getId_T()%>" tabindex="-1" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
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

                    <!-- Modal para mostrar informacion de el tutorial -->
        <div class="modal modal-xl" id="Ver<%= t.getId_T()%>" tabindex="-1" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5 text-center" id="exampleModalLabel"><%= t.getNombre()%></h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <iframe width="1060" height="315" src="<%= t.getUrl()%>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                        <div class="row">

                            <div class="col">
                                Categoria: <%= Categoria.darNombreCategoria(t.getId_C())%>
                            </div>
                            <div class="col">
                                Prioridad: <%= t.getPrioridad()%>
                            </div>
                            <div class="col">

                                Estado: <%= t.getEstado()%>
                            </div>
                        </div>


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>

                    </div>
                </div>
            </div>
        </div>

        <% }
        } else { %>
        <tr>
            No hay datos para mostrar
        </tr>


        <% }%>
        </tbody>
    </table>
</div>

</section>                


<%@include file="Templates/JS.jsp" %>
<%@include file="Templates/Footer.jsp" %>
