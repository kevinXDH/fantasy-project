<template>
  <div class="container" style="margin-bottom: 25px">
    <el-card>
      <el-button icon="el-icon-arrow-left" size="small" style="margin-top: 10px" @click="back"></el-button>
      <div class="grid-content bg-purple" style="margin-bottom: 50px">
        <el-row>
          <div>
            <h3 class="blog-title">{{ blogDetail.name }}</h3>
            <div style="display: flex;align-items: center;justify-content: center;flex-wrap: wrap;">
              <div style="display: flex;align-items: center;justify-content: space-evenly;margin:auto 30px auto 30px">
                <span style="display: flex;align-items: center;justify-content: center;margin-right: 20px">发布人：<el-avatar style="height: 40px;width: 40px" :src="blogDetail.user.avatar"></el-avatar></span>
                <span style="color: #0170fe;font-weight: bold">{{ blogDetail.user.name }}</span>
              </div>
              <div style=";margin:auto 30px auto 30px">
                <span>发布时间：</span>
                <span>{{ moment(blogDetail.createTime) }}</span>
              </div>
              <div style="margin:auto 30px auto 30px">
                <i class="el-icon-star-off">{{ blogDetail.star }}</i>
              </div>
            </div>
            <p class="blog-content">
              {{ blogDetail.content }}
            </p>
          </div>
        </el-row>
      </div>
      <h3>发表评论</h3>
      <div style="display:flex">
        <!-- 头像 -->
        <el-avatar icon="el-icon-user-solid" :src="userAvatar" v-if="isShowAvatar" style="margin-right: 15px"></el-avatar>
        <!-- 评论 -->
        <el-input
            type="textarea"
            :autosize="{ minRows: 5, maxRows: 10}"
            placeholder="善语结善缘，恶习伤人心~"
            v-model="blogCommentText"
            maxlength="200"
            show-word-limit
        >
        </el-input>
      </div>
      <div class="submit">
        <el-button type="primary" @click="releaseComment" plain>发表</el-button>
      </div>
      <!-- 评论列表 -->
      <div>
        <h3>评论列表({{total}})</h3>
        <div v-for="(item, index) in comment" :key="item.id" style="margin-bottom: 10px">
          <div style="color: #0170fe;font-weight: bold;font-size: 14px">{{item.user.name}}</div>
          <div class="comment-list">
            <div class="comment-detail">
              <el-avatar icon="el-icon-user-solid" :src="item.user.avatar"></el-avatar>
              <span class="comment-item" style="font-size:11px;width: 100%;padding:10px;border-radius:15px;box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);">{{ item.content }}</span>
            </div>
            <div class="time-star">
              <span class="comment-date">{{ moment(item.createTime) }}</span>
              <div class="comment-collection">
                <i class="el-icon-star-off">{{ item.star }}</i>
              </div>
            </div>
          </div>
        </div>
      </div>
    </el-card>
  </div>
</template>

<script>
import moment from 'moment'

export default {
  name: "BlogDetail",
  computed: {
    isShowAvatar() {
      return localStorage.getItem("userInfo")
    },
    total(){
      return this.comment.length
    }
  },
  props: {
    id: {
      type: String,
      required: true
    }
  },
  data() {
    return {
      bid:this.id,
      blogCommentText:'',
      blogDetail: null,
      userAvatar: '',
      comment: [
      ]
    }
  },
  created() {
    this.getDetailData()
    this.getUserAvatar()
    this.getBlogCommentList()
  },
  methods: {
    back(){
      this.$router.back()
    },
    releaseComment() {
      if (this.blogCommentText !== null && this.blogCommentText.length !== 0) {
        this.$http.post('/commentBlog/save',{
          bid:this.bid,
          uid:localStorage.getItem('userInfo'),
          content: this.blogCommentText
        }).then((response) => {
          if (response.data.code === 20000) {
            this.$message.info({
              message:response.data.data
            })
            this.getBlogCommentList()
            this.blogCommentText=''
          } else {
            this.$message({
              message: '服务器异常',
              type: 'error'
            })
          }
        })
      } else {
        this.$message.info({
          message:'请输入评论内容'
        })
      }
    },
    moment(time) {
      return moment(time).format('YYYY年M月D日 h时m分s秒')
    },
    getBlogCommentList(){
      this.$http.get('/commentBlog/getListByBid?bid='+this.bid).then((response) => {
        if (response.data.code === 20000) {
          this.comment = response.data.data
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
        path: '/resourceDetail/' + id
      })
    },
    getDetailData() {
      this.$http.get('/blog?id=' + this.id).then((response) => {
        if (response.data.code === 20000) {
          this.blogDetail = response.data.data;
        } else {
          this.$message({
            message: '服务器异常',
            type: 'error'
          })
        }
      })
    },
    getUserAvatar() {
      this.$http.get('/user?id=' + localStorage.getItem('userInfo')).then((response) => {
        if (response.data.code === 20000) {
          this.userAvatar = response.data.data.avatar;
        } else {
          this.$message({
            message: '服务器异常',
            type: 'error'
          })
        }
      })
    }
  }
}
</script>

<style lang="less" scoped>

.blog-title {
  text-align: center;
}

.blog-author {
  text-align: center;
  color: gray;
}

.blog-content {
  text-indent: 2em;
  letter-spacing: 1px;
  font-size: 15px;
  line-height: 2;
}

.blog-author div {
  margin-right: 10px;
}

.el-avatar {
  min-width: 40px !important;
}

.comment-collection {
  font-size: 14px;
  color: #777888;
  display: inline-block;
  width: 50px;
  text-align: left;
}

.comment-date {
  font-size: 14px;
  color: #777888;
  margin-right: 20px;
}

.comment-item {
  margin-left: 20px;
}

.submit {
  margin-top: 10px;
  display: flex;
  justify-content: right;

  el-button {
    width: 10%;
    min-width: 70px;
  }
}


.container {
  margin-top: 20px;
  padding-right: 50px;
  padding-left: 50px;
  margin-right: auto;
  margin-left: auto;
}

.detail-left {
  flex-direction: column;
  margin-bottom: 20px;
}

.grid-content p {
  margin: 10px 0px;
  display: inline-block;
}

// 评论
textarea {
  box-shadow: 0 2px 12px 0 rgb(0 0 0 / 10%);
  border-radius: 4px;
  border: 1px solid #EBEEF5;
  background-color: #FFF;
  overflow: hidden;
  color: #303133;
  transition: .3s;
}

.comment-list {
  margin: 10px 0px;
}

.comment-detail {
  display: flex;
  // justify-content: center;
  align-items: center;
}

.time-star {
  text-align: right;
}

/deep/ .el-descriptions-item__container .el-descriptions-item__content {
  align-items: center;
}

/deep/ .el-descriptions-item__label:not(.is-bordered-label) {
  margin-right: 10px;
  align-items: center;
}
</style>
