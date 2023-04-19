import axios from "axios";

const http = axios.create({
    baseURL: 'http://localhost:9000'
})

export default {
    getAllBreweries() {
        return http.get('/breweries')
    },
    getBreweryDetails(id) {
        return http.get(`/breweries/${ id }`)
    },
    addNewBrewery(brewery) {
        return http.post(`/breweries`, brewery)
    },
    updateBrewery(brewery) {
        return http.put(`/breweries/${brewery.breweryId}`, brewery)
    },
    getBreweriesByUserId(userId){
        return http.get(`/breweries/user/${userId}`);
    }
}