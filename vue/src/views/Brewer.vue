<template>
    <div>
      <the-header />
        <!-- binding user breweries to prop to child which would be the AddOrDeleteBeer component -->
        <add-or-delete-beer :userBreweries="breweries"/>
      <the-footer />
    </div>
</template>

<script> 
import AddOrDeleteBeer from "../components/AddOrDeleteBeer.vue";
// need this to call on get all breweries
import BreweryService from "../services/BreweryService";
import TheHeader from '../components/TheHeader.vue'
import TheFooter from '../components/TheFooter.vue'

export default {
    name: 'add-delete-beer',
    components: {
        AddOrDeleteBeer,
        TheHeader,
        TheFooter
    },
    data(){
        // breweries object that will contain all the properties then go to fetch breweries method to fill in the properties... then pass it above to line 3
        return{
            breweries:[]
        }
    },
    methods: {
    async fetchBreweries() {
      try {
          //get all breweries from brewery service
        const response = await BreweryService.getAllBreweries();
        //return the array of breweries by the API
        this.breweries = response.data.sort((a, b) => a.name.localeCompare(b.name));
      } catch (error) {
        console.log(error);
        alert('Failed to fetch breweries');
      }
    }
  },
  created(){
      //executing this on creation / loading page
      this.fetchBreweries();
  }
}
</script>

<style scoped>

</style>

