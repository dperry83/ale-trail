<template>
    <div>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Description</th>
                    <th>ABV</th>
                    <th>Beer Type</th>
                </tr>
            </thead>

             <div class="loading" v-if="isLoading">
                <img src=" ../public/beer-67.gif" />
            </div>

            <tbody>
                <tr v-for="item in beers" v-bind:key="item.beers_id">
                    <td> {{ item.name }} </td>
                    <td> {{ item.description }} </td>
                    <td> {{ item.abv }} </td>
                    <td> {{ item.beer_type }} </td>
                </tr>
            </tbody>
        </table>
    </div>
</template>

<script>
import BeerService from '../services/BeerService';

export default {
    name: 'beer-list',
    data() {
        return {
            beers: [],
            isLoading: true,
        }
    },
    created() {
        // now calls BeersByBrewery, passing this route parameter(id) as an argument
        BeerService
            .getBeersByBrewery(this.$route.params.id)
            .then( response => {
                this.beers = response.data;
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
tr:nth-child(even) {
    background-color: rgb(238, 238, 238);
}
</style>
