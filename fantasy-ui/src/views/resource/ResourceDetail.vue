<template>
  <div class="container" style="display:flex;margin-top: 20px">
    <div style="display:flex;flex:7;"
         class="detail-left">
      <el-card>
        <el-button icon="el-icon-arrow-left" size="small" style="margin-top: 10px" @click="back"></el-button>
        <div class="grid-content bg-purple">
          <el-row>
            <el-col :sm="24" :md="14">
              <h3>资源详情</h3>
              <el-descriptions class="margin-top" :column="1" :colon="true" size="medium"
                               :labelStyle="{color:'#0170fe',fontWeight:'bold'}">
                <el-descriptions-item label="网页地址">
                  <a :href="resource.url" target="_blank">{{ resource.url }}</a>
                </el-descriptions-item>
                <el-descriptions-item label="资源详情">{{ resource.content }}
                </el-descriptions-item>
                <el-descriptions-item label="发布时间">{{ moment(resource.createTime) }}</el-descriptions-item>
                <el-descriptions-item label="分 享 人">
                  <el-image
                      style="width: 50px; height: 50px;margin-right: 5px"
                      :src="resource.user.avatar"
                      fit="fill">
                  </el-image>
                  <div>{{ resource.user.name }}</div>
                </el-descriptions-item>
              </el-descriptions>
            </el-col>
            <el-col :sm="24" :md="10">
              <div style="display: flex;justify-content: center;flex-wrap: wrap">
                <card :key="resource.id"
                      style="margin: 20px"
                      :content="resource.content"
                      :create-time="resource.createTime"
                      :description="resource.description"
                      :image="resource.image"
                      :name="resource.name"
                      :star="resource.star"
                      :url="resource.url"
                      :tag="resource.tagArr">
                  <template #star>
                    <i class="el-icon-star-off"
                       style="font-size: 20px;cursor: pointer"
                       ref="star" @click="addResourceStar(resource.id)">{{ resource.star }}</i>
                  </template>
                </card>
              </div>
            </el-col>
          </el-row>
        </div>
        <el-divider></el-divider>
        <h3>发表评论</h3>
        <div style="display:flex">
          <!-- 头像 -->
          <el-avatar icon="el-icon-user-solid" :src="userAvatar" v-if="isShowAvatar"
                     style="margin-right: 15px"></el-avatar>
          <!-- 评论 -->
          <!--          <textarea rows="5" style="width:100%;margin-left: 15px">这是我的第一条评论</textarea>-->
          <el-input
              type="textarea"
              :autosize="{ minRows: 5, maxRows: 10}"
              placeholder="善语结善缘，恶习伤人心~"
              v-model="commentText"
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
    <div class="hidden-sm-and-down" style="display:flex;flex:3;justify-content: center">
      <div class="grid-content bg-purple">
        <h3 style="margin-left: 18%;">更多资源<i class="el-icon-refresh" style="cursor: pointer;color: #0170fe"
                                             @click="refreshMore"></i></h3>
        <div style="display: flex;justify-content: center;flex-wrap: wrap">
          <card v-for="e in moreResource"
                :key="e.id"
                style="margin: 20px"
                :content="e.content"
                :create-time="e.createTime"
                :description="e.description"
                :image="e.image"
                :name="e.name"
                :star="e.star"
                :url="e.url"
                :tag="e.tagArr">
            <template #goto>
              <el-tag style="margin-right: 5px;background-color: #0170fe;color: white;cursor: pointer"
                      @click="toResourceDetail(e.id)">访问
              </el-tag>
            </template>
            <template #star>
              <i class="el-icon-star-off"
                 style="font-size: 20px;cursor: pointer"
                 ref="star"  @click="addResourceStar(e.id)">{{ e.star }}</i>
            </template>
          </card>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Card from '@/components/Card'
import moment from 'moment'

export default {
  name: "ResourceDetail",
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
  components: {
    Card
  },
  data() {
    return {
      time:null,
      rid:this.id,
      commentText: '',
      userAvatar: '',
      resource: {
        id:'',
        content: '',
        createTime: '',
        description: '',
        url: '',
        image: '',
        name: '',
        star: 0,
        tagArr: [],
        resourceIds: [],
        user: {
          avatar: '',
          name: ''
        }
      },
      moreResource: [],
      comment: []
    }
  },
  created() {
    this.getDetailData()
    this.getUserAvatar()
    this.refreshMore()
    this.getCommentList(this.id)
  },

  methods: {
    addResourceStar(rid) {
      if (this.time !== null) {
        clearTimeout(this.time);
      }
      this.time = setTimeout(() => {
        this.$http.get('/userStar/collectList', {
          params: {
            uid: localStorage.getItem('userInfo')
          }
        }).then((response) => {
          console.log(response)
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
                this.getDetailData()
                this.refreshMore()
                this.$message({
                  message: '收藏成功',
                  type: 'info'
                })
              } else {
                this.$message({
                  message: '服务器异常',
                  type: 'error'
                })
              }
            })
          }
        })
      },500)
    },
    back(){
      this.$router.back()
    },
    backTop() {
      this.$toTop()
    },
    getCommentList(){
      this.$http.get('/commentResource/getListByRid?rid='+this.rid).then((response) => {
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
    refreshMore() {
      this.$http.get('/resource/getMoreResource').then((response) => {
        if (response.data.code === 20000) {
          this.moreResource = response.data.data
        } else {
          this.$message({
            message: '服务器异常',
            type: 'error'
          })
        }
      })
    },
    moment(time) {
      return moment(time).format('YYYY年M月D日 h时m分s秒')
    },
    releaseComment() {
      if (this.commentText !== null && this.commentText.length !== 0) {
        this.$http.post('/commentResource/save',{
          rid:this.rid,
          uid:localStorage.getItem('userInfo'),
          content: this.commentText
        }).then((response) => {
          if (response.data.code === 20000) {
            this.$message.info({
              message:response.data.data
            })
            this.getCommentList()
            this.commentText=''
          } else {
            this.$message({
              message: '服务器异常',
              type: 'error'
            })
          }
        }).finally(() => {
          this.backTop()
          this.refreshMore()
        })
      } else {
        this.$message.info({
          message:'请输入评论内容'
        })
      }
    },
    toResourceDetail(id) {
      this.$router.push({
        path:'/resource/'+id
      })
      this.rid=id
      this.$http.get('/resource?id=' + id).then((response) => {
        if (response.data.code === 20000) {
          this.resource = response.data.data;
          this.getCommentList(id)
        } else {
          this.$message({
            message: '服务器异常',
            type: 'error'
          })
        }
      }).finally(() => {
        this.backTop()
        this.refreshMore()
      })
    },
    getDetailData() {
      this.$http.get('/resource?id=' + this.id).then((response) => {
        if (response.data.code === 20000) {
          this.resource = response.data.data;
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
    },
    getMoreResource() {
      setInterval(() => {
        this.$http.get('/resource/getMoreResource').then((response) => {
          if (response.data.code === 20000) {
            this.moreResource = response.data.data
          } else {
            this.$message({
              message: '服务器异常',
              type: 'error'
            })
          }
        })
      }, 30*60*1000)
    }
  }
}
</script>

<style lang="less" scoped>
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

.border-left {
  border-left: 1px solid gray;;
}

.container {
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
