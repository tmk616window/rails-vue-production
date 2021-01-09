<template>
  <v-card width="400px" class="mx-auto mt-5">
    <v-card-title>
      <h3 >ログイン </h3>
    </v-card-title>
    <v-card-text>
      <v-form>
        <v-text-field prepend-icon="mdi-account-circle" v-model="loginEmail" hint="入力中。最大10文字" label="メールアドレス" />
        <v-text-field prepend-icon="mdi-lock" append-icon="mdi-eye-off" v-model="loginPassword"   label="password" />
        <v-btn
          rounded
          color="primary"
          dark
          @click="Logined"
        >
          ログイン
        </v-btn>
    　    <router-link to="signup/">新規作成</router-link>
      </v-form>
    </v-card-text>
  </v-card>
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
                Logined(){
                     axios.post('/api/sessions', {session: {email: this.loginEmail, password: this.loginPassword}})
                    .then(res => {
                        this.loginEmail = '',
                        this.loginPassword = '',
                        this.$store.dispatch('isLoggedIn')
                        this.$router.push('/')
                })
            }
            
         },
  }
</script>

<style>
</style>