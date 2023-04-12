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
        BeerService
            .getAllBeers()
            .then( response => {
                this.beers = response.data;
                this.isLoading = false;
            })
    }
}
</script>

<style>

</style>
