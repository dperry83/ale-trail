<template>
  <div class="home">
    <the-header />
    <h1>Home</h1>
    <div class="routers" >
       <div style="height: 30px; width: 100%; background-color:  rgba(6,40,81,255); color: white;">
    </div>
    </div>
  </div>
</template>

<script>
import TheHeader from '../components/TheHeader.vue'

export default {
  name: "home",
  components: {
    TheHeader
  }
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

