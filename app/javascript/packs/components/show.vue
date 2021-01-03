<template>
  <v-app>
      <br><br><br><br>
      <br><br>
      <div>
      </div>


<div class="show_box">
    <div class="card">
    <div>
        <chart class="chart"></chart>
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
                        <p class="article">・インフラ</p>
                     <div class="lang">
                        <p class="string">vue.js</p> 
                        <p class="string">php</p> 
                        <p class="string">php</p> 
                        <p class="string">javascript</p>
                        <p class="string">javascript</p>
                        <p class="string">javascript</p>
                        <p class="string">javascript</p>
                        <p class="string">javascript</p>
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
    <div class="like">
        <p>aa</p>
    </div>
</div>
<div class="user_box">
    <div class="user_image">
        aaaa
    </div>
</div>              
</div>
        <div class="message">
            <p>メッセージ</p>
            <div class="message_box">
                <p class="messsage_name">username</p>
                <p class="message_string">こんにちは</p>
            </div>
        </div>
    <p>{{task.name}}</p>
    　<router-link to="/">戻る</router-link>
  <p><v-btn dark v-on:click="show" class="button">編集</v-btn></p>
  <modal name="hello-world" :draggable="true" :resizable="true">
    <div class="modal-header">
      <h2>編集</h2>
    </div>
    <div class="modal-body">
    <b-form-input v-model="putTask" type="text" class="putinput" size="20"></b-form-input>
    <v-btn @click='updateTask(task.id)'>更新</v-btn>
      <button v-on:click="hide">閉じる</button>
    </div>  
  </modal>
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
         id: this.$route.params.taskId,
         ptag: [],
         ptags: [],
         texts:[],
         task: [],
         task: {
             id: '',
             name: ''
         },
         putTask: '',
         putPtag: ''
       }
     },
    created(){
        this.fetchTasks(this.id);
        this.fetchPtags(this.id);
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
        addInput() {
            this.texts.push(''); 
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
        deletePtag(id){
             axios.delete('/api/ptags/' + id ).then(response => {
                axios.get('/api/ptags/' + this.id).then(response => {
                this.ptags = response.data.ptags
                });
             });
        },
        show() {
            this.$modal.show('hello-world');
        },
        hide() {
            this.$modal.hide('hello-world');
        },
        
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
</style>
