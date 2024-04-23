<%@include file="Templates/Head.jsp"%>

<!-- Navar para navegar entre paginas -->
<header class="header">
    <div class="menu container">
        <a href="index.jsp" class="logo">Gestor de Tutoriales</a>
        <input type="checkbox" id="menu">
        <label for="menu">
            <img src="images/menu.png" class="menu-icono" alt="">
        </label>
        <nav class="navbar">
            <ul>
                <li><a href="index.jsp ">inicio</a></li>
                <li><a href="Tutoriales.jsp">Tutoriales</a></li>
                <li><a href="Categorias.jsp">Categorias</a></li>
                
            </ul>
        </nav>
    </div>


    <div class="header-content container">

        <h1>Gestor de tutoriales </h1>
        <p>Agrega y organiza tus toriales de la menera que prefiras, puedes organizar
            por categoria, pioridad, revisado o no. para que sea mas facil de gestionar
        </p>
        <a href="Tutoriales.jsp" class="btn-1">Empezar</a>
    </div>
</header>


<!-- Informacion para la presentacion de la pagina -->

<section class="Info ">

    <div class="row ">
        <div class="col-8 text-center" >
            <h4>Tutorial</h4>
            En esta pagina web podemos crear tutoriales para en listarlos y gestionarlos, los tutoriales son un buen contenido
            para aprender y reforzar tus habilidades lo que sera genial tenerlos organizados, asi como priorizarlos, agregarle las categorias
            ver el tutorial en la pagina al igual de el enlace que te envia donde esta el tutorial en youtube
        </div >
        <div class="col-4">
            <img src="Imagenes/img2.jpg" style="border-radius: 30px" height="250px" alt="">

        </div>

    </div>
    <div class="row " style="padding-top: 5%" >
        <div class="col-4" >

            <img src="Imagenes/img3.jpg" style="border-radius: 30px" height="250px" alt="">
        </div>
        <div class="col-8 text-center">
            <h4>Categorias</h4>
            En este apartado podras agregar una categoria para poder agregar un tutorial segun tu categoria, lo que hace una manera practica de organizar
            tus tutoriales
        </div>
    </div>



</section>

<%@include file="Templates/Footer.jsp"%>

