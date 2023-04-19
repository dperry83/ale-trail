<template>
  <div class="all-review">
  <button @click="showForm=!showForm" id="show-form">Review a Beer</button>
  <div class="form-container">
  <form id="review-form" v-if="showForm">
    <div id="beer-select">
      <label id="beer" for="beer">Beer &nbsp;</label>
      <select name="beer" v-model="review.beerId">
        <option disabled value="">Please select a beer</option>
        <option value="0">None</option>
        <!-- used v-for to loop over beers and create option for each beer -->
        <option v-for="beer in filteredBeers" :key="beer.beerId" :value="beer.beerId">
          {{ beer.name }}
        </option>
      </select>
      <div class="field" id="beer-rating">
        <label for="rating">Rating &nbsp;</label>
        <input type="number" min="1" max="5" v-model="review.rating" />
      
    </div>
    </div>

    <div class="review-text">
      <label for="review">Your Review: </label>
      <textarea name="review" rows="4" id="type-area"
                v-model="review.text"></textarea>
      <div class="actions">
        <br><button type="submit" id="submit-review"
                onclick="window.location.reload();" 
                v-on:click.prevent="saveReview()">Save Review</button>
    </div>
    </div>

    
  </form>
  </div>
  </div>
</template>

<script>
import ReviewService from '../services/ReviewService';
import UserService from '../services/UserService';

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
        // will now be populated by the created() property on line 61
        userId: 0,
        // assigns the brewery based on the route id for its brewery
        breweryId: this.breweryId,
        beerId: '',
        text: '',
        date: this.setDate(),
        rating: 0,
        isForBeer: true,
        
      },
      showForm: false,

      beers: [],
      filteredBeers: []
    }
  },
  created() {
    UserService
      .getUserId(this.$store.state.user.username)
      .then(response => {
        this.review.userId = response.data;
      })
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
      // this.review.userId = this.$store.state.user.id;

      ReviewService.saveNewReview(this.review).then(response => {
        if (response.status === 201) {
          // David said this is to go back to brewery details page after review is saved
          this.$router.push(`/beers/breweryId=${this.review.breweryId}`);
          console.log("review added");

          this.showForm = false;
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

select {
  width: 150px;
}


div.review-text {
padding-left: 70px;
}

#beer-select {
  padding-top: 10px;
}

#beer {
  padding-left: 20px;
}

.all-review {
  margin: auto;
  width: 35%;
  text-align: center;
}

#review-form {
  display: flex;
  column-gap: 10px;
  border: 1px solid black;
  margin-top: 5px;
  padding: 15px;
}
#review-form > .field{
  margin: auto;
  padding: 5px;
}

#beer-rating {
  padding-top: 30px;
  margin-right: 60px;
  
}
.actions {
  text-align: right;
}
#type-area {
  width: 100%;
}

#submit-review { 
  margin-right: 85px;
}

</style>