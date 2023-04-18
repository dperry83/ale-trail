<template>
    <div>
        <section>
            <all-users />
        </section>
        <section>
            <add-new-brewery />
        </section>
    </div>
</template>

<script> 
import AllUsers from '../components/AllUsers.vue'
import AddNewBrewery from '../components/AddNewBrewery.vue'

export default {
    name: 'allusers',
    components: {
        AllUsers,
        AddNewBrewery
    }
}

</script>

<style scoped>

</style>