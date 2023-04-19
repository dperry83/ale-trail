<template>
  <div>
    <the-header />
    <update-brewery :userBreweries="breweries" />
    <add-or-delete-beer :userBreweries="breweries" />
    <the-footer />
  </div>
</template>

<script>
import AddOrDeleteBeer from "../components/AddOrDeleteBeer.vue";
import BreweryService from "../services/BreweryService";
import TheHeader from "../components/TheHeader.vue";
import TheFooter from "../components/TheFooter.vue";
import UpdateBrewery from "../components/UpdateBrewery.vue";

export default {
  name: "BreweryManagement",
  components: {
    AddOrDeleteBeer,
    UpdateBrewery,
    TheHeader,
    TheFooter,
  },
  data() {
    return {
      breweries: [],
    };
  },
  methods: {
    async fetchBreweries() {
      try {
        const response = await BreweryService.getAllBreweries();
        this.breweries = response.data.sort((a, b) => a.name.localeCompare(b.name));
      } catch (error) {
        console.log(error);
        alert("Failed to fetch breweries");
      }
    },
  },
  created() {
    this.fetchBreweries();
  },
};
</script>

<style scoped>
</style>
