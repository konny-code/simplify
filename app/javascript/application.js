// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"


// ---- Tooltip init (keep as you already have, just for clarity) ----
document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll("[data-bs-toggle='tooltip']").forEach((el) => {
    new bootstrap.Tooltip(el, {
      trigger: "manual",
      html: true,
      sanitize: false,
      customClass: "simplify-tooltip"
    });

    // show tooltip on hover (desktop)
    el.addEventListener("mouseenter", () => {
      bootstrap.Tooltip.getInstance(el).show();
    });

    // show tooltip on tap (mobile & desktop click)
    el.addEventListener("click", () => {
      bootstrap.Tooltip.getInstance(el).show();
    });
  });
});

// ---- Bookmark click handler (capture phase) ----
function handleBookmarkClick(event) {
  // See *every* click/touch first
  const btn = event.target.closest(".tooltip-bookmark-btn");
  if (!btn) return;

  // Don't let anything else swallow this
  event.stopPropagation();
  event.preventDefault();

  const icon = btn.querySelector("i");
  icon.classList.toggle("fa-regular");
  icon.classList.toggle("fa-solid");

  console.log("Bookmarked:", btn.dataset.surface, btn.dataset.meaning);
}

// Capture phase = true (3rd arg)
document.addEventListener("click", handleBookmarkClick, true);
document.addEventListener("touchend", handleBookmarkClick, true);
