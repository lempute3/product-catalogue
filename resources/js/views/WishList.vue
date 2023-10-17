
<template>
  <div v-if="wishlist < 1" class="d-flex flex-column justify-center align-center pt-5 mt-10 font-weight-bold">
        <h1>Wishlist is empty</h1>
  </div>
  <div v-else class="d-flex flex-column justify-center align-center pt-15 product-container">
    <h1>Wishlist <v-btn size="small" icon="mdi-trash-can-outline" variant="text"></v-btn></h1>
    <v-virtual-scroll :items="wishlist" class="d-flex justify-center">
      <template v-slot:default="{ item }">
        <v-card class="d-flex flex-row mb-4 product" variant="tonal">
          <img :src="'/storage/images/products/' + '/' + item.type_id + '/' + item.images[0].image_path">
          <v-card-item>
            <v-card-title>{{ item.name }}</v-card-title>
            <v-card-subtitle class="d-flex">
              <span>{{ item.price }} &euro;</span>
            </v-card-subtitle>
            <v-card-actions>
              <v-btn @click="addProductToCart(item)" size="small" variant="text" icon="mdi-cart-outline" class="p-2"></v-btn>
              <v-btn @click="removeProduct(item.id)" size="small" variant="text" icon="mdi-minus-circle-outline" class="p-2"></v-btn>
            </v-card-actions>
          </v-card-item>
        </v-card>
      </template>
    </v-virtual-scroll>
  </div>
</template>

<script>
import { ref, onMounted, inject } from 'vue';
import { addToCart, getCartItemCount, getCartTotalPrice } from '../services/cartService';
import { getWishlist, removeFromWishlist } from '../services/wishlistService';

export default {
  setup() {
    const emitter = inject('emitter');
    const wishlist = ref([]);

    const refreshWishlist = () => {
      wishlist.value = getWishlist();
    };

    const addProductToCart = (product) => {
      addToCart(product)
      emitter.emit('cart-change', getCartItemCount());
      emitter.emit('cart-price-change', getCartTotalPrice());
    };

    const removeProduct = (productId) => {
      removeFromWishlist(productId);
      refreshWishlist();
      emitter.emit('cart-change', getCartItemCount());
    };

    onMounted(() => {
      refreshWishlist();
    });

    return {
      wishlist,
      addProductToCart,
      removeProduct,
    };
  },
};
</script>

<style scoped>
.product-container img {
  width: 40% !important;
}

.product-container .v-card {
  width: 600px !important;
  cursor: default !important;
}
</style>





