<template>
    <v-app>
    <br>
    <br>
    <div>
  <v-btn v-on:click="show" class="button" v-if="userLogin.name">投稿</v-btn>
    </div>
    <p>{{fetchLike()}}</p>
    <div class="collection">
        <v-container>
        <v-row classr="dark" style="height: 450px;">
        <div v-for="task in tasks" class="list" >
        <v-card hover width="300" height="410" class="card">
            <router-link :to="{name: 'task', params: {taskId: task.id}}" v-bind:for="'task_' + task.id" class="link">
            <div id="box">
              <div id="chart">
              <Chart 
              :infra_point="task.infra_point" 
              :backend_point="task.backend_point" 
              :user_point="task.user_point" 
              :plan_point="task.plan_point" 
              :unique_point="task.unique_point"
              :front_point="task.front_point"
              />
              </div>
             <div class="box2">
                <p class="string" v-for="tp in task_ptag(task.id)">{{tp.tag}}</p> 
             </div>

             <div>
                 <div class="like_box">
                    <v-icon color="red" class="like_image">mdi-heart</v-icon>   
                    <p class="like_number">{{task_like_count(task.id)}}</p>
                 </div>
             </div>
             <div class="user_box">
                 <p ><img :src="user_icon_task(task.user_id)" class="user_image"/></p>
                 <p class="username">{{user_task(task.user_id)}}</p>
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

        <modal name="hello-world" width="90%" height="auto" :scrollable="true" :draggable="true" >

        <v-container fluid>
            <v-row align="center">
            <v-col cols="5">
                <v-subheader>
                インフラ
                </v-subheader>
            </v-col>

            <v-col cols="5">
                <v-select
                v-model="new_infra_point"
                :items="items"
                label="Select"
                persistent-hint
                return-object
                single-line
                ></v-select>
            </v-col>
            </v-row>
        </v-container>

        <v-container fluid>
            <v-row align="center">
            <v-col cols="5">
                <v-subheader>
                フロントエンド
                </v-subheader>
            </v-col>

            <v-col cols="5">
                <v-select
                v-model="new_front_point"
                :items="items"
                label="Select"
                persistent-hint
                return-object
                single-line
                ></v-select>
            </v-col>
            </v-row>
        </v-container>

        <v-container fluid>
            <v-row align="center">
            <v-col cols="5">
                <v-subheader>
                バックエンド
                </v-subheader>
            </v-col>

            <v-col cols="5">
                <v-select
                v-model="new_backend_point"
                :items="items"
                label="Select"
                persistent-hint
                return-object
                single-line
                ></v-select>
            </v-col>
            </v-row>
        </v-container>

        <v-container fluid>
            <v-row align="center">
            <v-col cols="5">
                <v-subheader>
                企画力
                </v-subheader>
            </v-col>

            <v-col cols="5">
                <v-select
                v-model="new_plan_point"
                :items="items"
                label="Select"
                persistent-hint
                return-object
                single-line
                ></v-select>
            </v-col>
            </v-row>
        </v-container>

        <v-container fluid>
            <v-row align="center">
            <v-col cols="5">
                <v-subheader>
                ユーザビリティ
                </v-subheader>
            </v-col>

            <v-col cols="5">
                <v-select
                v-model="new_user_point"
                :items="items"
                label="Select"
                persistent-hint
                return-object
                single-line
                ></v-select>
            </v-col>
            </v-row>
        </v-container>

        <v-container fluid>
            <v-row align="center">
            <v-col cols="5">
                <v-subheader>
                独自性
                </v-subheader>
            </v-col>

            <v-col cols="5">
                <v-select
                v-model="new_unique_point"
                :items="items"
                label="Select"
                persistent-hint
                return-object
                single-line
                ></v-select>
            </v-col>
            </v-row>
        </v-container>

        <v-container fluid>
            <v-row align="center">
            <v-col cols="5">
                <v-subheader>
                作品 URL
                </v-subheader>
            </v-col>

            <v-col cols="5">
                <input type="text" >
                <v-text-field
                    label="URL"
                    v-model="newURL"
                ></v-text-field>
            </v-col>
            </v-row>
        </v-container>


        <div class="modal_btn">
        　<v-btn @click='createTask' class="modal_next_btn">次へ</v-btn>
          <v-btn v-on:click="hide">閉じる</v-btn>
        </div>

  </modal>

  <modal  name="task" width="90%" height="auto" :scrollable="true" :draggable="true" >
      <div class="task_reference">

                     <p class="article">
                         ・開発言語
                            <v-btn dark fab color="red" class="add-button-icon" @click="addInput" height="23px" width="23px">＋</v-btn>
                         </p>
                     <div class="lang">
                        <p v-for="(text,index) in texts" class="string">
                            <input type="text" v-model="texts[index]" size=10>
                            <v-btn dark fab color="red" class="add-button-icon" @click="removeInput(index)" height="23px" width="23px">－</v-btn>
                        </p>
                     </div>    
                        <p class="article">
                            ・インフラ
                            <v-btn dark fab color="red" class="add-button-icon" @click="addInputitag" height="23px" width="23px">＋</v-btn>
                        </p>
                     <div class="lang">
                        <p v-for="(itext,index) in itexts" class="string">
                            <input type="text" v-model="itexts[index]" size=10>
                            <v-btn dark fab color="red" class="add-button-icon" @click="iremoveInput(index)" height="23px" width="23px">－</v-btn>
                        </p>
                    </div>
                        <p class="article">
                            ・テキスト
                            <v-btn dark fab color="red" class="add-button-icon" @click="addInputTc" height="23px" width="23px">＋</v-btn>
                        </p>
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
        <div class="modal_btn">
        　<v-btn @click='Task_reference()' class="modal_next_btn">作成</v-btn>
          <v-btn v-on:click="thide">閉じる</v-btn>
        </div>
      </div>
  </modal>

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
         like:[],
         items: [0,1,2,3,4,5],
         ptag: [],
         ptags: [],
         itags: [],
         itexts:[],
         texts:[],
         taskcomments: [],
         TCs: [
         ],
         ptag: [],  
         user: [],  
         task: [],
         t: [],
         tasks: [],
         task: {
             id: '',
             name: ''
         },
         newURL: '',
         newTask: '',
         new_backend_point: '',
         new_infra_point: '',
         new_front_point: '',
         new_user_point: '',
         new_unique_point: '',
         new_plan_point: '',
         putTask: '',
         userId: this.storeuserId
       }
     },
     created(){
         this.fetchTasks();
         this.fetchUser();
         this.fetchPtag();
         this.fetchLike();
     },
     methods: {
         fetchTasks() {
                axios.get('/api/tasks').then(response => {
                this.tasks = response.data.tasks
             });
         },
         fetchUser() {
            axios.get('/api/users/').then(response => {
                this.user = response.data.users
             })
         },
         fetchPtag() {
            axios.get('/api/ptags/').then(response => {
                this.ptag = response.data.ptags
             })
         },
         fetchLike() {
            axios.get('/api/likes/').then(response => {
                this.like = response.data.likes
             })
         },
         createTask(){
             axios.post('/api/tasks', {task: {name: this.newURL, user_id: this.userLogin.id,backend_point: this.new_backend_point,front_point: this.new_front_point,plan_point: this.new_plan_point,infra_point: this.new_infra_point,unique_point: this.new_unique_point,user_point: this.new_user_point}}).then(response => {
                this.newURL = '';
                this.fetchTasks();
                this.hide()
                this.tshow();
            });
        },
        show_Task(){
            this.fetchTasks();
            var t =this.tasks.filter(t => t.user_id === this.userLogin.id )
            const last = t.slice(-1)[0]['id']; 
            console.log({last});
            this.$router.push('/' + last)
            return last 
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
        user_task(id) {
            var uu = []
            var u =this.user.filter(u => u.id === id )[0]
            for(var i in u) {
                uu.push(u[i])
            }
            return uu[1]
        },
        user_icon_task(id) {
            var uu = []
            var u =this.user.filter(u => u.id === id )[0]
            for(var i in u) {
                uu.push(u[i])
            }
            return uu[4].url
        },
        task_show(id) {
            var uu = []
            var u =this.user.filter(u => u.id === id )[0]
            for(var i in u) {
                uu.push(u[i])
            }
            return uu[1]
        },
        task_ptag(id) {
            const p =this.ptag.filter(p => p.task_id === id )
            return p;
        },
        task_like_count(id){
            const l =this.like.filter(l => l.task_id === id )
            return l.length;
        },
        show() {
            this.$modal.show('hello-world');
        },
        hide() {
            this.$modal.hide('hello-world');
        },
        tshow() {
            this.$modal.show('task');
        },
        thide() {
            this.$modal.hide('task');
        },
        onSubmit() {
            for(let i = 0; i < this.texts.length; i++) {
             axios.post('/api/ptags', {ptag: {tag: this.texts[i],task_id: this.show_Task()}}).then(res => {
                axios.get('/api/ptags/' + this.id).then(response => {
                this.ptags = response.data.ptags
                });
                 this.texts.splice(0)
             })
           }
        },
        ionSubmit() {
            for(let i = 0; i < this.itexts.length; i++) {
             axios.post('/api/itags', {itag: {tag: this.itexts[i],task_id: this.show_Task()}}).then(res => {
                axios.get('/api/itags/' + this.id).then(response => {
                this.itags = response.data.itags
                });
                 this.itexts.splice(0)
             })
           }
        },
        TConSubmit() {
            for(let i = 0; i < this.TCs.length; i++) {
             axios.post('/api/taskcomments', {taskcomment: {title: this.TCs[i].tct,comment: this.TCs[i].tcc,task_id: this.show_Task()}}).then(res => {
                axios.get('/api/taskcomments/' + this.id).then(response => {
                    this.taskcomments = response.data.taskcomments
                });
                 this.TCs.splice(0)
             }) 
           }
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
        Task_reference(){
            this.thide();
            this.ionSubmit();
            this.onSubmit();
            this.TConSubmit();
            this.show_Task();
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
.putinput{
    width: 120px; 
}
.postinput{
    width: 120px;
}
#chart{
    width: 250px;
    margin:0 auto;
    border-radius: 10px;
    border: solid 4px #FF9872;
    padding-left: 5px;
    padding-right: 5px;
    height: 220px;
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
    margin-right: 5px;
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

.modal{

}

.modal_btn{
    padding: 10px 10px 10px 10px;
}

.modal_next_btn{
    float: right;
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
    width:90%;
}

.task_reference{
    padding: 20px 20px 20px 20px;
}

</style>
