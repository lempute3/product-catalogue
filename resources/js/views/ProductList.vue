<template>
    <v-alert closable text v-model="showAlert" :type="alertType" :title="alertTitle"></v-alert>
    <div class="d-flex justify-content-start mt-5 pl-10 filter-selection-container">
        <select v-model="selectedSort">
            <option v-for="option in sortOptions" :key="option.value" :value="option.value">{{ option.text }}</option>
        </select>
        <v-btn @click="sortProducts()" icon="mdi-sort" size="small" variant="text"></v-btn>
    </div>
    <v-container class="product-container pt-10">
        <v-row>
            <v-col v-for="product in paginatedProducts" :key="product.id" cols="4" sm="2" md="2" lg="3" class="d-flex justify-center align-center">
                <v-card variant="tonal" class="product">
                    <img :src="'/storage/images/products/' + product.type_id + '/' + product.images[0].image_path">
                    <v-card-item>
                        <v-card-title>{{ product.name }}</v-card-title>
                        <v-card-subtitle>
                            <span>{{ product.price }} &euro;</span>
                        </v-card-subtitle>
                        <v-card-actions>
                            <v-btn @click="this.addProductToCart(product)" density="compact" size="small" variant="text" icon="mdi-cart-outline" class="p-2"></v-btn>
                            <v-btn @click="this.addProductToWishlist(product)" density="compact" size="small" variant="text" icon="mdi-heart-outline" class="p-2"></v-btn>
                        </v-card-actions>
                    </v-card-item>
                </v-card>
            </v-col>
        </v-row>
        <v-pagination v-if="totalPages > 1" v-model="currentPage" :length="totalPages" @input="paginateProducts"></v-pagination>
    </v-container>
</template>

<script>
import "../assets/css/productlist.css";
import { addToCart, getCartItemCount, getCartTotalPrice } from '../services/cartService';
import { addToWishlist } from '../services/wishlistService';


export default {
    data() {
        return {
            products: [],
            pageSize: 12,
            currentCategory: 1,
            currentPage: 1,

            showAlert: false,
            alertType: "",
            alertTitle: "",
            alertText: "",

            sortOptions: [
                { text: 'Name (A to Z)', value: 'nameAsc' },
                { text: 'Name (Z to A)', value: 'nameDesc' },
            ],
            selectedSort: 'nameAsc', // Default sorting order
        };
    },
    mounted() {

        this.emitter.on('category-change', (categoryId) => {
            this.currentCategory = categoryId;
            this.fetchProductData(categoryId);
        });

        this.fetchAll();
    },
    computed: {
        totalPages() {
            return Math.ceil(this.products.length / this.pageSize);
        },
        paginatedProducts() {
            const start = (this.currentPage - 1) * this.pageSize;
            const end = start + this.pageSize;
            return this.products.slice(start, end);
        }
    },
    methods: {
        async fetchAll() {
            try {
                const response = await axios.get('/api/products');
                this.products = response.data;
            } catch (error) {
                console.error('Error fetching products:', error);
            }
        },
        async fetchProductData(categoryId) {
            try {
                const response = await axios.get('/api/products/type/' + categoryId);
                this.products = response.data;
            } catch (error) {
                console.error('Error fetching category products:', error);
            }
        },
        sortProducts() {
            const sorted = [...this.products];
            if (this.selectedSort === 'nameAsc') {
                sorted.sort((a, b) => a.name.localeCompare(b.name));
            } else if (this.selectedSort === 'nameDesc') {
                sorted.sort((a, b) => b.name.localeCompare(a.name));
            }
            this.products = sorted;
        },
        addProductToCart(product) {
            addToCart(product)
            this.emitter.emit('cart-change', getCartItemCount());
            this.emitter.emit('cart-price-change', getCartTotalPrice());
        },
        addProductToWishlist(product) {
            const message = addToWishlist(product);
            this.showAlertMessage(message.type, message.message);
        },
        showAlertMessage(type, title) {
            this.alertType = type;
            this.alertTitle = title;
            this.showAlert = true;

            setTimeout(() => {
                this.showAlert = false;
            }, 3000);
        }
    },
}
</script>