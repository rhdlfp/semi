const reservationForm = document.getElementById("reservation-form");
const dateRangeInput = document.getElementById("date-range");
const selectedDatesDiv = document.getElementById("selected-dates");

const currentDate = new Date();
const oneYearLater = new Date();
oneYearLater.setFullYear(currentDate.getFullYear() + 1);

const options = {
  mode: "range",
  minDate: currentDate,
  maxDate: oneYearLater,
  dateFormat: "Y년 m월 d일",
  onClose: selectedDates => {
    if (selectedDates.length === 2) {
      const [startDate, endDate] = selectedDates;
      dateRangeInput.value = `${startDate.toLocaleDateString('ko-KR')} - ${endDate.toLocaleDateString('ko-KR')}`;
    }
  }
};

flatpickr(dateRangeInput, options);

reservationForm.addEventListener("submit", event => {
  event.preventDefault();

  const selectedDates = dateRangeInput.value.split(" - ");
  const startDate = new Date(selectedDates[0]);
  const endDate = new Date(selectedDates[1]);

  if (startDate <= endDate) {
    const options = { year: 'numeric', month: 'long', day: 'numeric' };
    selectedDatesDiv.innerText = `예약 날짜: ${startDate.toLocaleDateString('ko-KR', options)} - ${endDate.toLocaleDateString('ko-KR', options)}`;
  } else {
    selectedDatesDiv.innerText = "날짜 범위가 올바르지 않습니다.";
  }
});

document.addEventListener("DOMContentLoaded", function () {
  const customDateRangeInput = document.getElementById("custom-date-range");
  const customCheckboxes = document.querySelector(".custom-checkboxes");
  const closeButton = document.getElementById("close-checkboxes");

  customDateRangeInput.addEventListener("focus", function () {
    customCheckboxes.style.display = "block";
  });

  closeButton.addEventListener("click", function () {
    customCheckboxes.style.display = "none";
  });

  customCheckboxes.addEventListener("change", function () {
    const selectedOptions = Array.from(customCheckboxes.querySelectorAll("input[type='checkbox']:checked"))
      .map(checkbox => checkbox.value);

    // 선택된 옵션을 input에 표시
    customDateRangeInput.value = selectedOptions.join(", ");
  });
});