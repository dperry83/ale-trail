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

            <div class="loading" v-if="isLoading">
                <img src=" ../public/beer-67.gif" />
            </div>
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
            brewery: [],
            isLoading: true,
        }
    },
    created() {
        BreweryService
            .getAllBreweries()
            .then( response => {
                this.brewery = response.data;
                this.isLoading = false;
            })
    }
}
</script>

<style>

</style>
