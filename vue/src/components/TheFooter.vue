<template>
    <div>
        <div id="bottomBar" style="height: 60px; width: 100%; background-color:  rgba(6,40,81,255); color: white;">
            <router-link
                class="footer-link"
                v-bind:to="{ name: 'admin' }"
                v-if="this.$store.state.user.authorities[0].name === 'ROLE_ADMIN'"
                >Admin</router-link><br>
            <router-link
                class="footer-link"
                v-bind:to="{ name: 'brewer'}"
                v-if="this.$store.state.user.authorities[0].name === 'ROLE_BREWER'"
                >Brewer</router-link>
        </div>
    </div>
    
</template>

<script>

export default {
    name: 'the-footer'
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
