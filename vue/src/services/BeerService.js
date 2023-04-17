import axios from "axios";

const http = axios.create({
    baseURL: 'http://localhost:9000'
})

export default {
    getAllBeers() {
        return http.get('/beers')
    },
    getBeersByBrewery(id) {
        return http.get(`beers/breweryId=${id}`)
    }, 
    addBeer(beer) {
        return http.post('/beers', beer);
    },
    deleteBeer(beerId) {
        return http.delete(`/beers/${beerId}`);
    }
}