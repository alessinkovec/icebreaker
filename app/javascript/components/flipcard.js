const card = document.querySelector("#myCard")
const btnFlip = document.querySelector(".btn-flip")
const backFlip = document.querySelector(".back-link")


const flipcard = () => {
  card.addEventListener('click', (e) => {
    document.querySelector('.flip-container').classList.toggle("flip");
  })
  btnFlip.addEventListener('click', (e) => {
     document.querySelector('.flip-container').classList.toggle("flip");
  })
  backFlip.addEventListener('click', (e) => {
    e.preventDefault();
     document.querySelector('.flip-container').classList.toggle("flip");
  })
}

export { flipcard }
