<template>
  <div class="home">
    <the-header />
   
 
    <div class="image-container">
    <img class="homepic" src="HP1.png" alt="da hp">
    <div class="beer-text">
    <h3>ALE TRAIL Beer of the Month</h3>
    <h4> Lakes & Legends "Vibe Czech"</h4>
    </div>
    <div class="beer-award">
    
    
    <img class="highlightbeer" src="highlightedbeer.jpg" alt="hlbeer">
    <google-maps/>
    <blockquote>
      <h2>Chris P. Bacon</h2>
      <p>Really good Vibes with this one ;) &nbsp;&nbsp;&nbsp;&nbsp;      4 out of 5</p>
      <br>
      <h2>Carrie Oaky</h2>
      <p>No one Czeched my ID lol &nbsp;&nbsp;&nbsp;&nbsp;  5 out of 5</p>
      <br>
      <h2>Page Turner</h2>
      <p>No me gusta la cerveza &nbsp;&nbsp;&nbsp;&nbsp;  2 out of 5</p>


      
    </blockquote>
    </div>
    
    </div>
    
    <the-footer />
  </div>
</template>


<script>
import TheFooter from '../components/TheFooter.vue';
import TheHeader from '../components/TheHeader.vue'
import GoogleMaps from '../components/GoogleMaps.vue'


export default {
  name: "home",
  components: {
    TheHeader,
    TheFooter,
    GoogleMaps,
  }
};
</script>


<style scoped>

div.beer-award {
  display: flex;
  flex-direction: row;
}

blockquote {
  margin-top: 0;
  padding-top: 0;
}

.maps {
  margin-left: 100px;
}

.image-container {
 
  overflow: hidden;
  padding-bottom: 20px;
 


}


.homepic {
  max-width: 100%;
  max-height: 100%;
  object-fit: contain;
}


.beer-text{
  margin-left: 8%;
  margin-top: 2%;
}


h3 {
  display: inline;
  border: 1px solid black;
  background: rgba(6,40,81,255);
  background-clip: padding-box;
  color: white;
  padding: 2px 20px;
  border-radius: 5px;




}
h4 {
  display: block;
  margin-top: 10px;
  margin-left: 30px;


}


.highlightbeer {
  margin-left: 8.3%;
  max-width: 600px;
  max-height: 350px;
  border: 10px solid #062851;
  border-radius: 10px;
 
 
}


</style>




