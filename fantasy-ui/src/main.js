import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import 'element-ui/lib/theme-chalk/display.css';
import './index.css'
import axios from 'axios'
import { Loading } from 'element-ui';

//43.143.103.115
axios.defaults.baseURL = 'http://localhost:10086/'

let loading=null
axios.interceptors.request.use(
    config => {
        loading=Loading.service({fullscreen:true})
        // 从本地存储中获取token，携带在header中
        const token = localStorage.getItem('token');
        token && (config.headers.token = token);
        return config;
    },
    error => {
        return Promise.error(error);
    }
)

axios.interceptors.response.use((response)=>{
    Vue.nextTick(()=>{
        loading.close()
    })
    return response
})
// 挂载一个自定义属性$http
Vue.prototype.$http = axios


Vue.config.productionTip = false
Vue.use(ElementUI);

Vue.prototype.$toTop=()=>{
  let top = document.documentElement.scrollTop || document.body.scrollTop

  document.body.scrollTop = document.documentElement.scrollTop = top -= 10000
  // 实现滚动效果
  // const timeTop = setInterval(() => {
  //
  //   if (top <= 0) {
  //     clearInterval(timeTop)
  //   }
  // }, 10)
}

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
