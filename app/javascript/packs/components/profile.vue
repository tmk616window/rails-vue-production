<template>
<div>
    <br><br><br><br>
    <div class="profile">
        <div class="icon">
            <p>aaa</p>
            
        </div>
        <div class="text">
            <label for="">名前</label>
            <p>難波智貴</p>   
            <label for="">年齢</label>
            <p>22</p>   
            <label for="">職業</label>
            <p>難波智貴</p>   
            <label for="">mk</label>
            <p>難波智貴</p>   
        </div>
        <div class="comment">
            コメント
            <div class="comment_input">

            </div>
        </div>        
    </div>

</div>
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
    border: solid black 1px;
    margin-right: 20px;
    margin-left: 20px;
    padding: 20px;
}
.icon{
    float: left;
    border:solid black 1px;
    height: 200px;
    width: 200px;
}
.text{
    display: inline-block;
    margin-left: 70px;
    margin-top: 10px;

}
.comment_input{
    border:solid black 1px;
    padding: 20px;
}
</style>