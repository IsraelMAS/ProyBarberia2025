// Abre un modal con la descripción cuando haces click en la card (o en "Ver más")
document.addEventListener('DOMContentLoaded', () => {
  const cards   = document.querySelectorAll('.barbero-item .barber-card, .barbero-item .btnVerMas');
  const modalEl = document.getElementById('modalBarbero');
  if (!cards.length || !modalEl) return;

  const modal = new bootstrap.Modal(modalEl);

  // Atajos a campos del modal
  const $ = (id) => document.getElementById(id);
  const mTitulo = $('modalTitulo');
  const mImg    = $('modalImg');
  const mEsp    = $('modalEspecialidad');
  const mExp    = $('modalExperiencia');
  const mRate   = $('modalRating');
  const mRes    = $('modalResumen');
  const mDet    = $('modalDetalle');
  const mHor    = $('modalHorario');
  const mPre    = $('modalPrecio');

  const nombreEsp = {
    degradados: 'Degradados',
    barbas:     'Barbas',
    clasicos:   'Clásicos',
    disenos:    'Diseños',
    tinturas:   'Tinturas'
  };

  function abrirDesde(item){
    const d = item.dataset;

    // Fallbacks simples por si faltan data-*
    const card   = item.querySelector('.barber-card');
    const nombre = d.nombre || card?.querySelector('.card-title')?.textContent || 'Barbero';
    const img    = d.img || card?.querySelector('img')?.src || '';
    const espKey = d.especialidad || 'degradados';
    const exp    = d.experiencia || '';
    const rate   = d.rating || '';
    const res    = d.resumen || card?.querySelector('.card-text')?.textContent || '';
    const det    = d.detalle || '';
    const hor    = d.horario || '';
    const pre    = d.precio || '';

    if (mTitulo) mTitulo.textContent = nombre;
    if (mImg)    mImg.src = img;

    if (mEsp){
      mEsp.textContent = nombreEsp[espKey] || 'Especialidad';
      mEsp.classList.remove('bg-primary','bg-danger');
      mEsp.classList.add((espKey === 'barbas' || espKey === 'disenos') ? 'bg-danger' : 'bg-primary');
    }

    if (mExp)  mExp.textContent  = exp ? `${exp} años` : '';
    if (mRate) mRate.textContent = rate ? `★ ${rate}` : '';
    if (mRes)  mRes.textContent  = res;
    if (mDet)  mDet.textContent  = det;
    if (mHor)  mHor.textContent  = hor;
    if (mPre)  mPre.textContent  = pre;

    modal.show();
  }

  // Click en cards y en "Ver más"
  cards.forEach(el => {
    el.addEventListener('click', (e) => {
      e.preventDefault();
      const item = el.closest('.barbero-item');
      if (item) abrirDesde(item);
    });
  });
}); 
