<template>
    <div class="review">
        <h1>Reviews</h1>
        <new-review />
    </div>
</template>

<script> 
import NewReview from '../components/NewReview.vue'

export default {
    name: "testreview",
    components: {
        NewReview
    }
}

</script>

<style scoped>
h1{
    text-align: center;
}
</style>