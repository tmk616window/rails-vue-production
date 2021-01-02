import Vue from 'vue';
import Router from './router/router'
import Header from "../header.vue";
import Vuetify from "vuetify";
import "vuetify/dist/vuetify.min.css";



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

  