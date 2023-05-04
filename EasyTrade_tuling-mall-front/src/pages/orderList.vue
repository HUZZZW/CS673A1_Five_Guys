<template>
  <div class="order-list">
    <order-header title="Order List">
    </order-header>
    <div class="wrapper">
      <div class="container">
        <div class="order-box">
          <loading v-if="loading"></loading>
          <div class="order" v-for="(order,index) in list" :key="index">
            <div class="order-title">
              <div class="item-info fl">
                {{order.createTime}}
                <span></span>
                {{order.receiverName}}
                <span></span>
                Order Number: {{order.orderSn}}
                <span>| Total: </span>
                {{order.totalAmount}}
                <span>| Order Status:</span>
                <span v-if="order.status === 0">
                  Pending
                </span>
                 <span v-else-if="order.status === 1">
                  Preparing
                </span>
                <span v-else-if="order.status === 2">
                  Sent
                </span>
                <span v-else-if="order.status === 3">
                  Complete
                </span> 
                <span v-else-if="order.status === 4">
                  Closed
                </span>
                <span v-else>
                  Unknown
                </span>

              </div>
              <div class="item-money fr">
                <span>Price: </span>
                <span class="money">{{order.payAmount}}</span>
                <span>VC</span>
              </div>
              
            </div>
            <div class="order-content clearfix">
              <div class="good-box fl">
                <div class="good-list" v-for="(item,i) in order.orderItemList" :key="i">
                  <div class="good-img">
                    <img v-lazy="item.productPic" alt="">
                  </div>
                  <div class="good-name">
                    <div class="p-name">{{item.productName}}</div>
                    <div class="p-money">{{item.productPrice + 'X' + item.productQuantity}} VC</div>
                  </div>
                </div>
              </div>
              <div class="good-state fr" v-if="order.status == 0"> 
                <a href="javascript:;" @click="goPay(order.id)">Make a payment</a>
              </div>
            </div>
          </div>
          <el-pagination
            v-if="true"
            class="pagination"
            background
            layout="prev, pager, next"
            :pageSize="pageSize"
            :total="total"
            @current-change="handleChange"
            >
          </el-pagination>
          <div class="load-more" v-if="false">
              <el-button type="primary" :loading="loading" @click="loadMore">Load More</el-button>
          </div>
          <div class="scroll-more"
            v-infinite-scroll="scrollMore"
            infinite-scroll-disabled="true"
            infinite-scroll-distance="410"
            v-if="false"
          >
            <img src="/imgs/loading-svg/loading-spinning-bubbles.svg" alt="" v-show="loading">
          </div>
          <no-data v-if="!loading && list.length==0"></no-data>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  import OrderHeader from './../components/OrderHeader'
  import Loading from './../components/Loading'
  import NoData from './../components/NoData'
  import { Pagination,Button } from 'element-ui'
  import infiniteScroll from 'vue-infinite-scroll'
  import Qs from 'qs'
  export default{
    name:'order-list',
    components:{
      OrderHeader,
      Loading,
      NoData,
      [Pagination.name]:Pagination,
      [Button.name]:Button
    },
    directives: {
      infiniteScroll
    },
    data(){
      return {
        loading:false,
        list:[],
        pageSize:10,
        pageNum:1,
        total:0,
      }
    },
    mounted(){
      this.getOrderList();
    },
    methods:{
      getOrderList(){
        this.loading = true;
        this.busy = true;
        this.axios.post('/order/list/userOrder',Qs.stringify({ 
            pageSize:10,
            pageNum:this.pageNum
           
        }),{headers: {'Content-Type': 'application/x-www-form-urlencoded'}}).then((res)=>{
          this.loading = false;
          this.list = res.records;
          this.total = res.total;
        }).catch(()=>{
          this.loading = false;
        })
      },
      goPay(orderId){
        this.$router.push({
          path:'/order/pay',
          query:{
            orderId
          }
        })
      },
      handleChange(pageNum){
        this.pageNum = pageNum;
        this.getOrderList();
      }
    }
  }
</script>
<style lang="scss">
  @import './../assets/scss/config.scss';
  @import './../assets/scss/mixin.scss';
  .order-list{
    .wrapper{
      background-color:$colorJ;
      padding-top:33px;
      padding-bottom:110px;
      .order-box{
        .order{
          @include border();
          background-color:$colorG;
          margin-bottom:31px;
          &:last-child{
            margin-bottom:0;
          }
          .order-title{
            @include height(74px);
            background-color:$colorK;
            padding:0 43px;
            font-size:16px;
            color:$colorC;
            .item-info{
              span{
                margin:0 9px;
              }
            }
            .money{
              font-size:26px;
              color:$colorB;
            }
          }
          .order-content{
            padding:0 43px;
            .good-box{
              width:88%;
              .good-list{
                display: flex;
                align-items: center;
                height:145px;
                .good-img{
                  width:112px;
                  img{
                    width:100%;
                  }
                }
                .good-name{
                  font-size:20px;
                  color:$colorB;
                }
              }
            }
            .good-state{
              @include height(145px);
              font-size: 20px;
              color:$colorA;
              a{
                color:$colorA;
              }
            }
          }
        }
        .pagination{
          text-align:right;
        }
        .el-pagination.is-background .el-pager li:not(.disabled).active{
          background-color: $colorA;
        }
        .el-button--primary{
          background-color: $colorA;
          border-color: $colorA;
        }
        .load-more,.scroll-more{
          text-align:center;
        }
      }
    }
  }
</style>