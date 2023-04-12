<template>
    <div class="breweries">
    
    <list-all-breweries />
    </div>
</template>

<script>
import ListAllBreweries from '../components/ListAllBreweries.vue'

export default {
    name: 'AllBreweries',
    components: {
        ListAllBreweries
    }
}
</script>

<style>

</style>