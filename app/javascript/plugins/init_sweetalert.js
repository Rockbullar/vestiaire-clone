import Swal from 'sweetalert2';

const initNewItemSweetalert = ( options = {}) => {
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

const initAddToCartSweetalert = (options = {}) => {
  const swalButton = document.querySelector('#add-to-cart');
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', (e) => {
      e.preventDefault()
      alert(e)
      Swal.fire({
        title: 'Item added to cart',
        showCancelButton: true,
        confirmButtonText: `Checkout`,
        cancelButtonText: `Continue Shopping`,
      })
        .then((result) => {
          if (result.isConfirmed) {
            // document.location.href = "/cart"
            alert('aaa')
          } else if (result.isCancelled) {
          }

        });;
    });
  }
};

export { initNewItemSweetalert, initAddToCartSweetalert };
