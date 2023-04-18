<template>
  <div>
    <!-- if user is admin or brewer, the add/delete form will show. if they are user, then it wont show -->
    <div v-if="isAdminOrBrewer">
      <h2>Add or Delete Beer</h2>
      <!-- Add Beer -->
      <form @submit.prevent="addBeer">
          <h3>Add Beer</h3>
          <label for="name">Name:</label>
          <input type="text" id="name" v-model="newBeer.name" required>
          <br>

          <label for="description">Description:</label>
          <textarea id="description" v-model="newBeer.description"></textarea>
          <br>

          <label for="abv">ABV:</label>
          <input type="number" id="abv" v-model="newBeer.abv" step="0.01" required>
          <br>

          <label for="beerType">Beer Type:</label>
          <input type="text" id="beerType" v-model="newBeer.beerType" required>
          <br>

          <label for="breweryId">Brewery:</label>
          <select id="breweryId" v-model="newBeer.breweryId">
            <option v-for="brewery in breweries" :value="brewery.breweryId" :key="brewery.breweryId">{{ brewery.name }}</option>
          </select>
          <br>
          <button type="submit">Add Beer</button>
      </form>

      <!-- Delete Beer -->
      <form @submit.prevent="deleteBeer">
          <h3>Delete Beer</h3>
          <label for="beerId">Beer ID:</label>
          <input type="number" id="beerId" v-model="beerToDelete" required>
          <br>
          <button type="submit">Delete Beer</button>
      </form>
    </div>
  </div>
</template>

<script>
import BeerService from '../services/BeerService';
import { mapGetters } from 'vuex';

export default {
  name: 'AddOrDeleteBeer',
  //passing data properties from breweries to this component. using it for select statments with id=breweryId
  props: {
    breweries: {
      type: Array,
      required: true
    }
  },
  computed: {
    // import user object from store, setted up getter for this
    ...mapGetters(['user']),
    isAdminOrBrewer() {
      //check if user has role of admin or brewer
      console.log("User object:", this.user);
      return this.user.role === "ROLE_ADMIN" || this.user.role === "ROLE_BREWER";
      
    }
  },
  data() {
    return {
      //used for beers being added, initial values
      newBeer: {
        name: '',
        description: '',
        abv: null,
        beerType: '',
        breweryId: null
      },
      beerToDelete: null,
    }
  },
  methods: {
    addBeer() {
      BeerService.addBeer(this.newBeer)
        .then(() => {
          alert('Beer added successfully');
          this.newBeer = {
            name: '',
            description: '',
            abv: null,
            beerType: '',
            breweryId: null // set breweryId back to null after adding beer
          };
        })
        .catch((error) => {
          console.log(error);
          alert('Failed to add beer');
        });
    },
    deleteBeer() {
      BeerService.deleteBeer(this.beerToDelete)
        .then(() => {
          alert('Beer deleted successfully');
          this.beerToDelete = null;
        })
        .catch((error) => {
          console.log(error);
          alert('Failed to delete beer');
        });
    },
 

  }
}
</script>

<style>

</style>
    