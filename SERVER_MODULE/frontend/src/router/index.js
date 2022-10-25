import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import CreateForm from '../views/CreateForm.vue'
import DetailForm from '../views/DetailForm.vue'
import Forbidden from '../views/Forbidden.vue'
import ManageForm from '../views/ManageForm.vue'
import NotFound from '../views/NotFound.vue'
import Responses from '../views/Responses.vue'
import SubmitForm from '../views/SubmitForm.vue'

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView,
    meta: {
      auth: false
    }
  },
  {
    path: '/createForm',
    name: 'createForm',
    component: CreateForm,
    meta: {
      auth: true
    }
  },
  {
    path: '/detailForm/:slug',
    name: 'detailForm',
    component: DetailForm,
    meta: {
      auth: true
    }
  },
  {
    path: '/forbidden',
    name: 'forbidden',
    component: Forbidden,
    meta: {
      auth: false
    }
  },
  {
    path: '/manageForm',
    name: 'manageForm',
    component: ManageForm,
    meta: {
      auth: true
    }
  },
  {
    path: '/notFound',
    name: 'notFound',
    component: NotFound,
    meta: {
      auth: false
    }
  },
  {
    path: '/responses',
    name: 'responses',
    component: Responses,
    meta: {
      auth: true
    }
  },
  {
    path: '/submitForm',
    name: 'submitForm',
    component: SubmitForm,
    meta: {
      auth: true
    }
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

router.beforeEach((to, from, next) => {
  if(to.meta.auth && (!localStorage.getItem('token') || localStorage.getItem('token') == undefined)){
    router.back()
  }else if(!to.meta.auth && (localStorage.getItem('token') && localStorage.getItem('token') != undefined)){
    router.back()
  }else{
    next()
  }
})

export default router
