// app/javascript/controllers/delete_confirm_controller.js
import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"

// data-controller="delete-confirm" に紐づく
export default class extends Controller {
  confirm(event) {
    event.preventDefault() // いきなりフォーム送信させない

    Swal.fire({
      title: "Delete permanently?",
      text: "You can't recover this",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#d33",
      cancelButtonColor: "#6c757d",
      confirmButtonText: "DESTROY",
      cancelButtonText: "Cancel"
    }).then((result) => {
      if (result.isConfirmed) {
        const form = this.element.closest("form")
        if (form) form.requestSubmit()
      }
    })
  }
}
