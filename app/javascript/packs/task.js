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
import Store  from './store/store.js'
import VModal from 'vue-js-modal'


Vue.use(VModal);
Vue.use(BootstrapVue)
Vue.use(VueAxiosPlugin, { axios: axios })
Vue.use(Vuetify);
const vuetify = new Vuetify();



var app = new Vue({
  vuetify,
  store: Store,
  router: Router,
  el: '#app',
  components: {
      'nnn': Header,
  },
  computed:{
    userLogin(){
      return this.$store.getters.login
    }
  }
});

  