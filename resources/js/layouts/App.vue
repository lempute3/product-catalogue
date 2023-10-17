<script setup>
import Navigation from "../components/Navigation.vue"
import Footer from "../components/Footer.vue"
</script>

<template>
    <v-app>
        <v-layout>
            <Navigation />
            <v-main>
                <router-view></router-view>
            </v-main>
        </v-layout>
        <Footer></Footer>
    </v-app>
</template>

<style>
@import url('https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@200&display=swap');
#app { font-family: 'Source Sans 3', sans-serif; }
</style>
