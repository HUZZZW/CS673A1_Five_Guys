<template>
  <div class="login">
    <div class="container">
      <a href="/#/index"><img src="./../assets/image/Big-logo.png" alt=""></a>
    </div>
    <div class="wrapper">
      <div class="container">
        <div class="login-form">
          <h3>
            <span class="checked">SIGN IN WITH YOUR EZT ID</span>
          </h3>
          <div class="input">
            <input type="text" placeholder="Account Number" v-model="username">
          </div>
          <div class="input">
            <input type="password" placeholder="Password" v-model="password">
          </div>
          <div class="btn-box">
            <a href="javascript:;" class="btn" @click="login">Sign in</a>
          </div>
          <div class="tips">
            <div class="reg" @click="register">Sign up<span>|</span>Forger Password?</div>
          </div>
        </div>
      </div>
    </div>
    <div class="footer">
      <div class="footer-link">
        <a href="" target="_blank">EZT</a>
      </div>
    </div>
  </div>
</template>
<script>
import { mapActions } from 'vuex';
import { setCookie } from '@/util/support';

import Qs from 'qs'

export default {
  Qs,
  name: 'login',
  data() {
    return {
      username: '',
      password: '',
      userId: ''
    }
  },
  methods: {
    login() {
      let { username, password } = this;

      this.axios.post(
        'user/login',
        Qs.stringify({
          username: username,
          password: password
        }), { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } }).then((res) => {

          // store tokenHead + jwtToken into cookie
          // then next request would be included in tokenThead
          this.$cookie.set('token',res.tokenHead+' '+res.token,{expires:'1M'});
          // store into globle variable
          this.$store.dispatch('saveToken',res.token);
          // get payloader (decoded)
          var tokenStr= decodeURIComponent(escape(window.atob(res.token.split('.')[1])));
          // convert into json object
          let username = JSON.parse(tokenStr).user_name;

          // only use session to implement login function:
          // let username=res.username;
          // setCookie("token",username,120);

          // setCookie = this.$cookie.set
          setCookie("username", username, 120);

          // this.saveUserName = this.$store.dispatch('saveUserName',username)
          this.saveUserName(username);

          this.$router.push({
            name: 'index',
            params: {
              from: 'login'
            }
          });
        })
    },
    ...mapActions(['saveUserName']),
    register() {
      this.axios.post('/user/register', {
        username: this.username,
        password: this.password
      }).then(() => {
        this.$message.success('Sign up Successfully');
      })
    }
  }
}
</script>
<style lang="scss">
.login {
  &>.container {
    height: 113px;

    img {
      width: auto;
      height: 100%;
    }
  }

  .wrapper {
    background: url('../assets/image/login-page-background.jpg') left;
    background-repeat: no-repeat;
    background-size: 100% 100%;

    .container {
      height: 576px;

      .login-form {
        box-sizing: border-box;
        padding-left: 31px;
        padding-right: 31px;
        width: 410px;
        height: 510px;
        background-color: #ffffff;
        position: absolute;
        bottom: 29px;
        right: 0;

        h3 {
          line-height: 23px;
          font-size: 24px;
          text-align: center;
          margin: 40px auto 49px;

          .checked {
            color: #00ccff;
          }

          .sep-line {
            margin: 0 32px;
          }
        }

        .input {
          display: inline-block;
          width: 348px;
          height: 50px;
          border: 1px solid #E5E5E5;
          margin-bottom: 20px;

          input {
            width: 100%;
            height: 100%;
            border: none;
            padding: 18px;
          }
        }

        .btn {
          width: 100%;
          line-height: 50px;
          margin-top: 10px;
          font-size: 16px;
        }

        .tips {
          margin-top: 14px;
          display: flex;
          justify-content: space-between;
          font-size: 14px;
          cursor: pointer;

          .sms {
            color: #00ccff;
          }

          .reg {
            color: #999999;

            span {
              margin: 0 7px;
            }
          }
        }
      }
    }
  }

  .footer {
    height: 100px;
    padding-top: 60px;
    color: #999999;
    font-size: 16px;
    text-align: center;

    .footer-link {
      a {
        color: #999999;
        display: inline-block;
      }

      span {
        margin: 0 10px;
      }
    }

    .copyright {
      margin-top: 13px;
    }
  }
}</style>