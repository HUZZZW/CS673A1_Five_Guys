import Vue from 'vue'
import router from './router'
import axios from 'axios'
import VueAxios from 'vue-axios'
import VueLazyLoad from 'vue-lazyload'
import VueCookie from 'vue-cookie'
import { Message,Autocomplete } from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
// npm install --save font-awesome
import 'font-awesome/css/font-awesome.min.css'
import store from './store'  // Global variable
import App from './App.vue' 

// import env from './env'
// mock switch
const mock = false;
if(mock){
  require('./mock/api');
}

axios.defaults.baseURL = '/api';
axios.defaults.timeout = 8000; 

// axios.defaults.baseURL = env.baseURL;

function getCookie(c_name){
  if (document.cookie.length>0){
      let c_start=document.cookie.indexOf(c_name + "=")
      if (c_start!=-1){ 
          c_start=c_start + c_name.length+1 
          let c_end=document.cookie.indexOf(";",c_start)
          if (c_end==-1) c_end=document.cookie.length
              return unescape(document.cookie.substring(c_start,c_end))
          } 
      }
  return ""
}
// request
// axios interceptor  (jwt+spring security)
axios.interceptors.request.use(config => {
  // jwt Token
  var token= getCookie("token");
  window.console.log(token);
  if (token !=undefined) {
    // let each request carry a custom token
    config.headers['Authorization'] = token;
  } 
  return config
}, error => {
  // Do something with request error
  Promise.reject(error)
})





// Interface error interception
axios.interceptors.response.use(function(response){ 
  let res = response.data;
  let path = location.hash;   

  if(res.code==undefined){
    return res;
  }

  // Process CommonResult logic
  if(res.code == 200){
    return res.data;
  }else if(res.code==401 || res.code==403|| res.code==600){  //|| res.code==401 || res.code==403 
    if (path != '#/index'){
     
      window.location.href = '/#/login';
    }
    return Promise.reject(res);
  }else{
    Message.warning(res.message);
    return Promise.reject(res);
  }
},(error)=>{ 
  Message.error(error.message);
  return Promise.reject(error);
});

Vue.use(Autocomplete);
Vue.use(VueAxios,axios);
Vue.use(VueCookie);
Vue.use(VueLazyLoad,{
  loading:'/imgs/loading-svg/loading-bars.svg',
  error:'/imgs/nopic.png'
})
Vue.prototype.$message = Message;
Vue.config.productionTip = false


// Create a VUe root instance
new Vue({
  store,
  router,
  render: h => h(App),
}).$mount('#app')


