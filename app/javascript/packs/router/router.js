import Vue from 'vue'
import VueRouter from 'vue-router'
import Task from '../../task.vue'
import Store  from '../store/store.js'
import Show from '../components/show.vue'
import Signup from '../components/signup.vue'
import Login from '../components/login.vue'
import Profile from '../components/profile.vue'


Vue.use(VueRouter)

const router = new VueRouter({
  store: Store,
  mode: 'history',
  routes: [
    { path: '/login',
     component: Login,
     beforeEnter(to, from, next){
      if (Store.state.user.name){
        next({
          path: '/',
          redirect: '/'
        })
      } else {
        next()
      }
    }
  　},
    { path: '/signup', component: Signup },
    { path: '/', component: Task },
    {
      path: '/:taskId',
      name: 'task',
      component: Show,
      beforeEnter(to, from, next){
        if (Store.state.user.name){
          next()
        } else {
          next({
            path: '/login',
            redirect: '/login'
          })
        }
      }
    },
    {
      path: '/profile/:userId',
      name: 'user_profile',
      component: Profile
    }
  ],
})
 
export default router;
