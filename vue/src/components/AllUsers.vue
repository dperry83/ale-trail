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
                    <td> {{ user.authorities[0].name }} 
                        <div class="update-role">
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
                        </div>
                    </td>
                    <td> {{ user.name }} 
                        <div v-if="user.id === activeUser.id">
                            <label for="name-update">Update Name:</label> 
                            <br>
                            <input type="text" name="name-update"
                                   v-model="activeUser.name"
                                   >
                        </div>
                    </td>
                    <td> {{ user.city }} 
                        <div v-if="user.id === activeUser.id">
                            <label for="city-update">Update City:</label>
                            <br>
                            <input type="text" name="city-update"
                            v-model="activeUser.city"
                            >
                        </div>
                    </td>
                    <td> {{ user.state }} 
                        <div v-if="user.id === activeUser.id">
                            <label for="state-update">Update State Abbr:</label>
                            <br>
                            <input type="text" name="state-update"
                            v-model="activeUser.state"
                            minlength="2" maxlength="2">
                        </div>
                    </td>
                    <td> {{ user.zip }} 
                        <div v-if="user.id === activeUser.id">
                            <label for="zip-update">Update Zip:</label>
                            <br>
                            <input type="text" name="zip-update"
                            minlength="5" maxlength="10"
                            v-model="activeUser.zip"
                            >
                        </div>
                    </td>
                    <td>
                        <button 
                        v-on:click="setActiveUser(user)">Edit User</button>
                    </td>
                </tr>
            </tbody>
        </table>
        </div>
        <div class="edit-user">
            <h3 id="update-user">UPDATE USER</h3>
            <div class="first-column">
                <h4>User: {{ activeUser.name }} </h4>
                <h4>ID: {{ activeUser.id }} </h4>
                <h4>username: {{ activeUser.username }} </h4>
                <h4>Role: {{ activeUser.role }}</h4>
            </div>
            <div class="second-column">
                <h4>Name: {{ activeUser.name }} </h4>
                <h4>City: {{ activeUser.city }} </h4>
                <h4>State: {{ activeUser.state }} </h4>
                <h4>Zip: {{ activeUser.zip }} </h4>
            </div>
            <button @click="changeRole(activeUser)"  >Commit Changes</button>
            <button @click="cancelChange()"> Cancel</button>
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
            activeUser: {}
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
            confirm('Please confirm user update').then
            UserService
                .updateUserRole(activeUser.id, activeUser)
                .then( response => {
                    if(response.status === 200) {
                       alert("User successfully updated.");
                       window.location.reload();
                    }
                })
        },
        setActiveUser(user) {
            this.activeUser = user
        },
        cancelChange() {
            this.activeUser = []
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
.edit-user {
    /* display: inline-block; */
    margin: auto;
    width: 60%;
}
.edit-user > 
  .first-column, 
  .second-column {
      display: inline-block;
      border: 1px solid black;
      margin: 10px;
      width: 40%;
  }
.update-user {
    margin: auto;
}
</style>