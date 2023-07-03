import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chart"
export default class extends Controller {
  static values = {
    x: Array,
    y: Array,
    type: String
  }

  connect() {
    new Chart(this.element, {
      type: this.typeValue,
      data: {
        labels: this.xValue,
        datasets: [{
          fill: false,
          lineTension: 0,
          backgroundColor: "rgba(0,0,255,1.0)",
          borderColor: "rgba(0,0,255,0.1)",
          data: this.yValue
        }]
      },
      options: {
        legend: {display: false},
        scales: {
          yAxes: [{ticks: {min: 6, max:100}}],
        }
      }
    });
  }
}
