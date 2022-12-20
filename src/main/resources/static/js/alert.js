//원하는 버튼에 id적용 $("#....")
//  ex ) <button id="alertStart">승인</button>

$().ready(function () {
    $("#alertStart").click(function () {
        Swal.fire({
            icon: 'success',
            title: '승인이 완료되었습니다.',
            text: 'success.',
        });
    });
});

$().ready(function () {
    $("#errorStart").click(function () {
        Swal.fire({
            icon: 'error',
            title: '올바르지 않습니다.',
            text: 'error.',
        });
    });
});

$().ready(function () {
    $("#confirmStart").click(function () {
        Swal.fire({
            title: '정말로 그렇게 하시겠습니까?',
            text: "It cannot be re-delivered.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예',
            cancelButtonText: '아니오'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire(
                    '승인이 완료되었습니다.',
                    'success',
                    'success'
                )
            }
        })
    });
});

// $().ready(function () {
//     $("#drug").click(function () {
//         Swal.fire({
//             icon: 'success',
//             title: '약 처방이 완료되었습니다.',
//             text: '배송정보를 확인해주세요.',
//             timer: 40000,
//             timerProgressBar: true
//         });
//     });
// });