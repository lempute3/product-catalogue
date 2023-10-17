import { createRouter, createWebHistory } from 'vue-router';
import ProductList from '../views/ProductList.vue'
import WishList from '../views/WishList.vue'
import CartView from '../views/CartView.vue'

const routes = [
  { 
    path: '/', 
    name: 'home', 
    component: ProductList 
  },
  {
    path: '/wishlist', 
    name: 'wishlist',
    component: WishList 
  },
  {
    path: '/cart',
    name: 'cart',
    component: CartView,
  }
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;