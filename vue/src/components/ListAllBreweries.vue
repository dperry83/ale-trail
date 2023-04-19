<template>
  <div id="breweryTable">
    <table>
      <thead>
        <tr>
          <th>
            Name
            <input type="text" v-model="searchTerm" placeholder="search" />
          </th>
          <th>History</th>
          <th>Address</th>
          <th>Phone</th>
        </tr>
      </thead>

      <div class="loading" v-if="isLoading">
        <img src="beer-67.gif" />
      </div>
      <tbody>
        <tr v-for="item in filteredBreweries" v-bind:key="item.breweryId">
          <!-- links to finerdetails, using this breweryId as a parameter -->
          <td>
            <router-link
              v-bind:to="{
                name: 'finerdetails',
                params: { id: item.breweryId },
              }"
            >
              {{ item.name }}
            </router-link>
          </td>
          <td>{{ item.history }}</td>
          <td>{{ item.address }}</td>
          <td>{{ item.phone }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import BreweryService from "../services/BreweryService";

export default {
  name: "brewery-list",
  data() {
    return {
      breweries: [],
      isLoading: true,
      searchTerm: "",
    };
  },
  // calls BreweryService and populates data {breweries} w/ info at that endpoint
  created() {
    BreweryService.getAllBreweries().then((response) => {
      this.breweries = response.data;
      this.isLoading = false;
    });
  },
  computed: {
    filteredBreweries() {
      return this.breweries.filter((item) => {
        return item.name.toLowerCase().includes(this.searchTerm.toLowerCase());
      });
    },
  },
};
</script>

<style scoped>
table {
  width: 80%;
  margin-left: 10%;
  border-collapse: collapse;
}
th,
td {
  text-align: center;
  border: 1px solid black;
  padding: 13px 10px;
}

th {
  color: white;
  background-color: #062851;
}
td {
  padding-right: 10px;
  vertical-align: top;
}

div#breweryTable {
  padding-top: 30px;
}
</style>
