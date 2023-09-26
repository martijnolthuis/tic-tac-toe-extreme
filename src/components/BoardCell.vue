<template>
  <!-- Main board container, highlight if it's the active board and show winner if there is one -->
  <div :class="{ 'highlight-board': canPlayHere, 'won-board': winner }">
    <!-- Render each row of the smaller board -->
    <div v-for="(row, rowIndex) in subBoard" :key="rowIndex" class="board-row">
      <!-- Render each cell within a row -->
      <SingleCell
        v-for="(cell, cellIndex) in row"
        :key="cellIndex"
        :value="cell"
        @click="canPlayHere ? makeMove(rowIndex, cellIndex) : null"
      />
    </div>
    <!-- Display winner of this small board -->
    <div v-if="winner" class="winner-display">
      {{ winner }}
    </div>
  </div>
</template>

<script>
import SingleCell from "./SingleCell.vue";

export default {
  props: ["subBoard", "position", "currentPlayer", "nextMovePosition"],
  components: {
    SingleCell,
  },
  data() {
    return {
      winner: null, // Tracks winner of this small board
    };
  },
  computed: {
    // Check if this small board is the one where the next move should be made
    canPlayHere() {
      return (
        (this.nextMovePosition === null || this.positionMatchesNextMove) &&
        !this.winner &&
        !this.isBoardFull
      );
    },
    // Compare the current board's position with the next move position
    positionMatchesNextMove() {
      return (
        this.position.x === this.nextMovePosition.x &&
        this.position.y === this.nextMovePosition.y
      );
    },
    // Check if all cells in the board are filled
    isBoardFull() {
      return this.subBoard.flat().every((cell) => cell !== "");
    },
  },
  methods: {
    // Logic to handle a move within a small board
    makeMove(row, col) {
      if (!this.subBoard[row][col] && !this.winner) {
        const potentialBoard = JSON.parse(JSON.stringify(this.subBoard));
        potentialBoard[row][col] = this.currentPlayer;
        if (this.isWinner(potentialBoard)) {
          this.winner = this.currentPlayer;
        }

        // Emit the move details to the parent
        this.$emit("update-move", {
          position: this.position,
          cell: { x: row, y: col, value: this.currentPlayer },
        });
        this.$emit("make-move", { x: row, y: col });
      }
    },
    // Check if a player has won this small board
    isWinner(board) {
      // Check rows, columns, and diagonals
      for (let i = 0; i < 3; i++) {
        if (
          board[i][0] &&
          board[i][0] === board[i][1] &&
          board[i][1] === board[i][2]
        ) {
          return true;
        }
        if (
          board[0][i] &&
          board[0][i] === board[1][i] &&
          board[1][i] === board[2][i]
        ) {
          return true;
        }
      }
      // Check diagonals for a win
      if (
        board[0][0] &&
        board[0][0] === board[1][1] &&
        board[1][1] === board[2][2]
      ) {
        return true;
      }
      if (
        board[0][2] &&
        board[0][2] === board[1][1] &&
        board[1][1] === board[2][0]
      ) {
        return true;
      }
      return false;
    },
  },
};
</script>

<style scoped>
/* Styles for row of the small board */
.board-row {
  display: flex;
  justify-content: center;
  margin-bottom: 5px;
}
/* Styles to display the winner */
.winner-display {
  font-size: 2rem;
  text-align: center;
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}
/* Highlighting the active small board */
.highlight-board {
  border: 3px solid green;
  box-sizing: border-box;
}
/* Dimming the board that's already won */
.won-board {
  opacity: 0.6;
  pointer-events: none;
}
</style>
