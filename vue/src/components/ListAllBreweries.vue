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
                <tr v-for="item in breweries" 
                    v-bind:key="item.breweryId"> 
                    <!-- links to finerdetails, using this breweryId as a parameter -->
                    <router-link v-bind:to="{ name: 'finerdetails', params: {id: item.breweryId} }"> 
                        {{ item.name }} </router-link>
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
            breweries: [],
            isLoading: true,
        }
    },
    // calls BreweryService and populates data {breweries} w/ info at that endpoint
    created() {
        BreweryService
            .getAllBreweries()
            .then( response => {
                this.breweries = response.data;
                this.isLoading = false;
            })
    }
}
</script>

<style>
table {
    width: 80%;
    margin-left: 10%;
}
th, td {
    text-align: center;
}
td {
    padding-right: 10px;
    vertical-align: top;
}

</style>
