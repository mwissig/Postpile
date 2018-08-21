document.addEventListener("keyup",function(e){
   var key = e.which||e.keyCode;
   switch(key){
      case 37:
      x += 1;
      window.open(`#${x}`,"_self");
      break;
      case 38:
      x += 1;
      window.open(`#${x}`,"_self");
      break;
      case 39:
      x -= 1;
      window.open(`#${x}`,"_self");
      break;
      case 40:
      x -= 1;
      window.open(`#${x}`,"_self");
      break;
   }
});

function hide() {
document.getElementById(`likebutton${x}`).classList.add("hidden");
}

// document.querySelector(`#${x}`).scrollIntoView({
//   behavior: 'smooth'
// });
