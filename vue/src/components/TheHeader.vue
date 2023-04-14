<template>
    <div class="header">
        <img id="logo" src="logo_thumbnail.png" alt="da logo">
        <h2 class="tagline">ALE TRAIL</h2>
        <div id="nav" >
            
            <router-link id="headerHome" v-bind:to="{ name: 'home' }">Home</router-link> &nbsp;&nbsp;|&nbsp;
            <router-link id="brew" to="/breweries">View All Breweries</router-link> &nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
            <router-link id="logoutHeader" v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
            
            
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
    display: inline-block;
    margin-top:30px;
    float: right;
}

#logoutHeader {
border: 1px solid black;
background: black;
background-clip: padding-box;
color: white;
padding: 2px 20px;
border-radius: 10px;
}

#headerHome {
border: 1px solid black;
background: black;
background-clip: padding-box;
color: white;
padding: 2px 20px;
border-radius: 10px;
}

#brew {
border: 1px solid black;
background: black;
background-clip: padding-box;
color: white;
padding: 2px 20px;
border-radius: 10px;
}

</style>