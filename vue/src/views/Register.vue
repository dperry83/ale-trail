<template>
  <div id="register" class="text-center">
    <form class="form-register" @submit.prevent="register">
      <h1 class="h3 mb-3 font-weight-normal">Create Account</h1>
      <div class="alert alert-danger" role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>

      <div class="username-input">
      <label for="username" class="sr-only">Username: </label>
        <input
          type="text"
          id="username"
          class="form-control"
          placeholder="Username"
          v-model="user.username"
          required
          autofocus
        />
      </div>
      <br>
      <div class="password-input">
        <label for="password" class="sr-only">Password: &nbsp;</label>
        <!-- input type "password" is what makes the letters disappear when typing! -->
        <input
          type="password"
          id="password"
          class="form-control"
          placeholder="Password"
          v-model="user.password"
          required
        /><br>
        <br>
       <input
          type="password"
          id="confirmPassword"
          class="form-control"
          placeholder="Confirm Password"
          v-model="user.confirmPassword"
          required
        />
      </div>
      <br>
      <div class="personal-info">
        <label for="name">Full Name: </label>
        <input 
          type="text"
          id="full-name"
          class="form-control"
          placeholder="Full Name"
          v-model="user.name"
          required
          />
      </div>
      <br>
      <div class="location">
        <label for="home-city">Home City: </label>
          <input 
            type="text"
            id="city"
            class="form-control"
            placeholder="City"
            v-model="user.city"
            required
            /> 
            <br>
            <br>
        <label for="home-state">Home State: </label>
          <select 
            id="state"
            v-model="user.state"
            required>
              <option value="AL">AL</option>
              <option value="AK">AK</option>
              <option value="AR">AR</option>
              <option value="AZ">AZ</option>
              <option value="CA">CA</option>
              <option value="CO">CO</option>
              <option value="CT">CT</option>
              <option value="DC">DC</option>
              <option value="DE">DE</option>
              <option value="FL">FL</option>
              <option value="GA">GA</option>
              <option value="HI">HI</option>
              <option value="IA">IA</option>
              <option value="ID">ID</option>
              <option value="IL">IL</option>
              <option value="IN">IN</option>
              <option value="KS">KS</option>
              <option value="KY">KY</option>
              <option value="LA">LA</option>
              <option value="MA">MA</option>
              <option value="MD">MD</option>
              <option value="ME">ME</option>
              <option value="MI">MI</option>
              <option value="MN">MN</option>
              <option value="MO">MO</option>
              <option value="MS">MS</option>
              <option value="MT">MT</option>
              <option value="NC">NC</option>
              <option value="NE">NE</option>
              <option value="NH">NH</option>
              <option value="NJ">NJ</option>
              <option value="NM">NM</option>
              <option value="NV">NV</option>
              <option value="NY">NY</option>
              <option value="ND">ND</option>
              <option value="OH">OH</option>
              <option value="OK">OK</option>
              <option value="OR">OR</option>
              <option value="PA">PA</option>
              <option value="RI">RI</option>
              <option value="SC">SC</option>
              <option value="SD">SD</option>
              <option value="TN">TN</option>
              <option value="TX">TX</option>
              <option value="UT">UT</option>
              <option value="VT">VT</option>
              <option value="VA">VA</option>
              <option value="WA">WA</option>
              <option value="WI">WI</option>
              <option value="WV">WV</option>
              <option value="WY">WY</option>
          </select>
          
          <!-- <input 
            type="text" min="2" max="2"
            id="state"
            class="form-control"
            placeholder="State"
            v-model="user.state"
            required
            />
            <br> -->
            <br><br>
        <label for="home-zip"> Zip: </label>
          <input 
            type="text"
            id="zip"
            class="form-control"
            placeholder="Zip"
            v-model="user.zip"
            required
            />
      </div>
        <br>
      
      <button class="btn btn-lg btn-primary btn-block" type="submit" id="submit">
        Create Account
      </button>
      <br><br>

      <router-link :to="{ name: 'login' }">Have an account?</router-link>
    
    </form>
  </div>
</template>

<script>
import authService from '../services/AuthService';

export default {
  name: 'register',
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
        name: '',
        city: '',
        state: '',
        zip: ''

      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
</script>

<style scoped>
#submit{
  background-color:  rgba(6,40,81,255);
  color: white;
}
#register{
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100vw;
  height: 80vh;
  /*border: 1px solid black;
  width: 900px;
  height: 600px;
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  position: fixed;
 */
}

#confirmPassword.form-control {
  margin-left: 81px
}
</style>
