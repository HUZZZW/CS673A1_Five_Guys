<template>
  <div class="order-header">
    <div class="container clearfix">
      <div class="header-logo">
        <a href="/#/index"></a>
      </div>
      <div class="title">
        <h2>{{title}}<slot name="tip"></slot></h2>
      </div>
    </div>
  </div>
</template>

<script>
  export default{
    name:'order-header',
    props:{
      title:String
    },
    computed:{
      
    },
  }
</script>

<style lang="scss">
@import './../assets/scss/config.scss';

  .order-header{
    padding:30px 0;
    border-bottom:2px solid $colorA;
    .header-logo{
      float:left;
    }
    .title{
      display:inline-block;
      height:55px;
      line-height:55px;
    }
    .title{
      float:left;
      margin-left:54px;
      h2{
        font-size:28px;
        color:#333333;
      }
      span{
        font-size:14px;
        margin-left:17px;
        color:#999999;
        font-weight:200;
      }
    }
  }
</style>