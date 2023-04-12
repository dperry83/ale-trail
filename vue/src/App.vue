<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>
    <router-view />
  </div>
</template>

<style scoped>
  body {
    background: rgb(6,40,81);
  background: linear-gradient(0deg, rgba(6,40,81,1) 44%, rgba(200,133,44,1) 78%);
  }
</style>