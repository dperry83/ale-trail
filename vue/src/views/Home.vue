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
      <h2>Reviews</h2>
      <h2>Chris P. Bacon</h2>
      <p>Upon trying the Vibe Czech Pilsner, I found the crispness and light body to be refreshing, but not particularly memorable. The flavor, though pleasant, lacked the depth and nuance I seek in a truly great pilsner. While it's a decent option for a casual drink, it didn't quite meet my expectations for a standout beer. &nbsp;&nbsp;&nbsp;&nbsp;      4 out of 5</p>
      
      <h2>Carrie Oaky</h2>
      <p>The Vibe Czech Pilsner is an absolute triumph, offering a sublime marriage of lightness and crispness that sets it apart from its competitors. The flavor is delicately balanced and utterly refreshing, making each sip an unforgettable experience. This exceptional pilsner has earned its place among the best of its kind and is a must-try for all beer aficionados. &nbsp;&nbsp;&nbsp;&nbsp;  5 out of 5</p>
      
      <h2>Page Turner</h2>
      <p>In the realm of effervescent libations, the Vibe Czech Pilsner rises to near-legendary status. Its gossamer, crisp flavor pirouettes gracefully upon the palate, evoking a symphony of subtle complexities. While it may not ascend to the zenith of perfection, this enchanting pilsner artfully pays homage to its Czech roots, earning it a resplendent position within the hallowed halls of beer nobility. &nbsp;&nbsp;&nbsp;&nbsp;  2 out of 5</p>


      
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
  flex-wrap: wrap;
}

blockquote {
  margin-left: 100px;
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

p {
  width: 600px;
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