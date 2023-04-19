<template>
    <div class="breweries">
        <the-header />
    <list-all-breweries />
    <the-footer />
    </div>
</template>

<script>
import ListAllBreweries from '../components/ListAllBreweries.vue'
import TheHeader from '../components/TheHeader.vue'
import TheFooter from '../components/TheFooter.vue';

export default {
    // name given to ListAllBreweries component
    name: 'AllBreweries',
    components: {
        ListAllBreweries,
        TheHeader,
        TheFooter
    }
}
</script>

<style>

</style>