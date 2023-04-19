
<template>
  <div class="reviews">
    <div v-if="reviews.length === 0">
      No reviews available for this brewery.
    </div>

    <!-- cycle through each review in the list of reviews to pull up -->
    <div v-for="review in reviews" :key="review.id">
      <h2> {{ review.beerName }} </h2>
      <h3>{{ review.username }} Rated it: {{ review.rating }}/5     </h3>
      <h6>Date: {{review.date}}</h6>
      <p>{{ review.text }}</p>
      <hr />
    </div>
  </div>
</template>

<script>
import ReviewService from "../services/ReviewService";

export default {
  name: "Reviews",

  // passing brewery id from parent to this component
  props: {
    'breweryId': Number
  },
  data() {
    return {
      reviews: [],
    };
  },
  created() {
    //use the fetch reviews to get reviews for specific brewery on creation of this component
    this.fetchReviews();
  },
  methods: {
    async fetchReviews() {
      try {
        //getting brewery id 
        const response = await ReviewService.getReviewsForBreweryById(this.breweryId);
        this.reviews = response.data;
      } catch (error) {
        console.error("Error fetching reviews:", error);
      }
    },
  },
};
</script>

<style scoped>

.reviews {
  margin: auto;
  width: 60%;
}
  
</style>