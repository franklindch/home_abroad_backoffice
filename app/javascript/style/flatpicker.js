import flatpickr from "flatpickr"
import "flatpickr/dist/themes/material_blue.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

function calendar() {
  flatpickr("#range_start", {
    altInput: true,
    plugins: [new rangePlugin({ input: "#range_end"})]
  })
}


function calendarBirthDate() {
  flatpickr(".calendar_birth_date", {
    altInput: true
  })
}

export { calendar, calendarBirthDate };
