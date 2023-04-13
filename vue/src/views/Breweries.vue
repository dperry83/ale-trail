<template>
    <div class="breweries">
        <the-header />
    <list-all-breweries />
    </div>
</template>

<script>
import ListAllBreweries from '../components/ListAllBreweries.vue'
import TheHeader from '../components/TheHeader.vue'

export default {
    // name given to ListAllBreweries component
    name: 'AllBreweries',
    components: {
        ListAllBreweries,
        TheHeader
    }
}
</script>

<style>

</style>