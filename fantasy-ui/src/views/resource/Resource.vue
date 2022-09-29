<template>
  <div class="resource-body">
    <el-row type="flex"
            justify="center">
      <el-col :md="16">
        <!-- 资源大全 -->
        <el-card>
          <h4>全部分类</h4>
          <el-row :gutter="20">
            <el-col :span="24">
              <div class="grid-content bg-purple" style="display: flex;flex-wrap: wrap">
                <el-tag @click="chooseCategory(item.id)" v-for="item in categoryList" :key="item.id"
                        style="cursor: pointer">{{ item.name }}
                </el-tag>
              </div>
            </el-col>
          </el-row>

          <h4>全部资源</h4>
          <!-- 排序 -->
          <el-row style="display: flex;justify-content: space-between;align-items: center;flex-wrap: wrap">
            <div style="display: flex;align-items: center">
              <i class="el-icon-sort" style="font-size: 25px;font-weight: bold"></i>
              <el-tag style="cursor: pointer" @click="orderBy('')" type="info">默认</el-tag>
              <el-tag @click="orderBy('time')" style="cursor: pointer" type="info">时间</el-tag>
              <el-tag style="cursor: pointer" @click="orderBy('star')" type="info">收藏</el-tag>
            </div>

            <div class="search">
              <el-input placeholder="" v-model="params.text">
                <el-button slot="append" icon="el-icon-search" @keyup.enter.native="search" @click="search"></el-button>
              </el-input>
            </div>
          </el-row>

          <!-- 资源内容 -->
          <div style="display: flex;justify-content: center;flex-wrap: wrap">
            <card v-for="e in resourceList" :key="e.id" style="margin: 20px"
                  :content="e.content"
                  :create-time="e.createTime"
                  :description="e.description"
                  :image="e.image"
                  :name="e.name"
                  :star="e.star"
                  :url="e.url"
                  :tag="e.tagArr"
            >
              <template #goto>
                <el-tag
                    style="margin-right: 5px;background-color: #0170fe;color: white;cursor: pointer"
                    @click="toResourceDetail(e.id)"
                >访问
                </el-tag>
              </template>

              <template #star>
                <i class="el-icon-star-off" style="font-size: 20px;cursor: pointer" @click="addResourceStar(e.id)"
                   ref="star">{{ e.star }}</i>
              </template>
            </card>
          </div>


          <!-- 分页 -->
          <div class="block" style="display: flex;justify-content: center">
            <el-pagination
                @current-change="handleCurrentChange"
                :current-page="currentPage"
                :page-size="12"
                layout="total, prev, pager, next, jumper"
                :total="total">
            </el-pagination>
          </div>
        </el-card>
      </el-col>
      <el-col :md="4"
              :offset="1">
        <el-card class="box-card">
          <div slot="header"
               class="clearfix">
            <span style="font-weight: bold">资源分享榜</span>
          </div>
          <div v-for="item in sortList"
               :key="item.id"
               class="text item">
            <div class="author-parent" style="margin-bottom: 10px">
              <div class="collection" style="display: flex;align-items: center">
                <div style="display: flex;align-items: center">
                  <el-avatar :src="item.avatar"></el-avatar>
                  <span style="font-weight: bold;color: #0170fe;margin-left: 8px;font-size: 10px"
                        v-if="item.name.length<=9">{{ item.name }}</span>
                  <span style="font-weight: bold;color: #0170fe;margin-left: 8px;font-size: 10px"
                        v-else>{{ item.name.substring(0, 9) }}...</span>
                </div>
                <i class="el-icon-upload ">{{ item.star }}</i>
              </div>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import Card from '../../components/Card'

export default {
  created() {
    this.getResourceList(this.params)
    this.getCategoryList()
    this.getSortList()
  },
  components: {
    Card
  },
  data() {
    return {
      time:null,
      collectList: [],
      currentPage: 1,
      total: 0,
      resourceList: [],
      categoryList: [],
      resourceIds: [],
      sortList: [],
      params: {
        page: 1,
        pageSize: 12,
        orderBy: '',
        text: '',
        cid: ''
      }
    }
  },
  methods: {
    getSortList() {
      this.$http.get('/user/getSortList').then((response) => {
        if (response.data.code === 20000) {
          this.sortList = response.data.data
        }
      })
    },
    getCategoryList() {
      this.$http.get('/category/list').then((response) => {
        if (response.data.code === 20000) {
          this.categoryList = response.data.data
          this.$store.state.categoryList = response.data.data
        }
      })
    },
    chooseCategory(cid) {
      this.params.cid = cid
      this.getResourceList(this.params)
    },
    search() {
      this.currentPage = 1
      this.params.page = 1
      this.params.cid = ''
      this.getResourceList(this.params)
    },
    orderBy(type) {
      this.currentPage = 1
      this.params.page = 1
      this.params.cid = ''
      this.params.orderBy = type
      this.getResourceList(this.params)
    },
    handleCurrentChange(page) {
      this.params.page = page
      this.getResourceList(this.params)
    },
    getResourceList(params) {
      this.$http.get('/resource/page', {
        params: params
      }).then((response) => {
        if (response.data.code === 20000) {
          this.resourceList = response.data.data.records
          this.total = response.data.data.total
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
      if(this.time !== null){
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
                this.getResourceList(this.params)
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

    }
  }
}
</script>

<style>
.resource-body {
  margin-top: 40px;
}

.el-card__body {
  padding-top: 0px !important;
}

.el-tag {
  margin: 5px;
}

/* 排序 */
.resource-detail {
  margin: 25px 0px;
}

.resource-detail img {
  height: 100px;
}

/* .img-content {
  display: flex;
} */
/* 分页 */
.el-pagination {
  text-align: center;
}

/* 收藏榜 */
.collection {
  margin: 7px 0px;
  display: flex;
  justify-content: space-between;
}

.author-parent > span {
  color: grey;
  font-size: 12px;
}

@media (max-width: 600px) {
  .box-card {
    display: none;
  }
}
</style>
