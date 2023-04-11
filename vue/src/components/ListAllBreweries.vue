<template>
    <div>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Website</th>
                </tr>
            </thead>
            <tbody>
                <!-- insert v-for loop for each brewery -->
            </tbody>
        </table>
    </div>
</template>

<script>
import BreweryService from '../services/BreweryService';

export default {
    name: 'brewery-list',
    data() {
        return {
            breweries: []
        }
    },
    created() {
        BreweryService
            .getAllBreweries()
            .then( response => {
                this.breweries = response.data;
            })
    }
}
</script>

<style>

</style>
