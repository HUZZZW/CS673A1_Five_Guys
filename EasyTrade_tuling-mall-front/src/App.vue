<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<script>
export default {
  name: 'app',
  components: {
    
  },
  data(){
    return {
      
    }
  },
  mounted(){
    if(this.$cookie.get('username')){
      this.getUser();
      this.getCartCount();
    }
  },
  methods:{
    getUser(){
        let username=this.$cookie.get('username')
        this.$store.dispatch('saveUserName',username); 
    },
    // product number in cart
    getCartCount(){ 
      this.axios.get('/cart/products/sum').then((res=0)=>{ 
        // store into globle variable
        this.$store.dispatch('saveCartCount',res);
      })
    }
  }
}
</script>
<style lang="less">
  #app {
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    color: #2c3e50;
  }
  .fa-angle-right:before{content:"\F105"}.fa-angle-up:before{content:"\F106"}
</style>
<style lang="scss">
@import './assets/scss/reset.scss';
@import './assets/scss/config.scss';
@import './assets/scss/button.scss';
</style>
