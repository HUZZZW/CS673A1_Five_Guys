<template>
  <div class="login">
    <div class="container">
      <a href="/#/index"><img src="./../assets/image/Big-logo.png" alt=""></a>
    </div>
    <div class="wrapper">
      <div class="container">
        <div class="login-form">
          <h3>
            <span class="checked">Login</span>
          </h3>
          <div class="input">
            <input type="text" placeholder="Enter account number">
          </div>
          <div class="input">
            <input type="password" placeholder="Enter password">
          </div>
          <div class="btn-box">
            <a href="javascript:;" class="btn">Login</a>
          </div>
          <div class="tips">
            <div class="reg">Sign up<span>|</span>Forget password?</div>
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

<style lang="scss">
@import './../assets/scss/config.scss';
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
            color: $colorA;
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