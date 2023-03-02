<template>
  <div class="good-box">
    <div class="box-header">
      <h2 class="box-title">{{goodsItem.boxTitle}}</h2>
      <div class="type-more">
        <a :href="goodsItem.url" target="_blank">
          <span>See all</span>
          <i class="fa fa-angle-right"></i>
        </a>
      </div>
    </div>
    <div class="box-content">
      <div class="goods-content">
        <div class="goods-one">
          <div class="goods-item brick-item"
          v-for="(item, index) in goodsItem.listData.goods"
          :key="index">
            <a :href="item.url" target="_blank">
              <img :src="item.src" :alt="item.value">
              <h3 class="name ellipsis">{{item.value}}</h3>
              <span class="desc ellipsis">{{item.desc}}</span>
              <div class="price">
                <span v-if="item.sub">Floor: </span>
                <span>{{item.newPrice}} VC</span>
                <del v-if="item.oldPrice">{{item.oldPrice}} VC</del>
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {

    }
  },
  props: ['goodsItem'],
  methods: {

  }
}
</script>

<style lang="less">
  .good-box {
    position: relative;
    width: 1226px;
    height: auto;
    margin: 0 auto;
  }

  .box-header {
    .type-select {
      display: inline-block;
      .tab-list {
        display: flex;
        .tab-item {
          display: inline-block;
          margin-left: 30px;
          color: #424242;
          border-bottom: 2px solid transparent;
          transition: all .3s;
          cursor: pointer;
        }

        .active {
          border-bottom: 2px solid #00ccff;
          color: #00ccff;
        }
      }
    }

    .type-more {
      display: inline-block;
      a {
        font-size: 16px;
        display: flex;
        align-items: center;
        span {
          color: #424242;
          transition: all .4s;
        }

        i {
          width: 20px;
          height: 20px;
          margin-left: 8px;
          border-radius: 16px;
          font-size: 15px;
          line-height: 20px;
          background: #b0b0b0;
          color: #fff;
          text-align: center;
          vertical-align: 2px;
          transition: all .4s;
        }

        &:hover {
          span {
            color: #00ccff;
          }

          i {
            background: #00ccff;
          }
        }
      }
    }
  }

  .box-content {
    display: flex; 

    .promo-two {
      a {
        display: block;
        height: 300px;
        img {
          width: 234px;
          height: 100%;
        }
      }

      a:first-child {
        margin-bottom: 14px;
      }
    }

    .goods-content .goods-one {
      width: 1240px;
      display: flex;
      flex-wrap: wrap;
      .goods-item {
        background: #fff;
        height: 300px;
        padding: 20px 0;
        width: 234px;
        margin-left: 14px;
        margin-bottom: 14px;
      }
    }

    .goods-content {
      a {
        display: block;
        img {
          width: 160px;
          height: 160px;
          margin: 0 auto 18px;
        }

        .name {
          font-size: 14px;
          font-weight: 400;
          color: #333;
          margin: 0 10px 2px;
        }

        .desc {
          display: block;
          margin: 0 10px 10px;
          height: 18px;
          font-size: 12px;
          color: #b0b0b0;
        }

        .price {
          margin: 0 10px 14px;
          font-size: 14px;
          color: #00ccff;
          del {
            color: #b0b0b0;
            margin-left: 8px;
          }
        }
      }
    }
  }

  .brick-item {
    transition: all .2s linear;
    &:hover {
      transform: translate3d(0, -2px, 0);
      box-shadow: 0 15px 30px rgba(0, 0, 0, .1);
    }
  }
</style>

<style lang="less">

  .box-header {
    text-align: start;
    display: flex;
    justify-content: space-between;
    align-items: center;
    .box-title {
      display: inline-block;
      font-size: 22px;
      font-weight: 200;
      line-height: 58px;
      color: #333;
    }
  }
</style>