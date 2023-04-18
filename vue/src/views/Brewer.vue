<template>
    <div>
        <add-or-delete-beer :breweries="breweries"/>
    </div>
</template>

<script> 
import AddOrDeleteBeer from "../components/AddOrDeleteBeer.vue";

export default {
    name: 'add-delete-beer',
    components: {
        AddOrDeleteBeer
    }
}
</script>

<style scoped>

</style>