<%-- 
    Document   : Tutoriales
    Created on : 20/04/2024, 2:09:28 p. m.
    Author     : ADRIAN CASTILLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@include file="Templates/Head.jsp" %>
<%@include file="Templates/header.jsp" %>
<section class="row d-flex justify-content-center">


    <div class="col-6" style="padding: 3%;">

        <h2 class="text-center">Agregar Tutorial</h2>
        <p class="text-center">En esta seccion puedes agregar un tutorial, una ves agregado se mostra en la lista de abajo</p>

        <div class="form" style="border: 3px solid white; border-radius: 30px; padding: 10px;">
            <form id="fomulario" method="post" action="Sv?p=Agregar" class="row g-3 needs-validation" novalidate >

                <!-------------------------- Nombre Tutorial --------------->
                <div class="col-md-6">
                    <label for="validationCustom03" class="form-label">Nombre de Tutorial</label>
                    <input type="text" class="form-control" id="nombre" maxlength="50" name="nombre" required>
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
                    <select class="form-select" id="estado" name="estado" required>
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
                    <input type="number" class="form-control" id="prioridad" maxlength="10" name="prioridad" min="1" max="10" required>
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
                    <input type="url" class="form-control" id="url" name="url" pattern="https?://.+" required>
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
                    <button class="btn btn-primary" type="submit">Agregar tutorial</button>
                </div>
            </form>
        </div>

    </div>



</section>
<%@include file="Templates/Tabla.jsp" %>
<%@include file="Templates/JS.jsp" %>
<%@include file="Templates/Footer.jsp" %>

