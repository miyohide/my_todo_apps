import { Controller } from "@hotwired/stimulus"
import axios from 'axios';
import Gantt from "frappe-gantt";

// Connects to data-controller="show-gantt"
export default class extends Controller {
  ganttObj = null;

  async connect() {
    const todoData = await this.todos();
    this.ganttObj = new Gantt('#gantt', todoData);
  }

  async todos() {
    try {
      const res = await axios.get('/todos.json');
      return res.data;
    } catch (error) {
      console.log(error);
      return [];
    }
  }

  week() {
    console.log(this.ganttObj);
    this.ganttObj.change_view_mode('Week');
  }
}
