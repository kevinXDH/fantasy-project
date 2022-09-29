<template>
  <div id="app">
    <Header></Header>
    <router-view></router-view>
  </div>
</template>

<script>
import Header from '@/components/Header.vue';

export default {
  name: 'app',
  components: {
    Header
  },
  mounted () {

  },
  created() {
    this.getBlogList()
  },
  methods: {
    getBlogList() {
      this.$http.get('/blog/list', {
        params: {
          page: 1,
          pageSize: 10
        }
      }).then((response) => {
        this.$store.state.stateBlogList = response.data.data
      })
    }
  }
}
</script>
<style>

</style>
