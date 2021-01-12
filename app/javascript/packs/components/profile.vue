<template>
  <v-card width="800px" class="mx-auto mt-5 profile">
    <v-card-title>
      <h3 >プロフィール </h3>
    </v-card-title>
    <v-card-text>
      <div>
          <p class="icon"></p>
      </div>
      <div class="name">
        <p>name</p>
      </div>
        <div class="follow">
          <input type="file">
            <p class="follow_string">フォロワー：{{}}</p>
            <p>フォロー：{{}}</p>
        </div>
        <div class="content">
          <p>aaa年齢：　　　　　{{}}</p>
          <p>職業：　　　　　{{}}</p>
        </div>
    </v-card-text>
  </v-card>

</template>


<script>
   export default {
     data() {
       return {
       }
     },
     mounted () {
        // this.$refs.ThumbsUp.$data.active = true;
        // console.log(this.$refs.ThumbsUp.$Adata);
     },
     created(){
        //  this.userLogin
     },
    computed:{
        userLogin(){
        return this.$store.getters.login
        }
    }
}  
</script>
<style scoped>
.profile{

}
.icon{
    border:solid black 1px;
    height: 200px;
    width: 200px;
    border-radius: 50%;
    margin:0 auto;
}
.text{
    margin-left: 70px;
    margin-top: 10px;

}

.content p{
    text-align: center;
}

.comment_input{
    border:solid black 1px;
    padding: 20px;
    padding-bottom: 40px;
    max-width: 80%;
    margin: 0 auto;
}

.follow{
  text-align: center;
}

.follow p{
	display: inline-block;

}

.content{
  margin:0 auto;
}

.follow_string{
}

.name p {
  text-align:center;
}
</style>