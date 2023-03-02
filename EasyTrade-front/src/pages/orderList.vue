<template>
  <div class="order-list">
    <order-header title="Order List">
    </order-header>
    <div class="wrapper">
      <div class="container">
        <div class="order-box">
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
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  import OrderHeader from './../components/OrderHeader'
  import { Pagination,Button } from 'element-ui'
  import infiniteScroll from 'vue-infinite-scroll'
  export default{
    name:'order-list',
    components:{
      OrderHeader,
      [Pagination.name]:Pagination,
      [Button.name]:Button
    },
    directives: {
      infiniteScroll
    },
    data(){
      return {
        list:[],
        pageSize:10,
        pageNum:1,
        total:0
      }
    },
    methods:{
    
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
        .pagination{
          text-align:right;
        }
        .el-pagination .active{
          background-color: $colorA;
        }
      }
    }
  }
</style>