<template>
  <div class="order-pay">
    <order-header title="Make Payment">
      <template v-slot:tip>
        <span>Please confirm the receiving method</span>
      </template>
    </order-header>
    <div class="wrapper">
      <div class="container">
        <div class="order-wrap">
          <div class="item-order">
            <div class="icon-succ"></div>
            <div class="order-info">
              <h2>Order confirmed! Make the payment!</h2>
              <p>Please check out in <span>{{orderOvertime}} minutes</span>, otherwise the order will be cancelled</p>
              <p>Receiving Method: {{addressInfo}}</p>
            </div>
            <div class="order-total">
              <p>Total: <span>{{payment}}</span> VC</p>
              <p>Order details<em class="icon-down" :class="{'up':showDetail}" @click="showDetail=!showDetail"></em></p>
            </div>
          </div>
          <div class="item-detail" v-if="showDetail">
            <div class="item">
              <div class="detail-title">Order number: </div>
              <div class="detail-info theme-color">{{orderSn}}</div>
            </div>
            <div class="item">
              <div class="detail-title">Receiving Method: </div>
              <div class="detail-info">{{addressInfo}}</div>
            </div>
            <div class="item good">
              <div class="detail-title">Product name: </div>
              <div class="detail-info">
                <ul>
                  <li v-for="(item,index) in orderDetail" :key="index">
                    <img v-lazy="item.productPic"/>{{item.productName}}
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="item-pay">
          <h3>Choose payment method</h3>
          <div class="pay-way">
            <p>Pay method</p>
            <div class="pay pay-ali" @click="paySubmit(1)" :class="{'checked':payType==1}"></div>
            <div class="pay pay-wechat" :class="{'checked':payType==2}" ></div>
          </div>
           <div class="pay-way"  v-if="showPay && payType==1" >
              <img  :src="payImageQr"/>
            </div>
        </div>
      </div>
    </div>
    <scan-pay-code v-if="showPay && payType==2" @close="closePayModal" :img="payImg"></scan-pay-code>
    <modal
      title="Payment confirmation"
      btnType="3"
      :showModal="showPayModal"
      sureText="View the order"
      cancelText="Unpaid"
      @cancel="showPayModal=false"
      @submit="goOrderList"
    >
      <template v-slot:body>
        <p>Confirm the payment?</p>
      </template>
    </modal>
  </div>
</template>
<script>
import QRCode from 'qrcode'
import OrderHeader from './../components/OrderHeader'
import Modal from './../components/Modal'
import Qs from 'qs'
export default{
  name:'order-pay',
  data(){
    return {
      orderId:this.$route.query.orderId,
      addressInfo:'',//Consignee's address
      orderDetail:[],//Order details, including a list of items
      showDetail:false,//Whether to display order details
      payType:'',//Payment type
      showPay:false,//Whether to display the wechat Pay bullet box
      payImg:'',//The QR code address of scanning Pay
      showPayModal:false,//Whether to display the second payment confirmation box
      payment:0,//Total order amount
      T:'',//Timer ID
      payImageQr:'', 
      orderSn:'',
      orderOvertime:'',
    }
  },
  components:{
    OrderHeader,
    Modal
  },
  mounted(){
    this.getOrderDetail();
  },
  methods:{
    getOrderDetail(){
      this.axios.get(`/order/orderDetail?orderId=${this.orderId}`).then((res)=>{
         this.orderDetail=res.orderItemList;  //Details of goods ordered
         this.addressInfo=res.receiverProvince+res.receiverCity+res.receiverRegion+res.receiverDetailAddress;
         this.payment=res.payAmount;
         this.orderSn=res.orderSn;
         this.orderOvertime=res.normalOrderOvertime;

      }) 
    },
    paySubmit(payType){
      this.payType=payType;
      this.showPay = !this.showPay;
      // Alipay
      if(payType == 1){ 
          this.axios.post('/order/tradeQrCode',Qs.stringify({
          orderId:this.orderId,
          payType:1
        }),{headers: {'Content-Type': 'application/x-www-form-urlencoded'}}).then((res)=>{
        this.payImageQr='http://localhost:8888'+res;
        window.console.log(res);
        })
      }else{
        // Wechat
        this.axios.post('/pay',{
          orderId:this.orderId,
          orderName:'EZT',
          amount:0.01,//Unit: CNY
          payType:2 //1Alipay，2Wechat
        }).then((res)=>{
          QRCode.toDataURL(res.content)
          .then(url => {
            this.showPay = true;
            this.payImg = url;
            this.loopOrderState();
          })
          .catch(() => {
            this.$message.error('QR code generation failed, please try again later');
          })
        })
      }
    },
    // Close the pop-up frame
    closePayModal(){
      this.showPay = false;
      this.showPayModal = true;
      clearInterval(this.T);
    },
    // Polling the current order payment status
    loopOrderState(){
      this.T = setInterval(()=>{
        this.axios.get(`/orders/${this.orderId}`).then((res)=>{
          if(res.status == 20){
            clearInterval(this.T);
            this.goOrderList();
          }
        })
      },1000);
    },
    goOrderList(){
      this.$router.push('/order/list');
    }
  }
}
</script>
<style lang="scss">
  .order-pay{
    .wrapper{
      background-color:#F5F5F5;
      padding-top:30px;
      padding-bottom:61px;
      .order-wrap{
        padding: 62px 50px;
        background-color: #fff;
        font-size:14px;
        margin-bottom:30px;
        .item-order{
          display: flex;
          align-items: center;
          .icon-succ{
            width: 90px;
            height: 90px;
            border-radius: 50%;
            background:url('/imgs/icon-gou.png') #80c58a no-repeat center;
            background-size:60px;
            margin-right:40px;
          }
          .order-info{
            margin-right: 248px;
            h2{
              font-size:24px;
              color:#333333;
              margin-bottom:20px;
            }
            p{
              color:#666666;
              span{
                color:#00ccff;
              }
            }
          }
          .order-total{
            &>p:first-child{
              margin-bottom:30px;
            }
            span{
              font-size:28px;
              color:#00ccff;
            }
            .icon-down{
              display:inline-block;
              width:14px;
              height:10px;
              background:url('/imgs/icon-down.png') no-repeat center;
              background-size:contain;
              margin-left:9px;
              transition:all .5s;
              cursor:pointer;
              &.up{
                transform: rotate(180deg);
              }
            }
            .icon-up{
              transform: rotate(180deg);
            }
          }
        }
        .item-detail{
          border-top: 1px solid #D7D7D7;
          padding-top: 47px;
          padding-left: 130px;
          font-size: 14px;
          margin-top: 45px;
          .item{
            margin-bottom:19px;
            .detail-title{
              float:left;
              width:100px;
            }
            .detail-info{
              display:inline-block;
              img{
                width: 30px;
                vertical-align: middle;
              }
            }
          }
        }
      }
      .item-pay{
        padding:26px 50px 72px;
        background-color:#ffffff;
        color: #333333;
        h3{
          font-size: 20px;
          font-weight: 200;
          color: #333333;
          padding-bottom: 24px;
          border-bottom: 1px solid #D7D7D7;
          margin-bottom: 26px;
        }
        .pay-way{
          font-size:18px;
          .pay{
            display:inline-block;
            width:188px;
            height:64px;
            border:1px solid #D7D7D7;
            cursor:pointer;
            &:last-child{
              margin-left:20px;
            }
            &.checked{
              border:1px solid #00ccff;
            }
          }
          .pay-ali{
            background:url('/imgs/pay/icon-ali.png') no-repeat center;
            background-size:103px 38px;
            margin-top:19px;
          }
          .pay-wechat{
            background:url('/imgs/pay/icon-wechat.png') no-repeat center;
            background-size:103px 38px;
          }
        }
      }
    }
  }
</style>