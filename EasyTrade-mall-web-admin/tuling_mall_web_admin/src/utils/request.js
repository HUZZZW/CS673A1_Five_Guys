import axios from 'axios'
import { Message, MessageBox } from 'element-ui'
import store from '../store'
import { getToken } from '@/utils/auth'

// Create an axios instance
const service = axios.create({
  baseURL: process.env.BASE_API, // base_url of the api
  timeout: 15000, // request timeout
  withCredentials:true   // Set request to carry cookie to ensure session validity
})

// request interceptor
service.interceptors.request.use(config => {
  if (store.getters.token) {
    config.headers['Authorization'] = getToken() // Let each request carry a custom token, please modify it according to the actual situation
  }
  return config
}, error => {
  // Do something with request error
  console.log(error) // for debug
  Promise.reject(error)
})

// response interceptor
service.interceptors.response.use(
  response => {

    const res = response.data
    if (res.code !== 200) {

      // 401:未登录;
      if (res.code === 401) {
        MessageBox.confirm('You are already logged out, choose cancel to stay in this page, or log in again.', 'Logged Out', {
          confirmButtonText: 'Log in again',
          cancelButtonText: 'Cancel',
          type: 'warning'
        }).then(() => {
          store.dispatch('FedLogOut').then(() => {
            location.reload()// 为了重新实例化vue-router对象 避免bug
          })
        })
        return res;
      }
      else if (res.code === 403) {
        Message({
          message: res.message,
          type: 'warning',
          duration: 3 * 1000
        })
        return res;
      }
      Message({
        message: res.message,
        type: 'error',
        duration: 3 * 1000
      })
      return Promise.reject(res.message)
    } else {
      return response.data
    }
  },
  error => {
    console.log('err' + error)// for debug
    Message({
      message: error.message,
      type: 'error',
      duration: 3 * 1000
    })
    return Promise.reject(error)
  }
)

export default service
