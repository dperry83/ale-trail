<template>
<body>
  

  <div id="login" class="text-center">
    
    <form class="form-signin" @submit.prevent="login">
      <img id="logo" src="logo_thumbnail.png" alt="da logo">
      <h1 class="h3 mb-3 font-weight-normal">Please Sign In</h1>
      <div
        class="alert alert-danger"
        role="alert"
        v-if="invalidCredentials"
      >Invalid username and password!</div>
      <div
        class="alert alert-success"
        role="alert"
        v-if="this.$route.query.registration"
      >Thank you for registering, please sign in.</div>
      <label for="username" class="sr-only">Username: &nbsp;</label>
      <input
        type="text"
        id="username"
        class="form-control"
        placeholder="Username"
        v-model="user.username"
        required
        autofocus
      />
      <br>
      <br>
      <label for="password" class="sr-only">Password:  &nbsp;&nbsp;</label>
      <input
        type="password"
        id="password"
        class="form-control" 
        placeholder="Password"
        v-model="user.password"
        required
      />
      <br>
      <br>
      <router-link :to="{ name: 'register' }">Need an account?</router-link>
      <button id="submit" type="submit">Sign in</button>
    </form>
  </div>
  </body>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>

<style scoped>

#logo {
  transform: scale(1.5);
  margin-left: 35%;
}

#login{
  
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100vw;
  height: 80vh;
  
 /* 
  border: 2px solid black;
  top: 30%;
  margin-left: 20%;
  width: 400px;
  height: 500px;
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  position: fixed;
 */
}

#submit {
  color: white;
  background-color: rgba(6,40,81,255);
  margin-left: 70px;
}


body {
  background-image: url("beerbackground.jpg");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  margin: 0;
  height: 100vh;
  width: 100vw;
}

</style>
