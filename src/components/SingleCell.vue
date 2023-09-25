<template>
  <button class="cell" @click="updateValue">{{ value }}</button>
</template>

<script>
export default {
  props: ["value"],
  methods: {
    updateValue() {
      this.$emit("click");
    },
  },
};
</script>

<style scoped>
.cell {
  width: 50px;
  height: 50px;
  border: 1px solid black;
  background-color: #f4f4f4;
  font-size: 24px;
}
</style>
