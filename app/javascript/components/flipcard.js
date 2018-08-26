const card = document.querySelector("#myCard")
const btnFlip = document.querySelector(".btn-flip")
const flipcard = () => {
  card.addEventListener('click', (e) => {
    document.querySelector('.flip-container').classList.toggle("flip");
  })
  btnFlip.addEventListener('click', (e) => {
    setTimeout(function(){
     document.querySelector('.flip-container').classList.toggle("flip");
   }, 700);
  })
}

export { flipcard }
