import { Controller } from "@hotwired/stimulus"
import Gantt from "frappe-gantt";

// Connects to data-controller="gantt"
export default class extends Controller {
  connect() {
    new Gantt('#ganttchart', JSON.parse(document.getElementById('gantt').dataset.todos));
  }
}
