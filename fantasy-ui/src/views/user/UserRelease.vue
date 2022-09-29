<template>
  <div>
        <div class="block" style="display: flex;justify-content: center;margin-top: 20px">
          <el-pagination
                         @current-change="handleCurrentChange"
                         :current-page="currentPage"
                         :page-sizes="[5, 10, 20, 30]"
                         :page-size="pageSize"
                         layout="total, prev, pager, next, jumper"
                         :total="total">
          </el-pagination>
        </div>
    <el-divider/>
    <el-button @click="dialogFormVisible = true" style="background-color: #0170fe;color: white;font-size: 15px;margin-right: 10px">分享资源</el-button>

    <el-dialog title="分享资源" :visible.sync="dialogFormVisible">
      <el-form label-position="left" label-width="70px" :model="shareForm" ref="shareForm">
        <el-form-item label="名称" prop="name">
          <el-input v-model="shareForm.name"></el-input>
        </el-form-item>
        <el-form-item label="分类" prop="cid">
          <el-select v-model="shareForm.cid" placeholder="请选择分类">
            <el-option :label="item.name" :value="item.id" v-for="item in categoryList" :key="item.id"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="简介" prop="description">
          <el-input v-model="shareForm.description"></el-input>
        </el-form-item>
        <el-form-item label="内容" prop="content">
          <el-input v-model="shareForm.content"></el-input>
        </el-form-item>
        <el-form-item label="标签" prop="tagArr">
          <el-tag
              :key="index"
              v-for="(tag,index) in shareForm.tagArr"
              closable
              :disable-transitions="false"
              @close="handleClose(tag)">
            {{tag}}
          </el-tag>
          <el-input
              class="input-new-tag"
              v-if="inputVisible"
              v-model="inputValue"
              ref="saveTagInput"
              size="small"
              @keydown.enter.native="handleInputConfirm"
              @blur="handleInputConfirm"
          >
          </el-input>
          <el-button v-else class="button-new-tag" size="small" @click="showInput">添加标签+</el-button>
        </el-form-item>
        <el-form-item label="图片" prop="image">
          <el-upload
              class="avatar-uploader"
              action="http://xxx.xxx.xxx.xxx:xxx/cos/fileUpload?type=image"
              :show-file-list="false"
              :on-success="handleAvatarSuccess"
              :before-upload="beforeAvatarUpload">
            <img v-if="imageUrl" :src="imageUrl" class="avatar" alt="avatar" @click="">
            <i v-else class="el-icon-plus avatar-uploader-icon"></i>
          </el-upload>
        </el-form-item>
        <el-form-item label="链接" prop="url">
          <el-input v-model="shareForm.url" ></el-input>
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
        <el-form-item label="分类" prop="cid">
          <el-select v-model="updateForm.cid">
            <el-option :label="item.name" :value="item.id" v-for="item in categoryList" :key="item.id"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="简介" prop="description">
          <el-input v-model="updateForm.description"></el-input>
        </el-form-item>
        <el-form-item label="内容" prop="content">
          <el-input v-model="updateForm.content"></el-input>
        </el-form-item>
        <el-form-item label="标签" prop="tagArr">
          <el-tag
              :key="index"
              v-for="(tag,index) in updateForm.tagArr"
              closable
              :disable-transitions="false"
              @close="handleUpdateClose(tag)">
            {{tag}}
          </el-tag>
          <el-input
              class="input-new-tag"
              v-if="inputUpdateVisible"
              v-model="inputUpdateValue"
              ref="saveUpdateTagInput"
              size="small"
              @keydown.enter.native="handleUpdateInputConfirm"
              @blur="handleUpdateInputConfirm"
          >
          </el-input>
          <el-button v-else class="button-new-tag" size="small" @click="showUpdateInput">添加标签+</el-button>
        </el-form-item>
        <el-form-item label="图片" prop="image">
          <el-upload
              class="avatar-uploader"
              action="http://xxx.xxx.xxx.xxx:xxx/cos/fileUpload?type=image"
              :show-file-list="false"
              :on-success="handleUpdateAvatarSuccess"
              :before-upload="beforeAvatarUpload">
            <img v-if="updateForm.image" :src="updateForm.image" class="avatar" alt="avatar" @click="">
            <i v-else class="el-icon-plus avatar-uploader-icon"></i>
          </el-upload>
        </el-form-item>
        <el-form-item label="链接" prop="url">
          <el-input v-model="updateForm.url" ></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogUpdateFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitUpdate">确 定</el-button>
      </div>
    </el-dialog>

    <el-button v-if="uid===1" @click="getUserResource(params)">仅展示我的发布(默认)</el-button>
    <el-button v-if="uid===1" @click="getOtherUserResource(params)">仅展示其他用户发布</el-button>

    <el-table
        :data="tableData"
        height="70vh"
    >
      <el-table-column
          type="index"
          width="50">
      </el-table-column>
      <el-table-column
          prop="createTime"
          label="日期"
          sortable
          width="150">
        <template slot-scope="scope">
          {{moment(scope.row.createTime)}}
        </template>
      </el-table-column>
      <el-table-column
          prop="name"
          label="名称"
          width="120">
      </el-table-column>
      <el-table-column
          prop="description"
          label="简介"
          width="120">
        <template slot-scope="scope">
          <el-popover
              placement="right"
              width="200"
              trigger="hover"
              :content="scope.row.description">
            <el-tag slot="reference">查看简介</el-tag>
          </el-popover>
        </template>
      </el-table-column>
      <el-table-column
          prop="content"
          label="内容"
          width="120">
        <template slot-scope="scope">
          <el-popover
              placement="right"
              width="200"
              trigger="hover"
              :content="scope.row.content">
            <el-tag slot="reference">查看内容</el-tag>
          </el-popover>
        </template>
      </el-table-column>
      <el-table-column
          prop="tagArr"
          label="标签"
          width="250">
        <template slot-scope="scope">
          <el-tag type="info" v-for="item in scope.row.tagArr">{{item}}</el-tag>
        </template>
      </el-table-column>
      <el-table-column
          prop="image"
          label="图片"
          width="120">
        <template slot-scope="scope">
          <el-image style="width: 100px; height: 100px;"
                    :src="scope.row.image?scope.row.image:''"
          >
          </el-image>
        </template>

      </el-table-column>
      <el-table-column
          prop="url"
          label="链接"
          width="120">
        <template slot-scope="scope">
          <el-popover
              placement="top"
              width="200"
              trigger="hover"
              :content="scope.row.url">
            <el-tag slot="reference">查看链接</el-tag>
          </el-popover>
        </template>
      </el-table-column>
      <el-table-column
          prop="star"
          label="收藏数"
          sortable
          width="120">
      </el-table-column>
      <el-table-column
          width="200"
          align="right">
        <template slot="header" slot-scope="scope">
          <el-input placeholder="" v-model="text">
            <el-button slot="append" icon="el-icon-search" @click="search"></el-button>
          </el-input>
        </template>
        <template slot-scope="scope">
          <el-button
              size="mini"
              @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
          <el-button
              size="mini"
              type="danger"
              @click="handleDelete(scope.$index, scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import moment from 'moment'

export default {
  props:{
    uid:{
      type:[String,Number],
      required:true
    }
  },
  data() {
    return {
      imageUrl: '',
      updateImageUrl: '',
      inputVisible: false,
      inputUpdateVisible: false,
      inputValue: '',
      inputUpdateValue: '',
      currentPage: 1,
      pageSize:5,
      total: 0,
      text:'',
      tableData: [],
      params: {
        page: 1,
        pageSize: 5,
        text: '',
        uid: this.uid
      },
      dialogFormVisible: false,
      dialogUpdateFormVisible: false,
      formLabelWidth: '120px',
      shareForm: {
        name: '',
        cid:null,
        description:'',
        content:'',
        tagArr:[],
        image:'',
        url:''
      },
      updateForm: {
        id:null,
        name: '',
        cid:null,
        description:'',
        content:'',
        tagArr:[],
        image:'',
        url:''
      },
      categoryList:[],
      allFlag:true,
      otherFlag:false,
    }
  },
  created() {
    this.getUserResource(this.params);
    this.getCategoryList()
  },
  methods:{
    getCategoryList(){
      this.$http.get('/category/list').then((response) => {
        if (response.data.code === 20000) {
          this.categoryList = response.data.data
        } else {
          this.$message({
            message: '服务器异常',
            type: 'error'
          })
        }
      })
    },
    reset(){
      this.params={
        page: 1,
        pageSize: 5,
        uid: this.uid
      }
    },
    handleAvatarSuccess(res, file) {
      this.imageUrl = URL.createObjectURL(file.raw);
      this.shareForm.image=res.data
    },
    handleUpdateAvatarSuccess(res, file) {
      this.updateImageUrl = URL.createObjectURL(file.raw);
      this.updateForm.image=res.data
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
    handleClose(tag) {
      this.shareForm.tagArr.splice(this.shareForm.tagArr.indexOf(tag), 1);
    },
    handleUpdateClose(tag) {
      this.updateForm.tagArr.splice(this.updateForm.tagArr.indexOf(tag), 1);
    },
    showInput() {
      this.inputVisible = true;
      this.$nextTick(_ => {
        this.$refs.saveTagInput.$refs.input.focus();
      });
    },
    showUpdateInput() {
      this.inputUpdateVisible = true;
      this.$nextTick(_ => {
        this.$refs.saveUpdateTagInput.$refs.input.focus();
      });
    },
    handleInputConfirm() {
      let inputValue = this.inputValue;
      if (inputValue) {
        if (this.shareForm.tagArr.length<3){
          this.shareForm.tagArr.push(inputValue);
        }else {
          this.$message({
            message:'标签数不能超过三个'
          })
        }
      }
      this.inputVisible = false;
      this.inputValue = '';
    },
    handleUpdateInputConfirm() {
      let inputValue = this.inputUpdateValue;
      if (inputValue) {
        if (this.updateForm.tagArr.length<3){
          this.updateForm.tagArr.push(inputValue);
        }else {
          this.$message({
            message:'标签数不能超过三个'
          })
        }
      }
      this.inputUpdateVisible = false;
      this.inputUpdateValue = '';
    },
    submit(){
      this.shareForm.uid=this.uid
      this.$http.post('/resource/save',this.shareForm).then((response) => {
        if (response.data.code === 20000) {
          this.$message({
            message: response.data.data,
            type: 'info'
          })
          this.getUserResource(this.params)
        } else {
          this.$message({
            message: '服务器异常',
            type: 'error'
          })
        }
      })
      this.imageUrl=''
      this.dialogFormVisible = false
    },
    submitUpdate(){
      this.updateForm.uid=this.uid
      this.$http.post('/resource/update',this.updateForm).then((response) => {
        if (response.data.code === 20000) {
          this.$message({
            message: response.data.data,
            type: 'info'
          })
          this.getUserResource(this.params)
        } else {
          this.$message({
            message: '服务器异常',
            type: 'error'
          })
        }
      })
      this.dialogUpdateFormVisible = false
    },
    handleCurrentChange(page) {
      if (this.otherFlag){
        this.params.page = page
        this.getOtherUserResource(this.params)
        this.reset()
        return
      }
      this.params.page = page
      this.getUserResource(this.params)
      this.reset()
    },
    moment(time){
      return moment(time).format('YYYY年M月D日 h时m分s秒')
    },
    handleEdit(index, row) {
      this.updateForm=row
      this.dialogUpdateFormVisible=true
    },
    handleDelete(index, row) {
      this.$confirm("确定删除该条数据?", "提示", {
        cancelButtonText: "取消",
        confirmButtonText: "确定",
        type: "warning",
      }).then(() => {
        this.$http.delete(`/resource?id=${row.id}`).then((response) => {
          if (response.data.code === 20000) {
            this.getUserResource(this.params);
          } else {
            this.$message({
              message: '服务器异常',
              type: 'error'
            })
          }
        })
      })
    },
    search() {
      this.params.text = this.text
      this.getUserResource(this.params)
      this.text=''
    },
    getOtherUserResource(params){
      this.allFlag=false
      this.otherFlag=true
      this.$http.get('/resource/getOtherUserResourcePage', {
        params: params
      }).then((response) => {
        if (response.data.code === 20000) {
          this.tableData = response.data.data.records
          this.total = response.data.data.total
        } else {
          this.$message({
            message: '服务器异常',
            type: 'error'
          })
        }
      })
      this.reset()
    },
    getUserResource(params){
      this.otherFlag=false
      this.allFlag=false
      this.$http.get('/resource/getUserResourcePage', {
        params: params
      }).then((response) => {
        if (response.data.code === 20000) {
          this.tableData = response.data.data.records
          this.total = response.data.data.total
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

<style scoped>
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
