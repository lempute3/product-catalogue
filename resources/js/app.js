import './bootstrap';

import App from './layouts/App.vue'
import { createApp } from 'vue';
import { registerPlugins } from './plugins'


const app = createApp(App)
registerPlugins(app)

app.config.globalProperties.$appName = import.meta.env.VITE_APP_NAME;
app.mount("#app")