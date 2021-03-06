import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import createPersistedState from 'vuex-persistedstate'



Vue.use(Vuex)



export default new Vuex.Store({
  plugins: [createPersistedState()],
  state: {
    user: [],
    signin: false,
    a: true
    // signin: 'aa',
    
  },
  created(){

  },
  mutations: {  
    getUser(state, user){
      state.user = user
    },
    deleteUser(state, user){
      state.user = []
    },
    Signined(state, signin) {
      state.signin = signin
    }
    // Signined(state, signin) {
    //   state.signin =! signin
    // }
  },
  actions: {
    async isLoggedIn ({commit}, state, signin) {
        await axios.get('/api/sessions')
        .then(res => {
        commit('getUser', res.data)
        })
    },   
    async logout({commit}, state, id, signin) {
        await axios.delete('/api/sessions/' + this.getters.login.id)
            .then(response => {
              commit('deleteUser')
              axios.delete('/api/sessions/')
                //ログインページに戻す
            })
            // .catch(function (error) {
            //   commit('deleteUser')
            //   // state.signin = !state.signin
            // });
        },  
  },

// export const actions = {
//   async getList () {
//     const res = await this.$axios.$get('/api/todos')
//     commit("setList", res)
//   }
// }
  getters:{
    login: state => {
      return state.user
    },
    signined: state => {
      return state.signin
    },
    a(state) {
      return state.a;
    }
  }
})
