// ******** JAVA SCRIPT --- GENERAL ***********

// Arranque
document.addEventListener('DOMContentLoaded', () => {
  revelarAlEntrar();
  contarAlEntrar();
  fondoRotativoBody();
  aparecerImagenes();
  initBuscadorServicios();
  
  // Si tu navbar tiene reloj, no lo rompemos
  if (typeof initClock === 'function') initClock();
  
 
});

/* --- 1) Fade de bloques con .revelar (si los usas) --- */
function revelarAlEntrar() {
  const bloques = document.querySelectorAll('.revelar');
  if (!bloques.length) return;

  if (!('IntersectionObserver' in window)) {
    bloques.forEach(b => b.classList.add('show'));
    return;
  }
  const io = new IntersectionObserver(ents => {
    ents.forEach(e => {
      if (e.isIntersecting){ e.target.classList.add('show'); io.unobserve(e.target); }
    });
  }, { threshold: 0.2 });

  bloques.forEach(b => io.observe(b));
}

/* --- 2) Contadores: <span data-meta="250">0</span> (si los usas) --- */
function contarAlEntrar() {
  const nums = document.querySelectorAll('[data-meta]');
  if (!nums.length) return;

  const iniciar = el => {
    if (el.dataset._start) return;
    el.dataset._start = '1';
    const meta = parseInt(el.dataset.meta,10)||0;
    let n=0, paso=Math.max(1, Math.ceil(meta/50));
    const t=setInterval(()=>{
      n+=paso; if(n>=meta){n=meta; clearInterval(t);} el.textContent=n;
    },25);
  };

  if (!('IntersectionObserver' in window)) { nums.forEach(iniciar); return; }

  const io = new IntersectionObserver(ents => {
    ents.forEach(e => { if(e.isIntersecting){ iniciar(e.target); io.unobserve(e.target);} });
  }, { threshold: 0.6 });

  nums.forEach(n => io.observe(n));
}

/* --- 3) Fondo rotativo con crossfade en #bgRotativo --- */
function fondoRotativoBody(){
  const cont = document.getElementById('bgRotativo');
  if (!cont) return;

  const base = (window.APP_CTX || '');
  const fotos = [
    `${base}IMG/FONDOS/Servicios1.jpg`,
    `${base}IMG/FONDOS/Servicios2.jpg`,
    `${base}IMG/FONDOS/Servicios3.jpg`,
    `${base}IMG/FONDOS/Servicios4.jpg`
  ];

  // crea dos capas para hacer crossfade
  let a = cont.querySelector('.bg-img.a');
  let b = cont.querySelector('.bg-img.b');
  if (!a || !b){
    a = document.createElement('div'); a.className='bg-img a activa';
    b = document.createElement('div'); b.className='bg-img b';
    cont.insertBefore(b, cont.firstChild);
    cont.insertBefore(a, cont.firstChild);
  }

  let i=0, visible=a, oculto=b;
  visible.style.backgroundImage = `url('${fotos[i]}')`;

  setInterval(()=>{
    i=(i+1)%fotos.length;
    oculto.style.backgroundImage = `url('${fotos[i]}')`;
    oculto.classList.add('activa');
    visible.classList.remove('activa');
    const tmp=visible; visible=oculto; oculto=tmp;
  }, 5000);
}

/* --- 4) Activa el fade de imágenes marcadas con [data-fade] --- */
function aparecerImagenes(){
  const imgs = document.querySelectorAll('img[data-fade]');
  if (!imgs.length) return;

  const on = el => el.classList.add('on');

  if (!('IntersectionObserver' in window)) { imgs.forEach(on); return; }

  const io = new IntersectionObserver(ents => {
    ents.forEach(e => { if(e.isIntersecting){ on(e.target); io.unobserve(e.target); } });
  }, { threshold: 0.2 });

  imgs.forEach(img => io.observe(img));
}


									/////////////////////**************** BUSCADOR ******************//////////////////////////////
									
									
function initBuscadorServicios() {
  var input   = document.getElementById('buscarServicios');
  var limpiar = document.getElementById('btnLimpiarBuscador');
  var badge   = document.getElementById('buscarContador');
  var cols    = document.querySelectorAll('#cortes .col, #cortes [class*="col-"]');

  if (!input || !cols.length) return;

  // quita tildes y pasa a minúsculas (compatible)
  function norm(txt) {
    txt = (txt || '').toLowerCase();
    try { txt = txt.normalize('NFD').replace(/[\u0300-\u036f]/g, ''); } catch(e){}
    return txt.trim();
  }

  function filtrar() {
    var q = norm(input.value);
    var visibles = 0;

    cols.forEach(function (col) {
      var card   = col.querySelector('.card');
      if (!card) { col.classList.remove('d-none'); return; }

      var titulo = (card.querySelector('.card-title') || {}).textContent || '';
      var body   = (card.querySelector('.card-body')  || {}).textContent || '';
      var tags   = card.getAttribute('data-tags') || '';
      var blob   = norm(titulo + ' ' + body + ' ' + tags);

      var show = !q || blob.indexOf(q) !== -1;
      col.classList.toggle('d-none', !show);
      if (show) visibles++;
    });

    if (badge) badge.textContent = String(visibles);
  }

  input.addEventListener('input', filtrar);
  input.addEventListener('keydown', function (e) {
    if (e.key === 'Escape') { input.value = ''; filtrar(); }
  });
  if (limpiar) limpiar.addEventListener('click', function () {
    input.value = ''; filtrar(); input.focus();
  });

  filtrar(); // contador inicial
}



//////////////////////////FONDO LOGIN /////////////////////////////////



// ===== Fondo rotativo con fade + zoom =====

const fondos = [
  "IMG/FONDOS/servicios1.png",
  "IMG/FONDOS/servicios2.png",
  "IMG/FONDOS/servicios3.png"
];

let fondoIndex = 0;
const bg = document.getElementById("bgRotativo");

if (bg) {
  const capa = document.createElement("div");
  capa.className = "bg-rotativo";
  document.body.prepend(capa);

  function cambiarFondo() {
    const url = window.APP_CTX + fondos[fondoIndex];

    capa.style.setProperty("--fondo", `url('${url}')`);
    capa.style.backgroundImage = `url('${url}')`;

    capa.classList.remove("activo");
    void capa.offsetWidth; // forzar reflow
    capa.classList.add("activo");

    fondoIndex = (fondoIndex + 1) % fondos.length;
  }

  cambiarFondo();
  setInterval(cambiarFondo, 8000);
}
	