
<template>
    <v-app-bar elevation="3" class="px-10">
        <v-avatar :tile="true"><img src="/images/logo.svg" alt="logo"></v-avatar>
        <router-link to="/" class="ml-5 category-drawer-title">
            <v-toolbar-title>
                <v-toolbar-title><b>{{ this.$appName }}</b></v-toolbar-title>
            </v-toolbar-title>
        </router-link>

        <v-spacer></v-spacer>
        <div class="nav-btns pr-5">
            <v-btn @click.stop="categoryDrawer = !categoryDrawer" variant="text" size="small" rounded="xs" class="mx-1" prepend-icon="mdi-arrow-down" to="/">Categories</v-btn>
            <v-btn variant="text" size="small" rounded="xs" class="mx-1" prepend-icon="mdi-heart-outline" to="/wishlist">Wishlist</v-btn>
            <v-btn variant="text" size="small" rounded="xs" class="mx-1" to="/">Home</v-btn>
        </div>

        <v-divider vertical></v-divider>
        <div class="d-flex pl-2 pr-4">
            <v-btn variant="text" icon="mdi-magnify" size="small"></v-btn>
            <v-btn variant="text" icon="mdi-account" size="small"></v-btn>
            <v-badge :model-value="cartItemsCount > 0" :content="cartItemsCount" color="red">
                <v-btn variant="text" icon="mdi-cart-outline" size="small" :to="'/cart'"></v-btn>
            </v-badge>
        </div>
        <v-chip size="small" class="cart-cost"><b>{{ cartItemsPrice }} &euro;</b></v-chip>

    </v-app-bar>

    <v-navigation-drawer v-model="categoryDrawer" elevation="3" class="category-drawer" location="top" temporary>
        <v-list>
            <v-list-item v-for="category in categories" :key="category.id" @click="selectCategory(category.id)">
                <v-list-item-content>
                    <v-list-item-title>{{ category.name }}</v-list-item-title>
                    <v-divider></v-divider>
                </v-list-item-content>
            </v-list-item>
        </v-list>
    </v-navigation-drawer>
</template>

<script>
import { getCartItemCount, getCartTotalPrice } from '../services/cartService';

export default {
    data: () => ({
        categoryDrawer: false,
        cartItemsCount: 0,
        cartItemsPrice: 0.00,
        categories: [],
    }),
    mounted() {

        this.emitter.on('cart-change', (cartContentCount) => {
            this.cartItemsCount = cartContentCount;
        });

        this.emitter.on('cart-price-change', (cartContentPrice) => {
            this.cartItemsPrice = cartContentPrice;
        });

        this.cartItemsCount = getCartItemCount();
        this.cartItemsPrice = getCartTotalPrice();
        this.fetchCategories();
    },
    methods: {
        async fetchCategories() {
            try {
                const response = await axios.get('/api/products/types');
                this.categories = response.data;
            } catch (error) {
                console.error('Error fetching categories:', error);
            }
        },
        selectCategory(categoryId) {
            this.emitter.emit('category-change', categoryId);
        },
    }
}
</script>

<style>
.category-drawer-title {
    color: black;
    text-decoration: none !important;
}

.category-drawer {
    width: 70% !important;
    height: auto !important;
    margin-left: 15%;
}

.category-drawer .v-list {
    display: flex;
    flex-wrap: wrap;
    flex-direction: row;
    justify-content: center;
    gap: 25px;
    padding-top: 10px;
}

.category-drawer .v-list .v-list-item-title {
    color: #3da9fc;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-weight: bold
}

.v-app-bar .nav-btns .v-btn {
    color: #3da9fc;
    font-weight: bold;
}

.v-app-bar .cart-cost {
    color: #4CAFFC;
}

.v-badge__badge {
    position: relative;
    top: 2px;
}
</style>