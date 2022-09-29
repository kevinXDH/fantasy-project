<template>
  <div class="login_container" ref='vantaRef'>
    <div class="login_box">
      <!--title-->
      <!--type用来接收路由参数:'0','1',其中'0'表示展示登录框,'1'表是展示注册框-->
      <div id="title1" v-if="type==='0'" @click="toHome">Fantasy</div>
      <div id="title2" v-if="type==='1'" @click="toHome">Fantasy</div>
      <transition name="slide-fade">
        <!-- 登录表单区域 -->
        <el-form
            label-width="70px"
            class="login_from"
            :model="loginForm"
            ref="loginForm"
            hide-required-asterisk
            v-if="type==='0'"
        >
          <!-- 用户名 -->
          <el-form-item label="用户名" prop="username">
            <el-input
                v-model="loginForm.username"
                prefix-icon="el-icon-user-solid"
            ></el-input>
          </el-form-item>
          <!-- 密码 -->
          <el-form-item label="密码" prop="password">
            <el-input
                v-model="loginForm.password"
                prefix-icon="el-icon-unlock"
                show-password
            ></el-input>
          </el-form-item>
          <!-- 按钮区域 -->
          <el-form-item class="btns">
            <button type="button" class="button-submit" @keyup.enter="login" @click.prevent="login"
                    style="float: left;margin-right: 15px;">
              <i>登</i>
              <i>录</i>
            </button>
          </el-form-item>
        </el-form>
      </transition>

      <!--注册表单区域-->
      <transition name="slide-fade">
        <el-form
            label-width="70px"
            class="login_from"
            :model="registerForm"
            ref="registerForm"
            hide-required-asterisk
            v-if="type==='1'"
        >
          <!-- 用户名 -->
          <el-form-item label="用户名" prop="username">
            <el-input
                v-model="registerForm.username"
                prefix-icon="el-icon-user-solid"
            ></el-input>
          </el-form-item>
          <!-- 密码 -->
          <el-form-item label="新密码" prop="password1">
            <el-input
                v-model="registerForm.password1"
                prefix-icon="el-icon-unlock"
                show-password
            ></el-input>
          </el-form-item>
          <el-form-item label="确认密码" prop="password2">
            <el-input
                v-model="registerForm.password2"
                prefix-icon="el-icon-unlock"
                show-password
            ></el-input>
          </el-form-item>
          <!-- 按钮区域 -->
          <el-form-item class="btns">
            <button type="button" class="button-submit" @click="register">
              <i>注</i>
              <i>册</i>
            </button>
          </el-form-item>
        </el-form>
      </transition>
    </div>
  </div>
</template>

<script>
import * as p5 from 'p5'
import * as THREE from 'three'
import NET from 'vanta/src/vanta.net'

export default {
  props: {
    type: {
      type: String,
      default: '0',
      required: true
    }
  },
  watch: {
    type: {
      handler(newVal, oldVal) {
        //监听type的变化，清空表单
        if (newVal === '0') {
          this.loginForm.username = ''
          this.loginForm.password = ''
        } else {
          this.registerForm.username = ''
          this.registerForm.password1 = ''
          this.registerForm.password2 = ''
        }
      },
      //表示一进入界面就立即触发一次
      immediate: true
    }
  },
  mounted() {
    this.vantaEffect = NET({
      el: this.$refs.vantaRef,
      p5: p5,
      THREE: THREE
    })
    this.vantaEffect.setOptions({
      mouseControls: true,
      touchControls: true,
      gyroControls: false,
      minHeight: 200.00,
      minWidth: 200.00,
      scale: 1.00,
      scaleMobile: 1.00,
      color: 0xffffff,
      backgroundColor: 0xdbdcdc,
      maxDistance: 24.00,
      spacing: 20.00,
      showDots: false
    })
  },
  beforeDestroy() {
    if (this.vantaEffect) {
      this.vantaEffect.destroy()
    }
  },
  data() {
    return {
      username: '',
      password: '',
      loginForm: {
        username: '',
        password: ''
      },
      registerForm: {
        username: '',
        password1: '',
        password2: '',
      },
    }
  },
  methods: {
    toHome() {
      this.$router.push({
        path: '/'
      })
    },
    login() {
      if (this.loginForm.username === '' || this.loginForm.password === '') {
        this.$message({
          message: '用户名或密码不能为空',
          type: 'info'
        })
      } else {
        const param = {
          username: this.loginForm.username,
          password: this.loginForm.password
        }
        this.$http.post('/user/login', param).then((response) => {
          if (response.data.map.code === 20000) {
            //保存 token
            localStorage.setItem("userInfo", response.data.map.userInfo)
            localStorage.setItem("token", response.data.map.token)
            this.$store.state.isShowUserCenter = true
            // 跳转到首页
            this.$router.push({
              path: '/home'
            })

            const h = this.$createElement;
            setTimeout(() =>{
              this.$notify({
                title: '亲爱的用户',
                message: h('i', { style: 'color: #0170fe'}, `${this.getTimeState()}，欢迎回来`)
              });
            },1000)

          } else {
            this.$message({
              message: '用户名或密码错误',
              type: 'info'
            })
          }
        }).finally(() => {
          this.$refs['loginForm'].resetFields();
        })
      }
    },
    getTimeState(){
      let timeNow = new Date();
      let hours = timeNow.getHours();
      let text = ``;
      if (hours >= 0 && hours <= 10) {
        text = `早上好`;
      } else if (hours > 10 && hours <= 14) {
        text = `中午好`;
      } else if (hours > 14 && hours <= 18) {
        text = `下午好`;
      } else if (hours > 18 && hours <= 24) {
        text = `晚上好`;
      }
      return text;
    },
    register() {
      if (this.registerForm.username === '' || this.registerForm.password1 === '' || this.registerForm.password2 === '') {
        this.$message({
          message: '用户名或密码不能为空',
          type: 'info'
        })
      } else if (this.registerForm.password1 !== this.registerForm.password2) {
        this.$message({
          message: '两次密码输入不一致',
          type: 'info'
        })
        this.$refs['registerForm'].resetFields();
      } else {
        const param = {
          username: this.registerForm.username,
          password: this.registerForm.password1
        }
        this.$http.post('/user/save', param).then((response) => {
          if (response.data.code === 20000) {
            this.$message({
              message: '注册成功',
              type: 'info'
            })
            this.type = '0'
          } else {
            this.$message({
              message: response.data.msg,
              type: 'info'
            })
          }
        }).finally(() => {
          this.$refs['registerForm'].resetFields();
        })
      }
    }
  }
}

</script>

<style lang="less" scoped>
.login_container {
  margin: 0;
  left: 0;
  min-height: 100vh;
  width: 100%;
  height: 100vh;
  background-size: 100% 100%;
  position: fixed;
}

.login_box {
  width: 450px;
  height: 350px;
  background-color: rgba(255, 255, 255, 0.5);
  border-radius: 15px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
}

.login_from {
  position: absolute;
  bottom: 0;
  width: 100%;
  padding: 0 20px;
  box-sizing: border-box;
}

.btns {
  display: flex;
  justify-content: flex-end;
}

#title1 {
  font-size: 60px;
  font-style: italic;
  font-weight: bold;
  text-decoration: underline;
  display: flex;
  justify-content: center;
  color: #0170fe;
  cursor: pointer;
  margin-top: 45px;
}

#title2 {
  font-size: 60px;
  font-style: italic;
  font-weight: bold;
  text-decoration: underline;
  display: flex;
  justify-content: center;
  color: #0170fe;
  cursor: pointer;
}

//提交按钮样式---开始
.button-submit {
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  height: 35px;
  position: relative;
  padding: 0 20px;
  font-size: 35px;
  text-transform: uppercase;
  border: 0;
  box-shadow: hsl(210deg 87% 36%) 0px 5px 0px 0px;
  background-color: #0170fe;
  border-radius: 12px;
  overflow: hidden;
  transition: 31ms cubic-bezier(.5, .7, .4, 1);
}

.button-submit:before {
  content: attr(alt);
  display: flex;
  align-items: center;
  justify-content: center;
  position: absolute;
  inset: 0;
  font-size: 22px;
  font-weight: bold;
  color: white;
  letter-spacing: 4px;
  opacity: 1;
}

.button-submit:active {
  box-shadow: none;
  transform: translateY(7px);
  transition: 35ms cubic-bezier(.5, .7, .4, 1);
}

.button-submit:hover:before {
  transition: all .0s;
  transform: translateY(100%);
  opacity: 0;
}

.button-submit i {
  color: white;
  font-size: 22px;
  font-weight: bold;
  letter-spacing: 4px;
  font-style: normal;
  transition: all 2s ease;
  transform: translateY(-20px);
  opacity: 0;
}

.button-submit:hover i {
  transition: all .2s ease;
  transform: translateY(0px);
  opacity: 1;
}

.button-submit:hover i:nth-child(1) {
  transition-delay: 0.045s;
}

.button-submit:hover i:nth-child(2) {
  transition-delay: calc(0.045s * 3);
}

.button-submit:hover i:nth-child(3) {
  transition-delay: calc(0.045s * 4);
}

.button-submit:hover i:nth-child(4) {
  transition-delay: calc(0.045s * 5);
}

.button-submit:hover i:nth-child(6) {
  transition-delay: calc(0.045s * 6);
}

.button-submit:hover i:nth-child(7) {
  transition-delay: calc(0.045s * 7);
}

.button-submit:hover i:nth-child(8) {
  transition-delay: calc(0.045s * 8);
}

.button-submit:hover i:nth-child(9) {
  transition-delay: calc(0.045s * 9);
}

.button-submit:hover i:nth-child(10) {
  transition-delay: calc(0.045s * 10);
}

//提交按钮样式---结束

//动画---开始
.slide-fade-enter-active {
  transition: all .6s ease;
}

.slide-fade-leave-active {
  transition: all .6s cubic-bezier(1.0, 0.5, 0.8, 1.0);
}

.slide-fade-enter, .slide-fade-leave-to
  /* .slide-fade-leave-active for below version 2.1.8 */ {
  transform: translateX(10px);
  opacity: 0;
}

//动画---结束


</style>

