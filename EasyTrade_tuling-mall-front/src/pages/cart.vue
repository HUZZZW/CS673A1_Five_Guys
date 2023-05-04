<template>
  <div class="cart">
    <order-header title="My Cart">
    </order-header>
    <div class="wrapper">
      <div class="container">
        <div class="cart-box">
          <ul class="cart-item-head">
            <li class="col-1"><span class="checkbox" v-bind:class="{ 'checked': allChecked }" @click="toggleAll"></span>Select All
            </li>
            <li class="col-3">Product Name</li>
            <li class="col-1">Price</li>
            <li class="col-2">Quantity</li>
            <li class="col-1">Sub Total</li>
            <li class="col-1">Action</li>
          </ul>
          <ul class="cart-item-list">
            <li class="cart-item" v-for="(item, index) in list" v-bind:key="index">
              <div class="item-check">
                <span class="checkbox" v-bind:class="{ 'checked': item.productSelected }"
                  @click="updateCart(item)"></span>
              </div>
              <div class="item-name">
                <img v-lazy="item.productPic" alt="">
                <span>{{ item.productName + ' , ' + item.productSubTitle }}</span>
              </div>
              <div class="item-price">{{ item.price }}</div>
              <div class="item-num">
                <div class="num-box">
                  <a href="javascript:;" @click="updateCart(item, '-')">-</a>
                  <span>{{ item.quantity }}</span>
                  <a href="javascript:;" @click="updateCart(item, '+')">+</a>
                </div>
                <div>Stock: {{ item.stock }}</div>
              </div>
              <div class="item-total">{{ item.quantity * item.price }}</div>
              <div class="item-del" @click="delProduct(item)"></div>
            </li>
          </ul>
        </div>
        <div class="order-wrap clearfix">
          <div class="cart-tip fl">
            <a href="/#/index">Keep shopping</a>
            Total <span>{{ list.length }}</span> Product, <span>{{ checkedNum }}</span> selected, <span>{{ calcSum }}</span> VC in total
          </div>
          <div class="total fr">
            <a href="javascript:;" class="btn" @click="order">Check Out</a>
          </div>
        </div>
      </div>
    </div>
    <service-bar></service-bar>
    <nav-footer></nav-footer>
  </div>
</template>
<script>
import OrderHeader from './../components/OrderHeader'
// import ServiceBar from './../components/ServiceBar'
import NavFooter from './../components/NavFooter'
import Qs from 'qs'
import constStore from './../store/constStore.js'
export default {
  name: 'index',
  components: {
    OrderHeader,
    // ServiceBar,
    NavFooter
  },
  data() {
    return {
      list: [],//Product list
      allChecked: false,//Whether to select all
      cartTotalPrice: 0,//Total amount of goods
      checkedNum: 0//Quantity of selected goods
    }
  },
  computed: {
    calcSum() {
      let sum = 0;
      this.list.map((item) => {
        // Whether checked
        if (item.productSelected) {
          sum += item.price * item.quantity
        }
      });
      return sum;
    }
  },
  mounted() {
    this.getCartList();
  },
  methods: {
    // Get shopping cart list
    getCartList() {
      this.axios.get('/cart/list').then((res) => {
        this.renderData(res);
      })
    },
    // Update shopping cart count and shopping cart selection state
    updateCart(item, type) {
      let quantity = item.quantity;
      // action: reduct quantity
      if (type == '-') {
        if (quantity == 1) {
          this.$message.warning('Keep at least one piece of product');
          return;
        }
        --quantity;
        item.quantity = quantity;
        this.axios.post('/cart/update/quantity', Qs.stringify({
          id: item.id,
          quantity: item.quantity
        }), { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } }).then(() => {
        });
      }
      // action: increase quantity
      else if (type == '+') {
        // If the current quantity is equal to the stock, it cannot be added
        if (quantity >= item.stock) {
          this.$message.warning('Out of stock!');
          return;
        }
        ++quantity;
        item.quantity = quantity;
        this.axios.post('/cart/update/quantity', Qs.stringify({
          id: item.id,
          quantity: item.quantity
        }), { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } }).then(() => {
        });
      }
      // action: select (check the selection box)
      else {
        if (quantity > item.stock) {
          this.$message.warning('Out of stock!');
          return;
        }

        var index = 0;
        this.list.map((oitem) => {
          if (oitem.id == item.id) {
            oitem.productSelected = !oitem.productSelected;

            if (oitem.productSelected) {
              this.checkedNum++;
            } else {
              this.checkedNum--;
            }
            this.$set(this.list, index, oitem);
          }
          index++;
        });
      }
    },
    // Remove shopping cart items
    delProduct(item) {
      this.axios.post('/cart/delete', Qs.stringify({
        ids: item.id
      }), { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } }).then(() => {
        this.$message.success('Deleted successfully');
        var index = 0;
        var target = 0;
        this.list.map((oitem) => {
          if (oitem.id == item.id) {
            target = index;
          }
          index++;
        });
        this.checkedNum--;
        this.list.splice(target, 1);
      });
    },
    // Controls the 'Select All' function
    toggleAll() {
      let checkedNumTemp = 0;
      let index = 0;
      // Set productSelected for each item
      if (!this.allChecked) {
        this.list.map((item) => {
          if (item.quantity > item.stock) {
            this.$message.warning('Out of stock!');
            this.$set(this.list, index, item);
            index++;
            return;
          }
          item.productSelected = !this.allChecked;
          this.$set(this.list, index, item);
          index++;
          checkedNumTemp += 1;
        });
      } else {
        this.list.map((item) => {
          item.productSelected = !this.allChecked;
          this.$set(this.list, index, item);
          index++;
        });
      }
      // change checkbox state
      this.allChecked = !this.allChecked;
      // count number of selected items
      if (this.allChecked) {
        this.checkedNum = checkedNumTemp;
      } else {
        this.checkedNum = 0;
      }
    },
    // add 'checked' property for each product
    renderData(res) {
      this.list = res;
      this.list.map((item) => {
        if (item.productSelected == undefined) {
          item.productSelected = false;
        }
      });
      //this.list.filter(item=>item.productSelected).length;
    },
    // Cart to Order
    order() {
      let isCheck = this.list.every(item => !item.productSelected);
      if (isCheck) {
        this.$message.warning('Please select an item');
      } else {
        constStore.itemids = [];
        this.list.map((item) => {
          // If product is selected, add its id to the globle variable
          if (item.productSelected) {
            constStore.itemids.push(item.id);
          }
        });
        /**
         * Replace route:
         *   The page would not be refreshed
         *   and the value in the root vue object is retained
         * Redirect page:
         *   Reload will create a new vue object
         * */
        this.$router.push('/order/confirm');
      }
    }
  },
}
</script>
<style lang="scss">
.cart {
  .wrapper {
    background-color: #F5F5F5;
    padding-top: 30px;
    padding-bottom: 114px;

    .cart-box {
      background-color: #fff;
      font-size: 14px;
      color: #999999;
      text-align: center;

      .checkbox {
        display: inline-block;
        width: 22px;
        height: 22px;
        border: 1px solid #E5E5E5;
        vertical-align: middle;
        margin-right: 17px;
        cursor: pointer;

        &.checked {
          background: url('/imgs/icon-gou.png') #00ccff no-repeat center;
          background-size: 16px 12px;
          border: none;
        }
      }

      .cart-item-head {
        display: flex;
        height: 79px;
        line-height: 79px;

        .col-1 {
          flex: 1;
        }

        .col-2 {
          flex: 2;
        }

        .col-3 {
          flex: 3;
        }
      }

      .cart-item-list {
        .cart-item {
          display: flex;
          align-items: center;
          height: 125px;
          border-top: 1px solid #E5E5E5;
          font-size: 16px;

          .item-check {
            flex: 1;
          }

          .item-name {
            flex: 3;
            font-size: 18px;
            color: #333333;
            display: flex;
            align-items: center;

            img {
              width: 80px;
              height: 80px;
              vertical-align: middle;
            }

            span {
              margin-left: 30px;
            }
          }

          .item-price {
            flex: 1;
            color: #333333;
          }

          .item-num {
            flex: 2;

            .num-box {
              display: inline-block;
              width: 150px;
              height: 40px;
              line-height: 40px;
              border: 1px solid #E5E5E5;
              font-size: 14px;

              a {
                display: inline-block;
                width: 50px;
                color: #333333;
              }

              span {
                display: inline-block;
                width: 50px;
                color: #333333;
              }
            }
          }

          .item-total {
            flex: 1;
            color: #00ccff;
          }

          .item-del {
            flex: 1;
            width: 14px;
            height: 12px;
            background: url('/imgs/icon-close.png') no-repeat center;
            background-size: contain;
            cursor: pointer;
          }
        }
      }
    }

    .order-wrap {
      font-size: 14px;
      color: #666666;
      margin-top: 20px;
      height: 50px;
      line-height: 50px;

      .cart-tip {
        margin-left: 29px;

        a {
          color: #666666;
          margin-right: 37px;
        }

        span {
          color: #00ccff;
          margin: 0 5px;
        }
      }

      .total {
        font-size: 14px;
        color: #00ccff;

        span {
          font-size: 24px;
        }

        a {
          width: 202px;
          height: 50px;
          line-height: 50px;
          font-size: 18px;
          margin-left: 37px;
        }
      }
    }
  }
}
</style>