<template>
  <div>

    <!-- .info currently holds all the component details  -->
    <div class="info">
      
      <!-- contact info: left 1/3 of page -->
      <div class="contact">
        <h2>Contact Us</h2>
        <h4 id="phone"> {{ brewery.phone }} </h4>
        <h5 id="address"> {{ brewery.address }} </h5>
      </div>

      <!-- linked name: middle 1/3 of page -->
      <div class="name">
        <a :href="brewery.website" target="_blank"> {{brewery.name}} </a>
      </div>
      
      <!-- hours: right 1/3 of page -->
      <div class="hours">
        <h2>Hours</h2>
        <p> {{ brewery.hoursDaysOperation }} </p>
      </div>

    </div>
  </div>
</template>

<script>
import BreweryService from '../services/BreweryService'

export default {
  name: 'brewery-details',
  data() {
    return {
      brewery: {
        address: '',
        breweryId: 0,
        history: '',
        hoursDaysOperation: '',
        image: '',
        phone: '',
        website: ''
      }
    }
  },
  created() {
    BreweryService
      .getBreweryDetails(this.$route.params.id)
      .then(response => {
      this.brewery = response.data;
    });
  }
}
</script>

<style scoped> 

.info {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  gap: 40px;
  padding-top: 20px;
  padding-left: 20px;
  padding-right: 30px;
  text-align: center;
}
.name {
  text-align: center;
  padding-top: 20px;
  background-color: white;
}
/* currently applies to every div inside .info block */
.info > .contact, .name, .hours {
  border:black 1px solid;
}


</style>