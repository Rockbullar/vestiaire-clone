import Swal from 'sweetalert2';

const initSweetalert = (selector, options = {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('submit', (e) => {
      e.preventDefault()
      Swal.fire(options);
    });
  }
};

export { initSweetalert };
