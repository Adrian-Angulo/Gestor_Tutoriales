<%@include file="Templates/Head.jsp"%>


<header class="header">
    <div class="menu container">
        <a href="index.html" class="logo">Gestor de Tutoriales</a>
        <input type="checkbox" id="menu">
        <label for="menu">
            <img src="images/menu.png" class="menu-icono" alt="">
        </label>
        <nav class="navbar">
            <ul>
                <li><a href="index.jsp ">inicio</a></li>
                <li><a href="Tutoriales.jsp">Tutoriales</a></li>
                <li><a href="Categorias.jsp">Categorias</a></li>
                <li><a href="#footer">Contacto</a></li>
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



<section class="Info " >

    <div class="row ">
        <div class="col-8 text-center" >
            <h4>Tutorial</h4>
            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Incidunt, quia assumenda. Maiores officia voluptatem
            sunt vero illum quos facilis similique, nulla hic, sapiente fugit sint quasi, rem molestiae voluptate! Enim.
            Ad at laborum commodi iste laboriosam ducimus ipsum consectetur accusantium cumque repudiandae delectus rem
            iusto corporis, harum asperiores reiciendis ex ut? A eaque tenetur magnam quos nemo sit maiores molestiae.
            Veniam quibusdam ut aliquam quasi iste id quam dolor, fugiat nam voluptas quod animi reiciendis delectus nulla
            incidunt labore porro sunt ipsam ad numquam, odio repellat repellendus. Minima, placeat vero.
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
            <h4>Caracteristicas</h4>
            Lorem ipsum dolor sit amet consectetur, adipisicing elit. Error quas nobis itaque voluptas consequuntur
            aspernatur fuga nesciunt voluptate vero maiores eligendi hic molestiae nostrum veritatis, enim tempore.
            Molestias, ut architecto.
        </div>
    </div>



</section>

<%@include file="Templates/Footer.jsp"%>

