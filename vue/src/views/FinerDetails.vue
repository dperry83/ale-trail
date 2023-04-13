<template>
    <div class="finerdetails">
    <!-- displays ListAllBeers component, now refactored to 
         display beers by breweryId -->
    <list-all-beers />
    </div>
</template>

<script>
import ListAllBeers from '../components/ListAllBeers.vue'

export default {
    name: 'beers-by-brewery',
    components: {
        ListAllBeers
    }
}
</script>

<style>

</style>