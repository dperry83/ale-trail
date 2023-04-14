<template>
    <form >
        <div class="field">
            <label for="userId">UserId</label>
            <input type="number" name="userId" v-model="review.userId"/>
        </div> 
        <div class="field">
            <label for="brewery">Brewery ID</label>
            <input type="number" name="brewery" v-model="review.breweryId" />
        </div>
        <div classs="field">
            <label for="beer">Beer</label>
            <input type="number" name="beer" v-model="review.beerId" />
        </div>
        <div class="field">
            <label for="review">Review Text</label>
            <textarea name="review" rows="4" cols="40" v-model="review.text"></textarea>
        </div>
        <div class="field">
            <label for="rating">Your Rating (1 thru 5) </label>
            <input type="number" min="1" max="5" v-model="review.rating" />
        </div>
        <div class="field">
            <label for="forBeer">Is this a beer review? </label>
            <input type="checkbox" name="forBeer" v-model="review.isForBeer"/>Yes
        </div>
        <div class="actions">
            <button type="submit" v-on:click.prevent="saveReview()">Save Review</button>
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
                breweryId: 0,
                beerId: 0,
                text: '',
                date: this.setDate(),
                rating: 0,
                isForBeer: false
            }
        }
    },
    methods: {
        saveReview() {
            ReviewService
              .saveNewReview(this.review)
              .then( response => {
                  if(response.status === 201) {
                      this.$router.push(`/beers/breweryId=${this.review.breweryId}`);
                      console.log("review successfully added");
                  }
              })
        },
        setDate() {
            const today = new Date();
            return today.toISOString().substr(0,10);
        }
    }
}
</script>

<style scoped>

</style>