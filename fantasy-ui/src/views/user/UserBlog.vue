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
      </el-table-column>
      <el-table-column width="200" align="right">
        <template slot="header" slot-scope="scope">
          <el-button @click="dialogFormVisible = true" style="background-color: #0170fe;color: white;font-size: 15px;margin-right: 10px">发布博客</el-button>
        </template>
        <template slot-scope="scope">
          <el-button size="mini" @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
          <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <el-dialog title="分享博客" :visible.sync="dialogFormVisible">
      <el-form label-position="left" label-width="70px" :model="shareForm" ref="shareForm">
        <el-form-item label="名称" prop="name">
          <el-input v-model="shareForm.name"></el-input>
        </el-form-item>
        <el-form-item label="内容" prop="content">
          <el-input
              type="textarea"
              :autosize="{ minRows: 4, maxRows: 10}"
              placeholder="请输入内容"
              maxlength="1000"
              v-model="shareForm.content">
          </el-input>
        </el-form-item>
        <el-form-item label="图片" prop="coverImg">
          <el-input v-model="shareForm.coverImg" placeholder="输入图片地址即可"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="submit">确 定</el-button>
      </div>
    </el-dialog>

    <el-dialog title="编辑资源" :visible.sync="dialogUpdateFormVisible">
      <el-form label-position="left" label-width="70px" :model="updateForm" ref="updateForm">
        <el-form-item label="名称" prop="name">
          <el-input v-model="updateForm.name"></el-input>
        </el-form-item>
        <el-form-item label="内容" prop="content">
          <el-input
              type="textarea"
              :autosize="{ minRows: 4, maxRows: 10}"
              placeholder="请输入内容"
              maxlength="1000"
              v-model="updateForm.content">
          </el-input>
        </el-form-item>
        <el-form-item label="图片" prop="coverImg">
          <el-input v-model="updateForm.coverImg" placeholder="输入图片地址即可"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogUpdateFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitUpdate">确 定</el-button>
      </div>
    </el-dialog>
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
      updateForm: {
        cid:0,
        content: '',
        coverImg: '',
        img: '',
        name: ''
      },
      shareForm: {
        cid:0,
        content: '',
        coverImg: '',
        img: '',
        name: ''
      },
      dialogUpdateFormVisible: false,
      dialogFormVisible: false,
    }
  },
  created() {
    this.getBlogList()
  },
  methods: {
    getBlogList() {
      this.$http
        .get('/blog/list', {
          params: {
            page: 1,
            pageSize: 9999
          }
        })
        .then(response => {
          if (this.uid!==1){
            this.blogList = response.data.data.filter(e=>e.uid===this.uid)
          }else {
            this.blogList = response.data.data
          }
        })
    },
    moment(time) {
      return moment(time).format('YYYY年M月D日 h时m分s秒')
    },
    handleEdit(index, row) {
      this.updateForm = row
      this.dialogUpdateFormVisible = true
    },
    handleDelete(index, row) {
      this.$confirm('确定删除该条数据?', '提示', {
        cancelButtonText: '取消',
        confirmButtonText: '确定',
        type: 'warning'
      }).then(() => {
        this.$http.delete(`/blog?id=${row.id}`).then(response => {
          if (response.data.code === 20000) {
            this.getBlogList()
          } else {
            this.$message({
              message: '服务器异常',
              type: 'error'
            })
          }
        })
      })
    },
    submitUpdate() {
      this.updateForm.uid = this.uid
      this.$http.put('/blog/', this.updateForm).then(response => {
        if (response.data.code === 20000) {
          this.$message({
            message: response.data.data,
            type: 'info'
          })
          this.getBlogList()
        } else {
          this.$message({
            message: '服务器异常',
            type: 'error'
          })
        }
      })
      this.dialogUpdateFormVisible = false
    },
    submit() {
      this.shareForm.uid = this.uid
      this.$http.post('/blog', this.shareForm).then(response => {
        if (response.data.code === 20000) {
          this.$message({
            message: response.data.data,
            type: 'info'
          })
          this.getBlogList()
        } else {
          this.$message({
            message: '服务器异常',
            type: 'error'
          })
        }
      })
      this.dialogFormVisible = false
    }
  }
}
</script>

<style scoped>

</style>
