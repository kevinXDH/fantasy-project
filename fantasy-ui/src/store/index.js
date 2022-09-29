import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    isShowUserCenter: localStorage.getItem('userInfo')!=null,
    id:0,
    categoryList:[],
    stateBlogList:[],
    collectedResourceList:[]
  },
  getters: {
  },
  mutations: {
    changeShowUserCenter (state) {
      state.isShowUserCenter=!state.isShowUserCenter
    },
    setId(state){
      state.id=localStorage.getItem('userInfo')
    }
  },
  actions: {
  },
  modules: {
  }
})
