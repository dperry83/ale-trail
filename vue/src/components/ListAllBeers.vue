<template>
    <div id="beersTable">
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
                <tr v-for="item in beers" v-bind:key="item.beer_id">
                    <td> {{ item.name }} </td>
                    <td> {{ item.description }} </td>
                    <td> {{ item.abv }}% </td>
                    <td> {{ item.beerType }} </td>
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


<style scoped>
table {
    width: auto;
    margin: auto;
    border-collapse: collapse;
    padding: 10px 30px 10px 15px;
    ;
   
}
th, td {
    text-align: center;
    border: 1px solid black;
    padding: 13px 10px;
}
td {
    padding-right: 10px;
    vertical-align: top;
}


div#beersTable {
    padding-top: 25px;
}


</style>
