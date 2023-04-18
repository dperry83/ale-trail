// src/views/finerdetails.vue
<template>
  <div class="finerdetails">
    <the-header />
    <div>
      <brewery-details />
    </div>
    <div>
      <list-all-beers />
    </div>
    <div>
      <brewery-reviews :brewery-id="breweryId" />
    </div>
    <!-- pass the brewery id to the reviews sending it to the props -->
    <reviews :brewery-id="breweryId" />
    <!-- pass the brewery properties to the add or delete beer component as a prop -->
    
  </div>
</template>

<script>
import ListAllBeers from "../components/ListAllBeers.vue";
import TheHeader from "../components/TheHeader.vue";
import BreweryDetails from "../components/BreweryDetails.vue";
import BreweryReviews from "../components/BreweryReviews.vue";
import Reviews from "../components/Reviews.vue"; 
import BreweryService from "../services/BreweryService"

export default {
  name: "finerdetails",
  components: {
    TheHeader,
    BreweryDetails,
    ListAllBeers,
    BreweryReviews,
    Reviews
  },
  data() {
    return {

      //retreiving brewery id based on param
      breweryId: this.$route.params.id,
      //obtained by the method underneath 'getAllbreweries' then sends it above in the template declaration
      breweries: []
    };
  },
  //called when the component is created. used to perform initial setup. fetching data
  created() {
    BreweryService.getAllBreweries()
      .then(response => {
        this.breweries = response.data;
      })
      .catch(error => {
        console.log(error);
      });
  }
};
</script>

<style>
</style>