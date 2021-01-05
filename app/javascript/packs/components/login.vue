<template>
    <b-container class="d-flex justify-content-center">
      <v-app>
      <v-form class="login-form">
        <v-card-title>ログイン</v-card-title>
        <v-text-field v-model="loginEmail" hint="入力中。最大10文字" label="email" color="green darken-5" clearable class="login-input"></v-text-field>
        <v-text-field v-model="loginPassword" hint="最低8文字" counter=8 color="green darken-5" clearable class="login-input" label="password" type="password"></v-text-field>
        <v-btn @click="Logined">ログイン</v-btn>
    　    <router-link to="signup/">新規作成</router-link>
      </v-form>
    </v-app>
    </b-container>
</template>

<script>
   import axios from 'axios';
    axios.defaults.headers.common = {
        'X-Requested-With': 'XMLHttpRequest',
        'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf-token"]').getAttribute('content')
    };
  export default {
         data() {
           return {
             loginEmail: '',
             loginPassword: '',
             s: false
           }
         },
         methods: {
            //  Logined(){
            //         this.$store.dispatch('isLoggedIn')
            // },
                Logined(){
                     axios.post('/api/sessions', {session: {email: this.loginEmail, password: this.loginPassword}})
                    .then(res => {
                        this.loginEmail = '',
                        this.loginPassword = '',
                        this.$store.dispatch('isLoggedIn')
                        this.$router.push('/')
                    // this.$stroe.commit('getUser', res.data)
                })
            }
            
         },
         computed:{
            // loginEmail(){
            //   return this.$store.state.loginEmail
            // },
            // loginPassword(){
            //   return this.$store.state.loginPassword
            // }
         }
  }
</script>

<style>
.login-input{
    width: 400px;
  }
.login-form{
  padding:10px 10px 10px 10px; 
  border: solid black 1px;
}  
</style>