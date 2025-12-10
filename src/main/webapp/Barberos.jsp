<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Barberos</title>

<link rel="stylesheet" href="CSS/bootstrap.min.css">

<style>
        .card:hover {
            transform: scale(1.02);
            transition: 0.3s;
            cursor: pointer;
        }
</style>

</head>

<body class="bg-dark text-white">

	<%@ include file="includes/navbar.jspf" %>
	

    <div class="container py-4">

<div class="row d-flex flex-column gap-3">

	<h1>Elige a tu barbero</h1>
	
		<h3 class="text-right">Barbero 1</h3>
		
            <!-- Barbero 1 -->
            <div class="col-md-2 col-lg-7">
                <div class="card shadow-sm p-3 border-0 cursor-pointer transition"
                     onclick="location.href='Horarios.jsp'"
                     style="transition: transform .3s;"
                     onmouseover="this.style.transform='scale(1.1)'"
                     onmouseout="this.style.transform='scale(1)'">
                    
                    <div class="d-flex align-items-start gap-3">
                        <img src="IMG/barbero1.jpg" 
                             class="rounded-circle object-fit-cover"
                             width="80" height="80">

                        <p class="mt-2">
                            Con más de 6 años de experiencia, es reconocido por su precisión en degradados perfectos y
                            cortes modernos. Su estilo combina técnica detallada con creatividad.
                        </p>
                    </div>
                </div>
            </div>

		<h3 class="text-right">Barbero 2</h3>
	

            <!-- Barbero 2 -->
            <div class="col-md-2 col-lg-7">
                <div class="card shadow-sm p-3 border-0 cursor-pointer"
                     onclick="location.href='Horarios.jsp'"
                     style="transition: transform .3s;"
                     onmouseover="this.style.transform='scale(1.1)'"
                     onmouseout="this.style.transform='scale(1)'">

                    <div class="d-flex align-items-start gap-3">
                        <img src="IMG/barbero2.jpg"
                             class="rounded-circle object-fit-cover"
                             width="80" height="80">

                        <p class="mt-2">
                            Experto en diseño y mantenimiento de barbas. Domina técnicas clásicas y modernas,
                            asegurando líneas limpias y simetría impecable.
                        </p>
                    </div>
                </div>
            </div>

		<h3 class="text-right">Barbero 3</h3>


            <!-- Barbero 3 -->
            <div class="col-md-2 col-lg-7">
                <div class="card shadow-sm p-3 border-0 cursor-pointer"
                     onclick="location.href='Horarios.jsp'"
                     style="transition: transform .3s;"
                     onmouseover="this.style.transform='scale(1.1)'"
                     onmouseout="this.style.transform='scale(1)'">

                    <div class="d-flex align-items-start gap-3">
                        <img src="IMG/barbero3.jpg"
                             class="rounded-circle object-fit-cover"
                             width="80" height="80">

                        <p class="mt-2">
                            Especialista en cortes tradicionales y elegantes como el pompadour o el estilo gentleman,
                            con más de 10 años de experiencia.
                        </p>
                    </div>
                </div>
            </div>

		<h3 class="text-right">Barbero 4</h3>


            <!-- Barbero 4 -->
            <div class="col-md-2 col-lg-7">
                <div class="card shadow-sm p-3 border-0 cursor-pointer"
                     onclick="location.href='Horarios.jsp'"
                     style="transition: transform .3s;"
                     onmouseover="this.style.transform='scale(1.1)'"
                     onmouseout="this.style.transform='scale(1)'">

                    <div class="d-flex align-items-start gap-3">
                        <img src="IMG/barbero4.jpg"
                             class="rounded-circle object-fit-cover"
                             width="80" height="80">

                        <p class="mt-2">
                            Maneja tinturas, diseños con máquina y cortes creativos. Ideal para quienes quieren renovar
                            su estilo con un toque moderno.
                        </p>
                    </div>
                </div>
            </div>

        </div>
    </div>


	<%@ include file="includes/footer.jspf" %>
<script src="JS/bootstrap.bundle.min.js"></script>
</body>
</html>
