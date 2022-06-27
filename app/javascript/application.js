import { createApp } from 'vue';
import MatestackUiVueJs from 'matestack-ui-vuejs';

const appInstance = createApp({});

document.addEventListener('DOMContentLoaded', () => {
    MatestackUiVueJs.mount(appInstance);
});