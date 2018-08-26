import "bootstrap";
import { flipcard } from "../components/flipcard.js"
import { scroll } from "../components/scroll.js"

if (document.querySelector('.flip-container')) flipcard();

if (document.querySelector('#scroll')) scroll();


