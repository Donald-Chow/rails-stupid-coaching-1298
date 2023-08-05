import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chat"

export default class extends Controller {
  static targets = ["input", "messages", "waiting"]
  connect() {
  }

  reply(event) {
    if (event.key==='Enter'){
      const input = this.inputTarget.value
      this.inputTarget.value = ""
      fetch(`answer?question=${input}`, {
        method: "GET",
        headers: { "Accept": "application/json" }})
        .then(response => response.json())
        .then((data)=> {
          this.messagesTarget.insertAdjacentHTML('beforeend', data.question);
          this.messagesTarget.scrollTop = this.messagesTarget.scrollHeight;
          this.waitingTarget.innerText = "Coach is typing...";
          setTimeout(() => {
          this.waitingTarget.innerText = "";
          this.messagesTarget.insertAdjacentHTML('beforeend', data.answer);
          this.messagesTarget.scrollTop = this.messagesTarget.scrollHeight}, 1500)
      })
    }
  }
}
