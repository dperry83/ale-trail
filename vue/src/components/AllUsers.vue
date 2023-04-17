<template>
    <div class="users">
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
                    v-bind:key="user.id">
                    <td> {{ user.id }} </td>
                    <td> {{ user.username }} </td>
                    <td> {{ user.authorities[0].name }} </td>
                    <td> {{ user.name }} </td>
                    <td> {{ user.city }} </td>
                    <td> {{ user.state }} </td>
                    <td> {{ user.zip }} </td>
                   
                    <td> 
                        <label for="role-change">Change Role: </label> <br>
                        <select 
                          name="role-change" 
                          id="role-dropdown" 
                          v-model="activeUser.role"                        
                          >
                            <option value="none"></option>
                            <option value="ROLE_USER">User</option>
                            <option value="ROLE_BREWER">Brewer</option>
                            <option value="ROLE_ADMIN">Administrator</option>
                        </select>
                    </td>
                </tr>
            </tbody>
        </table>
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
                id: '',
                username: '',
                name: '',
                city: '',
                state: '',
                zip: '',
                role: ''
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
        changeRole() {
            
            // const user = {
            //     id: this.user.id,
            //     username: this.user.username,
            //     name: this.user.name,
            //     city: this.user.city,
            //     state: this.user.state,
            //     zip: this.user.zip,
            //     role: newRole
            // };
            UserService
                .updateUser()
                .then( response => {
                    if(response.status === 200) {
                        this.$router.push('/admin')
                    }
                })
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