// =====================================
// Horario.js
// Fondo dinámico para Horarios.jsp
// - Usa Horario1.jpg y Horario2.jpg
// - Precarga imagen (evita parpadeo)
// - Cambia con fade suave cada cierto tiempo
// =====================================
(function () {
  const bg = document.querySelector(".horario-bg");
  if (!bg) return; // si no existe el div, no hacemos nada

  // Si tienes contextPath en window.APP_CTX, úsalo.
  // Si no, funciona igual con rutas normales.
  const ctx = window.APP_CTX || "";

  const imagenes = [
    ctx + "IMG/HORARIO/Horario1.jpg",
    ctx + "IMG/HORARIO/Horario2.jpg"
  ];

  let indiceActual = -1;

  function elegirOtraImagen() {
    if (imagenes.length === 1) return 0;

    let i;
    do {
      i = Math.floor(Math.random() * imagenes.length);
    } while (i === indiceActual);

    return i;
  }

  function precargar(src) {
    return new Promise((ok, fail) => {
      const img = new Image();
      img.onload = () => ok();
      img.onerror = () => fail();
      img.src = src;
    });
  }

  async function cambiarFondo() {
    const i = elegirOtraImagen();
    const src = imagenes[i];

    try {
      // 1) precargamos para que no "salte"
      await precargar(src);

      // 2) fade out
      bg.style.opacity = "0";

      // 3) cambiamos imagen y fade in
      setTimeout(() => {
        bg.style.backgroundImage = `url('${src}')`;
        bg.style.opacity = "1";
        indiceActual = i;
      }, 250);

    } catch (e) {
      console.warn("No se pudo cargar:", src);
    }
  }

  // Primer fondo al cargar
  cambiarFondo();

  // Cambia cada 12 segundos (ajusta si quieres)
  setInterval(cambiarFondo, 12000);
})();


