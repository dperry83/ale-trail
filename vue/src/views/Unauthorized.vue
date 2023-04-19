<template>
    <div class="main">
        <h1>You are not authorized to view this page.</h1>
        <router-link v-bind:to=" { name: 'home'} ">
            <button class="nav">Home</button>
        </router-link>
        <router-link v-bind:to=" { name: 'login'} ">
            <button class="nav">Login</button>
        </router-link>
    
    </div>
</template>

<script> 

export default {
    name: 'Unauthorized',

}
</script>

<style scoped>

.main {
    text-align: center;
    padding: 20px;
}
.nav {
    margin: 15px;
}

</style>