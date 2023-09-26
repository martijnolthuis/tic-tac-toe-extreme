<template>
  <!-- This is a button that represents a cell in the game board -->
  <button class="cell" @click="updateValue">{{ value }}</button>
</template>

<script>
export default {
  // `value` is a prop passed to this component which displays the cell value ('X', 'O', or '')
  props: ["value"],
  methods: {
    // When the cell is clicked, it emits a 'click' event to the parent component
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
  border: 2px solid #333; /* Cell border definition */
  background-color: #f9f9f9; /* Light background for the cell */
  font-size: 24px; /* Font size for the 'X' and 'O' */
  color: #333; /* Text color */
  cursor: pointer; /* Cursor style indicates it's clickable */
  /* transition: background-color 0.2s ease; Transition effect for hover */
  transition: all 0.3s ease; /* Smoothens the transition for all properties */
}

.cell:active {
  transform: scale(0.95); /* Slightly shrinks the cell when clicked */
}

.cell:hover {
  background-color: #f4f4f4; /* Slight change in color when hovering */
}
</style>
