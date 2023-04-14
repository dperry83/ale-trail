<template>
    <div class="beers">
            <the-header />
        <list-all-beers />
    </div>
</template>

<script>
import ListAllBeers from '../components/ListAllBeers.vue'
import TheHeader from '../components/TheHeader.vue'

export default {
    name: 'AllBeers',
    components: {
        ListAllBeers,
        TheHeader
    }
}
</script>

<style>

</style>