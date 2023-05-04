<template>
  <div class="goods-sale">
    <div v-for="(item, index) in postItems.length" :key="index">
      <poster :postItem="postItems[index]"></poster>
      <goods-box :goodsItem="goodsItems[index]"></goods-box> 
    </div>
  </div>
</template>

<script>
import Poster from './Poster' // Category recommended
import GoodsBox from './GoodsBox' // Category recommended corresponding recommended goods

export default {
  data () {
    return {
      postItems: [],
      goodsItems: [],

      // postItem1: {src: '', url: ''},
      // goodsItem1: {
      //   boxTitle: '',
      //   isHot: false,
      //   vertical: true,
      //   url: '',
      //   listData: {
      //     promo: [{src: '', url: ''}],
      //     goods: [
      //       {value: '', desc: '', sub: true, newPrice: '', oldPrice: '', src: '', url: ''},
      //     ]
      //   }
      // }, 
    }
  },
  methods: {
    init() {
      // Get category recommendations and category recommendations
      this.axios.get("/home/goods_sale").then((res) => {
        // window.console.log(res)
        for (let index = 0; index < res.length; index++) {
          const cate = res[index];
          this.postItems.push({
            src: cate.pic,
            url: cate.url
          })
          
          let goods= []
          let productList = cate.productList
          for (let j = 0; j < productList.length; j++) {
            const product = productList[j];
            goods.push({
              value: product.name,
              desc: product.subTitle,
              sub: product.sub==0?true:false,
              newPrice:product.price,
              oldPrice:product.price<product.originalPrice?product.originalPrice:null,
              src: product.pic,
              url: '/#/detail/' + product.id
            })
          }

          this.goodsItems.push({
            boxTitle: cate.categoryName,
            url: '/#/searchResult/' + cate.categoryName,
            listData: {
              goods: goods
            }
          })
        }
      })
    }
  },
  mounted() {
    this.init();
  },
  components: {
    'Poster': Poster,
    'GoodsBox': GoodsBox
  }
}
</script>

<style lang="less">
  .goods-sale {
      position: relative;
      
    text-align: center;
      width: 1226px;
      height: auto;
      margin: 0 auto;
      display: flex;
      flex-direction: column;
  }
  .goods-sale *{    box-sizing: border-box;}
</style>