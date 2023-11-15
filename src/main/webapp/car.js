$(function() {
    var startDate = null;
    var endDate = null;
    var carID = $("#carID").val();
    var pricePerDay = parseInt($("#price").text());

    $("#date-range").datepicker({
        dateFormat: 'yy-mm-dd',
        minDate: 0,
        maxDate: '+1y',
        beforeShowDay: function(date) {
            var reservedDates = getReservedDates(); // 예약된 날짜 가져오기
            var currentDate = formatDate(date);

            if (reservedDates.includes(currentDate)) { // 예약된 날짜인 경우
                return [false, "date-range-selected"];
            }

            if (startDate && endDate) {
                var startTimestamp = startDate.getTime();
                var endTimestamp = endDate.getTime();
                var currentTimestamp = date.getTime();

                if (currentTimestamp >= startTimestamp && currentTimestamp <= endTimestamp) {
                    return [false, "date-range-selected"];
                }

                var disabled = false;
                var loopDate = new Date(startDate);

                while (loopDate <= endDate) {
                    var loopTimestamp = loopDate.getTime();
                    if (loopTimestamp === currentTimestamp) {
                        disabled = true;
                        break;
                    }
                    loopDate.setDate(loopDate.getDate() + 1);
                }

                if (disabled) {
                    return [false, "date-range-selected"];
                }
            }

            return [true, ""];
        },

        onSelect: function(selectedDate) {
            if (!startDate) {
                startDate = new Date(selectedDate);
                $("#reservation-days").text("0");
                $("#total-price").text("0");
            } else if (!endDate) {
                endDate = new Date(selectedDate);
                var diffTime = endDate.getTime() - startDate.getTime();
                var diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));

                if (diffDays < 0) {
                    alert("잘못된 날짜 선택입니다. 다시 선택해주세요.");
                    resetDateSelection();
                    return;
                }

                $("#reservation-days").text(diffDays);
                $("#total-price").text(diffDays * pricePerDay);
                $("#reserve-button").prop("disabled", false);
                $(".ui-datepicker-calendar").find('td').unbind('mouseenter').unbind('mouseleave');
            }
        }
    });

    function formatDate(date) {
        var year = date.getFullYear();
        var month = (date.getMonth() + 1).toString().padStart(2, '0');
        var day = date.getDate().toString().padStart(2, '0');
        return year + "-" + month + "-" + day;
    }

    function resetDateSelection() {
        startDate = null;
        endDate = null;
        $("#reservation-days").text("0");
        $("#total-price").text("0");
        $("#reserve-button").prop("disabled", true);
        $(".ui-datepicker-calendar").find('td').unbind('mouseenter').unbind('mouseleave');
        $("#date-range").datepicker("refresh");
    }

    function reserve() {
        if (!loggedIn) {
            alert("로그인 하셔야 합니다.");
            window.location.href = "login.jsp";
            return;
        }

        if (startDate && endDate) {
            var startDateStr = formatDate(startDate);
            var endDateStr = formatDate(endDate);
            var totalprice = $("#total-price").text();

            $.ajax({
                type: "POST",
                url: "reservationAction.jsp",
                data: {
                    action: "reserve",
                    startDate: startDateStr,
                    endDate: endDateStr,
                    userID: userID,
                    carID: carID,
                    totalPrice: totalprice
                },
                success: function(response) {
                    alert(response);
                },
                error: function(xhr, status, error) {
                    alert("Reservation failed: " + error);
                }
            });
        }
    }
    
    
    $("#reserve-button").click(reserve);

    $("#reset-button").click(function() {
        resetDateSelection();
    });

function getReservedDates() {
        var reservedDates = [];

        $.ajax({
            type: "GET",
            url: "getReservedDates.jsp",
            data: {
                carID: carID,
            },
            async: false,
            success: function(response) {
                reservedDates = JSON.parse(response);
            },
            error: function(xhr, status, error) {
                alert("Error fetching reserved dates: " + error);
            }
        });

        return reservedDates;
    }
});





// 모달 및 캐러셀 스크립트
var modal = document.getElementById("myModal");
var images = document.querySelectorAll(".carimage2_img6 img"); // 이미지 선택 수정
var closeBtn = document.getElementsByClassName("close")[0];

// 이미지 클릭 시 모달 표시
for (var i = 0; i < images.length; i++) {
	images[i].addEventListener("click", function() {
		modal.style.display = "block";
	});
}

// 모달 닫기 버튼 클릭 시 모달 닫기
closeBtn.addEventListener("click", function() {
	modal.style.display = "none";
});

// 모달 바깥 영역 클릭 시 모달 닫기
window.addEventListener("click", function(event) {
	if (event.target == modal) {
		modal.style.display = "none";
	}
});
