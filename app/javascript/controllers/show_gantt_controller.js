import { Controller } from "@hotwired/stimulus"
import axios from 'axios';

// Connects to data-controller="show-gantt"
export default class extends Controller {
  connect() {
    this.todos();
  }

  todos() {
    axios.get('/todos.json')
      .then(function (res) {
       console.log(res.data);
      })
      .catch(function (error) {
        console.log(error);
      });
  }  
}
