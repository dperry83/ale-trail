import axios from "axios";

const http = axios.create({
    baseURL: 'http://localhost:9000'
})

export default {
    saveNewReview(review) {
        return http.post(`/review`, review)
    },

    getAllBeers() {
        return http.get(`/beers`)
    },

    getAllBreweries() {
        return http.get(`/breweries`)
    }
}
