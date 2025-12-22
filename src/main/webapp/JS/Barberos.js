document.addEventListener("DOMContentLoaded", () => {
  // Referencias
  const inputBuscar = document.getElementById("inputBuscar");
  const btnLimpiar = document.getElementById("btnLimpiar");
  const selectEspecialidad = document.getElementById("selectEspecialidad");
  const selectOrden = document.getElementById("selectOrden");
  const textoContador = document.getElementById("textoContador");
  const btnScrollArriba = document.getElementById("btnScrollArriba");

  const items = Array.from(document.querySelectorAll(".barbero-item"));

  // Modal (Bootstrap)
  const modalElemento = document.getElementById("modalBarbero");
  const modal = modalElemento ? new bootstrap.Modal(modalElemento) : null;

  // Campos del modal
  const modalTitulo = document.getElementById("modalTitulo");
  const modalImg = document.getElementById("modalImg");
  const modalEspecialidad = document.getElementById("modalEspecialidad");
  const modalExperiencia = document.getElementById("modalExperiencia");
  const modalRating = document.getElementById("modalRating");
  const modalResumen = document.getElementById("modalResumen");
  const modalDetalle = document.getElementById("modalDetalle");
  const modalHorario = document.getElementById("modalHorario");
  const modalPrecio = document.getElementById("modalPrecio");

  // ===== Utilidades =====
  const normalizar = (t) =>
    (t || "")
      .toLowerCase()
      .normalize("NFD")
      .replace(/\p{Diacritic}/gu, "")
      .trim();

  const mapEspecialidadTexto = (key) => {
    const mapa = {
      degradados: "Degradados",
      barbas: "Barbas",
      clasicos: "Clásicos",
      disenos: "Diseños",
      tinturas: "Tinturas",
    };
    return mapa[key] || "Especialidad";
  };

  // ===== Animaciones al entrar (scroll reveal) =====
  activarReveal();

  // ===== Eventos =====
  if (inputBuscar) inputBuscar.addEventListener("input", aplicarFiltros);
  if (selectEspecialidad) selectEspecialidad.addEventListener("change", aplicarFiltros);
  if (selectOrden) selectOrden.addEventListener("change", aplicarFiltros);

  if (btnLimpiar) {
    btnLimpiar.addEventListener("click", () => {
      if (inputBuscar) inputBuscar.value = "";
      if (selectEspecialidad) selectEspecialidad.value = "todos";
      if (selectOrden) selectOrden.value = "recomendado";
      aplicarFiltros();
    });
  }

  if (btnScrollArriba) {
    btnScrollArriba.addEventListener("click", () => {
      window.scrollTo({ top: 0, behavior: "smooth" });
    });
  }

  // Botón "Ver más" y click en card para modal
  items.forEach((item) => {
    const card = item.querySelector(".barber-card");
    const btnVerMas = item.querySelector(".btnVerMas");

    const abrir = () => abrirModalConDatos(item);

    if (card) {
      card.addEventListener("click", (e) => {
        // si hace click en un enlace/botón dentro, no forzamos modal encima
        if (e.target.closest("a")) return;
        abrir();
      });
    }

    if (btnVerMas) {
      btnVerMas.addEventListener("click", (e) => {
        e.stopPropagation();
        abrir();
      });
    }
  });

  // Primera pasada: contador y orden recomendado
  aplicarFiltros();

  // ===== Funciones principales =====
  function aplicarFiltros() {
    const texto = normalizar(inputBuscar?.value);
    const filtroEsp = selectEspecialidad?.value || "todos";
    const orden = selectOrden?.value || "recomendado";

    // 1) Filtrar visibles
    let visibles = [];

    items.forEach((item) => {
      const nombre = normalizar(item.dataset.nombre);
      const especialidad = normalizar(item.dataset.especialidad);
      const resumen = normalizar(item.dataset.resumen);
      const detalle = normalizar(item.dataset.detalle);

      const coincideTexto =
        !texto ||
        nombre.includes(texto) ||
        especialidad.includes(texto) ||
        resumen.includes(texto) ||
        detalle.includes(texto);

      const coincideEspecialidad = filtroEsp === "todos" || especialidad === filtroEsp;

      const mostrar = coincideTexto && coincideEspecialidad;

      item.style.display = mostrar ? "" : "none";
      if (mostrar) visibles.push(item);
    });

    // 2) Ordenar (reorganizar el DOM)
    visibles = ordenarItems(visibles, orden);
    const grid = document.getElementById("gridBarberos");
    if (grid) visibles.forEach((it) => grid.appendChild(it));

    // 3) Contador
    if (textoContador) {
      textoContador.textContent =
        visibles.length === 1
          ? "Mostrando 1 barbero"
          : `Mostrando ${visibles.length} barberos`;
    }
  }

  function ordenarItems(lista, tipo) {
    const copia = [...lista];

    if (tipo === "nombre") {
      copia.sort((a, b) => (a.dataset.nombre || "").localeCompare(b.dataset.nombre || ""));
    }

    if (tipo === "experiencia") {
      copia.sort((a, b) => Number(b.dataset.experiencia) - Number(a.dataset.experiencia));
    }

    if (tipo === "rating") {
      copia.sort((a, b) => Number(b.dataset.rating) - Number(a.dataset.rating));
    }

    // "recomendado": rating alto + experiencia
    if (tipo === "recomendado") {
      copia.sort((a, b) => {
        const scoreA = Number(a.dataset.rating) * 10 + Number(a.dataset.experiencia);
        const scoreB = Number(b.dataset.rating) * 10 + Number(b.dataset.experiencia);
        return scoreB - scoreA;
      });
    }

    return copia;
  }

  function abrirModalConDatos(item) {
    if (!modal) return;

    const nombre = item.dataset.nombre || "Barbero";
    const espKey = item.dataset.especialidad || "degradados";
    const rating = item.dataset.rating || "0.0";
    const experiencia = item.dataset.experiencia || "0";
    const resumen = item.dataset.resumen || "";
    const detalle = item.dataset.detalle || "";
    const horario = item.dataset.horario || "";
    const precio = item.dataset.precio || "";
    const img = item.dataset.img || "";

    if (modalTitulo) modalTitulo.textContent = nombre;
    if (modalImg) modalImg.src = img;

    if (modalEspecialidad) modalEspecialidad.textContent = mapEspecialidadTexto(espKey);

    // Cambiar color de badge según especialidad (simple y entendible)
    if (modalEspecialidad) {
      modalEspecialidad.classList.remove("bg-primary", "bg-danger");
      modalEspecialidad.classList.add(espKey === "barbas" || espKey === "disenos" ? "bg-danger" : "bg-primary");
    }

    if (modalExperiencia) modalExperiencia.textContent = `${experiencia} años`;
    if (modalRating) modalRating.textContent = `★ ${rating}`;
    if (modalResumen) modalResumen.textContent = resumen;
    if (modalDetalle) modalDetalle.textContent = detalle;
    if (modalHorario) modalHorario.textContent = horario;
    if (modalPrecio) modalPrecio.textContent = precio;

    modal.show();
  }

  function activarReveal() {
    const elementos = document.querySelectorAll(".anim-entrada, .anim-item");
    if (!elementos.length) return;

    const obs = new IntersectionObserver(
      (entradas) => {
        entradas.forEach((e) => {
          if (e.isIntersecting) e.target.classList.add("on");
        });
      },
      { threshold: 0.12 }
    );

    elementos.forEach((el) => obs.observe(el));
  }
});
