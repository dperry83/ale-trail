<template>
    <div class="finerdetails">
        <the-header />
        <brewery-details />
    <!-- displays ListAllBeers component, now refactored to 
         display beers by breweryId -->
    <list-all-beers />
   <brewery-reviews :brewery-id="breweryId"/>
    </div>
</template>

<script>
import ListAllBeers from '../components/ListAllBeers.vue'
import TheHeader from '../components/TheHeader.vue'
import BreweryDetails from '../components/BreweryDetails.vue'
import BreweryReviews from '../components/BreweryReviews.vue'


export default {
    name: 'beers-by-brewery',
    components: {
        TheHeader,
        BreweryDetails,
        ListAllBeers,
        BreweryReviews
    },
    data() {
        return {
            breweryId: this.$route.params.id
        }
    }

}
</script>

<style>

</style>