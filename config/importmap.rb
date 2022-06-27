# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true

if Rails.env.production? || Rails.env.staging?
  pin 'vue', to: 'https://ga.jspm.io/npm:vue@3.2.31/dist/vue.esm-browser.prod.js'
else
  pin 'vue', to: 'https://ga.jspm.io/npm:vue@3.2.31/dist/vue.esm-browser.js'
end
pin 'matestack-ui-vuejs', to: 'https://cdn.jsdelivr.net/npm/matestack-ui-vuejs@3.1.0/dist/matestack-ui-vuejs.esm.js'
