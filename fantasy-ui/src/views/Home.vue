<template>
  <div>
    <div class="header-div" ref="vantaRef">
      <div class="title">Fantasy</div>
      <button id="main-button" @click="moreToResource">开始探索</button>
    </div>

    <div>
      <el-row type="flex"
              justify="center">
        <el-col :xs="20"
                :md="20">
          <h4 style="margin-top: 40px">关于我们</h4>
          <el-card class="box-card" style="margin-bottom: 50px;padding-top:20px;border-radius: 15px"> 什么？找不到资源？快来<span
              style="color: #0170fe">Fantasy</span>(范特西),这里有许许多多的资源任你挑选，帮你请准定位到你所感兴趣的资源，除此之外，在这里你还能发挥自己所能，将自己觉得不错的资源分享给他人，精品博客等你来撰写。
            找资源，就来fantasy，快加入我们吧！
          </el-card>

          <div>
            <h4>热门资源</h4>
            <div @click="moreToResource"
                 class="more">更多
            </div>
          </div>

          <!-- 热门资源 -->
          <div style="display: flex;justify-content: center;flex-wrap: wrap">
            <card v-for="item in resourceList" :key="item.id" style="margin: 20px"
                  :content="item.content"
                  :create-time="item.createTime"
                  :description="item.description"
                  :image="item.image"
                  :name="item.name"
                  :star="item.star"
                  :url="item.url"
                  :tag="item.tagArr"
            >
              <template #goto>
                <el-tag
                    style="margin-right: 5px;background-color: #0170fe;color: white;cursor: pointer"
                    @click="toResourceDetail(item.id)"
                >访问
                </el-tag>
              </template>

              <template #star>
                <i class="el-icon-star-off" style="font-size: 20px;cursor: pointer" @click="addResourceStar(item.id)"
                   ref="star">{{ item.star }}</i>
              </template>
            </card>
          </div>

          <div style="margin-top: 25px">
            <h4>热门博客</h4>
            <div @click="moreToBlog"
                 class="more">更多
            </div>
          </div>

          <!-- 热门博客内容 -->
          <el-row class="top-content">
            <el-col :md="24">
              <el-card>
                <el-row v-for="(b, rIndex) in blogList" :key="rIndex">
                  <el-col :md="18">
                    <div :body-style="{ padding: '0px' }"
                         shadow="never">
                      <div style="padding: 14px">
                        <h4 class="article-title" style="color: #0170fe;cursor: pointer" @click="toBlogDetail(b.id)">
                          {{ b.name }}</h4>
                        <p class="author">发布人: {{ b.user.name }}</p>
                        <span class="item-summary">{{ b.content.substring(0, 100) }}...</span>
                        <div class="blog-item-bottom">
                          <div class="bottom clearfix comment-collection">
                            <i class="el-icon-s-comment "></i>
                            <div>{{ b.commentCount }}</div>&nbsp;&nbsp;
                            <i class="el-icon-star-off "></i>
                            <div>{{ b.star }}</div>
                          </div>
                          <time class="time">发布时间：{{ moment(b.createTime) }}</time>
                        </div>
                      </div>
                    </div>
                  </el-col>
                  <el-col :md="6">
                    <div :body-style="{ padding: '0px' }"
                         shadow="never">
                      <div style="padding: 14px" class="content-time">
                        <img :src="b.coverImg"
                             alt="" style="width:170px;height: 121px">
                      </div>
                    </div>
                  </el-col>
                </el-row>
              </el-card>
            </el-col>
          </el-row>
        </el-col>
      </el-row>

    </div>
    <!-- 底部 -->
    <footer class="rc-footer" id="bottom">
      <el-row type="flex"
              class="row-bg"
              justify="space-between">
        <el-col :span="6">
          <div class="footer-column">
            <h2 style="color: #0170fe">WebUI组件</h2>
            <div class="item">
              <a href="https://www.antdv.com/components/overview">Ant Design Vue</a>
            </div>
            <div class="item">
              <a href="https://tdesign.tencent.com/">TDesign</a>
            </div>
            <div class="item">
              <a href="https://nutui.jd.com/#/">NutUI 3.0</a>
            </div>
            <div class="item">
              <a href="https://arco.design/">Arco Design</a>
            </div>
            <div class="item">
              <a href="https://www.iviewui.com/">View Design</a>
            </div>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="footer-column">
            <h2 style="color: #0170fe">后端框架</h2>
            <div class="item">
              <a href="https://spring.io/">Spring</a>
            </div>
            <div class="item">
              <a href="https://laravel.com/">Laravel</a>
            </div>
            <div class="item">
              <a href="https://cakephp.org/">CakePHP</a>
            </div>
            <div class="item">
              <a href="https://www.djangoproject.com/">Django</a>
            </div>
            <div class="item">
              <a href="https://rubyonrails.org/">Ruby on Rails</a>
            </div>
            <div class="item">
              <a href="https://www.phoenixframework.org/">Phoenix</a>
            </div>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="footer-column">
            <h2 style="color: #0170fe">低代码框架</h2>
            <div class="item">
              <a href="https://www.renren.io/">人人开源</a>
            </div>
            <div class="item">
              <a href="https://www.diboot.com/">Diboot 低代码开发平台</a>
            </div>
            <div class="item">
              <a href="https://baomidou.com/pages/ba5b24/">MybatisX</a>
            </div>
            <div class="item">
              <a href="https://baidu.gitee.io/amis/">百度开源 amis</a>
            </div>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="footer-column">
            <h2 style="color: #0170fe">更多</h2>
            <div class="item">
              <a href="https://github.com/">Github</a>
            </div>
            <div class="item">
              <a href="https://gitee.com/">Gitee</a>
            </div>
          </div>
        </el-col>
      </el-row>
      <div
          style="background-color: #172026;
          height: 60px;width: 100%;
          border-top: 1px solid lightgray;
          display: flex;justify-content: center;
          align-items: center;
          color:white;
      ">
        Made By XDH Team @2022
      </div>
    </footer>

  </div>
</template>

<script>
import * as p5 from 'p5'
import * as THREE from 'three'
import GLOBE from 'vanta/src/vanta.globe.js'
import Card from '../components/Card'
import moment from "moment";

export default {
  components: {
    Card
  },
  data() {
    return {
      time:null,
      uid: localStorage.getItem('userInfo'),
      resourceList: [],
      blogList: [],
      resourceIds: []
    }
  },
  created() {
    this.getHomeResource()
    this.getHotBlogList()
  },
  mounted() {
    this.vantaEffect = GLOBE({
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
      color: 0x3fc6ff,
      color2: 0xcfc,
      size: 2.00,
      backgroundColor: 0xfafafa
    })
  },
  methods: {
    debounce(fn) {
      let t = null
      return function () {
        if (t) {
          clearTimeout(t)
        }
        t = setTimeout(() => {
          fn.apply(this, arguments)
        }, 1000)
      }
    },
    moment(time) {
      return moment(time).format('YYYY年M月D日 h时m分s秒')
    },
    toBlogDetail(id) {
      this.$router.push({
        path: '/blog/' + id
      })
    },
    getHotBlogList() {
      this.$http.get('/blog/hotList').then((response) => {
        this.blogList = response.data.data
      })
    },
    moreToResource() {
      this.$router.push({
        path: '/resource'
      })
    },
    moreToBlog() {
      this.$router.push({
        path: '/blog'
      })
    },
    getHomeResource() {
      this.$http.get('/resource/homeResource').then((response) => {
        if (response.data.code === 20000) {
          this.resourceList = response.data.data
        } else {
          this.$message({
            message: '服务器异常',
            type: 'error'
          })
        }
      })
    },
    toResourceDetail(id) {
      this.$router.push({
        path: '/resource/' + id
      })
      this.$toTop()
    },
    addResourceStar(rid) {
      if (this.time !== null) {
        clearTimeout(this.time);
      }
      this.time = setTimeout(() => {
        this.$http({
          url: '/user/verifyToken',
          method: 'get',
          headers: {
            token: localStorage.getItem('token')
          },
        }).then((response) => {
          if (response.data.code === 20000) {
            this.$http.get('/userStar/collectList', {
              params: {
                uid: localStorage.getItem('userInfo')
              }
            }).then((response) => {
              this.resourceIds = response.data.data
              const flag = this.resourceIds.find(e => e === rid)
              if (flag) {
                this.$message.info({
                  message: '该资源已经收藏啦'
                })
              } else {
                this.$http.get('/resource/addStar', {
                  params: {
                    uid: localStorage.getItem('userInfo'),
                    rid: rid
                  }
                }).then((response) => {
                  if (response.data.code === 20000) {
                    this.$message({
                      message: '收藏成功',
                      type: 'info'
                    })
                    this.getHomeResource()
                  } else {
                    this.$message({
                      message: '服务器异常',
                      type: 'error'
                    })
                  }
                })
              }
            })
          } else {
            this.$message.info('请登录后操作')
            this.$router.push({path: '/login/0'})
          }

        })
      }, 500)
    }
  }
}
</script>

<style>
body {
  margin: 0 !important;
}

.title {
  font-size: 80px;
  font-style: italic;
  font-weight: bold;
  text-decoration: underline;
  color: #0170fe;
  cursor: none;
}

.header-div {
  display: flex;
  justify-content: center;
  flex-direction: column;
  align-items: center;
  height: 400px;
}

.box-card {
  width: 100%;
}

.time {
  font-size: 13px;
  color: #999;
}

.bottom {
  margin-top: 13px;
  line-height: 12px;
}

.button {
  padding: 0;
  float: right;
}

.image {
  width: 100%;
  display: block;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}

.clearfix:after {
  clear: both;
}

h4 {
  display: inline-block;
}

.more {
  color: gray;
  margin: 22px auto;
  float: right;
  text-decoration: none;
  cursor: pointer;
}

/* 热门内容 */
.top-content .el-card {
  border: none;
}

.content-time {
  text-align: right;
}

.top-content .bottom {
  display: flex;
}

.top-content span {
  display: block;
  margin-bottom: 5px;
}

.content-time time {
  display: block;
  margin-bottom: 6px;
}

.top-content .el-card__body {
  padding: 5px !important;
}

.content-time img {
  display: inline-block;
  height: 121px;
}

/*热门博客*/
.blog-item-bottom {
  display: flex;
  justify-content: space-between;
  align-items: end;
}

.comment-collection {
  color: #777888;
  display: flex;
  align-items: center;
  font-size: 14px;
}

.item-summary {
  color: gray;
  font-size: 15px;
}

/* 底部 */
.rc-footer {
  margin-top: 100px;
  width: 100%;
  position: relative;
  clear: both;
  color: #fff6;
  font-size: 14px;
  line-height: 1.5;
  background-color: #172026;
}

.footer-column {
  text-align: center;
}

.rc-footer h2 {
  font-weight: 500;
  font-size: 16px;
  color: #fff;
}

.rc-footer .item {
  margin: 24px 0;
}


.rc-footer .item a {
  transition: all 0.3s;
  color: #ffffffe6;
  text-decoration: none;
}

.article-title {
  margin: 0 auto;
}

.author {
  font-size: 14px;
  color: #222226;
}


#main-button {
  font-size: 16px;
  padding: 1em 3.3em;
  transform: perspective(200px) rotateX(15deg);
  color: white;
  font-weight: 900;
  border: none;
  border-radius: 5px;
  background: linear-gradient(0deg, rgba(63, 94, 251, 1) 0%, rgba(70, 135, 252, 1) 100%);
  box-shadow: rgba(63, 94, 251, 0.2) 0px 40px 29px 0px;
  will-change: transform;
  transition: all 0.3s;
  border-bottom: 2px solid rgba(70, 135, 252, 1);
  cursor: pointer;
}

#main-button:hover {
  transform: perspective(180px) rotateX(30deg) translateY(2px);
}

#main-button:active {
  transform: perspective(170px) rotateX(36deg) translateY(5px);
}

@media (max-width: 600px) {
  .header-div {
    height: 20vh;
  }
}
</style>
