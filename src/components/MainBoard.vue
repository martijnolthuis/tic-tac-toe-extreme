<template>
  <!-- Main game container -->
  <div>
    <!-- Display the main board winner if there's one -->
    <div v-if="mainBoardWinner" class="victory-message">
      {{ mainBoardWinner }} Wins!
    </div>
    <!-- Render the main board rows -->
    <div v-for="(row, rowIndex) in board" :key="rowIndex" class="board-row">
      <!-- Render each cell (which is a mini board) within a row -->
      <div v-for="(cell, cellIndex) in row" :key="cellIndex" class="board-cell">
        <!-- Individual mini board cell component -->
        <BoardCell
          :subBoard="cell"
          :winner="boardWinners[rowIndex][cellIndex]"
          :position="{ x: rowIndex, y: cellIndex }"
          :currentPlayer="currentPlayer"
          :nextMovePosition="nextBoard"
          @update-move="updateCell"
          @make-move="handleMove"
          @board-won="handleBoardWon"
        />
      </div>
    </div>
    <!-- Restart game button -->
    <button @click="startGame">Restart Game</button>
  </div>
</template>

<script>
import BoardCell from "./BoardCell.vue";

export default {
  components: {
    BoardCell, // Mini board cell component import
  },
  data() {
    return {
      board: this.initializeBoard(),
      currentPlayer: "X",
      nextBoard: null,
      boardWinners: Array(3)
        .fill()
        .map(() => Array(3).fill(null)), // New data property
    };
  },
  computed: {
    mainBoardWinner() {
      // Check rows, columns, and diagonals
      for (let i = 0; i < 3; i++) {
        if (
          this.boardWinners[i][0] &&
          this.boardWinners[i][0] === this.boardWinners[i][1] &&
          this.boardWinners[i][1] === this.boardWinners[i][2]
        ) {
          return this.boardWinners[i][0];
        }
        if (
          this.boardWinners[0][i] &&
          this.boardWinners[0][i] === this.boardWinners[1][i] &&
          this.boardWinners[1][i] === this.boardWinners[2][i]
        ) {
          return this.boardWinners[0][i];
        }
      }
      if (
        this.boardWinners[0][0] &&
        this.boardWinners[0][0] === this.boardWinners[1][1] &&
        this.boardWinners[1][1] === this.boardWinners[2][2]
      ) {
        return this.boardWinners[0][0];
      }
      if (
        this.boardWinners[0][2] &&
        this.boardWinners[0][2] === this.boardWinners[1][1] &&
        this.boardWinners[1][1] === this.boardWinners[2][0]
      ) {
        return this.boardWinners[0][2];
      }
      return null;
    },
  },
  methods: {
    // Resets the game to its initial state
    startGame() {
      this.board = this.initializeBoard();
      this.boardWinners = Array(3)
        .fill()
        .map(() => Array(3).fill(null)); // Reset the winners
      this.nextBoard = null;
      this.currentPlayer = "X";
    },
    // Generates a fresh 3x3x3x3 board
    initializeBoard() {
      return Array.from({ length: 3 }, () =>
        Array.from({ length: 3 }, () =>
          Array.from({ length: 3 }, () => Array(3).fill("")),
        ),
      );
    },
    // Updates cell value based on player's move
    updateCell(payload) {
      const { position, cell, winner } = payload;
      if (winner) {
        this.board[position.x][position.y] = winner;
      } else {
        this.board[position.x][position.y][cell.x][cell.y] = cell.value;
      }
      // Switch to the other player
      this.currentPlayer = this.currentPlayer === "X" ? "O" : "X";
    },
    // Determines the next board where the move should be made
    handleMove(position) {
      const board = this.board[position.x][position.y];
      if (this.isBoardFull(board) || this.isBoardWon(board)) {
        this.nextBoard = null; // Allow play in any mini board
      } else {
        this.nextBoard = position; // Play in a specific mini board
      }
    },
    // Check if all cells in a mini board are filled
    isBoardFull(board) {
      return board.every((row) => row.every((cell) => cell !== ""));
    },
    // Determine if a mini board has a winner
    isBoardWon(board) {
      // Check rows, columns, and diagonals for win
      const isRowWin = board.some((row) =>
        row.every((cell) => cell === this.currentPlayer),
      );
      const isColWin = [0, 1, 2].some((col) =>
        board.every((row) => row[col] === this.currentPlayer),
      );
      const isDiag1Win =
        board[0][0] === this.currentPlayer &&
        board[1][1] === this.currentPlayer &&
        board[2][2] === this.currentPlayer;
      const isDiag2Win =
        board[0][2] === this.currentPlayer &&
        board[1][1] === this.currentPlayer &&
        board[2][0] === this.currentPlayer;

      return isRowWin || isColWin || isDiag1Win || isDiag2Win;
    },
    getWinner(board) {
      // Check and return the winner of the board if there is one
      if (this.isBoardWon(board)) return this.currentPlayer;
      return null;
    },
    handleBoardWon(position) {
      this.boardWinners[position.x][position.y] = this.currentPlayer;
    },
  },
};
</script>

<style scoped>
.board-row {
  display: flex; /* Flex layout for row alignment */
  justify-content: center; /* Center aligns the individual cells */
  margin-bottom: 15px; /* Margin for space between rows */
}

.board-cell {
  border: 3px solid #888; /* Border definition for each small board */
  margin: 5px; /* Margin around each small board */
  padding: 10px; /* Padding inside each small board */
  background-color: #fff; /* White background color */
  box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
}

.won-board {
  opacity: 0.6; /* Slight fade for a board that's won */
  pointer-events: none; /* Makes it unclickable */
  background-color: #ffeaa7; /* A light yellow shade for won board */
}

.highlight-board {
  border: 5px dashed #55efc4; /* A bright green color to highlight the next playable board */
}
button {
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  font-size: 1.2em;
  background-color: #2c3e50;
  color: #f9f9f9;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

button:hover {
  background-color: #34495e;
}

button:active {
  transform: translateY(2px); /* Slight downward motion when clicked */
}

.victory-message {
  font-size: 3rem;
  color: #e74c3c; /* Feel free to change color based on preference */
  text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.2);
  margin-bottom: 20px;
}
</style>
