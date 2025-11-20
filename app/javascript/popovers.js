import * as bootstrap from "bootstrap"

console.log("✅ popovers.js loaded, bootstrap =", bootstrap)

document.addEventListener("turbo:load", () => {
  console.log("✅ turbo:load fired")

  const words = document.querySelectorAll(".simplify-word")
  console.log("✅ found .simplify-word elements:", words.length)

  words.forEach((el) => {
    // Just in case, print one example
    if (!el.dataset.initPopover) {
      console.log("  → initializing popover for:", el.textContent.trim())
    }

    // mark so we don't double-init
    el.dataset.initPopover = "true"

    // Initialize popover with explicit options (click trigger)
    new bootstrap.Popover(el, {
      trigger: "click",
      html: true,
      placement: "top",
      container: "body"
    })
  })
})

// Close popover when the ✕ button is clicked
document.addEventListener("click", (event) => {
  const closeBtn = event.target.closest(".js-word-popover-close")
  if (!closeBtn) return

  const popoverEl = closeBtn.closest(".popover")
  if (!popoverEl) return

  const id = popoverEl.getAttribute("id")
  if (!id) return

  const trigger = document.querySelector(`[aria-describedby='${id}']`)
  if (!trigger) return

  const popover = bootstrap.Popover.getInstance(trigger)
  if (popover) popover.hide()
})
