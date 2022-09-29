<template>
  <div>
    <el-menu
             class="el-menu-demo"
             mode="horizontal"
             @select="handleSelect"
             router
    >
      <el-menu-item>
<!--        <span class="icon" @click="toHome">Fantasy</span>-->
        <img
            src="https://fantasy-1305765455.cos.ap-shanghai.myqcloud.com/logo.png"
            alt="logo"
            width="160"
            height="45"
            @click="toHome"
            style="cursor: pointer"
        />
      </el-menu-item>

      <el-menu-item index="/home" style="border-bottom-color: rgb(255 255 255)" >首页</el-menu-item>
      <el-menu-item index="/resource" style="border-bottom-color: rgb(255 255 255)">资源</el-menu-item>
      <el-menu-item index="/blog" style="border-bottom-color: rgb(255 255 255)">博客</el-menu-item>
      <el-menu-item style="border-bottom-color: rgb(255 255 255)" @click="toBottom" v-if="isShowAbout">更多相关</el-menu-item>

<!--      <div class="search">-->
<!--        <el-input placeholder="" v-model="searchText">-->
<!--          <el-button slot="append" icon="el-icon-search" @click="search"></el-button>-->
<!--        </el-input>-->
<!--      </div>-->

      <el-menu-item index="/login/0" style="background-color: #0170fe;color: white" v-if="isShow">登录</el-menu-item>
      <el-menu-item index="/login/1" style="border-bottom-color: rgb(255 255 255)" v-if="isShow">注册</el-menu-item>
      <el-menu-item style="border-bottom-color: rgb(255 255 255)" v-if="!isShow" @click="goToUserDetail">个人中心</el-menu-item>
    </el-menu>
  </div>
</template>

<script>
export default {
  computed:{
    isShow() {
      return !this.$store.state.isShowUserCenter
    },
    isShowAbout(){
      return this.$route.path==='/home'
    },
  },
  created() {

  },
  data() {
    return {
      searchText:'',
      loadingInstance:null
    }
  },
  methods: {
    toBottom(){
      window.scrollTo(0,9999);
    },
    toHome(){
      this.$router.push({
        path:'/'
      })
    },
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
    },
    search(){
      console.log(this.searchText);
    },
    goToUserDetail(){
      this.$router.push({
        path:'/userDetail/'+localStorage.getItem('userInfo')
      })
    }
  }
}
</script>

<style scoped>
body {
  margin: 0px !important;
}
.icon {
  font-size: 50px;
  font-style: italic;
  font-weight: bold;
  /* text-decoration: underline; */
  color: #0170fe;
  cursor: pointer;
}

.el-menu-demo{
  display: flex;
  align-items: center;
  justify-content: space-between;
}

/deep/ .el-menu--horizontal>.el-menu-item{
  color: #000;
  font-size: 16px;
  font-weight: bold;
}


@media (max-width:600px) {
  .el-menu-demo {
    display: none;
  }
}
</style>
