<template>
  <div>
    <el-table :data="blogList" height="100vh">
      <el-table-column type="index" width="50">
      </el-table-column>
      <el-table-column prop="createTime" label="日期" sortable width="250">
        <template slot-scope="scope">
          {{moment(scope.row.createTime)}}
        </template>
      </el-table-column>
      <el-table-column prop="user.name" label="发布人" width="120">
      </el-table-column>
      <el-table-column prop="name" label="名称" width="250">
      </el-table-column>
      <el-table-column prop="content" label="内容" width="120">
        <template slot-scope="scope">
          <el-popover placement="right" width="200" trigger="hover" :content="scope.row.content">
            <el-tag slot="reference">查看内容</el-tag>
          </el-popover>
        </template>
      </el-table-column>
      <el-table-column prop="coverImg" label="图片" width="140">
        <template slot-scope="scope">
          <el-image style="width: 100px; height: 100px;" :src="scope.row.coverImg?scope.row.coverImg:''">
          </el-image>
        </template>
      </el-table-column>
      <el-table-column prop="star" label="收藏数" sortable width="120">
        0
      </el-table-column>
      <el-table-column width="200" align="right">
        <template slot-scope="scope">
          <el-button size="mini" @click="handleEdit(scope.$index, scope.row)"><i class="el-icon-check"/></el-button>
          <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)"><i class="el-icon-close"/></el-button>
        </template>
      </el-table-column>
    </el-table>

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
  data() {
    return {
      userId: this.uid,
      formLabelWidth: '120px',
      blogList: [],
    }
  },
  created() {
    this.getBlogList()
  },
  methods: {
    getBlogList() {
      this.$http
        .get('/blog/getRedis')
        .then(response => {
          if(response.data.code === 20000){
            this.blogList = response.data.data
            console.log(this.blogList)
          }else {
            this.$message.error({
              message:'服务器故障'
            })
          }

        })
    },
    moment(time) {
      return moment(time).format('YYYY年M月D日 h时m分s秒')
    },
    handleEdit(index, row) {
      this.$http
          .post('/blog/save',row)
          .then(response => {
            if(response.data.code === 20000){
              this.$message.info({
                message:response.data.data
              })
              this.getBlogList()
            }else {
              this.$message.error({
                message:'服务器故障'
              })
            }
          })
    },
    handleDelete(index, row) {
      this.$confirm('确定执行该操作吗', '提示', {
        cancelButtonText: '取消',
        confirmButtonText: '确定',
        type: 'warning'
      }).then(() => {
        this.$http.post(`/blog/deleteRedis`,row).then(response => {
          if (response.data.code === 20000) {
            this.getBlogList()
            this.$message({
              message: response.data.data,
              type: 'info'
            })
          } else {
            this.$message({
              message: '服务器异常',
              type: 'error'
            })
          }
        })
      })
    }
  }
}
</script>

<style scoped>

</style>
