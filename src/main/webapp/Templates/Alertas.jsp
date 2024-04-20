

<% String mostrarAlerta = (String) request.getAttribute("mostrarAlerta"); %>

<% if (mostrarAlerta.equalsIgnoreCase("AgregarT")) { %>
<label>Se ha agregado una nueva tarea</label>
<% }%>

<% if (mostrarAlerta.equalsIgnoreCase("AgregarC")) { %>
<div id="alerta" class="alert alert-success d-flex align-items-center" role="alert">
    <svg class="bi flex-shrink-0 me-2" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
    <div>
        Se ha Agregado una nueva categoria
    </div>
</div>
<% }%>

<% if (mostrarAlerta.equalsIgnoreCase("EliminarT")) { %>
<div id="alerta" class="alert alert-success d-flex align-items-center" role="alert">
    <svg class="bi flex-shrink-0 me-2" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
    <div>
        Se ha eliminado un tutorial
    </div>
</div>
<% }%>

<% if (mostrarAlerta.equalsIgnoreCase("EliminarC")) { %>
<div id="alerta" class="alert alert-success d-flex align-items-center" role="alert">
    <svg class="bi flex-shrink-0 me-2" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
    <div>
        se ha eliminado una categoria
    </div>
</div>
<% }%>

<% if (mostrarAlerta.equalsIgnoreCase("ModicarT")) { %>
<div id="alerta" class="alert alert-success d-flex align-items-center" role="alert">
    <svg class="bi flex-shrink-0 me-2" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
    <div>
        Se ha modificado un tutorial
    </div>
</div>
<% }%>

<% if (mostrarAlerta.equalsIgnoreCase("NoModicarT")) { %>
<div id="alerta" class="alert alert-success d-flex align-items-center" role="alert">
    <svg class="bi flex-shrink-0 me-2" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
    <div>
        No se pudo modificar el tutorial
    </div>
</div>
<% }%>

<% if (mostrarAlerta.equalsIgnoreCase("ModificaC")) { %>
<div id="alerta" class="alert alert-success d-flex align-items-center" role="alert">
    <svg class="bi flex-shrink-0 me-2" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
    <div>
        No se pudo modificar la categoria
    </div>
</div>
<% }%>

<% if (mostrarAlerta.equalsIgnoreCase("NoEliminarT")) { %>
<div id="alerta" class="alert alert-danger d-flex align-items-center" role="alert">
    <svg class="bi flex-shrink-0 me-2" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
    <div>
        No se pudo Eliminar el tutorial
    </div>
</div>
<% }%>

<% if (mostrarAlerta.equalsIgnoreCase("NoEliminarC")) { %>
<div id="alerta" class="alert alert-danger d-flex align-items-center" role="alert">
    <svg class="bi flex-shrink-0 me-2" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
    <div>
        No se pudo Eliminar la categoria
    </div>
</div>
<% }%>



