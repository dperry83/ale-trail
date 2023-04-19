<template>
    <div>
        <div id="bottomBar" style="height: 60px; width: 100%; background-color:  rgba(6,40,81,255); color: white;">
            <router-link
                class="footer-link"
                v-bind:to="{ name: 'admin' }"
                v-if="authUserRole === 'ROLE_ADMIN'"
                >Admin</router-link><br>
            <router-link
                class="footer-link"
                v-bind:to="{ name: 'brewer'}"
                v-if="authUserRole === 'ROLE_BREWER'"
                >Brewer</router-link>
        </div>
    </div>
    
</template>

<script>
import UserService from '../services/UserService.js'

export default {
    name: 'the-footer',
    data() {
        return {
            authUserRole: ''
        }
    },
    created() {
        UserService
            .getCurrentUser(this.$store.state.user.username)
            .then( response => {
                this.authUserRole = response.data.authorities[0].name
            })
    }
}
</script>

<style scoped>
div#bottomBar {
    margin-top: 100px;
}
.footer-link {
    color: white;
    margin-left: 10px;
}
</style>
