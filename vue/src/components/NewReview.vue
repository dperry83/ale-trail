<template>
    <form>

        <div class="field">
            <label for="brewery">Brewery</label>
            <!-- v-model is used to create two-way data binding between the input value and the data property. Changes to the input value will update the data property and vice versa. -->
            <select name="brewery" v-model="review.breweryId" v-on:change="filterBeers">
                <option disabled value="">Please select a brewery</option>
                <option value="0">None</option>
                <!-- used v-for to loop over brewery and create option for each brewery -->
                <option v-for="brewery in breweries" :key="brewery.breweryId" :value="brewery.breweryId">
                {{ brewery.name }}
                </option>
            </select>
        </div>

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

        <!-- <div class="field">
            <label for="forBeer">Is this a beer review? </label>
            <input type="checkbox" name="forBeer" v-model="review.isForBeer"/>Yes
        </div> -->

        <div class="actions">
            <!-- v-on:click.prevent is used to prevent the form from being submitted when save review button is clicked.
            Also added onclick to reload the page so you could tell the review was sent to the database. visually looks better -->
            <button type="submit" onclick="window.location.reload();" v-on:click.prevent="saveReview()">Save Review</button>
        </div>
    </form>
</template>

<script>
import ReviewService from '../services/ReviewService';

export default {
    name: 'new-review',
    data() {
        return {
            review: {
                userId: 0,
                // assigns the current logged-in username to the review
                username: this.$store.state.user.username,
                // assigns the brewery based on the route id for its brewery
                breweryId: this.$route.params.id,
                beerId: '',
                text: '',
                date: this.setDate(),
                rating: 0,
                isForBeer: true
            },
            breweries: [],
            beers: [],
            filteredBeers: []
        }
    },

    mounted() {
        ReviewService
        //get all beers and sort by name
            .getAllBeers().then(response => {
                this.beers = response.data.sort((a, b) => a.name.localeCompare(b.name));
            });
        ReviewService
        //get all beers and sort by brewery
            .getAllBreweries().then(response => {
                this.breweries = response.data.sort((a, b) => a.name.localeCompare(b.name));
            });
    },

    methods: {
        saveReview() {
            // uses current logged in user and sets user id from the store
            this.review.userId = this.$store.state.user.id;

            ReviewService.saveNewReview(this.review)
              .then(response => {
                  if(response.status === 201) {
                      // David said this is to go back to brewery details page after review is saved
                      this.$router.push(`/beers/breweryId=${this.review.breweryId}`);
                      console.log("review added");
                  }
              })
        },
        setDate() {
            const today = new Date();
            return today.toISOString().substr(0,10);
        },
        filterBeers() {
        if (this.review.breweryId === 0) {
            // Display all beers when they choose none
            this.filteredBeers = this.beers;
        } else {
            // Filter the beers when a brewery is selected
            this.filteredBeers = this.beers.filter(beer => beer.breweryId === this.review.breweryId);
        }
        
        // If no beers are filtered, display all beers
        if (this.filteredBeers.length === 0) {
            this.filteredBeers = this.beers;
        }
        
        // Reset the selected beer to none
        this.review.beerId = 0;
    }
}}

</script>

<style scoped>

</style>