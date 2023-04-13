<template>
    <div class="header">
        <img id="logo" src="logo_thumbnail.png" alt="da logo">
        <h2 class="tagline">Embark on the Ale Trail</h2>
        <div id="nav">
            
            <router-link v-bind:to="{ name: 'home' }">Home</router-link> &nbsp;&nbsp;|&nbsp;
            <router-link id="brew" to="/breweries">View All Breweries</router-link> &nbsp;&nbsp;|&nbsp;
            <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
        </div>
    </div>
</template>

<script> 
export default {
    name: 'the-header'
}
</script>

<style>

#logo {
    display: inline;
}
.tagline {
    display: inline;
}
#nav {
    text-align: end;
}
</style>