<template>
    <div class="header">
        <img id="logo" src="logo_thumbnail.png" alt="da logo">
        <h2 class="tagline">ALE TRAIL</h2>
        <div id="nav" >
            
            <router-link v-bind:to="{ name: 'home' }">Home</router-link> &nbsp;&nbsp;|&nbsp;
            <router-link id="brew" to="/breweries">View All Breweries</router-link> &nbsp;&nbsp;|&nbsp;
            <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
            
            
        </div>

        <div style="height: 30px; width: 100%; background-color:  rgba(6,40,81,255); color: white;"/>
        
    
    </div>
    
</template>

<script> 
export default {
    name: 'the-header'
}
</script>

<style>



#logo,
.tagline {
display: inline-block;
vertical-align: middle;
color: #062851;
font-size: 30px;
font-weight: bolder;
}

.tagline {
    margin-left: 10px;
    
}

#nav {
    text-align: end;
}
</style>