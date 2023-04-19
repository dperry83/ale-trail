<template>
  <div class="maps">
    <iframe
      width="375"
      height="375"
      style="border:0"
      loading="lazy"
      allowfullscreen
      :src="embedUrl"
    ></iframe>
  </div>
</template>

<script>
export default {
  data() {
    return {
      apiKey: 'AIzaSyA8sLeXelx_lS6KyS1vF0A1hD7d2DSR3Fs',
    }
  },
  computed: {
    embedUrl() {
      return `https://www.google.com/maps/embed/v1/place?q=place_id:ChIJBRKffr8ys1IRLfE2DXkOZrQ&key=${this.apiKey}`;
    }
  }
}
</script>
