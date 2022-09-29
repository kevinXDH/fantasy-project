<template>
  <div class="container">
    <!-- 热门博客内容 -->
    <el-card style="margin-bottom: 20px">
      <el-row v-for="item in blogList" :key="item.id" style="border-bottom: 1px solid lightgray">
        <el-col :md="18">
          <div :body-style="{ padding: '0px' }"
               shadow="never">
            <div style="padding: 14px">
              <h4 class="article-title" style="color: #0170fe;cursor: pointer" @click="toBlogDetail(item.id)">{{ item.name }}</h4>
              <p class="author">发布人: {{ item.user.name }}</p>
              <span class="item-summary">{{ item.content.substring(0, 100) }}</span>
              <div class="blog-item-bottom">
                <div class="bottom clearfix comment-collection">
                  <i class="el-icon-s-comment "></i>
                  <div>{{ item.commentCount }}</div>&nbsp;&nbsp;
                  <i class="el-icon-star-off "></i>
                  <div>{{ item.star }}</div>
                </div>
                <div class="time">发布时间：{{ moment(item.createTime)}}</div>
              </div>
            </div>
          </div>
        </el-col>
        <el-col :md="6">
          <div :body-style="{ padding: '0px' }"
               shadow="never">
            <div style="padding: 14px" class="content-time">
              <img :src="item.coverImg"
                   alt="" style="width:170px;height: 121px">
            </div>
          </div>
        </el-col>
      </el-row>
    </el-card>
  </div>
</template>

<script>
import moment from "moment";

export default {
  name: "Blog",
  data() {
    return {
      blogList: [],
    }
  },
  created() {
    this.getBlogList()
  },
  methods: {
    moment(time) {
      return moment(time).format('YYYY年M月D日 h时m分s秒')
    },
    getBlogList() {
        this.$http.get('/blog/list', {
          params: {
            page: 1,
            pageSize: 9999
          }
        }).then((response) => {
          this.blogList = response.data.data
        })
    },
    //  跳转到博客详情页面
    toBlogDetail(id) {
      this.$router.push({
        path: '/blog/' + id
      })
    }
  }
}
</script>

<style lang="less" scoped>
.container {
  margin-top: 20px;
  padding-right: 50px;
  padding-left: 50px;
  margin-right: auto;
  margin-left: auto;
}

.comment-collection {
  color: #777888;
  display: flex;
  align-items: center;
  font-size: 14px;
}

.blog-item-bottom {
  display: flex;
  justify-content: space-between;
  align-items: end;
}

.item-summary {
  color: gray;
  font-size: 15px;
}

.author {
  color: #222226;
}


</style>
