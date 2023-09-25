<template>
  <div>
    <div v-for="(row, rowIndex) in board" :key="rowIndex" class="board-row">
      <div v-for="(cell, cellIndex) in row" :key="cellIndex" class="board-cell">
        <BoardCell
          :subBoard="cell"
          :position="{ x: rowIndex, y: cellIndex }"
          :currentPlayer="currentPlayer"
          :nextMovePosition="nextBoard"
          @update-move="updateCell"
          @make-move="handleMove"
        />
      </div>
    </div>
    <button @click="startGame">Restart Game</button>
  </div>
</template>

<script>
import BoardCell from "./BoardCell.vue";

export default {
  components: {
    BoardCell,
  },
  data() {
    return {
      board: this.initializeBoard(),
      currentPlayer: "X",
      nextBoard: null,
    };
  },
  methods: {
    startGame() {
      this.board = this.initializeBoard();
      this.nextBoard = null;
      this.currentPlayer = "X";
    },
    initializeBoard() {
      return Array.from({ length: 3 }, () =>
        Array.from({ length: 3 }, () =>
          Array.from({ length: 3 }, () => Array(3).fill("")),
        ),
      );
    },
    updateCell(payload) {
      const { position, cell, winner } = payload;
      if (winner) {
        // Update entire subBoard when there's a winner
        this.board[position.x][position.y] = winner;
      } else {
        this.board[position.x][position.y][cell.x][cell.y] = cell.value;
      }
      this.currentPlayer = this.currentPlayer === "X" ? "O" : "X";
    },
    handleMove(position) {
      const board = this.board[position.x][position.y];
      if (this.isBoardFull(board) || this.isBoardWon(board)) {
        this.nextBoard = null; // Allow to play in any board
      } else {
        this.nextBoard = position;
      }
    },
    isBoardFull(board) {
      return board.every((row) => row.every((cell) => cell !== ""));
    },
    isBoardWon(board) {
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
  },
};
</script>

<style scoped>
.board-row {
  display: flex;
  justify-content: center;
  margin-bottom: 5px;
}
.board-cell {
  border: 2px solid red;
  margin: 5px;
}
</style>
