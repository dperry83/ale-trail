<template>
    <div class="new-brewery">
        <h1>Add New Brewery</h1>
        <form>
            <div class="user-id">
                <label for="brewer">Brewer ID: </label>
                <select name="brewer" id="brewerID"
                        v-model="newBrewery.userId">
                    <option disabled value="">Must be registered user</option>
                    <option v-for="user in filteredUsers" 
                            :key="user.id"
                            :value="user.id"
                            > {{ user.name }} </option>
                    
                </select>
            </div><br>
            <div class="brewery-name">
                <label for="location-name">Brewery Name: </label>
                <input type="text" id="reqText"
                       name="location-name"
                       placeholder="Required"
                       required
                       v-model="newBrewery.name"
                       >
            </div><br>
            <div class="image">
                <label for="image">Image Link: </label>
                <input type="text" name="image" id="imgLink"
                        v-model="newBrewery.image"
                        placeholder="http:// ...">
            </div><br>
            <div class="history">
                <label for="history" id="history-label">History Text: </label><br>
                <textarea name="history" id="history-text" 
                          cols="30" rows="5"
                          v-model="newBrewery.history"></textarea>
            </div><br>
            <div class="website">
                <label for="website">Website: </label>
                <input type="text" name="website" id="webText"
                       v-model="newBrewery.website"
                       placeholder="www.example.com">
            </div><br>
            <div class="hours-days">
                <label for="open-hours">Hours of Operation: </label><br>
                <textarea name="open-hours" 
                          id="hoursText" cols="30" rows="5"
                          v-model="newBrewery.hours_days_operation"
                          placeholder="Day(s): hours 
    Day(s): hours
    etc..."></textarea>
            </div><br>
            <div class="brewery-address">
                <label for="address">Street Address: </label>
                <input type="text" id="streetText"
                       name="address"
                       placeholder="Required"
                       required
                       v-model="newBrewery.address"
                       >
            </div><br>
            <div class="phone">
                <label for="phone-number">Phone: </label>
                <input type="text" name="phone" id="phoneText"
                       v-model="newBrewery.phone"
                       placeholder="no characters or spaces">
            </div><br>
            <button type="submit" id="saveBrewery"
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

<style scoped>
.new-brewery{
    margin-left: 380px;
}
#brewerID{
    margin-left: 65px;
}
#streetText{
    margin-left: 30px;
}

#hoursText{
    margin-left: 145px;
}

#webText{
    margin-left: 79px;
}
#phoneText{
    margin-left: 90px;
}

#reqText{
    margin-left: 31px;
}
#history-text{
    margin-left: 146px;
}
#imgLink{
    margin-left: 58px;
}

#saveBrewery{
border: 1px solid black;
background: rgba(6,40,81,255);
background-clip: padding-box;
color: white;
padding: 2px 10px;
border-radius: 5px;
}
</style>