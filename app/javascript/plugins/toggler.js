
function toggleEvent() {
  let x = document.getElementById("myBookings");
  console.log(x.innerHTML)
  if (x.innerHTML === "") {
    x.innerHTML = "Swapped text!";
  } else {
    x.innerHTML = "Hello";
  }
}
