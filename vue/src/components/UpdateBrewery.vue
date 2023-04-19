<template>
  <div>
    <h2>Update Brewery</h2>
    <form @submit.prevent="updateBrewery">
        <!-- drop down list to choose brewery to update -->
        <label for="breweryId">Select a brewery:</label>
        <select id="breweryId" v-model="selectedBreweryId" required>
            <option disabled value="">Please select one</option>
            <option v-for="brewery in breweries" :value="brewery.breweryId" :key="brewery.breweryId">{{ brewery.name }}</option>
        </select>

        <!-- input fields for brewery updates -->
        <label for="name">Name:</label>
        <input type="text" id="name" v-model="brewery.name" required>
        <br>

        <label for="image">Image URL:</label>
        <input type="text" id="image" v-model="brewery.image">
        <br>

        <label for="history">History:</label>
        <textarea id="history" v-model="brewery.history"></textarea>
        <br>

        <label for="website">Website:</label>
        <input type="text" id="website" v-model="brewery.website">
        <br>

        <label for="hours_days_operation">Hours/Days of Operation:</label>
        <input type="text" id="hours_days_operation" v-model="brewery.hours_days_operation">
        <br>

        <label for="address">Address:</label>
        <input type="text" id="address" v-model="brewery.address" required>
        <br>

        <label for="phone">Phone:</label>
        <input type="text" id="phone" v-model="brewery.phone">
        <br>
        
        <button type="button" @click="updateBrewery">Update Brewery</button>
    </form>
  </div>
</template>

<script>
import BreweryService from '../services/BreweryService';
import { mapGetters } from 'vuex';

export default {
  name: 'UpdateBrewery',
  props: ['userBreweries'],
  data() {
    return {
        // the properties
      brewery: {
        name: '',
        image: '',
        history: '',
        website: '',
        hours_days_operation: '',
        address: '',
        phone: ''
      },
      selectedBreweryId: null,
      //list of breweries
      breweries: []
    }
  },
  computed: {
      //getter in the store that pulls the user info / id
    ...mapGetters(['user']),
     selectedBrewery() {
         // returns brewery object in the array line 65 that matches the selected brewery id
      return this.breweries.find(brewery => brewery.breweryId === this.selectedBreweryId)
    }
  },
  methods: {
    async updateBrewery() {
  try {
      // updates the selected brewery with the new properties in input field
    const selectedBrewery = this.breweries.find(brewery => brewery.breweryId === this.selectedBreweryId);
    selectedBrewery.name = this.brewery.name;
    selectedBrewery.image = this.brewery.image;
    selectedBrewery.history = this.brewery.history;
    selectedBrewery.website = this.brewery.website;
    selectedBrewery.hours_days_operation = this.brewery.hours_days_operation;
    selectedBrewery.address = this.brewery.address;
    selectedBrewery.phone = this.brewery.phone;

    // calls the updated brewery service with the parameter of selectedBrewery
    await BreweryService.updateBrewery(selectedBrewery);
    alert('Brewery updated successfully');
  } catch (error) {
    console.log(error);
    alert('Failed to update brewery');
  }
},
// This method fetches all the breweries from the backend using the BreweryService and sets the data to the 'breweries' property
     async fetchBreweries() {
  try {
    //get the brewery by user id
    const response = await BreweryService.getBreweriesByUserId(this.user.id);
    this.breweries = response.data.sort((a, b) => a.name.localeCompare(b.name));
  } catch (error) {
    console.log(error);
    alert('Failed to fetch breweries');
  }
}

  },
  created() {
    this.fetchBreweries()
  }
}
</script>

<style scoped>

</style>
