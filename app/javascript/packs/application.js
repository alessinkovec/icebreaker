import "bootstrap";
import { flipcard } from "../components/flipcard.js"
import { scroll } from "../components/scroll.js"
import { scroll2 } from "../components/scroll.js"
import anime from 'animejs'
import { pagedissolve } from "../components/button.js"


if (document.querySelector('.flip-container')) flipcard();

if (document.querySelector('#scroll')) scroll();
if (document.querySelector('.scroll2')) scroll2();


pagedissolve();

