<template>
  <el-container class="home-container">
    <el-tabs :tab-position="tabPosition" style="height: 100vh;width: 100%">
      <el-tab-pane label="用户信息">
        <div class="demo-image">
          <div>
            <el-tooltip class="item" effect="light" content="修改头像" placement="right" style="margin-top: 10px">
              <el-image style="width: 100px; height: 100px;cursor: pointer"
                        :src="userInfo.avatar?userInfo.avatar:''"
                        @click="showUpload"
              >
              </el-image>
            </el-tooltip>
          </div>

          <el-upload
              v-if="isShowUpload"
              class="avatar-uploader"
              action="http://xxx.xxx.xxx.xxx:xxx/cos/fileUpload?type=avatar"
              :show-file-list="false"
              :on-success="handleAvatarSuccess"
              :before-upload="beforeAvatarUpload">
            <img v-if="imageUrl" :src="imageUrl" class="avatar" alt="avatar" @click="">
            <i v-else class="el-icon-plus avatar-uploader-icon"></i>
          </el-upload>
          <el-button type="danger" @click="logout(userId)">注销账号</el-button>
        </div>

        <el-divider></el-divider>
        <div class="ul-xinxi">
          <el-descriptions class="margin-top" title="个人信息" :column="3" border>
            <template slot="extra">
              <el-button type="primary" @click="showUpdateModal">编辑</el-button>
            </template>
            <el-descriptions-item>
              <template slot="label">
                <i class="el-icon-user"></i>
                昵称
              </template>
              {{ userInfo.name }}
            </el-descriptions-item>
            <el-descriptions-item>
              <template slot="label">
                <i class="el-icon-user"></i>
                用户名
              </template>
              {{ userInfo.username }}
            </el-descriptions-item>
            <el-descriptions-item>
              <template slot="label">
                <i class="el-icon-mobile-phone"></i>
                手机号
              </template>
              {{ userInfo.phone }}
            </el-descriptions-item>
            <el-descriptions-item>
              <template slot="label">
                <i class="el-icon-location-outline"></i>
                邮箱
              </template>
              {{ userInfo.email }}
            </el-descriptions-item>
            <el-descriptions-item>
              <template slot="label">
                <i class="el-icon-tickets"></i>
                注册时间
              </template>
              <el-tag size="small">{{ userInfo.createTime }}</el-tag>
            </el-descriptions-item>
          </el-descriptions>
        </div>

        <el-dialog :visible="showModal" :before-close="closeModal">
          <div>
            <span>昵称:</span>
            <el-input v-model="newUserInfo.name"></el-input>
          </div>
          <div>
            <span>用户名:</span>
            <el-input v-model="newUserInfo.username"></el-input>
          </div>
          <div>
            <span>手机号:</span>
            <el-input v-model="newUserInfo.phone"></el-input>
          </div>
          <div>
            <span>邮箱:</span>
            <el-input v-model="newUserInfo.email"></el-input>
          </div>
          <div>
            <span>密码:</span>
            <el-input v-model="newUserInfo.password" placeholder="请输入新密码,如果不修改密码此项不填"></el-input>
          </div>

          <span slot="footer" class="dialog-footer">
            <el-button @click="showModal = false">取 消</el-button>
            <el-button type="primary" @click="submit">确 定</el-button>
          </span>
        </el-dialog>
      </el-tab-pane>

      <el-tab-pane label="我的发布">
        <user-release :uid="userId"/>
      </el-tab-pane>
      <el-tab-pane label="我的收藏">
        <user-star :uid="userId"></user-star>
      </el-tab-pane>
      <el-tab-pane label="我的博客" v-if="userId!==1">
        <UserBlog :uid="userId"></UserBlog>
      </el-tab-pane>
      <el-tab-pane label="全部博客" v-else>
        <UserBlog :uid="userId"></UserBlog>
      </el-tab-pane>
      <el-tab-pane label="我的评论" v-if="userId!==1">
        <UserComment :uid="userId"></UserComment>
      </el-tab-pane>
      <el-tab-pane label="全部评论" v-else>
        <UserComment :uid="userId"></UserComment>
      </el-tab-pane>
      <el-tab-pane label="待处理事项" v-if="userId===1">
        <UserCommit :uid="userId"></UserCommit>
      </el-tab-pane>
    </el-tabs>
  </el-container>

</template>

<script>
import UserRelease from "@/views/user/UserRelease";
import UserStar from "@/views/user/UserStar";
import UserBlog from "@/views/user/UserBlog";
import UserComment from "@/views/user/UserComment";
import UserCommit from "@/views/user/UserCommit";
export default {
  components:{
    UserRelease,
    UserStar,
    UserBlog,
    UserComment,
    UserCommit
  },
  props: {
    id: {
      type: [Number, String],
      required: true
    }
  },
  data() {
    return {
      userId:parseInt(localStorage.getItem('userInfo')),
      isShowUpload:false,
      imageUrl: '',
      tabPosition: 'left',
      userInfo: {
        name: '',
        avatar: '',
        username: '',
        email: '',
        phone: '',
      },
      newUserInfo: {
        name: '',
        username: '',
        email: '',
        phone: '',
        password:''
      },
      fits: ['fill'],
      showModal: false,
    }
  },
  created() {
    this.getUserInfo()
  },
  methods: {
    showUpload(){
      this.isShowUpload=!this.isShowUpload
    },
    handleAvatarSuccess(res, file) {
      this.imageUrl = URL.createObjectURL(file.raw);
      const param = {
        id:this.userId,
        avatar:res.data
      }
      this.$http.post('/user',param).then(res => {
        if(res.data.code===20000){
          this.$message.info({
            message: res.data.data
          })
        }else {
          this.$message.info({
            message: res.data.msg
          })
        }
      }).finally(()=>{
        this.showUpload()
        this.getUserInfo()
        this.imageUrl=''
      })
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === 'image/jpeg';
      const isLt2M = file.size / 1024 / 1024 < 2;
      if (!isJPG) {
        this.$message.error('上传头像图片只能是 JPG 格式!');
      }
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 2MB!');
      }
      return isJPG && isLt2M;
    },
    showUpdateModal() {
      this.showModal = !this.showModal
      this.newUserInfo.id = this.userId
      this.newUserInfo.name = this.userInfo.name
      this.newUserInfo.username = this.userInfo.username
      this.newUserInfo.email = this.userInfo.email
      this.newUserInfo.phone = this.userInfo.phone
    },
    /**
     * 关闭弹窗
     */
    closeModal() {
      this.showModal = false
    },
    /**
     * 提交到后台
     */
    submit() {
      if (this.newUserInfo.password==='') {
        delete this.newUserInfo.password;
      }
      this.userInfo = JSON.parse(JSON.stringify(this.newUserInfo))
      this.$http.post('/user', this.newUserInfo).then(res => {
        if(res.data.code===20000){
          this.$message.info({
            message: res.data.data
          })
          this.getUserInfo()
          this.closeModal()
        }else {
          this.$message.info({
            message: res.data.msg
          })
        }
      })
    },
    getUserInfo() {
        this.$http.get('/user', {
          params: {
            id: this.userId
          },
        }).then((response) => {
          if (response.data.code === 20000) {
            this.userInfo = response.data.data
          } else {
            this.$message({
              message: response.data.msg,
              type: 'error'
            })
            // this.$router.push({
            //   path:'/login/0'
            // })
          }
        })
    },
    logout(id) {
      this.$confirm("确定退出登录吗?", "提示", {
        cancelButtonText: "取消",
        confirmButtonText: "确定",
        type: "warning",
      }).then(() => {
        this.$http.get('/user/logout/' + id).then((response) => {
          if (response.data.code === 20000) {
            //清空个人信息
            localStorage.removeItem("userInfo")
            localStorage.removeItem('token')
            this.$store.commit('changeShowUserCenter')
            // 跳转到首页
            this.$router.push({
              path: '/'
            })
            console.log('注销账号成功')
          } else {
            this.$message({
              message: '服务器异常',
              type: 'error'
            })
          }
        })
      });

    }
  },
}

</script>

<style lang="less" scoped>
.home-container {
  height: 100%;
}

.el-table__body td.el-table__cell {
  border-bottom: none !important;
}

.xinxi {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.ul-xinxi ul {
  list-style: none;
  padding-left: 0;
}

.ul-xinxi ul span {
  margin-right: 50%;
}

.ul-xinxi ul li:nth-child(3) {
  margin-right: 5%;
}

.ul-xinxi ul li:nth-child(4) {
  margin-right: 9%;
}


.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}
.avatar {
  width: 178px;
  height: 178px;
  display: block;
}
</style>
