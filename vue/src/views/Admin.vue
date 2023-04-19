<template>
    <div>
        <the-header />
        <section>
            <all-users />
        </section>
        <section>
            <add-new-brewery />
        </section>
        <the-footer />
    </div>
</template>

<script> 
import AllUsers from '../components/AllUsers.vue'
import AddNewBrewery from '../components/AddNewBrewery.vue'
import TheHeader from '../components/TheHeader.vue'
import TheFooter from '../components/TheFooter.vue'

export default {
    name: 'allusers',
    components: {
        AllUsers,
        AddNewBrewery,
        TheHeader,
        TheFooter
    }
}

</script>

<style scoped>

</style>