<template>
  <form>
    <div class="field">
      <label for="beer">Beer</label>
      <select name="beer" v-model="review.beerId">
        <option disabled value="">Please select a beer</option>
        <option value="0">None</option>
        <!-- used v-for to loop over beers and create option for each beer -->
        <option v-for="beer in filteredBeers" :key="beer.beerId" :value="beer.beerId">
          {{ beer.name }}
        </option>
      </select>
    </div>

    <div class="field">
      <label for="review">Review Text</label>
      <textarea name="review" rows="4" cols="40" v-model="review.text"></textarea>
    </div>

    <div class="field">
      <label for="rating">Your Rating (1 thru 5) </label>
      <input type="number" min="1" max="5" v-model="review.rating" />
    </div>

    <div class="actions">
      <button type="submit" onclick="window.location.reload();" v-on:click.prevent="saveReview()">Save Review</button>
    </div>
  </form>
</template>

<script>
import ReviewService from '../services/ReviewService';

export default {
  name: 'BreweryReviews',
  props: {
    breweryId: {
      type: Number,
      required: true
    }
  },
  data() {
    return {
      review: {
        // assigns the current logged-in username to the review
        username: this.$store.state.user.username,
        // assigns the brewery based on the route id for its brewery
        breweryId: this.breweryId,
        beerId: '',
        text: '',
        date: this.setDate(),
        rating: 0,
        isForBeer: true
      },

      beers: [],
      filteredBeers: []
    }
  },

  mounted() {
    //get all beers and sort by name
    ReviewService.getAllBeers().then(response => {
      this.beers = response.data.sort((a, b) => a.name.localeCompare(b.name));
      //look on line 85... it is filtering the beers by brewery
      this.filterBeers();
    });
  },

  methods: {
    saveReview() {
      // uses current logged in user and sets user id
      this.review.userId = this.$store.state.user.id;

      ReviewService.saveNewReview(this.review).then(response => {
        if (response.status === 201) {
          // David said this is to go back to brewery details page after review is saved
          this.$router.push(`/beers/breweryId=${this.review.breweryId}`);
          console.log("review added");
        }
      })
    },
    setDate() {
      const today = new Date();
      return today.toISOString().substr(0, 10);
    },
    filterBeers() {
      // Filter the beers by the selected brewery
      this.filteredBeers = this.beers.filter(beer => beer.breweryId === this.review.breweryId);

      // If no beers are filtered, display all beers
      if (this.filteredBeers.length === 0) {
        this.filteredBeers = this.beers;
      }
    }
  }
}
</script>

<style scoped>
</style>
