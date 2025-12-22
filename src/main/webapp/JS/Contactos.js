document.addEventListener("DOMContentLoaded", () => {
  initBannerContacto();
});

function initBannerContacto(){
  const img = document.getElementById("bannerContacto");
  if(!img) return;

  // TUS IMÁGENES REALES
  const banners = [
    "IMG/CONTACTANOS/Contactos1.png",
    "IMG/CONTACTANOS/Contactos2.png",
    "IMG/CONTACTANOS/Contactos3.png"
  ];

  // Si falta alguna imagen, igual no crashea:
  // (solo rotará entre las que existan si el navegador las carga)
  if(banners.length <= 1) return;

  // Precarga para evitar “parpadeos”
  banners.forEach(src => { const pre = new Image(); pre.src = src; });

  let i = 0;
  const tiempo = 3500; // 3.5s

  setInterval(() => {
    i = (i + 1) % banners.length;

    img.classList.add("banner-fade");

    setTimeout(() => {
      img.src = banners[i];
      img.classList.remove("banner-fade");
    }, 220);

  }, tiempo);
}
