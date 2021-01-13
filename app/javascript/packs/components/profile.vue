






<template>
  <v-card width="800px" class="mx-auto mt-5 profile">
    <v-card-title>
      <h3 >プロフィール </h3>
    </v-card-title>

      <img 
      :src="user.icon.url" 
        class="icon"
      />


    <v-card-text>
      <div class="name">
        <p>name</p>
      </div>
        <div class="follow">


  <div class="contents">
    <label v-show="!uploadedImage" class="input-item__label"
      >画像を選択
      <input type="file" @change="onFileChange" />
    </label>
    <div class="preview-item">
      <div v-show="uploadedImage" class="preview-item-btn" @click="remove">
        <p class="preview-item-name">{{ img_name }}</p>
      </div>
    </div>
  </div>



          <button @click="updateUser()">dswd2</button>
          <input type="text" v-model="putIcon">
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
   import axios from 'axios';
    axios.defaults.headers.common = {
        'X-Requested-With': 'XMLHttpRequest',
        'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf-token"]').getAttribute('content')
    };
   export default {
     data() {
       return {
         icon:"",
         id: this.$route.params.userId,
         putIcon: '',
         user: [],
         uploadedImage: '',
         img_name: '',    
       }
     },
     mounted () {
        // this.$refs.ThumbsUp.$data.active = true;
        // console.log(this.$refs.ThumbsUp.$Adata);
     },
     created(){
       this.fetchUser();
        //  this.userLogin
     },
    methods:{
        click(){
        },
        fetchUser() {
            axios.get('/api/users/' + this.id).then(response => {
                    this.user = response.data
            });
        },
         updateUser() {
             axios.put('/api/users/' + this.id , {user: {icon: this.uploadedImage}}).then(response => {
                this.putIcon = '';
                this.uploadedImage = '';
                this.fetchUser();
             });

         },
        onFileChange(e) {
          const files = e.target.files || e.dataTransfer.files;
          this.createImage(files[0]);

          this.img_name = files[0].name;
          let formdata = new FormData()
          formdata.append('user[icon]', files[0]);
          let config = {
              headers: {
                  'content-type': 'multipart/form-data'
              }
          };
          console.log(formdata)
          axios.put('/api/users/' + this.id ,formdata, config).then(response => {
            this.user = response.data
          });
        },
        createImage(file) {
          const reader = new FileReader();
          reader.onload = e => {
            this.uploadedImage = e.target.result;
            // console.log(this.uploadedImage)

          };
          // axios.put('/api/users/' + this.id , {user: {icon: file}}).then(response => {
          //   // this.putIcon = '';
          //   // this.uploadedImage = '';
          //   // this.fetchUser();
          // });


          reader.readAsDataURL(file);
        },
        remove() {
          this.uploadedImage = false;
        },

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
