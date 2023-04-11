<template>
    <div>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>History</th>
                    <th>Address</th>
                    <th>Phone</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="item in breweries" v-bind:key="item.brewery_id">
                    <td> {{ item.name }} </td>
                    <td> {{ item.history }} </td>
                    <td> {{ item.address }} </td>
                    <td> {{ item.phone }} </td>
                </tr>
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
