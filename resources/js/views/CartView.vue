
<template>
    <div v-if="cartContent < 1" class="d-flex flex-column justify-center align-center pt-5 mt-10 font-weight-bold">
        <h1>Cart is empty</h1>
    </div>
    <div v-else class="d-flex flex-column justify-center align-center pt-5 mt-10 font-weight-bold product-container">
        <h1>Cart <v-btn size="small" icon="mdi-trash-can-outline" variant="text"></v-btn></h1>
        <v-virtual-scroll :items="cartContent" class="d-flex justify-center">
            <template v-slot:default="{ item }">
                <v-card class="d-flex flex-row mb-4 product" variant="tonal">
                    <img :src="'/storage/images/products/' + '/' + item.type_id + '/' + item.images[0].image_path">
                    <v-card-item>
                        <v-card-title>{{ item.name }}</v-card-title>
                        <v-card-subtitle><span>{{ item.price }} &euro;</span></v-card-subtitle>
                        <v-card-actions>
                            <input v-model="item.quantity" @input="updateQuantity(item)" type="number" min="1" max="99">
                            <v-btn size="small" variant="text" icon="mdi-minus-circle-outline" class="p-2" @click="removeProduct(item.id)"></v-btn>
                        </v-card-actions>
                    </v-card-item>
                </v-card>
            </template>
        </v-virtual-scroll>
        <div class="checkout-container">
            <div class="d-flex">
                <span>Total : </span>
                <span class="ml-auto">{{ cartTotalPrice }} &euro;</span>
            </div>
            <div class="d-flex justify-center mt-5">
                <v-btn variant="tonal" class="checkout-btn">Procced to checkout</v-btn>
            </div>
        </div>
    </div>
</template>
  
<script>
import "../assets/css/cartview.css"
import { inject, ref, onMounted } from 'vue';
import { getCartlist, removeFromCart, getCartItemCount, getCartTotalPrice, saveCartContentToStorage } from '../services/cartService';

export default {
    setup() {
        const emitter = inject('emitter');
        const cartContent = ref([]);
        const cartTotalPrice = ref(0);

        const refreshCartContent = () => {
            cartContent.value = getCartlist();
        };

        const refreshCartTotalPrice = () => {
            cartTotalPrice.value = getCartTotalPrice();
        };

        const removeProduct = (productId) => {
            removeFromCart(productId);
            refreshCartContent();
            refreshCartTotalPrice();
            emitter.emit('cart-change', getCartItemCount());
            emitter.emit('cart-price-change', getCartTotalPrice());
        };

        const updateQuantity = (product) => {
            const productIndex = cartContent.value.findIndex((p) => p.id === product.id);
            if (productIndex !== -1) {
                cartContent.value[productIndex].quantity = parseInt(product.quantity, 10) || 1;
                saveCartContentToStorage(cartContent.value);
                refreshCartTotalPrice();
                emitter.emit('cart-price-change', getCartTotalPrice());
            }
        };

        onMounted(() => {
            refreshCartContent();
            refreshCartTotalPrice();
        });

        return {
            cartContent,
            cartTotalPrice,
            removeProduct,
            updateQuantity,
        };
    },
};
</script>
  
<style scoped>
.product-container img {
    width: 20% !important;
    height: 100px !important;
    padding-top: 25px !important;
}

.product-container .product {
    width: 600px !important;
    cursor: default !important;
}

</style>
  
  
  
  
  
  