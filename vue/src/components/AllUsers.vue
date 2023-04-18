<template>
    <div class="users">
        <div class="all-users">
        <table class="user-table">
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>username</th>
                    <th>Current Role</th>
                    <th>Name</th>
                    <th>City</th>
                    <th>State</th>
                    <th>Zip</th>
                    <th>ACTIONS</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="user in users" 
                    v-bind:key="user.id"
                    >
                    <td> {{ user.id }} </td>
                    <td> {{ user.username }} </td>
                    <td> {{ user.authorities[0].name }} </td>
                    <td> {{ user.name }} </td>
                    <td> {{ user.city }} </td>
                    <td> {{ user.state }} </td>
                    <td> {{ user.zip }} </td>
                    <td>
                        <button 
                        v-on:click="setActiveUser(user)">Edit User</button>
                    </td>
                    
                        <label for="role-change"
                            v-if="user.id === activeUser.id">Update Role: </label> <br>
                        <select 
                          name="role-change" 
                          id="role-dropdown"       
                          v-model="activeUser.role"
                          v-if="user.id === activeUser.id"                  
                          >
                            <option value="none"></option>
                            <option value="ROLE_USER">User</option>
                            <option value="ROLE_BREWER">Brewer</option>
                            <option value="ROLE_ADMIN">Administrator</option>
                        </select>
                    
                </tr>
            </tbody>
        </table>
        </div>
        <div class="edit-user">
            <h3>UPDATE USER PERMISSIONS</h3>
            <h4>User:  {{ activeUser.name }} </h4>
            <h4>ID: {{ activeUser.id }} </h4>
            <h4>username: {{ activeUser.username }} </h4>
            <h4>New Role: {{ activeUser.role }}</h4>
            <button @click="changeRole(activeUser)" >Commit Changes</button>
        </div>
    </div>
</template>

<script> 
import UserService from '../services/UserService.js'

export default {
    name: 'all-users',
    data() {
        return {
            users: [],
            activeUser: {
                role: '',
                city: '',
                id: '',
                name: '',
                state: '',
                username: '',
                zip: ''
            }
        }
    },
    created() {
        UserService
            .getAllUsers()
            .then( response => {
                this.users = response.data
            })
    },
    methods: {
        changeRole(activeUser) {
            // deleted the authorities property before sending the object
            // will look into why the server functions this way
            delete activeUser.authorities;
            UserService
                .updateUserRole(activeUser.id, activeUser)
                .then( response => {
                    if(response.status === 200) {
                        console.log("update successful!");
                    }
                })
        },
        setActiveUser(user) {
            this.activeUser = user
        }
}
}
</script>

<style scoped> 
table {
    width: auto;
    margin: auto;
    border-collapse: collapse;
    padding: 10px 30px 10px 15px;
    ;
   
}
th, td {
    text-align: center;
    border: 1px solid black;
    padding: 13px 10px;
}
td {
    padding-right: 10px;
    vertical-align: top;
}


div#beersTable {
    padding-top: 25px;
}


</style>