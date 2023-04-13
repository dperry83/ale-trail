<template>
  <div class="home">
    <h1>Home</h1>
    <div class="routers" >
       <div style="height: 30px; width: 100%; background-color:  rgba(6,40,81,255); color: white;">
    <router-link id="brew" to="/breweries">View All Breweries</router-link>
    &nbsp;|&nbsp;
    <router-link id="beer" to="/beers">View All Beers</router-link>
    </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "home"
};
</script>

<style scoped>
.routers {
 text-align: center;
 
}
h1 {
  color: beige;
}

</style>

