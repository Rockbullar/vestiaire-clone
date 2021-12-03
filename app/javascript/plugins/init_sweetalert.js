import Swal from 'sweetalert2';

const initNewItemSweetalert = () => {
  const swalButton = document.querySelector('#new_item_submit');
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', (e) => {
      e.preventDefault()
      Swal.fire({
        title: 'Are you sure you want to list this',
        showCancelButton: true,
        confirmButtonText: `List Item`,
        cancelButtonText: `Cancel`,
      })
        .then((result) => {
          if (result.isConfirmed) {
            // document.location.href = "/user_items"
            $('#new_item')[0].submit()

          } else if (result.isCancelled) {
          }

      });;
    });
  }
};

const initAddToCartSweetalert = () => {
  const swalButton = document.querySelector('#add-to-cart');
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', (e) => {
      e.preventDefault()
      // link_to is triggering on click and bypassing the eventlistener
      Swal.fire({
        title: 'Item added to cart',
        showCancelButton: true,
        confirmButtonText: `Checkout`,
        cancelButtonText: `Continue Shopping`,
      })
        .then((result) => {
          if (result.isConfirmed) {
            // document.location.href = "/cart"
          } else if (result.isCancelled) {
          }

        });;
    });
  }
};

export { initNewItemSweetalert, initAddToCartSweetalert };
