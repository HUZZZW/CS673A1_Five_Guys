<template>
  <div>
    <router-view></router-view>
    <nav-footer></nav-footer>
  </div>
</template>
<script>
  import NavFooter from './../components/NavFooter'
  export default{
    name:'order',
    data(){
      return {
        title:'',
        tip:''
      }
    },
    components:{
      NavFooter
    }
  }
</script>