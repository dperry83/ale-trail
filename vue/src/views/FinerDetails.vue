<template>
    <div class="finerdetails">
        <the-header />
    <!-- displays ListAllBeers component, now refactored to 
         display beers by breweryId -->
    <list-all-beers />
    </div>
</template>

<script>
import ListAllBeers from '../components/ListAllBeers.vue'
import TheHeader from '../components/TheHeader.vue'

export default {
    name: 'beers-by-brewery',
    components: {
        ListAllBeers,
        TheHeader
    }
}
</script>

<style>

</style>