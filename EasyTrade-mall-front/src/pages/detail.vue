<template>
  <div class="detail">
    <product-param v-bind:title="product.name"></product-param>
    <div class="wrapper">
      <div class="container clearfix">
        <div class="swiper">
          <swiper :options="swiperOption">
            <swiper-slide v-for="(item, index) of albumPics" :key="index">
              <img :src="item" alt="" />
            </swiper-slide>
            <div class="swiper-pagination" slot="pagination"></div>
          </swiper>
        </div>
        <div class="content">
          <h2 class="item-title">{{ product.name }}</h2>
          <p class="item-info">{{ product.subTitle }}</p>
          <div class="item-price">{{ product.price }} VC</div>
          <div class="line"></div>
          <div class="item-version clearfix">
            <h2>Select Specifications</h2>
            <div
              class="product fr"
              v-for="(item, index) of product.skuStockList"
              :key="index"
              :class="[ {checked: clicked == index},{disabled: (item.stock-item.lockStock)<=0} ]"
              :skuId="item.id"
              @click="handlerSkuid(item, index)"
            >
              {{ item.sp1 + item.sp2 }}
            </div>
          </div>
          <div class="item-total">
            <div class="product-info clearfix">
              <div class="stock-warn" v-if="clicked==null">
                <i class="fa fa-exclamation-triangle f2" aria-hidden="true" ></i>
                Please Select Specifications
              </div>
              <!-- <div class="fr" v-if="skuName" v-html="skuName"></div> -->
              <div class="stock" v-else>
                <div class="stock-detail"  v-html="skuName"></div>
                <div class="product-total" v-if="skuPrice>0">Total: {{ skuPrice }} VC</div> 
              </div>
            </div>
          </div>
          <div class="btn-group">
            <a href="javascript:;" class="btn btn-large fl" @click="addCart"
              >Add to Cart</a
            >
            <a href="javascript:;" class="btn btn-large btn-buy fl">Buy Now</a>
          </div>

          <div class="after-sale-info">
            <span
              ><a
                href="javascript:void(0);"
                v-if="serviceIds.includes('1')"
                class="support"
              >
                <i class="fa fa-check-circle-o f2" aria-hidden="true"></i>
                <em>Quick Return</em>
              </a>
            </span>
            <span
              ><a
                href="javascript:void(0);"
                v-if="serviceIds.includes('2')"
                class="support"
              >
                <i class="fa fa-check-circle-o f2" aria-hidden="true"></i>
                <em>Quick Refund</em>
              </a>
            </span>
            <span
              ><a
                href="javascript:void(0);"
                v-if="serviceIds.includes('3')"
                class="support"
              >
                <i class="fa fa-check-circle-o f2" aria-hidden="true"></i>
                <em>Free Delivery</em>
              </a>
            </span>
          </div>
        </div>
      </div>
    </div>
    <div class="price-info">
      <div class="container">
        <h2>Product Details</h2>

        <div class="attributes">
          <ul class="attributes-list">
            <li
              v-for="(item, index) in product.productAttributeValueList"
              :key="index"
            >
              {{ item.attrName }}:&nbsp;{{ item.value }}
            </li>
          </ul>
        </div>
        <div class="desc" v-html="product.detailHtml">
        </div>
      </div>
    </div>
    <service-bar></service-bar>
  </div>
</template>
<script>
import { swiper, swiperSlide } from "vue-awesome-swiper";
import ProductParam from "./../components/ProductParam";
// import ServiceBar from "./../components/ServiceBar";
import "swiper/dist/css/swiper.css";
export default {
  name: "detail",
  data() {
    return {
      id: this.$route.params.id, // get product ID
      err: "",
      version: 1, // switch product version 
      product: {}, // product info
      swiperOption: {
        autoplay: true,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
      },
      skuId: 0,
      albumPics: [],
      clicked: null,
      serviceIds: [],
      skuPrice:0,
      skuName:'',
    };
  },
  components: {
    swiper,
    swiperSlide,
    ProductParam,
    // ServiceBar,
  },
  mounted() {
    this.getProductInfo();
  },
  methods: {
    getProductInfo() {
      this.axios.get(`/product/detail/${this.id}`).then((res) => {
        this.product = res;

        this.albumPics = res.albumPics.split(",");
        this.albumPics.unshift(res.pic);
        if (
          this.albumPics == null ||
          this.albumPics == undefined ||
          this.albumPics == ""
        ) {
          this.albumPics = res.pic.split(",");
        }

        this.serviceIds = res.serviceIds.split(",");
      });
    },
    addCart() {
      if (this.skuId == null || this.skuId == undefined || this.skuId == "") {
        this.$message.warning("Please select a specification");
        return;
      }
      
      this.axios
        .post("/cart/add", {
          productId: this.id,
          productSkuId: this.skuId,
          quantity: 1,
        })
        .then(() => {
          this.$message.success({ 
          dangerouslyUseHTMLString: true,
          message:"Successfully add to cart, please click <a href='/*/cart'>Cart</a> to check."});
        });
    },
    handlerSkuid(item, index) {
      if((item.stock-item.lockStock)<=0){
        this.$message.warning("Out of stock, please select another specification");
        return;
      }
      // Repeat clicks will cancel focus
      if (this.clicked == index) {
        this.clicked = null;
        this.skuId = 0; 
        this.albumPics = this.product.albumPics.split(",");
        this.albumPics.unshift(this.product.pic); 
        this.skuName='';
        this.skuPrice=0;
      } else {
        this.clicked = index;
        this.skuId = item.id;
        this.albumPics = [item.pic];
        this.skuName=this.product.name+ item.sp1+item.sp2+"<br/>Stock："+(item.stock-item.lockStock)+" "+this.product.unit;
        this.skuPrice=item.price;
      }
    },
  },
};
</script>
<style lang="scss">
@import "./../assets/scss/config.scss";
@import "./../assets/scss/mixin.scss";
.detail {
  .product-info {
    margin-top: -10px;
    display: flex;
    justify-content: space-around;
    flex-direction: column;
  }
  .stock-warn {
    margin-top: 15px;
    color: #00bbff;
  }
  .stock {margin-top: 25px;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
  }
  .stock-detail {
    margin-top: -16px;
  }
  .product-total {
    margin-bottom: -35px;
    display: fles;
    justify-content: flex-end;
  }
  .wrapper {
    .swiper {
      float: left;
      width: 600px;
      height: 600px;
      margin-top: 5px;
      img {
        width: 90%;
        height: 90%;
      }
    }
    .content {
      float: right;
      width: 584px;
      height: auto;
      .item-title {
        font-size: 28px;
        padding-top: 30px;
        padding-bottom: 16px;
        height: 66px;
      }
      .item-info {
        font-size: 14px;
        height: 36px;
      }
      .delivery {
        font-size: 16px;
        color: #00bbff;
        margin-top: 26px;
        margin-bottom: 14px;
        height: 15px;
      }
      .item-price {
        font-size: 20px;
        color: #00bbff;
        height: 19px;
        .del {
          font-size: 16px;
          color: #999999;
          margin-left: 10px;
          text-decoration: line-through;
        }
      }
      .btn-group {
        width: 100%;
        height: 54px;
      }
      .after-sale-info {
        margin: 20px 0px;
        a {
          display: inline-block;
          margin-right: 55px;
          line-height: 30px;
          margin-bottom: 10px;
          cursor: default;
          white-space: nowrap;
          color: #b0b0b0;
        }
        i {
          font-size: 24px;
          display: inline-block;
          font-style: normal;
          vertical-align: middle;
        }
        em {
          font-style: normal;
          display: inline-block;
          margin-left: 2px;
          vertical-align: middle;
          font-size: 16px;
        }
      }
      .line {
        height: 0;
        margin-top: 25px;
        margin-bottom: 28px;
        border-top: 1px solid #e5e5e5;
      }
      .item-addr {
        height: 108px;
        background-color: #fafafa;
        border: 1px solid #e5e5e5;
        box-sizing: border-box;
        padding-top: 31px;
        padding-left: 64px;
        font-size: 14px;
        line-height: 14px;
        position: relative;
        .icon-loc {
          position: absolute;
          top: 27px;
          left: 34px;
          @include bgImg(20px, 20px, "/imgs/detail/icon-loc.png");
        }
        .addr {
          color: #666666;
        }
        .stock {
          margin-top: 15px;
          color: #00bbff;
        }
      }
      .item-version,
      .item-color {
        margin-top: 30px;
        h2 {
          font-size: 18px;
          margin-bottom: 20px;
        }
      }
      .item-version,
      .item-color {
        .product {
          width: 50%;
          height: 50px;
          line-height: 50px;
          font-size: 16px;
          color: #333333;
          border: 1px solid #e5e5e5;
          box-sizing: border-box;
          text-align: center;
          cursor: pointer;
          span {
            color: #666666;
            margin-left: 15px;
          }
          .color {
            display: inline-block;
            width: 14px;
            height: 14px;
            background-color: #666666;
          }
          &.checked {
            border: 1px solid #00bbff;
            color: #00bbff;
          }
        }
        .disabled{
          color: #b0b0b0;
          cursor: auto;}
      }
      .item-total {
        height: 108px;
        background: #fafafa;
        padding: 24px 33px 29px 30px;
        font-size: 14px;
        margin-top: 50px;
        margin-bottom: 30px;
        box-sizing: border-box;
        .product-total {
          font-size: 24px;
          color: #00bbff;
          margin-top: 18px;
        }
      }
    }
  }
  .price-info {
    text-align: center;
    background-color: #f3f3f3;
    height: auto;
    h2 {
      font-size: 24px;
      color: #333333;
      padding-top: 38px;
      margin-bottom: 30px;
      border-bottom: #00bbff 2px solid;
      line-height: 50px;
    }
    .attributes-list {
      width: 749px;
      display: block;
      clear: both;
      margin: 20px auto;
      min-height: 50px;
      text-align: left;
      li {
        display: inline;
        float: left;
        width: 206px;
        height: 24px;
        margin-right: 20px;
        overflow: hidden;
        text-indent: 5px;
        line-height: 24px;
        white-space: nowrap;
        text-overflow: ellipsis;
      }
    }
  }
}
</style>