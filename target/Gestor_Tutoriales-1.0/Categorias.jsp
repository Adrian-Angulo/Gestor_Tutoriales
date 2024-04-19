<%@include file="Templates/Head.jsp" %>
<%@include file="Templates/header.jsp" %>

<section class="container categoria">
    <section class="row">
        <div class="col-12 align-middle"
             style="background-color: #527286; margin-bottom: 20px; padding: 10px 5px ; border-radius: 20px;">


            <form method="post" action="SvCategoria?p=Agregar"  class="row">

                <div class="row">
                    <div class="col-10">
                        <input type="text" name="nombreC" class="form-control" placeholder="Nombre de la categoria">
                               
                    </div>
                    <div class="col-2">
                        <input type="submit" class="form-control"  value="Enviar">
                    </div>
                </div>

            </form>
        </div>

    </section>

</section>

<!-- Tabla para categoria -->

<section  class="container"style="width: 500px;">


    <!-- Post preview-->
    <!-- Agregamos la clase text-center -->

    <br>
    <div class="text-center">
        <h2 class="post-title">Lista de Categorias
        </h2>
    </div>
    <br>
    <table id="myTabla2" class="table table-striped" style="border: 2px solid black">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Nombre</th>
                <th scope="col">Opciones</th>

            </tr>
        </thead>
        <tbody >

            <%
                List<Categoria> listaDeCategoria = Categoria.listarCategoria();
                if (listaDeCategoria != null) {
                    for (Categoria c : listaDeCategoria) {


            %>
            <tr>
                <th scope="row"><%= c.getId_C()%></th>
                <td><%= c.getNombre()%></td>
                <td>

        <center>
            <!-- Boton para editar el tutorial -->
            <a  class="btn btn-outline-warning" data-bs-toggle="modal" data-bs-target="#editar<%= c.getId_C()%>" data-nombre="<%= c.getId_C()%>"><i class="bi bi-pencil-fill"></i></a>                                        
            <!-- Boton para eliminar el tutorial -->
            <a href="#" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#eliminar<%= c.getId_C()%>" data-nombre="<%= c.getId_C()%>"><i class="bi bi-trash3-fill"></i></a>
        </center>
        </td>
        </tr>



        <!---------------- modal de confimacion para eliminar una categoria --------------->

        <div class="modal fade" id="eliminar<%= c.getId_C()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Confirmacion</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        seguro que desea eliminar la categoria <%= c.getNombre()%>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <a href="SvCategoria?id=<%= c.getId_C()%>" class="btn btn-outline-danger"> Eliminar </a>
                    </div>
                </div>
            </div>
        </div>
        <!------------------ Fin modal de confimacion para eliminar un Categoria ----------------->



        <!-- Modal para editar una categoria -->

        <div class="modal fade" id="editar<%= c.getId_C()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="SvCategoria?p=Editar&id=<%= c.getId_C()%>" method="POST">

                        <div class="modal-header">

                            <h1 class="modal-title fs-5" id="exampleModalLabel">Editar Caracteristica</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>


                        <div class="row" style="margin: 20px; border: none">
                            <div class="col-12">
                                <input type="text" name="nombreC" class="form-control" value="<%= c.getNombre()%>">
                            </div>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">Actualizar</button>

                        </div>

                    </form>
                </div>
            </div>
            <!-- Modal para editar una categoria -->

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

<%@include file="Templates/JS.jsp" %>
<%@include file="Templates/Footer.jsp" %>