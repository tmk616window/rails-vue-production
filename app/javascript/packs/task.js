import Vue from 'vue';
import Header from "../header.vue";
import Vuetify from "vuetify";
import "vuetify/dist/vuetify.min.css";



Vue.use(Vuetify);
const vuetify = new Vuetify();



var app = new Vue({
  vuetify,
  el: '#app',
  components: {
      'nnn': Header,
  }
});

  