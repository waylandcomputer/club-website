import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
import Members from '../views/Members.vue'
import Project from '../views/Project.vue'
import Signup from '../views/Signup.vue'
import Queue from '../views/Queue.vue'
import Default from '../views/Default.vue'
import aboyer from '../views/aboyer.vue'

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/members',
    name: 'Members',
    component: Members
  },
  {
    path: '/projects',
    name: 'Projects',
    component: Project
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  },
  {
    path: "/join",
    name: "Signup",
    component: Signup,
  },
  {
    path: "/queue",
    name: "Queue",
    component: Queue,
  },
  {
    path: "/members/default",
    name: "Default",
    component: Default,
  },  
  {
    path: "/members/aboyer",
    name: "aboyer",
    component: aboyer,
  },
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
