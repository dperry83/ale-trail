<template>
  <div class="home">
    <the-header />
    
  
    <div class="image-container"> 
    <img class="homepic" src="HP1.png" alt="da hp">

    <h3>ALE TRAIL Beer of the Month<br> Lakes & Legends "Vibe Czech"</h3>
    <img class="highlightbeer" src="highlightedbeer.jpg" alt="hlbeer">
    </div>
    <the-footer />
  </div>
</template>

<script>
import TheFooter from '../components/TheFooter.vue';
import TheHeader from '../components/TheHeader.vue'

export default {
  name: "home",
  components: {
    TheHeader,
    TheFooter
  }
};
</script>

<style scoped>
.image-container {
 
  height: 100vh;
}

.homepic {
  max-width: 100%;
  max-height: 100%;
  object-fit: contain;
}
.highlightbeer {
  display: flex;
  margin-top: 15px;
  max-height: 20%;
  border: 8px solid #062851;
  border-radius: 10PX;
  
  
}

</style>

