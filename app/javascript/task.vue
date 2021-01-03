<template>
    <v-app>
    <a href="/login">aaaa</a>
    <label for="">新規作成</label>
    <div>
        <v-text-field v-model="newTask" type="text" name="" class="postinput"/>
        <v-btn @click='createTask'>作成</v-btn>
    </div>
    <div class="collection">
        <v-container>
            <v-row classr="dark" style="height: 450px;">
        <div v-for="task in tasks" class="list" >
        <v-card hover width="300" height="410" class="card">
            <router-link :to="{name: 'task', params: {taskId: task.id}}" v-bind:for="'task_' + task.id" class="link">
            <div id="box">
              <div id="chart">
                <chart></chart>
              </div>
             <div class="box2">
                <p class="string">php</p> 
                <p class="string">php</p> 
                <p class="string">php</p> 
                <p class="string">phｚｚｚｚｚｚｚ</p>
                <p class="string">dl;cml;mcd</p>
             </div>
             <div>
                 <div class="like_box">
                    <p class="like_image"></p>
                    <p class="like_number">20</p>
                 </div>
                 <div class="message_box">
                    <p class="message_image"></p>
                    <p class="message_number">20</p>
                 </div>
             </div>
             <div class="user_box">
                 <p class="user_image"></p>
                 <p class="username">username</p>
             </div>
            </div>
            </router-link>
        </v-card>
        </div>
        </v-row>
        </v-container>  
    </div>
    <div class="user_form">
        <p class="user_form_image"></p>
    </div>
    </v-app>
</template>
<script>
   import Chart from './packs/components/chart.vue';
   import axios from 'axios';
    axios.defaults.headers.common = {
        'X-Requested-With': 'XMLHttpRequest',
        'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf-token"]').getAttribute('content')
    };
   export default {
     components: {
        Chart
     },
     data() {
       return {
         task: [],
         tasks: [],
         task: {
             id: '',
             name: ''
         },
         newTask: '',
         putTask: ''
       }
     },
     mounted () {
        // this.$refs.ThumbsUp.$data.active = true;
        // console.log(this.$refs.ThumbsUp.$Adata);
     },
     created(){
         this.fetchTasks();
     },
     methods: {
         fetchTasks() {
                axios.get('/api/tasks').then(response => {
                this.tasks = response.data.tasks
             });
         },
         createTask(){
             axios.post('/api/tasks', {task: {name: this.newTask}}).then(response => {
                axios.post('/api/protags', {task: {name: this.newTask}}) 
                this.newTask = '';
                var element = document.documentElement;
                var bottom = element.scrollHeight - element.clientHeight;
                window.scroll(0, bottom);
                axios.get('/api/tasks').then(response => {
                this.tasks = response.data.tasks
                });
            });
        },
         updateTask(id) {
             axios.put('/api/tasks/' + id , {task: {name: this.putTask}}).then(response => {
                this.putTask = '';
                axios.get('/api/tasks').then(response => {
                this.tasks = response.data.tasks
                });
             });
         },
         deleteTask(id) {
            axios.delete('/api/task/' + id ).then(response => {
                axios.get('/api/task').then(response => {
                this.tasks = response.data.tasks
                });
            });
        },
    },
  computed:{
    userLogin(){
      // return this.$store.getters.login
    }
  }
    
   }
</script>

<style scoped>
.putinput{
    width: 120px; 
}
.postinput{
    width: 120px;
}
#chart{
    height: 220px;
    width: 250px;
    margin:0 auto;
    border-radius: 10px;
    border: solid 4px #FF9872;
    padding-left: 5px;
    padding-right: 5px;
}
#box{
    height: 300px;
    width: 300px;
}
.box2{
    margin: 10px 10px 5px 10px;
}
.card{
    margin: 10px 10px 10px 10px;
    padding-top: 10px;
    padding-bottom: 10px;
}
.string{
    background-color:#DCC2FF;
    display: inline-block;
    padding: 3px 5px 3px 5px;
    color: white;
    text-decoration:none;
    margin: 0;
    margin-bottom: 4px;
}
.string:hover {
    text-decoration:none;
}
.link{
  text-decoration: none;
}
.link:hover{
    text-decoration: none; /* リンクに出てくる下線を無効にする*/    
}
.user_image{
    width: 40px;
    height: 40px;
    border: solid 1px black;
    float: left;
    margin-right: 10px;
}
.user_box{
    margin-left: 10px;
    margin-top: 10px;
}
.username{
    font-size: 25px;
}
.like_box{
    width: 80px;
    height: 37px;
    margin-bottom: 3px;
    margin-left:10px ;
    display: inline-block;
    border-radius: 10px;
    border: solid 4px #FF3366;
}
.like_image{
    margin-top: 4px;
    margin-left: 10px;
    width: 22px;
    height: 22px;
    border: solid 1px black;
    float: left;
    margin-right: 8px;
}
.like_number{
    font-size: 22px;
    display: block;
    color: #FF3366;
    
}
.message_number{
    font-size: 22px;
    display: block;
    color: #8EB8FF;
}
.message_image{
    margin-top: 4px;
    margin-left: 10px;
    width: 22px;
    height: 22px;
    border: solid 1px black;
    float: left;
    margin-right: 8px;
}
.message_box{
    border: solid 4px #8EB8FF;
    width: 80px;
    height: 37px;
    margin-bottom: 3px;
    margin-left:10px ;
    display: inline-block;
    border-radius: 10px;
}
</style>
