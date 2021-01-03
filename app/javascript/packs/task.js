import Vue from 'vue';
import Router from './router/router'
import Header from "../header.vue";
import Vuetify from "vuetify";
import "vuetify/dist/vuetify.min.css";
import VueAxiosPlugin from "./plugins/vue-axios";
import axios from "axios";
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'


Vue.use(BootstrapVue)
Vue.use(VueAxiosPlugin, { axios: axios })
Vue.use(Vuetify);
const vuetify = new Vuetify();



var app = new Vue({
  vuetify,
  router: Router,
  el: '#app',
  components: {
      'nnn': Header,
  }
});

  