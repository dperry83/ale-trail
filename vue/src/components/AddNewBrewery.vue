<template>
    <div class="new-brewery">
        <h1>Add New Brewery</h1>
        <form>
            <div class="user-id">
                <label for="brewer">Brewer ID: </label>
                <select name="brewer"
                        v-model="newBrewery.userId">
                    <option disabled value="">Must be registered user</option>
                    <option v-for="user in filteredUsers" 
                            :key="user.id"
                            :value="user.id"
                            > {{ user.name }} </option>
                    
                </select>
            </div>
            <div class="brewery-name">
                <label for="location-name">Brewery Name: </label>
                <input type="text" 
                       name="location-name"
                       placeholder="Required"
                       required
                       v-model="newBrewery.name"
                       >
            </div>
            <div class="brewery-address">
                <label for="address">Street Address: </label>
                <input type="text" 
                       name="address"
                       placeholder="Required"
                       required
                       v-model="newBrewery.address"
                       >
            </div>
            <button type="submit"
                    @click.prevent="createBrewery()">Save Brewery</button>

        </form>
    </div>
</template>

<script>
import UserService from '../services/UserService';
import BreweryService from '../services/BreweryService';

export default {
    data() {
        return {
            users: [],
            newBrewery: {
                userId: '',
                name: '',
                image: '',
                history: '',
                website: '',
                hours_days_operation: '',
                address: '',
                phone: ''
            },
            filteredUsers: []
        }
    },
    created() {
        UserService
            .getAllUsers()
            .then (response => {
                this.users = response.data;
                this.filterUsers();
            })
    },
    methods: {
        createBrewery() {
            BreweryService
                .addNewBrewery(this.newBrewery)
                .then(response => {
                    if(response.status === 201) {
                        console.log("brewery successfully added");
                    }
                })
        },
        filterUsers() {
            this.users.forEach(user => {
                if(user.role === 'ROLE_BREWER') {
                    this.filteredUsers.push(user)
                }
            })
        },        
    }
}
</script>
