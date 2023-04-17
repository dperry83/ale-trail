
<template>
  <div class="reviews">
    <div v-if="reviews.length === 0">
      No reviews available for this brewery.
    </div>
    <div v-for="review in reviews" :key="review.id">
      <h3>{{ review.username }} - Rating: {{ review.rating }}</h3>
      <p>{{ review.text }}</p>
      <hr />
    </div>
  </div>
</template>

<script>
import ReviewService from "../services/ReviewService";

export default {
  name: "Reviews",
  props: ["breweryId"],
  data() {
    return {
      reviews: [],
    };
  },
  created() {
    this.fetchReviews();
  },
  methods: {
    async fetchReviews() {
      try {
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
  /* Your styles... */
</style>