<template>
  <v-app>
      <br><br><br><br>
      <br><br>


<div class="show_box">
    <div class="card">
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
        <div>
        </div>
        <div class="box">
                     <p class="article">
                         ・開発言語
                            <v-btn dark fab color="red" class="add-button-icon" @click="addInput">＋</v-btn>
                            <button type="button" @click="onSubmit" class="add-button-ptag">送信</button>

                         </p>
                     <div class="lang">
                        <p v-for="ptag in ptags" class="string">
                            {{ptag.tag}}
                            <v-icon @click="deletePtag(ptag.id)">mdi-delete</v-icon>
                        </p>
                        <p v-for="(text,index) in texts" class="string">
                            <input type="text" v-model="texts[index]" size=10>
                            <!--<button type="button" @click="removeInput(index)">削除</button>-->
                            <v-btn dark fab color="red" class="add-button-icon" @click="removeInput(index)">－</v-btn>
                        </p>
                     </div>    
                        <p class="article">
                            ・インフラ
                            <v-btn dark fab color="red" class="add-button-icon" @click="addInputitag">＋</v-btn>
                            <button type="button" @click="ionSubmit" class="add-button-ptag">送信</button>
                        </p>
                     <div class="lang">
                        <p v-for="itag in itags" class="string">
                            {{itag.tag}}
                            <v-icon @click="deleteItag(itag.id)">mdi-delete</v-icon>
                        </p>
                        <p v-for="(itext,index) in itexts" class="string">
                            <input type="text" v-model="itexts[index]" size=10>
                            <!--<button type="button" @click="removeInput(index)">削除</button>-->
                            <v-btn dark fab color="red" class="add-button-icon" @click="iremoveInput(index)">－</v-btn>
                        </p>
                     </div>
                        <p class="article">・URL</p>
                     <div class="lang">
                        <a href="https://644b6d9b325a4fff87a89af4cf0fc21d.vfs.cloud9.ap-northeast-1.amazonaws.com/22">https://644b6d9b325a4fff87a89af4cf0fc21d.vfs.cloud9.ap-northeast-1.amazonaws.com/22</a>
                     </div>
                        <p class="article">・会社</p>
                     <div class="lang">
                        自社開発
                        社員数：20人
                        新卒
                     </div>
        </div>
        <p class="comment_string">コメント</p>
        <div class="comment">
            <p>mklxsmklcnsmklncksldncklasncm/las,nmdklanmdklankl
            ndkl;md;aｍｍｍｍｍｍｍｍｍｍｍｍｍｍｍｍｍ,xlsmal;mddklwmdklew
            mdlk;sml;dml;dm;lwmdlpmewk;pdmwpjdopwjopdjaspdw
            kdpwmdkl;ewmdlpewmldpmwl;dmw;lmdewpojmdpowe
            </p>
        </div>
        <p class="comment_string">ポートフォリオ概要</p>
        <div class="comment">
            <p>mklxsmklcnsmklncksldncklasncm/las,nmdklanmdklankl
            </p>
        </div>

        <p class="comment_string">ポートフォリオ概要</p>
        <div class="comment">
            <p>mklxsmklcnsmklncksldncklasncm/las,nmdklanmdklankl
            </p>
        </div>
    </div>
</div>
<div class="user_box">
    <div class="user_image">
    </div>
    <div class="user_name">
                <router-link :to="{name: 'user_profile', params: {userId: task_user(task.user_id).id}}" class="link">{{task_user(task.user_id).name}}</router-link>
    </div>
</div>              
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
         task: [],
         id: this.$route.params.taskId,
         user: [],
         ptag: [],
         ptags: [],
         itags: [],
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
        // this.fetchUsers();
    },
    mounted(){
        this.axios.get('/api/users/').then(response => {
                this.user = response.data.users
        });
        // this.fetchTasks(this.id);
        // this.fetchUsers();
    },
    methods: {
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
        addInput() {
            this.texts.push('')
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
        task_user(i) {
            const u = this.user.filter(u => u.id === i )[0]
            return u;
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
    margin-right: 10px;
    display: inline-block;
    height: 300px;
    width: 310px;
    /*margin:0 auto ;*/
    border: solid 4px #FF9872;
    border-radius: 10px;
    /*float: right;*/
    display: inline-block;
    margin-left: 20px;
    float: left;
}    
.card{
    background-color: #FFFAFA;
    padding-top: 20px;
    color: red;
    width: 850px;
    height: 1000px;
    margin:0 auto;
    float: left;
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
    display: inline-block;
    width: 500px;
    height: 320px;
}
.article{
    color: black;
    margin: 0;
    margin-left: 5px;
    font-weight:700;
}
.comment_string{
    margin: 0;
    margin-left: 20px;
}    
.comment{
    border: solid 1px black;
    margin-right: 10px;
    margin-left: 20px;
    padding:10px 10px 10px 10px;
    background-color: #F5F5F5;
    border: solid 4px #EEEEEE;
    border-radius: 10px;
}
.user_box{
    margin-left: 50px;
    border: solid 1px black;
    float: left;
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
    height: 18px;
    width: 18px;
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
