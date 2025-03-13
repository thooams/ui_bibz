// import * as bootstrap from "bootstrap";
// (function ($bs) {
//   const CLASS_NAME = "has-child-dropdown-show";
//   $bs.Dropdown.prototype.toggle = (function (_orginal) {
//     return function () {
//       document.querySelectorAll("." + CLASS_NAME).forEach(function (e) {
//         e.classList.remove(CLASS_NAME);
//       });
//       let dd = this._element
//         .closest(".dropdown")
//         ?.parentNode?.closest(".dropdown");
//       for (; dd && dd !== document; dd = dd.parentNode.closest(".dropdown")) {
//         dd.classList.add(CLASS_NAME);
//       }
//       return _orginal.call(this);
//     };
//   })($bs.Dropdown.prototype.toggle);
//
//   document.querySelectorAll(".dropdown").forEach(function (dd) {
//     dd.addEventListener("hide.bs.dropdown", function (e) {
//       if (this.classList.contains(CLASS_NAME)) {
//         this.classList.remove(CLASS_NAME);
//         e.preventDefault();
//       }
//       e.stopPropagation(); // do not need pop in multi level mode
//     });
//   });
//
//   // for hover
//   document
//     .querySelectorAll(".dropdown-hover, .dropdown-hover-all .dropdown")
//     .forEach(function (dd) {
//       dd.addEventListener("mouseenter", function (e) {
//         let toggle = e.target.querySelector(
//           ':scope>[data-bs-toggle="dropdown"]',
//         );
//         if (!toggle.classList.contains("show")) {
//           $bs.Dropdown.getOrCreateInstance(toggle).toggle();
//           dd.classList.add(CLASS_NAME);
//           $bs.Dropdown.clearMenus();
//         }
//       });
//       dd.addEventListener("mouseleave", function (e) {
//         let toggle = e.target.querySelector(
//           ':scope>[data-bs-toggle="dropdown"]',
//         );
//         if (toggle.classList.contains("show")) {
//           $bs.Dropdown.getOrCreateInstance(toggle).toggle();
//         }
//       });
//     });
// })(bootstrap);

import * as bootstrap from "bootstrap";

function initDropdowns() {
  const CLASS_NAME = "has-child-dropdown-show";
  document.querySelectorAll("." + CLASS_NAME).forEach((e) => {
    e.classList.remove(CLASS_NAME);
  });

  document.querySelectorAll(".dropdown").forEach((dd) => {
    dd.addEventListener("hide.bs.dropdown", function (e) {
      if (this.classList.contains(CLASS_NAME)) {
        this.classList.remove(CLASS_NAME);
        e.preventDefault();
      }
      e.stopPropagation();
    });
  });

  // for hover
  document
    .querySelectorAll(".dropdown-hover, .dropdown-hover-all .dropdown")
    .forEach((dd) => {
      dd.addEventListener("mouseenter", function (e) {
        let toggle = e.target.querySelector(
          ':scope>[data-bs-toggle="dropdown"]',
        );
        if (!toggle.classList.contains("show")) {
          bootstrap.Dropdown.getOrCreateInstance(toggle).toggle();
          dd.classList.add(CLASS_NAME);
          bootstrap.Dropdown.clearMenus();
        }
      });

      dd.addEventListener("mouseleave", function (e) {
        let toggle = e.target.querySelector(
          ':scope>[data-bs-toggle="dropdown"]',
        );
        if (toggle.classList.contains("show")) {
          bootstrap.Dropdown.getOrCreateInstance(toggle).toggle();
        }
      });
    });
}

// Exécute le script au chargement initial
document.addEventListener("DOMContentLoaded", initDropdowns);

// Ré-exécute le script après chaque changement de page avec Turbo
document.addEventListener("turbo:load", initDropdowns);
