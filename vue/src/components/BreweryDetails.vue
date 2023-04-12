<template>
  <div class="brewery-details">
    <h1>{{ brewery.name }}</h1>
    <div v-for="beer in brewery.beers" v-bind:key="beer.id" class="brewery-beer bubble">
      <h3 class="beer-name">{{ beer.name }}</h3>
      <p class="beer-body">
        {{ beer.description }}
      </p>
    </div>
  </div>
</template>

<script>
import BreweryService from '../services/BreweryService'
export default {
  name: 'brewery-details',
  props: {
    'brewery_id': Number
  },
  data() {
    return {
      beer: {
        beer_id: 0,
        name: '',
        abv: 0,
        description: '',
        beer_type: '',
        // messages: [] <- for reviews later
      },
    }
  },
  created() {
    BreweryService.getBreweryDetails(this.$route.params.id).then(response => {
      this.beer = response.data
    });
  }
}
</script>