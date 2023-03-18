import { Controller } from "@hotwired/stimulus"
import axios from 'axios';
import Gantt from "frappe-gantt";

// Connects to data-controller="show-gantt"
export default class extends Controller {
  connect() {
    this.todos();
  }

  todos() {
    axios.get('/todos.json')
      .then(function (res) {
       console.log(res.data);
       new Gantt('#gantt', res.data);
      })
      .catch(function (error) {
        console.log(error);
      });
  }  
}
