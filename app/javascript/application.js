// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "bootstrap"
import "@hotwired/turbo-rails"
import "controllers"

import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

document.addEventListener('turbo:load', () => {
    var collapseElements = [].slice.call(document.querySelectorAll('[data-bs-toggle="collapse"]'))
    collapseElements.map(function (el) {
      return new bootstrap.Collapse(el)
    })
  });
  