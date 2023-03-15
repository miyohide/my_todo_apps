// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";
import * as bootstrap from "bootstrap"; // eslint-disable-line no-unused-vars
import showGantt from "./controllers/todo";

const todoIndex = document.getElementById('todos_index');

if (todoIndex) {
  showGantt();  
};
