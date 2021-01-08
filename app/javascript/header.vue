<template>
  <v-app>
    <header>
      <v-app-bar
        app
        dark
      >
        <v-app-bar-nav-icon @click="drawer = true"></v-app-bar-nav-icon>
        <v-toolbar-title class="bar-title">ENJOB</v-toolbar-title>
                        <p>{{userLogin.id}}</p>
      <div v-if="userLogin.name">
        <button @click="logout">ログアウと</button>
      </div>
      <div v-else>
        <p>aaaaa</p>
      </div>

      </v-app-bar>
      

      <v-navigation-drawer
        v-model="drawer"
        fixed
        temporary
      >
        <v-list
          nav
          dense
        >
          <v-list-item-group>

            <router-link to="/" class="link">
            <v-list-item>
              <v-list-item-title >ホーム</v-list-item-title>
            </v-list-item>
            </router-link>
            
      <div v-if="userLogin.name">
            <router-link :to="{name: 'user_profile', params: {userId: userLogin.id}}" class="link">
            <v-list-item>
              <v-list-item-title >プロフィール</v-list-item-title>
            </v-list-item>
            </router-link>
      </div>
      <div v-else>
            <router-link to="/login" class="link">
            <v-list-item>
              <v-list-item-title >ログイン</v-list-item-title>
            </v-list-item>
            </router-link>
      </div>




          </v-list-item-group>
        </v-list>
    </v-navigation-drawer>
    </header>
  </v-app>
</template>

<script>
 
export default {
  data () {
    return {
      drawer: false,
    }
  },
  created(){
    this.usermane;
    this.userLogin;
    // this.logout();
  },
  methods:{
    logout(){
      this.$store.dispatch('logout')
      this.$router.push('/')
    },
    usersigned(){
      this.$store.commit('Signined')
    }
  },
  computed:{
    userLogin(){
      return this.$store.getters.login
    },
    userSignined(){
      return this.$store.getters.signined
    },
    a(){
      return this.$store.getters.a
    }
  }
}
</script>

<style scoped>
body{
  margin-top: 150px;
  margin-bottom: 150px;
}
div{
  height: 25px;
}
.link{
  text-decoration: none;
}
.link:hover{
    text-decoration: none; /* リンクに出てくる下線を無効にする*/    
}
</style>