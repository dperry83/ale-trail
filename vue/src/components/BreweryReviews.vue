<template>
  <section>
    <h2>Reviews</h2>
    <ul>
      <li v-for="review in reviews" :key="review.reviewId">
        {{ review.text }} - Rated: {{ review.rating }} / 5
      </li>
    </ul>
  </section>
</template>

<script>
import ReviewService from "../services/ReviewService";

export default {
  name: "brewery-reviews",
  props: {
    breweryId: {
      type: Number,
      required: true,
    },
  },
  data() {
    return {
      reviews: [],
    };
  },
  mounted() {
    this.fetchBreweryReviews();
  },
  methods: {
    async fetchBreweryReviews() {
      try {
        const response = await ReviewService.getReviewByBreweryId(this.breweryId);
        this.reviews = response.data;
      } catch (error) {
        console.error("Error fetching reviews:", error);
      }
    },
  },
};
</script>

<style scoped>
  
</style>
