/* ============================================================
   amitwebsite.online — Amit Maurya Portfolio
   main.js — Hamburger menu toggle only
   ============================================================ */

document.addEventListener('DOMContentLoaded', function () {
  const hamburger = document.getElementById('hamburger');
  const navMobile = document.getElementById('nav-mobile');

  if (hamburger && navMobile) {
    hamburger.addEventListener('click', function () {
      navMobile.classList.toggle('open');
    });

    /* Close mobile menu when a link is clicked */
    navMobile.querySelectorAll('a').forEach(function (link) {
      link.addEventListener('click', function () {
        navMobile.classList.remove('open');
      });
    });
  }
});
