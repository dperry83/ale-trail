<template>
  <div class="home">
    <the-header />
    <div class="routers" >
       <div style="height: 30px; width: 100%; background-color:  rgba(6,40,81,255); color: white;">
    </div>
    </div>
    <div class="image-container"> 
    <img class="homepic" src="HP1.png" alt="da hp">
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
.image-container {
  display: flex;
  justify-content: center;
  align-items: flex-start;
  height: 100vh;
}

.homepic {
  max-width: 100%;
  max-height: 100%;
  object-fit: contain;
}

</style>

