<template>
  <v-app>
      <br><br><br><br>
      <br><br>


<div class="show_box">
    <div class="card">
    <div>
    <div>
        <div class="chart">
              <Chart 
              :infra_point="task.infra_point" 
              :backend_point="task.backend_point" 
              :user_point="task.user_point" 
              :plan_point="task.plan_point" 
              :unique_point="task.unique_point"
              :front_point="task.plan_point"
              />
        </div>

        <div class="box">
            <div class="user_name">
                ユーザー：<router-link :to="{name: 'user_profile', params: {userId: task_user(task.user_id)}}" class="link">{{task_user_name(task.user_id)}}</router-link>
            </div>

            <div v-if='userLike()'>
                <button @click="deleteLikes()">いいねかいじょ</button>
            </div>
            <div v-else>
                <button @click="createLike()">いいね</button>
            </div>                
                     <p class="article">
                         ・開発言語
                            <v-btn dark fab color="red" class="add-button-icon" @click="addInput" height="23px" width="23px">＋</v-btn>
                            <button type="button" @click="onSubmit" class="add-button-ptag">作成</button>
                         </p>
                     <div class="lang">
                        <p v-for="ptag in ptags" class="string">
                            {{ptag.tag}}
                            <v-icon @click="deletePtag(ptag.id)">mdi-delete</v-icon>
                        </p>
                        <p v-for="(text,index) in texts" class="string">
                            <input type="text" v-model="texts[index]" size=10>
                            <v-btn dark fab color="red" class="add-button-icon" @click="removeInput(index)" height="23px" width="23px">－</v-btn>
                        </p>
                     </div>    
                        <p class="article">
                            ・インフラ
                            <v-btn dark fab color="red" class="add-button-icon" @click="addInputitag" height="23px" width="23px">＋</v-btn>
                            <button type="button" @click="ionSubmit" class="add-button-ptag">作成</button>
                        </p>
                     <div class="lang">
                        <p v-for="itag in itags" class="string">
                            {{itag.tag}}
                            <v-icon @click="deleteItag(itag.id)">mdi-delete</v-icon>
                        </p>
                        <p v-for="(itext,index) in itexts" class="string">
                            <input type="text" v-model="itexts[index]" size=10>
                            <v-btn dark fab color="red" class="add-button-icon" @click="iremoveInput(index)" height="23px" width="23px">－</v-btn>
                        </p>
                     </div>
        </div>

    </div>
        <div class="lang">
            <p class="article">・URL</p>
            <a href="https://644b6d9b325a4fff87a89af4cf0fc21d.vfs.cloud9.ap-northeast-1.amazonaws.com/22">https://644b6d9b325a4fff87a89af4cf0fc21d.vfs.cloud9.ap-northeast-1.amazonaws.com/22</a>
        </div>
        ・テキスト
        <v-btn dark fab color="red" class="add-button-icon" @click="addInputTc" height="23px" width="23px">＋</v-btn>
        <button type="button" @click="TConSubmit" class="add-button-ptag">作成</button>
        <div v-for="tc in taskcomments">
            <p class="comment_string">
                {{tc.title}}
                <v-icon @click="deleteTCs(tc.id)">mdi-delete</v-icon>        
            </p>

            <div class="comment">{{tc.comment}}</div>
        </div>

        <div v-for="(tc, index) in TCs">
                <p class="comment_string">
                    <v-text-field
                        label="Title"
                        v-model="tc.tct"
                    ></v-text-field>
                </p>

                <div class="comment">
                    <v-textarea
                    background-color="grey lighten-2"
                    color="cyan"
                    label="text"
                    v-model="tc.tcc"
                    ></v-textarea>
                    <v-btn height="23px" width="23px" dark fab color="red" class="add-button-icon" @click="removeTC(index)" >－</v-btn>
                </div>
        </div>
    </div>
</div>
<!-- <div class="user_box">
    <div class="user_image">
    </div>
</div>               -->
</div>
  </v-app>
</template>
<script>
   import Chart from './chart.vue';
   import axios from 'axios';
   export default {
      components: {
        Chart
      },
     data() {
       return {
         like: [],  
         task: [],
         id: this.$route.params.taskId,
         t: [],
         user: [],
         ptag: [],
         ptags: [],
         itags: [],
         taskcomments: [],
         TCs: [
         ],
         itexts: [],
         texts:[],
         putTask: '',
         putPtag: ''
       }
     },
    created(){
        this.fetchTasks(this.id);
        this.fetchPtags(this.id);
        this.fetchItags(this.id);
        this.fetchTaskcomments(this.id);
        this.fetchLike(this.id);
        // this.fetchUsers();
        this.fetchUsers();
        this.task_user();      
    },
    mounted(){
        // this.fetchTasks(this.id);
        // this.fetchUsers();
    },
    methods: {
        fetchUsers() {
            axios.get('/api/users/').then(response => {
                    this.user = response.data.users
            });
        },
        fetchTasks(id) {
                axios.get('/api/tasks/' + id ).then(response => {
                this.task = response.data
            });
        },
        fetchPtags(id){
                axios.get('/api/ptags/' + id).then(response => {
                this.ptags = response.data.ptags
                });
        },
        fetchItags(id){
                axios.get('/api/itags/' + id).then(response => {
                this.itags = response.data.itags
                });
        },
        fetchTaskcomments(id){
                axios.get('/api/taskcomments/' + id).then(response => {
                this.taskcomments = response.data.taskcomments
                });
        },
        fetchLike(id){
                axios.get('/api/likes/' + id).then(response => {
                this.like = response.data.likes
                });
        },
        Like_count(){
            return this.like.length
        },
        userLike(){
                var l =this.like.filter(l => l.user_id === this.userLogin.id )[0]
                console.log(l)
                return l
        },
         updateTask(id) {
             axios.put('/api/tasks/' + id , {task: {name: this.putTask}}).then(response => {
                this.putTask = '';
                this.$modal.hide('hello-world');
                axios.get('/api/tasks/' + id ).then(response => {
                this.task = response.data
                });
             });
         },
         removeInput(index) {
             this.texts.splice(index, 1)
         },
         updatePtag(id) {
             axios.put('/api/ptags/' + id, {ptags: {tag: this.putPtag}}).then(response => {
                this.putPtag = '';
                this.$modal.hide('hello-world');
                axios.get('/api/tasks/' + id ).then(response => {
                this.task = response.data
                });
                axios.get('/api/ptags').then(response => {
                this.ptags = response.data.ptags
                });
             });
         },
        removeInput(index) {
            this.texts.splice(index, 1);
        },
        iremoveInput(index) {
            this.itexts.splice(index, 1);
        },
        addInput() {
            this.texts.push(''); 
        },
        addInputitag() {
            this.itexts.push(''); 
        }, 
        addInputTc() {
            this.TCs.push({tct:'', tcc: ''}); 
        },
        removeTC(index){
            this.TCs.splice(index, 1);
        },
        onSubmit() {
            for(let i = 0; i < this.texts.length; i++) {
             axios.post('/api/ptags', {ptag: {tag: this.texts[i],task_id: this.id}}).then(res => {
                axios.get('/api/ptags/' + this.id).then(response => {
                this.ptags = response.data.ptags
                });
                 this.texts.splice(0)
             })
           }
        },
        ionSubmit() {
            for(let i = 0; i < this.itexts.length; i++) {
             axios.post('/api/itags', {itag: {tag: this.itexts[i],task_id: this.id}}).then(res => {
                axios.get('/api/itags/' + this.id).then(response => {
                this.itags = response.data.itags
                });
                 this.itexts.splice(0)
             })
           }
        },
        TConSubmit() {
            for(let i = 0; i < this.TCs.length; i++) {
             axios.post('/api/taskcomments', {taskcomment: {title: this.TCs[i].tct,comment: this.TCs[i].tcc,task_id: this.id}}).then(res => {
                axios.get('/api/taskcomments/' + this.id).then(response => {
                    this.taskcomments = response.data.taskcomments
                });
                 this.TCs.splice(0)
             }) 
           }
        },
         createLike(){
             axios.post('/api/likes/', {like: {task_id: this.id, user_id: this.userLogin.id}}).then(response => {
                this.fetchLike(this.id);     
            });
        },
        deletePtag(id){
             axios.delete('/api/ptags/' + id ).then(response => {
                axios.get('/api/ptags/' + this.id).then(response => {
                this.ptags = response.data.ptags
                });
             });
        },
        deleteItag(id){
             axios.delete('/api/itags/' + id ).then(response => {
                axios.get('/api/itags/' + this.id).then(response => {
                this.itags = response.data.itags
                });
             });
        },
        deleteTCs(id){
             axios.delete('/api/taskcomments/' + id ).then(response => {
                this.fetchTaskcomments(this.id);     
             });
        },
        deleteLikes(id){
            var l =this.like.filter(l => l.user_id === this.userLogin.id )[0]['id']
             axios.delete('/api/likes/' + l ).then(response => {
                this.fetchLike(this.id);     
             });
        },
        task_user(id) {
            var uu = []
            var u =this.user.filter(u => u.id === id )[0]
            for(var i in u) {
                uu.push(u[i])
            }
            console.log(uu)
            return uu[0]
        },
        task_user_name(id) {
            var uu = []
            var u =this.user.filter(u => u.id === id )[0]['name']
            return u
        },
        show() {
            this.$modal.show('hello-world');
        },
        hide() {
            this.$modal.hide('hello-world');
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
.like p{
    border: solid 1px black;
    display: inline-block;
    /*border-radius: 50%;*/
    margin: 0;
    /*position:fixed;*/
    /*margin-right: 30px;*/
    /*float: left;*/
}
.like{
    margin-top:20px;
    margin-left: 20px;
    /*float: right;*/
}
.show_box{
    margin: 0 auto;
}
.chart{
    padding: 5px 5px 5px 5px;
    /* margin-right: 10px; */
    /* display: inline-block; */
    height: 65%;
    width: 80%;
    /*margin:0 auto ;*/
    border: solid 4px #FF9872;
    border-radius: 10px;
    /*float: right;*/
    /* display: inline-block; */
    /* margin-left: 20px; */
    margin:0 auto;
    /* float: right; */
}
.card{
    background-color: #FFFAFA;
    padding-top: 20px;
    padding-bottom: 20px;
    color:;
    /* max-width: 70px; */
    /* width: 850px; */
    padding: 10px 10px 10px 10px;
    margin:0 auto;
    margin-bottom: 20px;
    /* float: left; */
}
.string{
    background-color:#DCC2FF;
    display: inline-block;
    padding: 3px 5px 3px 5px;
    color: white;
    text-decoration:none;
    margin: 0;
    margin-right: 5px;
    margin-bottom: 4px;
}
.lang{
    margin: 5px 5px 5px 5px;
        /*display: inline-block;*/
}
.box{
    /*border: solid 1px black;*/
    /* display: inline-block; */
    padding:1px 1px 1px 1px;
    width: 500px;
    /* float: left; */
    /* height: 320px; */
}
.article{
    color: black;
    margin: 0;
    margin-left: 5px;
    font-weight:700;
}
.comment_string{
    font-weight: 900;
    margin-top:20px;
    margin: 0;
    margin-left: 20px;
}    
.comment{
    border: solid 1px black;
    margin-right: 10px;
    margin-left: 20px;
    padding:10px 10px 80px 10px;
    margin-bottom: 30px;
    background-color: white;
    border: solid 4px #EEEEEE;
    border-radius: 10px;
    width:90%;
}
.user_box{
    margin-left: 50px;
    border: solid 1px black;
    /* float: left; */
    padding: 10px 10px 10px 10px;
}
.message{
    margin-left: 320px;
}
.messsage_name{
    float: left;
    margin-right: 5px;
}

.add-button-icon{
    height: 10px;
    width: 10px;
}

.add-button-ptag{
    background-color:yellow;
}

.user_image{
    border: solid black 1px;
    height: 200px;
    width: 200px;
    border-radius: 100px;
}

.user_name{
    margin-top: 30px;
    font-size: 20px; 
}

</style>
