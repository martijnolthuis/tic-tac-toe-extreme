<template>
  <!-- The root component that wraps the entire application -->
  <div id="app">
    <!-- Including the main game board component -->
    <MainBoard />
  </div>
</template>

<script>
// Importing the MainBoard component from its location
import MainBoard from "./components/MainBoard.vue";

export default {
  // Naming the component as "App"
  name: "App",
  // Registering the MainBoard component to be used within this component
  components: {
    MainBoard,
  },
};
</script>

<style>
/* Styling specific to the root `App` component */
#app {
  text-align: center;    // Center-align the content
  margin-top: 60px;      // Give some top margin for better layout
}
</style>
