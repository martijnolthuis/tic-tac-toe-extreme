# Tic Tac Toe Extreme: The Next Generation of Classic Tic Tac Toe

## Overview

This web application is designed to take the age-old game of Tic Tac Toe to an entirely new dimension. By introducing a grid within each cell, the game becomes more challenging, fun, and strategic. The modern, intuitive UI ensures that gameplay remains smooth and enjoyable.

## Table of Contents

- [Features](#features)
- [Technology Stack](#technology-stack)
- [Installation and Setup](#installation-and-setup)
- [Gameplay Instructions](#gameplay-instructions)
- [License](#license)

## Features

- **Extreme Mode**: Instead of one board, play on a meta board where each cell itself is a board of Tic Tac Toe.
- **Interactive Gameplay**: Clear visual cues highlight available moves, with immediate feedback on wins.
- **Two Modes**: Challenge yourself in a solo game or battle it out with a friend in two-player mode.

## Technology Stack

- **Front-end**: Vue.js
- **Utilities**: Vue CLI, Docker, and Docker-compose

## Installation and Setup

1. Clone this repository:
   `git clone https://github.com/yourusername/tic-tac-toe-extreme`
2. Navigate to the directory:
   `cd tic-tac-toe-extreme`
3. Use Docker-compose to build and run the application:
   `docker-compose up --build`
4. Launch the game in your browser at `http://localhost:8080`.

## Gameplay Instructions

1. Start a game, choosing between single-player or two-player mode.
2. Play Tic Tac Toe as usual on the larger board, but to win a cell on the large board, you have to win the smaller Tic Tac Toe game within that cell.
3. The game concludes when a player wins the main board or all smaller boards are full.

## License

This project is licensed under the MIT License. View the `LICENSE` file in the repository for details.
