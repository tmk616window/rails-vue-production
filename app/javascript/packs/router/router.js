import Vue from 'vue'
import VueRouter from 'vue-router'
import Task from '../../task.vue'

import Show from '../components/show.vue'
import Signup from '../components/signup.vue'
import Login from '../components/login.vue'
import Profile from '../components/profile.vue'


Vue.use(VueRouter)

const router = new VueRouter({
  mode: 'history',
  routes: [
    { path: '/login', component: Login },
    { path: '/signup', component: Signup },
    { path: '/', component: Task },
    {
      path: '/:taskId',
      name: 'task',
      component: Show
    },
    {
      path: '/profile/:userId',
      name: 'user_profile',
      component: Profile
    }

  ],
})
 
export default router;