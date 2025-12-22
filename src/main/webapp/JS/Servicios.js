/* ===============================
   SERVICIOS.JS
   Página: Servicios.jsp
   =============================== */

document.addEventListener("DOMContentLoaded", () => {
  initBuscadorServicios();
  initFadeImagenes();
  initFondoRotativo();
});

/* ===============================
   BUSCADOR DE SERVICIOS
   =============================== */
function initBuscadorServicios(){
  const input   = document.getElementById("buscarServicios");
  const limpiar = document.getElementById("btnLimpiarBuscador");
  const badge   = document.getElementById("buscarContador");
  const cards   = document.querySelectorAll("#cortes .col"); // columnas del grid

  if(!input || !cards.length) return;

  const normalizar = (t) =>
    t.toLowerCase()
     .normalize("NFD")
     .replace(/\p{Diacritic}/gu, "")
     .trim();

  function filtrar(){
    const q = normalizar(input.value);
    let visibles = 0;

    cards.forEach(col => {
      const card   = col.querySelector(".card");
      const titulo = card?.querySelector(".card-title")?.innerText || "";
      const texto  = card?.innerText || "";
      const tags   = card?.dataset?.tags || "";

      const match =
        !q ||
        normalizar(titulo).includes(q) ||
        normalizar(texto).includes(q) ||
        normalizar(tags).includes(q);

      col.style.display = match ? "" : "none";
      if(match) visibles++;
    });

    if(badge){
      badge.innerText = visibles;
      badge.classList.toggle("bg-danger", visibles === 0);
      badge.classList.toggle("bg-primary", visibles > 0);
    }
  }

  input.addEventListener("input", filtrar);

  if(limpiar){
    limpiar.addEventListener("click", () => {
      input.value = "";
      filtrar();
      input.focus();
    });
  }

  filtrar(); // estado inicial
}

/* ===============================
   FADE IN DE IMÁGENES
   =============================== */
function initFadeImagenes(){
  const imgs = document.querySelectorAll("img[data-fade]");
  if(!imgs.length) return;

  const obs = new IntersectionObserver(
    (entradas) => {
      entradas.forEach(e => {
        if(e.isIntersecting){
          e.target.classList.add("on");
          obs.unobserve(e.target);
        }
      });
    },
    { threshold: 0.15 }
  );

  imgs.forEach(img => obs.observe(img));
}

/* ===============================
   FONDO ROTATIVO GLOBAL
   =============================== */
function initFondoRotativo(){
  const contenedor = document.getElementById("bgRotativo");
  if(!contenedor) return;

  const fondos = [
    "IMG/FONDOS/fondo1.jpg",
    "IMG/FONDOS/fondo2.jpg",
    "IMG/FONDOS/fondo3.jpg"
  ];

  let index = 0;

  // Crear capas
  const capa1 = document.createElement("div");
  const capa2 = document.createElement("div");

  capa1.className = "bg-img activa";
  capa2.className = "bg-img";

  capa1.style.backgroundImage = `url('${fondos[0]}')`;
  capa2.style.backgroundImage = `url('${fondos[1]}')`;

  contenedor.appendChild(capa1);
  contenedor.appendChild(capa2);

  let actual = capa1;
  let siguiente = capa2;

  setInterval(() => {
    index = (index + 1) % fondos.length;
    siguiente.style.backgroundImage = `url('${fondos[index]}')`;

    siguiente.classList.add("activa");
    actual.classList.remove("activa");

    // swap
    [actual, siguiente] = [siguiente, actual];
  }, 6000);
}
