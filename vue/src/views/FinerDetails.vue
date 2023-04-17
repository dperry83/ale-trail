// src/views/finerdetails.vue
<template>
  <div class="finerdetails">
    <the-header />
    <brewery-details />
    <list-all-beers />
    <brewery-reviews :brewery-id="breweryId" />
    <reviews :brewery-id="breweryId" />
  </div>
</template>

<script>
import ListAllBeers from "../components/ListAllBeers.vue";
import TheHeader from "../components/TheHeader.vue";
import BreweryDetails from "../components/BreweryDetails.vue";
import BreweryReviews from "../components/BreweryReviews.vue";
import Reviews from "../components/Reviews.vue"; 

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
      breweryId: this.$route.params.id,
    };
  },
};
</script>

<style>
</style>
