<template>
    <div class="finerdetails">
        <the-header />
        <brewery-details />
    <!-- displays ListAllBeers component, now refactored to 
         display beers by breweryId -->
    <list-all-beers />
    <new-review />
    </div>
</template>

<script>
import ListAllBeers from '../components/ListAllBeers.vue'
import TheHeader from '../components/TheHeader.vue'
import BreweryDetails from '../components/BreweryDetails.vue'
import NewReview from '../components/NewReview.vue'

export default {
    name: 'beers-by-brewery',
    components: {
        TheHeader,
        BreweryDetails,
        ListAllBeers,
        NewReview
    }

}
</script>

<style>

</style>