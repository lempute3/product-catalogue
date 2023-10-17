import vuetify from './vuetify'
import router from '../router/router.js';
import mitt from 'mitt'

export function registerPlugins (app) {
  const emitter = mitt();
  
  app.provide('emitter', emitter);
  app.config.globalProperties.emitter = emitter;
  app
    .use(vuetify)
    .use(router)
}
