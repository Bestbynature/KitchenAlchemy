window.addEventListener(('turbo:load'), () => {
  document.addEventListener('submit', (event) => {
    if (event.target && event.target.className === 'delete-alertbox') {
      event.preventDefault()
      Swal.fire({
          title: 'Are you sure?',
          text: "You won't be able to revert this!",
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Yes, delete it!'
      })
        .then((result) => {
          if (result.isConfirmed) {
            document.querySelector('.delete-alertbox').submit()
            Swal.fire({
               title: 'Deleted!',
                text: 'The item has been deleted.',
                timer: 3000,
                timerProgressBar: true,
                icon: 'success'
            })
          }else {
            Swal.fire({
              title: 'Transaction Cancelled',
              text: 'Your item is safe',
              timer: 2000,
              timerProgressBar: true,
              icon: 'info'
            })
          }
        })
        .catch(event.preventDefault())
    }
  })
})