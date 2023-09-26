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
/* Styling for the cell button */
.cell {
  width: 50px;                  // Set width of the cell button
  height: 50px;                 // Set height of the cell button
  border: 1px solid black;      // Border for the cell
  background-color: #f4f4f4;   // Background color of the cell
  font-size: 24px;              // Font size for the X or O value
}
</style>
