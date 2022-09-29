<template>
  <div class="card">
    <div class="card-img">
      <el-image
          :src="image"
          fit="contain"
          style="width: 100%; height: 100%"
      >
      </el-image>
    </div>
    <div class="card-info" style="display: flex;flex-direction: column">
      <div style="margin-top: 10px;display: flex;">
        <el-tag v-for="i in tag.length" style="margin-right: 1px">{{ tag[i - 1] }}</el-tag>
        <slot name="goto"></slot>
      </div>
      <div style="margin-top: 10px;display: flex;justify-content: space-between;align-items: center">
        <div class="text-title" v-if="name.length<=13">{{ name }}</div>
        <div class="text-title" v-else>{{ name.substring(0,13) }}...</div>
        <slot name="star"></slot>
      </div>
      <div style="margin-top: 10px;font-size: 13px" v-if="description.length<=45">{{ description }}</div>
      <div style="margin-top: 10px;font-size: 13px" v-else>{{ description.substring(0,45) }}...</div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    name: {
      type: String,
      required: true
    },
    description: {
      type: String,
      required: true
    },
    image: {
      type: String,
      required: true
    },
    url: {
      type: String,
      required: true
    },
    content: {
      type: String,
      required: true
    },
    star: {
      type: Number,
      default: 0,
      required: true
    },
    tag: {
      type: Array,
      default: []
    },
    createTime: {
      type: String,
    }
  },
  data() {
    return {
      flag:true
    };
  },
  mounted() {

  },
  methods: {
  }
}
</script>

<style lang="less" scoped>

.card {
  width: 230px;
  height: 250px;
  padding: .8em;
  position: relative;
  overflow: visible;
  border-radius: 10px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
}

.card:hover {
  background-color: #f3f3f3;
}

.card-img {
  height: 100px;
  width: 100px;
  transition: .3s ease;
}

.text-title {
  font-weight: bold;
  font-size: 17px;
  color: #0170fe;
}

.card-img:hover {
  transform: translateY(-25%);
}

.card-button:hover {
  border: 1px solid #ffcaa6;
  background-color: #ffcaa6;
}

</style>
