import Vue from 'vue'
import router from './router'
import 'font-awesome/css/font-awesome.min.css'
import App from './App.vue' 


// initalize instance of Vue
new Vue({
  router,
  render: h => h(App),
}).$mount('#app')


