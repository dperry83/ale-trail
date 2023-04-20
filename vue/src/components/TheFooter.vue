<template>
    <div>
        <div id="bottomBar" class="bottom-bar">
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
.bottom-bar {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    height: 60px;
    width: 100%;
    background-color: rgba(6,40,81,255);
    color: white;
    margin-top: 100px;
}
.footer-link{
    
    font-weight: bold;
    background-clip: padding-box;
    color: white;
    padding: 2px 20px;
    margin-left: 20px;
}
</style>
