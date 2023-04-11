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
            beers: []
        }
    },
    created() {
        BeerService
            .getAllBeers()
            .then( response => {
                this.beers = response.data;
            })
    }
}
</script>

<style>

</style>
