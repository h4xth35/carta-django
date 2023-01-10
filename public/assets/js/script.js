const base = location.protocol + '//' + location.host;

$(document).ready(function (params) {
    $('.eliminar').on('click', function (e) {
        e.preventDefault()

        let $boton = $(this)
        let url = $boton.attr('data-link')
        let title = $boton.attr('data-target')

        Swal.fire({
            title: 'Cuidado',
            text: title,
            icon: 'warning',
            showCancelButton: true,
            background: '#0d0d0de8',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si, eliminar!'
          }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = base+'/'+url
            }
          })
        
    })


})