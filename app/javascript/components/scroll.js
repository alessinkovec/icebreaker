const smoothScroll = require('smoothscroll');

const link = document.querySelector('#scroll');
const destination = document.querySelector('.card');

// This function can easily be an onClick handler in React components
const handleClick = function(event) {
  event.preventDefault();
  smoothScroll(destination);
};


function scroll() {
  link.addEventListener('click', handleClick);
}

export { scroll };
