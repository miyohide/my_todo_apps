import { Controller } from "@hotwired/stimulus"
import Gantt from "frappe-gantt";

// Connects to data-controller="gantt"
export default class extends Controller {
  ganttObj = null;

  connect() {
    this.ganttObj = new Gantt('#ganttchart', JSON.parse(document.getElementById('gantt').dataset.todos));
  }

  week() {
    this.ganttObj.change_view_mode('Week');
  }

  day() {
    console.log(this.ganttObj);
    this.ganttObj.change_view_mode('Day');
  }

  month() {
    this.ganttObj.change_view_mode('Month');
  }
}
