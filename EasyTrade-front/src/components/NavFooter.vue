<template>
  <div class="footer">
    <div class="footer-logo">
      <img src="./../assets/image/main-logo.png">
      <p>Easy Trade</p>
    </div>             
    <div class="footer-link">
      <a href="" target="_blank">EZT</a>
    </div>
  </div>
</template>
<script>
  export default{
    name:'nav-footer'
  }
</script>
<style lang="scss" scoped>
  .footer{
    height:234px;
    border-top:4px solid #00ccff;
    background-color:#333333;
    color:#999999;
    font-size:16px;
    text-align:center;
    .footer-logo{
      margin-top:46px;
      margin-bottom:31px;
      img{
        width:53px;
        height:53px; 
      }
    }
    .footer-link{
      a{
        color:#999999;
        display:inline-block;
      }
      span{
        margin:0 10px;
      }
      margin-bottom:13px;
    }
  }
</style>