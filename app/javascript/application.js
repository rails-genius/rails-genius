import { createApp } from 'vue';
import "@hotwired/turbo-rails";
import MatestackUiVueJs from 'matestack-ui-vuejs';

const appInstance = createApp({});

document.addEventListener('turbo:load', () => {
    MatestackUiVueJs.mount(appInstance);
});