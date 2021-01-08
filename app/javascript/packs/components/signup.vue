<template>
  <v-card width="400px" class="mx-auto mt-5">
    <v-card-title>
      <h3 >新規登録 </h3>
    </v-card-title>
    <v-card-text>
      <v-form>
        <v-text-field v-model="newName"  prepend-icon="mdi-account-circle"  hint="入力中。最大10文字" label="ユーザー名" />
        <v-text-field v-model="newEmail"  prepend-icon="mdi-folder-outline" hint="入力中。最大10文字" label="メールアドレス" />
        <v-text-field v-model="newPassword" prepend-icon="mdi-lock" append-icon="mdi-eye-off"   label="パスワード" type="password"  />
        <v-text-field v-model="newPassword_confirmation" prepend-icon="mdi-lock" append-icon="mdi-eye-off" label="パスワード確認" type="password"  />
        <v-btn
          rounded
          color="primary"
          dark
          @click="createUser"
        >
          登録
        </v-btn>
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
     data: function () {
       return {
        //  form1: "<input v-model='putTask' type='text' />",
         tasks: [],
         newName: '',
         newEmail: '',
         newPassword: '',
         newPassword_confirmation: ''
       }
     },
    //  created: function(){
    //      this.fetchTasks();
    //  },
     methods: {
         createUser(){
             axios.post('/api/users', {user: {name: this.newName, email: this.newEmail, password: this.newPassword, password_confirmation: this.newPassword_confirmation}}).then(response => {
                this.newName = '';
                this.newEmail = '';
                this.newName = '';
                this.newPassword = '';
                this.newPassword_confirmation = '';
                this.$router.push('/login')
            });
        },
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
