// JS/app.js
// ----------------------------------------------------
// Script simple y claro para tu proyecto:
// - Reloj del navbar (HH:MM:SS + AM/PM, con pequeño efecto)
// - Fade-in al hacer scroll (.fade.show de Bootstrap)
// - Contadores que suben cuando aparecen
// ----------------------------------------------------

document.addEventListener('DOMContentLoaded', () => {
  initClock();
  initReveal();
  initCounters();
});

// -------------------------
// 1) Reloj Píldoras Navbar
// -------------------------
function initClock() {
  const h     = document.getElementById('ck-h');
  const m     = document.getElementById('ck-m');
  const s     = document.getElementById('ck-s');
  const ampm  = document.getElementById('ck-ampm');
  const pills = document.getElementById('clockPills');

  // Si esta página no tiene reloj (p.ej. no cargaste navbar.jspf), salimos
  if (!h || !m || !s || !ampm) return;

  let flip = false; // alterna colores H/M cada minuto
  const pad = n => String(n).padStart(2, '0');

  function fechaLarga(d) {
    return d.toLocaleDateString('es-PE', {
      weekday: 'long', year: 'numeric', month: 'long', day: 'numeric'
    });
  }

  function tick() {
    const d = new Date();
    let hh = d.getHours();
    const mm = d.getMinutes();
    const ss = d.getSeconds();

    ampm.textContent = (hh >= 12 ? 'PM' : 'AM');
    hh = hh % 12 || 12;

    h.textContent = pad(hh);
    m.textContent = pad(mm);
    s.textContent = pad(ss);

	
    // Cada minuto, intercambia rojo/azul en H y M
    if (ss === 0) {
      flip = !flip;
      h.classList.toggle('bg-danger',  flip);
      h.classList.toggle('bg-primary', !flip);
      m.classList.toggle('bg-primary',  flip);
      m.classList.toggle('bg-danger',  !flip);
    }

    // Tooltip con fecha larga (si Bootstrap está cargado)
    if (pills && window.bootstrap && bootstrap.Tooltip) {
      const title = fechaLarga(d);
      pills.setAttribute('title', title);
      const t = bootstrap.Tooltip.getInstance(pills) || new bootstrap.Tooltip(pills);
      t.setContent({ '.tooltip-inner': title });
    }
  }

  tick();
  setInterval(tick, 1000);
}

// -------------------------
// 2) Fade-in al hacer scroll
// -------------------------
function initReveal() {
  const els = document.querySelectorAll('.js-reveal'); // en HTML: class="fade js-reveal"
  if (!els.length) return;

  // Fallback si no hay IntersectionObserver
  if (!('IntersectionObserver' in window)) {
    els.forEach(el => el.classList.add('show'));
    return;
  }

  const obs = new IntersectionObserver(entries => {
    entries.forEach(en => {
      if (en.isIntersecting) {
        en.target.classList.add('show'); // .fade.show -> transición de opacidad de Bootstrap
        obs.unobserve(en.target);
      }
    });
  }, { threshold: 0.2 });

  els.forEach(el => obs.observe(el));
}

// -------------------------
// 3) Contadores al aparecer
// -------------------------
function initCounters() {
  const nums = document.querySelectorAll('[data-count]');
  if (!nums.length) return;

  // Fallback sin IO
  if (!('IntersectionObserver' in window)) {
    nums.forEach(el => el.textContent = el.dataset.count || '0');
    return;
  }

  const obs = new IntersectionObserver(entries => {
    entries.forEach(en => {
      if (!en.isIntersecting) return;

      const el = en.target;
      if (el.dataset.started) return;  // evita doble inicio
      el.dataset.started = '1';

      const target = parseInt(el.dataset.count, 10) || 0;
      let n = 0;
      const step = Math.max(1, Math.floor(target / 60)); // ~60 pasos
      const timer = setInterval(() => {
        n += step;
        if (n >= target) { n = target; clearInterval(timer); }
        el.textContent = n;
      }, 30);

      obs.unobserve(el);
    });
  }, { threshold: 0.6 });

  nums.forEach(el => obs.observe(el));
}
