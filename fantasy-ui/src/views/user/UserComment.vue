<template>
  <div style="height: 100vh;overflow:scroll">
    <div>
      <div v-for="(item, index) in comment" :key="item.id" style="margin-bottom: 25px">

        <div style="color: #0170fe;font-weight: bold;font-size: 14px">{{ item.user.name }}</div>
        <div class="comment-list">
          <div class="comment-detail" style="display: flex;align-items: center">
            <el-avatar icon="el-icon-user-solid" :src="item.user.avatar" style="margin-right: 10px"></el-avatar>
            <span class="comment-item"
                  style="margin-right:5px;font-size:11px;width: 100%;padding:10px;border-radius:15px;box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);">{{
                item.content
              }}</span>
            <el-button type="danger" size="mini" @click="deleteById(item.id)">删除</el-button>
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
  </div>
</template>

<script>
import moment from 'moment'

export default {
  props: {
    uid: {
      type: [String, Number],
      required: true
    }
  },
  components: {},
  data() {
    return {
      comment: [],

    }
  },
  created() {
    this.getCommentList()
  },
  methods: {
    deleteById(id) {
      this.$confirm("确定删除该评论?", "提示", {
        cancelButtonText: "取消",
        confirmButtonText: "确定",
        type: "warning",
      }).then(() => {
        this.$http.delete('/commentResource?id=' + id).then((response) => {
          if (response.data.code === 20000) {
            this.getCommentList()
            setTimeout(()=>{
              this.$message({
                message: response.data.data,
                type: 'info'
              })
            },1000)
          } else {
            this.$message({
              message: '服务器异常',
              type: 'error'
            })
          }
        })
      })
    },
    getCommentList() {
      this.$http.get('/commentResource/getAllComment').then((response) => {
        if (response.data.code === 20000) {
          if (this.uid !== 1) {
            this.comment = response.data.data.filter(e => e.uid === this.uid)
          } else {
            this.comment = response.data.data
          }

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

  },
}
</script>

<style scoped>

</style>
