<template>
  <div id="app">
    <div class="game-wrapper">
      <!-- Main Title for the Game -->
      <h1>Tic Tac Toe Extreme</h1>
      <!-- Main Board Component -->
      <MainBoard />
    </div>
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
/* Global styling and reset */
* {
  margin: 0; /* Removing default margins */
  padding: 0; /* Removing default paddings */
  box-sizing: border-box; /* Ensuring that padding and borders don't increase the total size of the element */
}

/* Setting styles for the entire page */
body,
html {
  height: 100%; /* Ensuring full height for the body and html tags */
  overflow-y: hidden; /* Prevent vertical scrolling on the entire page */
}

/* Main app container styling */
#app {
  text-align: center; /* Centralizing inline and inline-block children */
  font-family: "Arial", sans-serif; /* Defining the global font for the app */
  background-color: #eae7e2; /* Background color for the entire app */
  height: 100%; /* Ensure the app container takes full height of its parent */
  display: flex; /* Using flexbox to centralize the game wrapper */
  justify-content: center; /* Horizontally centering the game-wrapper */
  align-items: center; /* Vertically centering the game-wrapper */
}

/* Styling for the main game area */
.game-wrapper {
  width: 100%; /* Ensuring it takes up full available width, but respecting the max-width */
  max-width: 800px; /* Limiting the maximum width */
  padding: 20px; /* Padding around the content */
  background-color: #fafafa; /* Background color of the game area */
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Adding a slight shadow for visual depth */
  border-radius: 10px; /* Rounded edges for aesthetics */
}

/* Styling for the main game title */
h1 {
  color: #2c3e50; /* Text color */
  font-size: 3em; /* Font size */
  font-weight: bold; /* Bold font for emphasis */
  text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.2); /* Slight shadow for text depth */
  letter-spacing: 1.5px; /* Space between letters */
  margin-bottom: 20px; /* Space below the title, before the game starts */
}
</style>
