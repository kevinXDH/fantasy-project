<template>
  <div style="height: 100vh;overflow:scroll">
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
          <i class="el-icon-star-off" style="font-size: 20px;cursor: pointer"
             ref="star">{{ e.star }}</i>
        </template>
      </card>
    </div>
  </div>
</template>

<script>
import moment from 'moment'
import Card from "@/components/Card"

export default {
  props: {
    uid: {
      type: [String, Number],
      required: true
    }
  },
  components:{
    Card
  },
  data() {
    return {
      resourceList: [],
      collectList:[],
      params: {
        page: 1,
        pageSize: 9999
      }
    }
  },
  created() {
    this.getResourceList(this.params)
    this.getCollectList()
  },
  methods: {
    getCollectList(){
      this.$http.get('/userStar/collectList', {
        params: {
          uid: localStorage.getItem('userInfo')
        }
      }).then((response) => {
        this.collectList= response.data.data
      })
    },
    getResourceList(params) {
      this.$http.get('/resource/page', {
        params: params
      }).then((response) => {
        if (response.data.code === 20000) {
          // this.resourceList = response.data.data.records
          for (let i = 0; i < this.collectList.length; i++) {
            this.resourceList.push(response.data.data.records.find(e=>e.id===this.collectList[i]))
          }
        }
      })
    },
    toResourceDetail(id) {
      this.$router.push({
        path: '/resource/' + id
      })
      this.$toTop()
    },
    moment(time) {
      return moment(time).format('YYYY年M月D日 h时m分s秒')
    },
    handleDelete(){

    }
  },
}
</script>

<style scoped>

</style>
