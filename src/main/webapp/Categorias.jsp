<%@include file="Templates/Head.jsp" %>
<%@include file="Templates/header.jsp" %>


<!-- Seccion para agregar la categoria -->
<section class="container-fluid" style="border: none; background: linear-gradient(rgba(0, 0, 0, 2) 2%,rgba(208, 198, 193,3) 40% );">
    <div class="row justify-content-center">
        <div class="col-6 "
             style=" margin-bottom: 20px; padding: 10px 5px ; border-radius: 20px;">

            <!-- Formulario para agregar la categoria -->
            <form method="post" action="SvCategoria?p=Agregar"  class="row needs-validation">

                <div class="row">
                    <div class="col-10">
                        <input type="text" id="validationCustom03" name="nombreC" class="form-control" maxlength="50" placeholder="Nombre de la categoria" required>
                        <div class="invalid-feedback">
                            Ingresar un nombre por favor
                        </div>
                    </div>
                    <div class="col-2">
                        <button class="btn  btn-outline-light" type="submit"> <strong> Agregar </strong></button>
                    </div>
                </div>

            </form>
        </div>

    </div>




    <!-- En esta parte se puede administrar las aletas que apareceran en la pagina -->
    <div class="row d-flex justify-content-center align-items-center">
        <div class="col-6">



            <div class="text-center" style="color: white">
                <h2 class="post-title">Lista de Categorias
                </h2>
            </div>
            <div class="row d-flex justify-content-center">
            <div class="col-6 ">
                
                <!-- Se recibe el valor del parametro alerta de el servlet SvCategoria -->
                <%     String alerta = (String) request.getAttribute("alerta");
                    if (alerta != null) { //si la categoria es diferente a null se identifica el valor del la variable alerta

                        switch (alerta) {
                        
                            // si el valor de la alerta en AgregadoC se manda un mensaje en pantalla para mostar mensaje de que se agrego una categoria
                            case "AgregadoC":

                %>

                <div class="alert alert-success d-flex align-items-center justify-content-between" id="alerta" role="alert">

                    Se ha agregado una categoria
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>

                <%                            break;
                    case "NoAgregadoC":
                %>


                <div class="alert alert-warning d-flex align-items-center justify-content-between"id="alerta" role="alert">

                    No se pudo la categoria
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>

                <%
                        break;
                    case "EditadoC":
                %>

                <div class="alert alert-success d-flex align-items-center justify-content-between"id="alerta" role="alert">

                    Se ha editado la categoria
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>

                <%
                        break;
                    case "NoEditadoC":
                %>

                <div class="alert alert-warning d-flex align-items-center justify-content-between"id="alerta" role="alert">

                    No se pudo editar la categoria
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </div>

            <%
                    break;
                case "ElinimarC":
            %>


            <div class="alert alert-success d-flex align-items-centerjustify-content-between"id="alerta" role="alert">

                Se ha eliminado una categoria
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>

            <%
                    break;
                case "NoElinimarC":
            %>

            <div class="alert alert-warning d-flex align-items-center justify-content-between"id="alerta" role="alert">

                No se pudo eliminar la categoria
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>

            <%
                    break;

                case "ExisteC":
            %>

            <div class="alert alert-warning d-flex align-items-center justify-content-between"id="alerta" role="alert">

                Ya existe una categoria con ese nombre
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>

            <%
                            break;
                        default:

                    }
                }

            %>

        </div>
        </div>
        <br>
        
        <!-- Tabla para mostarar las categorias registrardas -->
        <table id="myTabla2" class="table "  >
            <thead class="">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Opciones</th>

                </tr>
            </thead>
            <tbody class="table-group-divider">

               
               
                <%                        List<Categoria> listaDeCategoria = Categoria.listarCategoria(); // se agrega las categorias a un arraylist
                    if (listaDeCategoria != null) { // verofica si la lista es diferente de null
                        for (Categoria c : listaDeCategoria) { // si la lista es diferente de null recorremos la listas  


                %>
                <tr >
                    <!-- mostramos las categorias registradas  -->
                    <th scope="row"><%= c.getId_C()%></th>
                    <td><%= c.getNombre()%></td>
                    <td>

            <center>
                <!-- Boton para editar el tutorial -->
                <a  class="btn btn-outline-warning" style="border:none; border-radius: 50%" data-bs-toggle="modal" data-bs-target="#editar<%= c.getId_C()%>" data-nombre="<%= c.getId_C()%>"><i class="bi bi-pencil-fill"></i></a>                                        
                <!-- Boton para eliminar el tutorial -->
                <a href="#" class="btn btn-outline-danger" style="border:none ; border-radius: 50%" data-bs-toggle="modal" data-bs-target="#eliminar<%= c.getId_C()%>" data-nombre="<%= c.getId_C()%>"><i class="bi bi-trash3-fill"></i></a>
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
    </div>
</div>

</section>




<%@include file="Templates/JS.jsp" %>
<%@include file="Templates/Footer.jsp" %>