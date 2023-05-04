<template>
  <div class="order-confirm">
    <order-header title="Confirm Order">
      <template v-slot:tip>
        <span>Please confirm the receiving method</span>
      </template>
    </order-header>
    <svg
      version="1.1"
      xmlns="http://www.w3.org/2000/svg"
      xmlns:xlink="http://www.w3.org/1999/xlink"
      style="position: absolute; width: 0px; height: 0px; overflow: hidden"
    >
      <defs>
        <symbol id="icon-add" viewBox="0 0 31 32">
          <title>add</title>
          <path
            d="M30.745 15.152h-14.382v-14.596c0-0.308-0.243-0.557-0.543-0.557s-0.543 0.249-0.543 0.557v14.596h-14.665c-0.3 0-0.543 0.249-0.543 0.557s0.243 0.557 0.543 0.557h14.665v15.177c0 0.307 0.243 0.557 0.543 0.557s0.543-0.249 0.543-0.557v-15.177h14.382c0.3 0 0.543-0.249 0.543-0.557s-0.243-0.557-0.543-0.557z"
            class="path1"
          ></path>
        </symbol>
        <symbol id="icon-edit" viewBox="0 0 32 32">
          <title>edit</title>
          <path
            d="M28.287 8.51l-4.805-4.806 0.831-0.831c0.472-0.472 1.086-0.777 1.564-0.777 0.248 0 0.452 0.082 0.622 0.253l3.143 3.144c0.539 0.54 0.133 1.529-0.524 2.186l-0.831 0.831zM26.805 9.992l-1.138 1.138-4.805-4.806 1.138-1.138 4.805 4.806zM24.186 12.612l-14.758 14.762-4.805-4.806 14.758-14.762 4.805 4.806zM7.379 28.288l-4.892 1.224 1.223-4.894 3.669 3.67zM31.123 4.011l-3.143-3.144c-0.567-0.567-1.294-0.867-2.103-0.867-1.036 0-2.174 0.52-3.045 1.391l-20.429 20.436c-0.135 0.134-0.23 0.302-0.276 0.487l-2.095 8.385c-0.089 0.355 0.017 0.736 0.276 0.995 0.198 0.198 0.461 0.307 0.741 0.307 0.085 0 0.171-0.010 0.254-0.031l8.381-2.096c0.185-0.047 0.354-0.142 0.487-0.276l20.43-20.436c1.409-1.41 2.042-3.632 0.524-5.15v0z"
            class="path1"
          ></path>
        </symbol>
        <symbol id="icon-del" viewBox="0 0 32 32">
          <title>delete</title>
          <path
            d="M11.355 4.129v-2.065h9.29v2.065h-9.29zM6.194 29.935v-23.742h19.613v23.742h-19.613zM30.968 4.129h-8.258v-3.097c0-0.569-0.463-1.032-1.032-1.032h-11.355c-0.569 0-1.032 0.463-1.032 1.032v3.097h-8.258c-0.569 0-1.032 0.463-1.032 1.032s0.463 1.032 1.032 1.032h3.097v24.774c0 0.569 0.463 1.032 1.032 1.032h21.677c0.569 0 1.032-0.463 1.032-1.032v-24.774h3.097c0.569 0 1.032-0.463 1.032-1.032s-0.463-1.032-1.032-1.032v0z"
            class="path1"
          ></path>
          <path
            d="M10.323 9.806c-0.569 0-1.032 0.463-1.032 1.032v14.452c0 0.569 0.463 1.032 1.032 1.032s1.032-0.463 1.032-1.032v-14.452c0-0.569-0.463-1.032-1.032-1.032z"
            class="path2"
          ></path>
          <path
            d="M16 9.806c-0.569 0-1.032 0.463-1.032 1.032v14.452c0 0.569 0.463 1.032 1.032 1.032s1.032-0.463 1.032-1.032v-14.452c0-0.569-0.463-1.032-1.032-1.032z"
            class="path3"
          ></path>
          <path
            d="M21.677 9.806c-0.569 0-1.032 0.463-1.032 1.032v14.452c0 0.569 0.463 1.032 1.032 1.032s1.032-0.463 1.032-1.032v-14.452c0-0.569-0.463-1.032-1.032-1.032z"
            class="path4"
          ></path>
        </symbol>
      </defs>
    </svg>
    <div class="wrapper">
      <div class="container">
        <div class="order-box">
          <div class="item-address">
            <h2 class="addr-title">Delivery e-mail address</h2>
            <div class="addr-list clearfix">
              <div
                class="addr-info"
                :class="{ checked: index == checkIndex }"
                @click="checkIndex = index"
                v-for="(item, index) in list"
                :key="index"
              >
                <h2>{{ item.name }}</h2>
                <div class="phone">{{ item.phoneNumber }}</div>
                <div class="street">
                  {{
                    item.province +
                    " " +
                    item.city +
                    " " +
                    item.region +
                    " " +
                    item.detailAddress
                  }}
                </div>
                <div class="action">
                  <a href="javascript:;" class="fl" @click="delAddress(item)">
                    <svg class="icon icon-del">
                      <use xlink:href="#icon-del"></use>
                    </svg>
                  </a>
                  <a
                    href="javascript:;"
                    class="fr"
                    @click="editAddressModal(item)"
                  >
                    <svg class="icon icon-edit">
                      <use xlink:href="#icon-edit"></use>
                    </svg>
                  </a>
                </div>
              </div>
              <div class="addr-add" @click="openAddressModal">
                <div class="icon-add"></div>
                <div>Add new receiving method</div>
              </div>
            </div>
          </div>
          <div class="item-good">
            <h2>Product</h2>
            <ul>
              <li v-for="(item, index) in cartList" :key="index">
                <div class="good-name">
                  <img v-lazy="item.productPic" alt="" />
                  <span>{{
                    item.productName + " " + item.productSubTitle
                  }}</span>
                </div>
                <div class="good-price">
                  {{ item.price }} VC  *  {{ item.quantity }}
                </div>
                <div class="good-total">{{ item.price * item.quantity }} VC</div>
              </li>
            </ul>
          </div>
          <div class="detail">
            <div class="item">
              <span class="item-name">Quantity: </span>
              <span class="item-val">{{ count }}</span>
            </div>
            <div class="item">
              <span class="item-name">Items: </span>
              <span class="item-val">{{ totalAmount }} VC</span>
            </div>
            <div class="item-total">
              <span class="item-name">Total: </span>
              <span class="item-val">{{ calcTotalAmount }} VC</span>
            </div>
          </div>
          <div class="btn-group">
            <a href="/#/cart" class="btn btn-default btn-large">Back to Cart</a>
            <a href="javascript:;" class="btn btn-large" @click="orderSubmit"
              >Place your order</a
            >
          </div>
        </div>
      </div>
    </div>
    <modal
      title="Add new receiving method"
      btnType="1"
      :showModal="showEditModal"
      @cancel="showEditModal = false"
      @submit="submitAddress"
    >
      <template v-slot:body>
        <div class="edit-wrap">
          <div class="item">
            <input
              type="text"
              class="input"
              placeholder="Name"
              v-model="checkedItem.name"
            />
            <input
              type="text"
              class="input"
              placeholder="Phone number"
              v-model="checkedItem.phoneNumber"
            />
          </div>
          <div class="item">
            <select name="province" v-model="checkedItem.province">
              <option
                :value="item"
                v-for="(item, i) in Object.keys(pcaList)"
                :key="i"
              >
                {{ item }}
              </option>
            </select>
            <select
              name="city"
              v-model="checkedItem.city"
              v-if="checkedItem.province"
            >
              <option
                :value="item"
                v-for="(item, i) in Object.keys(pcaList[checkedItem.province])"
                :key="i"
              >
                {{ item }}
              </option>
            </select>
            <select
              name="region"
              v-model="checkedItem.region"
              v-if="checkedItem.city"
            >
              <option
                :value="item"
                v-for="(item, i) in pcaList[checkedItem.province][
                  checkedItem.city
                ]"
                :key="i"
              >
                {{ item }}
              </option>
            </select>
          </div>
          <div class="item">
            <el-autocomplete
              class="inline-input"
              v-model="checkedItem.detailAddress"
              :fetch-suggestions="querySearch"
              placeholder="Detail address"
              :trigger-on-focus="false"
              @select="handleSelect"
            ></el-autocomplete> 
          </div>
          <div class="item">
            <input
              type="text"
              class="input"
              placeholder="Zip"
              v-model="checkedItem.postCode"
            />
          </div>
        </div>
      </template>
    </modal>
    <modal
      title="Deletion confirmation"
      btnType="1"
      :showModal="showDelModal"
      @cancel="showDelModal = false"
      @submit="submitAddress"
    >
      <template v-slot:body>
        <p>Are you sure you want to delete this address?</p>
      </template>
    </modal>
  </div>
</template>
<script>
import OrderHeader from "./../components/OrderHeader";
import Modal from "./../components/Modal";
import constStore from "./../store/constStore.js";
import Qs from "qs";
export default {
  name: "order-confirm",
  data() {
    return {
      list: [], //List of shipping addresses
      cartList: [], //The list of items in the shopping cart that need to be paid for
      cartTotalPrice: 0, //Total amount of goods
      count: 0, //Commodity settlement quantity
      checkedItem: {
        province: "",
        city: "",
        region: "",
      }, //The selected commodity object
      userAction: "", //User behavior 0: Added 1: edited 2: deleted
      showDelModal: false, //Whether the delete box is displayed
      showEditModal: false, //Whether to display new or edit tabs
      checkIndex: 0, //Current delivery method selected index
      couponList: [],
      itemIds: [],
      activeIndex: 0,
      totalAmount: 0,
      freightAmount: 0,
      //promotionAmount: 50,
      payAmount: 0,
      curCouponId: 0,
      couponAmount: 0,
      pcaList: {},
    };
  },
  computed: {
    calcTotalAmount: function () {
      return this.payAmount - this.couponAmount;
    },
  },
  components: {
    OrderHeader,
    Modal,
  },
  mounted() {
    //this.getAddressList();
    this.getCartList();
    //this.getCouponList();

    // axios
    let pca = require("../api/pca.json");
    this.pcaList = pca;
  },

  methods: {
    handleSelect(item){
      this.checkedItem.province=item.province
        this.checkedItem.city=item.city
        this.checkedItem.region=item.area 
    },
    getAddressList() {
      this.axios.get("/member/address/list").then((res) => {
        this.list = res;
      });
    },
    // The box for adding an address is displayed
    openAddressModal() {
      this.userAction = 0;
      this.checkedItem = {};
      this.showEditModal = true;
    },
    // The Modify address dialog box is displayed
    editAddressModal(item) {
      this.userAction = 1;
      this.checkedItem = item;
      this.showEditModal = true;
    },
    delAddress(item) {
      this.checkedItem = item;
      this.userAction = 2;
      this.showDelModal = true;
    },
    // Address deletion, edit, and add functions
    submitAddress() {
      let { checkedItem, userAction } = this;
      let method,
        url,
        params = {};
      if (userAction == 0) {
        (method = "post"), (url = "/member/address/add");
      } else if (userAction == 1) {
        (method = "post"), (url = `/member/address/update/${checkedItem.id}`);
      } else {
        (method = "post"), (url = `/member/address/delete/${checkedItem.id}`);
      }
      if (userAction == 0 || userAction == 1) {
        let {
          name,
          phoneNumber,
          province,
          city,
          region,
          detailAddress,
          postCode,
        } = checkedItem;
        region = checkedItem.region;
        let errMsg = "";
        if (!name) {
          errMsg = "Please enter the name of the receiver";
        } else if (!phoneNumber || !/\d{10}/.test(phoneNumber)) {
          errMsg = "Please enter the phone number in the correct format";
        } else if (!province) {
          errMsg = "Please select a state";
        } else if (!city) {
          errMsg = "Please select a city";
        } else if (!detailAddress || !region) {
          errMsg = "Please select a address";
        } else if (!/\d{6}/.test(postCode)) {
          errMsg = "Please enter correct ZIP code";
        }

        if (errMsg) {
          this.$message.error(errMsg);
          return;
        }
        params = {
          name,
          phoneNumber,
          postCode,
          province,
          city,
          region,
          detailAddress,
        };
      }

      this.axios[method](url, params).then(() => {
        this.closeModal();
        this.getAddressList();
        this.$message.success("Success!");
      });
    },
    closeModal() {
      this.checkedItem = {};
      this.userAction = "";
      this.showDelModal = false;
      this.showEditModal = false;
    },
    getCartList() {
      // if no item was selected, navi back to cart page
      if (
        constStore.itemids == undefined ||
        constStore.itemids == null ||
        constStore.itemids.length == 0
      ) {
        this.$message.error("Please select an item");
        this.$router.push("/cart");
        return;
      }

      //  var itemId="";
      //  constStore.itemids.map((id)=>{
      //    itemId+=id+",";
      //  });

      // itemId=itemId.substring(0,itemId.length-1)

      this.axios
        .post(
          "/order/generateConfirmOrder",
          Qs.stringify({ itemIds: constStore.itemids }, { indices: false }),
          { headers: { "Content-Type": "application/x-www-form-urlencoded" } }
        )
        .then((res) => {
          this.cartList = res.cartList;
          res.cartList.map((item) => {
            this.itemIds.push(item.id);
          });
          // this.couponAmount=res.
          this.totalAmount = res.priceTotal;
          this.freightAmount = res.freightAmount;
          // this.promotionAmount=res.calcAmount.promotionAmount;
          this.payAmount = res.payAmount;
          this.count = res.productTotal;

          this.list = res.addressList;
        });
    },
    // Order submission
    orderSubmit() {
      let item = this.list[this.checkIndex];

      if (!item) {
        this.$message.error("Please select a delivery method");
        return;
      }

      if (this.curCouponId == 0) {
        this.axios
          .post("/order/generateOrder", {
            itemIds: this.itemIds,     // order id
            memberReceiveAddressId: item.id,  // address id
            //payType: 1,   // Alipay
          })
          .then((res) => {
            this.$router.push({
              path: "/order/pay",
              query: {
                orderId: res,
              },
            });
          });
      } else {
        this.axios
          .post("/order/generateOrder", {
            couponId: this.curCouponId,
            itemIds: this.itemIds,
            memberReceiveAddressId: item.id,
            payType: 1,
          })
          .then((res) => {
            this.$router.push({
              path: "/order/pay",
              query: {
                orderId: res.order.id,
              },
            });
          });
      }
    },
  },
};
</script>
<style lang="scss">
.order-confirm {
  .wrapper {
    background-color: #f5f5f5;
    padding-top: 30px;
    padding-bottom: 84px;
    .order-box {
      background-color: #ffffff;
      padding-left: 40px;
      padding-bottom: 40px;
      .addr-title {
        font-size: 20px;
        color: #333333;
        font-weight: 200;
        margin-bottom: 21px;
      }
      .item-address {
        padding-top: 38px;
        .addr-list {
          .addr-info,
          .addr-add {
            box-sizing: border-box;
            float: left;
            width: 271px;
            height: 180px;
            border: 1px solid #e5e5e5;
            margin-right: 15px;
            padding: 15px 24px;
            font-size: 14px;
            color: #a4a4a4;
          }
          .addr-info {
            cursor: pointer;
            h2 {
              height: 27px;
              font-size: 18px;
              font-weight: 300;
              color: #333;
              margin-bottom: 10px;
            }
            .street {
              height: 50px;
            }
            .action {
              height: 50px;
              line-height: 50px;
              .icon {
                width: 20px;
                height: 20px;
                fill: #666666;
                vertical-align: middle;
                &:hover {
                  fill: #00ccff;
                }
              }
            }
            &.checked {
              border: 1px solid #00ccff;
            }
          }
          .addr-add {
            text-align: center;
            color: #999999;
            cursor: pointer;
            .icon-add {
              width: 30px;
              height: 30px;
              border-radius: 50%;
              background: url("/imgs/icon-add.png") #e0e0e0 no-repeat center;
              background-size: 14px;
              margin: 0 auto;
              margin-top: 45px;
              margin-bottom: 10px;
            }
          }
        }
      }
      .item-good {
        margin-top: 34px;
        border-bottom: 1px solid #e5e5e5;
        padding-bottom: 12px;
        h2 {
          border-bottom: 1px solid #e5e5e5;
          padding-bottom: 5px;
        }
        li {
          display: flex;
          align-items: center;
          height: 40px;
          line-height: 40px;
          margin-top: 10px;
          font-size: 16px;
          color: #333333;
          .good-name {
            flex: 5;
            img {
              width: 30px;
              height: 30px;
              vertical-align: middle;
            }
          }
          .good-price {
            flex: 2;
          }
          .good-total {
            padding-right: 44px;
            color: #00ccff;
          }
        }
      }
      .item-shipping,
      .item-invoice {
        margin-top: 31px;
        line-height: 20px;
        h2 {
          display: inline-block;
          margin-right: 71px;
          font-size: 20px;
          width: 80px;
        }
        span,
        a {
          font-size: 16px;
          color: #00ccff;
          margin-right: 23px;
        }
      }
      .detail {
        padding: 50px 44px 33px 0;
        border-bottom: 1px solid #f5f5f5;
        text-align: right;
        font-size: 16px;
        color: #666666;
        .item-val {
          color: #00ccff;
        }
        .item {
          line-height: 15px;
          margin-bottom: 12px;
        }
        .item-val {
          display: inline-block;
          width: 100px;
        }
        .item-total {
          .item-val {
            font-size: 1.5vw;
          }
        }
        .selc {
          border: 1px solid #ccc;
          padding: 7px 7px;
          border-radius: 3px;
          padding-left: 5px;
          padding-bottom: 10px;
          font-size: 24;
          margin-bottom: 12px;
        }
      }
      .btn-group {
        margin-top: 37px;
        text-align: right;
      }
    }
  }
  .edit-wrap {
    font-size: 14px;
    .item {
      margin-bottom: 15px;
      .inline-input {
        width: 100%;
      }
      .input {
        display: inline-block;
        width: 283px;
        height: 40px;
        line-height: 40px;
        padding-left: 15px;
        border: 1px solid #e5e5e5;
        & + .input {
          margin-left: 14px;
        }
      }
      select {
        height: 40px;
        line-height: 40px;
        border: 1px solid #e5e5e5;
        margin-right: 15px;
      }
      textarea {
        height: 62px;
        width: 100%;
        padding: 13px 15px;
        box-sizing: border-box;
        border: 1px solid #e5e5e5;
      }
    }
  }
}
</style>