<template>
  <div>

    <a id = "website" :href="brewery.website" target="_blank"> {{brewery.name}} </a>
    <!-- .info currently holds all the component details  -->
    <div class="info">
     
      <!-- contact info: left 1/3 of page -->
      <div class="contact">
        <h2>Contact Us</h2>
        <h4 id="phone"> {{ brewery.phone }} </h4>
        <h5 id="address"> {{ brewery.address }} </h5>
      </div>


      <!-- linked name: middle 1/3 of page -->
      <!-- <div class="name">
        <a :href="brewery.website" target="_blank"> {{brewery.name}} </a>
      </div> -->
     
      <!-- hours: right 1/3 of page -->
      <div class="hours">
        <h2>Hours</h2>
        <!-- this is a hot mess of code, but it works! -->
        <p v-for="day in dailyHours(brewery.hoursDaysOperation)" v-bind:key="day" id="day"> {{ day }} </p>
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
  //fetch brewery details from brewery service immediately after this component is created.
  created() {
    BreweryService
      .getBreweryDetails(this.$route.params.id)
      .then(response => {
      this.brewery = response.data;
    });
  },
  methods: {
    dailyHours(string) {
      const daily = string.split(/\n/);
        return daily;                    
      }
    }
  }
</script>


<style scoped>

#website {
  text-align: center;
  margin: 0 auto;
  display: block;
  padding-top: 20px;
  padding-bottom: 10px;
}


.info {
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
  grid-template-columns: repeat(3, 30%);
  gap: 99px;
  padding-top: 20px;
  padding-left: 20px;
  padding-right: 20px;
  text-align: center;
}
.name {
  text-align: center;
  padding-top: 20px;
}
/* currently applies to every div inside .info block */
.info > .contact, .name, .hours {
  border:black 1px solid;




}


.contact, .name, .hours {
  padding: 1px 40px;
}


#day {
  line-height: 5px;
}


.info >div {
  max-width: 300px;
}


</style>
