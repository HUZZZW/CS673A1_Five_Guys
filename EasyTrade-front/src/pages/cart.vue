<template>
  <div class="cart">
    <order-header title="My Cart">
    </order-header>
    <div class="wrapper">
      <div class="container">
        <div class="cart-box">
          <ul class="cart-item-head">
            <li class="col-1"><span class="checkbox" v-bind:class="{'checked':allChecked}" @click="toggleAll"></span>Select All</li>
            <li class="col-3">Product Name</li>
            <li class="col-1">Price</li>
            <li class="col-2">Quantity</li>
            <li class="col-1">Sub Total</li>
            <li class="col-1">Action</li>
          </ul>  
        </div>
        <div class="order-wrap clearfix">
          <div class="total fr">
             <a href="javascript:;" class="btn">Check Out</a>
          </div>
        </div>
      </div>
    </div>
    <nav-footer></nav-footer>
  </div>
</template>

<script>
  import OrderHeader from './../components/OrderHeader'
  import NavFooter from './../components/NavFooter'
  export default{
    name:'index',
    components:{
      OrderHeader,
      NavFooter
    },
    data(){
      return {

      }
    }, 
    computed:{

    },
    methods:{
      
    },
  }
</script>

<style lang="scss">
@import './../assets/scss/config.scss';

  .cart{
    .wrapper{
      background-color:#F5F5F5;
      padding-top:30px;
      padding-bottom:114px;
      .cart-box{
        background-color:#fff;
        font-size:14px;
        color:#999999;
        text-align:center;
        .checkbox{
          display: inline-block;
          width: 22px;
          height: 22px;
          border: 1px solid #E5E5E5;
          vertical-align: middle;
          margin-right: 17px;
          cursor:pointer;
          &.checked{
            background:url('/imgs/icon-gou.png') $colorA no-repeat center;
            background-size:16px 12px;
            border:none;
          }
        }
        .cart-item-head{
          display:flex;
          height: 79px;
          line-height: 79px;
          .col-1{
            flex:1;
          }
          .col-2{
            flex:2;
          }
          .col-3{
            flex:3;
          }
        }
      }
      .order-wrap{
        font-size:14px;
        color: #666666;
        margin-top: 20px;
        height: 50px;
        line-height: 50px;
        .total{
          font-size:14px;
          color:$colorA;
          span{
            font-size:24px;
          }
          a{
            width:202px;
            height:50px;
            line-height:50px;
            font-size:18px;
            margin-left:37px;
          }
        }
      }
    }
  }
</style>