import { Controller } from "@hotwired/stimulus"
import axios from 'axios';
import Gantt from "frappe-gantt";

// Connects to data-controller="show-gantt"
export default class extends Controller {
  ganttObj = null;

  async connect() {
    const todoData = await this.todos();
    this.ganttObj = new Gantt('#gantt', todoData, {
      on_click: function (task) {
        console.log(task);
      },
      on_progress_change: function(task, progress) {
        const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
        const todo_id = task.id.split('_')[1];
        axios.put(`/todos/${todo_id}.json`, {
          progress: task.progress
        }, {
          headers: {
            'X-CSRF-Token' : csrfToken
          }
        });
      }
    });
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

  updateTodo(updatedData) {
    console.log(updatedData);
  }

  week() {
    this.ganttObj.change_view_mode('Week');
  }

  day() {
    this.ganttObj.change_view_mode('Day');
  }

  month() {
    this.ganttObj.change_view_mode('Month');
  }
}
