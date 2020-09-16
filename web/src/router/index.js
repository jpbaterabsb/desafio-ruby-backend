import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/lojas",
    name: "Lojas",
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/Lojas.vue"),
  },
  {
    path: "/lojas/:id/registros",
    name: "RegistrosLoja",
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/RegistrosLoja.vue"),
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
