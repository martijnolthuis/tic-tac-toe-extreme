<template>
  <div id="app">
    <MainBoard />
  </div>
</template>

<script>
import MainBoard from "./components/MainBoard.vue";

export default {
  name: "App",
  components: {
    MainBoard,
  },
};
</script>

<style>
#app {
  text-align: center;
  margin-top: 60px;
}
</style>
