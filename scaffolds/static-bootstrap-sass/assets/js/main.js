(() => {
  const yearTargets = document.querySelectorAll('[data-current-year]');
  yearTargets.forEach((target) => {
    target.textContent = new Date().getFullYear().toString();
  });

  const menuToggle = document.querySelector('[data-menu-toggle]');
  const menu = document.querySelector('[data-menu]');

  if (menuToggle && menu) {
    menuToggle.addEventListener('click', () => {
      const isOpen = menu.classList.toggle('is-open');
      menuToggle.setAttribute('aria-expanded', isOpen ? 'true' : 'false');
    });
  }
})();
