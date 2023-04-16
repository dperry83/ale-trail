<template>
    <div>
        <h1>TEST TEXT</h1>   
        <h2>  </h2> 
    </div>
</template>

<script>

export default {
    name: 'user-props',
    data() {
        return {
            user: {
                username: this.$store.state.user.username
            }
        }
    }
}
</script>
