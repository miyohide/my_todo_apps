import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-gantt"
export default class extends Controller {
  connect() {
    console.log("hogehoge");
  }
}
