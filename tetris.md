---
layout: default
title: Tetris
permalink: /tetris.html
---

<style>
/* ============================================
   0x00TETRIS - Terminal Style Tetris
   ============================================ */

:root {
  --bg-primary: #000000;
  --bg-secondary: #0a0a0a;
  --bg-tertiary: #121212;
  --border-color: #333333;
  --text-primary: #f5f5f5;
  --text-secondary: #b8b8b8;
  --text-muted: #666666;
  --accent-green: #b8bb26;
  --glow-green: rgba(184, 187, 38, 0.4);
}

* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

#tetris-container {
  background: var(--bg-primary);
  min-height: 90vh;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  position: relative;
  overflow: hidden;
  font-family: 'JetBrains Mono', 'Fira Code', 'Source Code Pro', Monaco, monospace;
  padding: 20px;
}

/* Game wrapper */
#game-wrapper {
  display: flex;
  gap: 20px;
  align-items: flex-start;
}

/* Main game board */
#game-board {
  background: var(--bg-secondary);
  border: 2px solid var(--border-color);
  position: relative;
}

#game-board canvas {
  display: block;
}

/* Side panel */
#side-panel {
  display: flex;
  flex-direction: column;
  gap: 16px;
  min-width: 160px;
}

/* Panel sections */
.panel-section {
  background: var(--bg-secondary);
  border: 1px solid var(--border-color);
  padding: 12px;
}

.panel-title {
  font-size: 10px;
  color: var(--text-muted);
  text-transform: uppercase;
  letter-spacing: 2px;
  margin-bottom: 8px;
  padding-bottom: 6px;
  border-bottom: 1px solid var(--border-color);
}

/* Score display */
.score-value {
  font-size: 24px;
  color: var(--accent-green);
  text-shadow: 0 0 10px var(--glow-green);
  font-weight: bold;
}

.stat-row {
  display: flex;
  justify-content: space-between;
  font-size: 12px;
  color: var(--text-secondary);
  margin-top: 8px;
}

.stat-value {
  color: var(--accent-green);
}

/* Next piece preview */
#next-canvas {
  display: block;
  margin: 0 auto;
}

/* Hold piece */
#hold-canvas {
  display: block;
  margin: 0 auto;
}

/* Controls info */
.controls-list {
  font-size: 10px;
  color: var(--text-muted);
  line-height: 1.8;
}

.controls-list kbd {
  background: var(--bg-tertiary);
  padding: 2px 6px;
  border-radius: 3px;
  border: 1px solid var(--border-color);
  font-family: inherit;
  color: var(--text-secondary);
}

/* Game over overlay */
#game-over {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.9);
  display: none;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  z-index: 100;
}

#game-over.active {
  display: flex;
}

#game-over h2 {
  color: var(--accent-green);
  font-size: 32px;
  text-shadow: 0 0 20px var(--glow-green);
  margin-bottom: 16px;
  text-transform: uppercase;
  letter-spacing: 4px;
}

#game-over .final-score {
  color: var(--text-secondary);
  font-size: 18px;
  margin-bottom: 24px;
}

#game-over .final-score span {
  color: var(--accent-green);
  font-size: 24px;
}

#restart-btn {
  background: var(--bg-tertiary);
  border: 1px solid var(--accent-green);
  color: var(--accent-green);
  padding: 12px 32px;
  cursor: pointer;
  font-family: inherit;
  font-size: 14px;
  text-transform: uppercase;
  letter-spacing: 2px;
  transition: all 0.2s ease;
}

#restart-btn:hover {
  background: var(--accent-green);
  color: var(--bg-primary);
  box-shadow: 0 0 20px var(--glow-green);
}

/* Pause overlay */
#pause-overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.8);
  display: none;
  align-items: center;
  justify-content: center;
  z-index: 50;
}

#pause-overlay.active {
  display: flex;
}

#pause-overlay span {
  color: var(--accent-green);
  font-size: 24px;
  text-shadow: 0 0 15px var(--glow-green);
  text-transform: uppercase;
  letter-spacing: 4px;
  animation: pulse 1s ease-in-out infinite;
}

@keyframes pulse {
  0%, 100% { opacity: 1; }
  50% { opacity: 0.5; }
}

/* Back button */
#back-btn {
  position: absolute;
  top: 16px;
  left: 16px;
  z-index: 100;
  background: rgba(10, 10, 10, 0.9);
  border: 1px solid var(--border-color);
  color: var(--text-secondary);
  padding: 8px 16px;
  cursor: pointer;
  font-family: inherit;
  font-size: 12px;
  text-decoration: none;
  display: flex;
  align-items: center;
  gap: 8px;
  transition: all 0.2s ease;
}

#back-btn:hover {
  border-color: var(--accent-green);
  color: var(--accent-green);
}

/* Title */
#game-title {
  position: absolute;
  top: 16px;
  left: 50%;
  transform: translateX(-50%);
  font-size: 14px;
  color: var(--accent-green);
  text-transform: uppercase;
  letter-spacing: 4px;
  text-shadow: 0 0 10px var(--glow-green);
}

/* Ghost piece styling is handled in JS */

/* Responsive */
@media (max-width: 600px) {
  #game-wrapper {
    flex-direction: column;
    align-items: center;
  }

  #side-panel {
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: center;
    min-width: auto;
  }

  .panel-section {
    flex: 1;
    min-width: 140px;
  }
}
</style>

<div id="tetris-container">
  <a href="/game.html" id="back-btn">
    <span>←</span> BACK
  </a>

  <div id="game-title">0x00TETRIS</div>

  <div id="game-wrapper">
    <div id="game-board">
      <canvas id="tetris-canvas"></canvas>
      <div id="game-over">
        <h2>Game Over</h2>
        <div class="final-score">Score: <span id="final-score">0</span></div>
        <button id="restart-btn">Play Again</button>
      </div>
      <div id="pause-overlay">
        <span>Paused</span>
      </div>
    </div>

    <div id="side-panel">
      <div class="panel-section">
        <div class="panel-title">Score</div>
        <div class="score-value" id="score">0</div>
        <div class="stat-row">
          <span>Level</span>
          <span class="stat-value" id="level">1</span>
        </div>
        <div class="stat-row">
          <span>Lines</span>
          <span class="stat-value" id="lines">0</span>
        </div>
      </div>

      <div class="panel-section">
        <div class="panel-title">Next</div>
        <canvas id="next-canvas" width="80" height="80"></canvas>
      </div>

      <div class="panel-section">
        <div class="panel-title">Hold</div>
        <canvas id="hold-canvas" width="80" height="80"></canvas>
      </div>

      <div class="panel-section">
        <div class="panel-title">Controls</div>
        <div class="controls-list">
          <kbd>←</kbd> <kbd>→</kbd> Move<br>
          <kbd>↓</kbd> Soft drop<br>
          <kbd>↑</kbd> Rotate<br>
          <kbd>Space</kbd> Hard drop<br>
          <kbd>C</kbd> Hold<br>
          <kbd>P</kbd> Pause
        </div>
      </div>
    </div>
  </div>
</div>

<script>
// ============================================
// 0x00TETRIS - Terminal Style Tetris Game
// ============================================

const canvas = document.getElementById('tetris-canvas');
const ctx = canvas.getContext('2d');
const nextCanvas = document.getElementById('next-canvas');
const nextCtx = nextCanvas.getContext('2d');
const holdCanvas = document.getElementById('hold-canvas');
const holdCtx = holdCanvas.getContext('2d');

// Game constants
const COLS = 10;
const ROWS = 20;
const BLOCK_SIZE = 28;
const PREVIEW_BLOCK = 16;

// Set canvas sizes
canvas.width = COLS * BLOCK_SIZE;
canvas.height = ROWS * BLOCK_SIZE;

// Tetromino colors (terminal/hacker theme)
const COLORS = {
  I: '#00ffff', // Cyan
  O: '#ffff00', // Yellow
  T: '#b8bb26', // Green (accent)
  S: '#00ff00', // Bright green
  Z: '#ff4444', // Red
  J: '#4444ff', // Blue
  L: '#ff8800', // Orange
  ghost: 'rgba(184, 187, 38, 0.3)',
  grid: '#1a1a1a',
  gridLine: '#222222'
};

// Tetromino shapes
const SHAPES = {
  I: [[0,0,0,0], [1,1,1,1], [0,0,0,0], [0,0,0,0]],
  O: [[1,1], [1,1]],
  T: [[0,1,0], [1,1,1], [0,0,0]],
  S: [[0,1,1], [1,1,0], [0,0,0]],
  Z: [[1,1,0], [0,1,1], [0,0,0]],
  J: [[1,0,0], [1,1,1], [0,0,0]],
  L: [[0,0,1], [1,1,1], [0,0,0]]
};

// Wall kick data (SRS)
const WALL_KICKS = {
  normal: [
    [[0,0], [-1,0], [-1,1], [0,-2], [-1,-2]],
    [[0,0], [1,0], [1,-1], [0,2], [1,2]],
    [[0,0], [1,0], [1,1], [0,-2], [1,-2]],
    [[0,0], [-1,0], [-1,-1], [0,2], [-1,2]]
  ],
  I: [
    [[0,0], [-2,0], [1,0], [-2,-1], [1,2]],
    [[0,0], [-1,0], [2,0], [-1,2], [2,-1]],
    [[0,0], [2,0], [-1,0], [2,1], [-1,-2]],
    [[0,0], [1,0], [-2,0], [1,-2], [-2,1]]
  ]
};

// Game state
let board = [];
let currentPiece = null;
let nextPiece = null;
let holdPiece = null;
let canHold = true;
let score = 0;
let level = 1;
let lines = 0;
let gameOver = false;
let paused = false;
let dropCounter = 0;
let lastTime = 0;

// Initialize board
function createBoard() {
  return Array.from({ length: ROWS }, () => Array(COLS).fill(0));
}

// Create a new piece
function createPiece(type) {
  return {
    type: type,
    shape: SHAPES[type].map(row => [...row]),
    color: COLORS[type],
    x: Math.floor(COLS / 2) - Math.floor(SHAPES[type][0].length / 2),
    y: 0,
    rotation: 0
  };
}

// Get random piece type
function randomPiece() {
  const types = 'IOTSZJL';
  return types[Math.floor(Math.random() * types.length)];
}

// Rotate matrix
function rotateMatrix(matrix) {
  const n = matrix.length;
  const result = matrix.map((row, i) =>
    row.map((_, j) => matrix[n - 1 - j][i])
  );
  return result;
}

// Check collision
function collides(piece, board, offsetX = 0, offsetY = 0) {
  for (let y = 0; y < piece.shape.length; y++) {
    for (let x = 0; x < piece.shape[y].length; x++) {
      if (piece.shape[y][x]) {
        const newX = piece.x + x + offsetX;
        const newY = piece.y + y + offsetY;
        if (newX < 0 || newX >= COLS || newY >= ROWS) return true;
        if (newY >= 0 && board[newY][newX]) return true;
      }
    }
  }
  return false;
}

// Merge piece into board
function merge(piece, board) {
  piece.shape.forEach((row, y) => {
    row.forEach((value, x) => {
      if (value) {
        const boardY = piece.y + y;
        const boardX = piece.x + x;
        if (boardY >= 0) {
          board[boardY][boardX] = piece.color;
        }
      }
    });
  });
}

// Clear completed lines
function clearLines() {
  let linesCleared = 0;
  outer: for (let y = ROWS - 1; y >= 0; y--) {
    for (let x = 0; x < COLS; x++) {
      if (!board[y][x]) continue outer;
    }
    const row = board.splice(y, 1)[0].fill(0);
    board.unshift(row);
    linesCleared++;
    y++;
  }

  if (linesCleared > 0) {
    // Scoring: 100, 300, 500, 800 for 1, 2, 3, 4 lines
    const points = [0, 100, 300, 500, 800];
    score += points[linesCleared] * level;
    lines += linesCleared;
    level = Math.floor(lines / 10) + 1;
    updateDisplay();
  }
}

// Get ghost piece position
function getGhostY() {
  let ghostY = currentPiece.y;
  while (!collides(currentPiece, board, 0, ghostY - currentPiece.y + 1)) {
    ghostY++;
  }
  return ghostY;
}

// Move piece
function movePiece(dir) {
  if (!collides(currentPiece, board, dir, 0)) {
    currentPiece.x += dir;
  }
}

// Drop piece
function dropPiece() {
  if (!collides(currentPiece, board, 0, 1)) {
    currentPiece.y++;
    dropCounter = 0;
  } else {
    lockPiece();
  }
}

// Hard drop
function hardDrop() {
  while (!collides(currentPiece, board, 0, 1)) {
    currentPiece.y++;
    score += 2;
  }
  lockPiece();
}

// Rotate piece with wall kicks
function rotatePiece() {
  const originalShape = currentPiece.shape;
  const originalRotation = currentPiece.rotation;
  currentPiece.shape = rotateMatrix(currentPiece.shape);
  currentPiece.rotation = (currentPiece.rotation + 1) % 4;

  const kicks = currentPiece.type === 'I' ? WALL_KICKS.I : WALL_KICKS.normal;
  const kickData = kicks[originalRotation];

  for (const [dx, dy] of kickData) {
    if (!collides(currentPiece, board, dx, dy)) {
      currentPiece.x += dx;
      currentPiece.y += dy;
      return;
    }
  }

  // Revert if no kick works
  currentPiece.shape = originalShape;
  currentPiece.rotation = originalRotation;
}

// Lock piece and spawn new one
function lockPiece() {
  merge(currentPiece, board);
  clearLines();
  canHold = true;
  spawnPiece();
}

// Spawn new piece
function spawnPiece() {
  currentPiece = nextPiece || createPiece(randomPiece());
  nextPiece = createPiece(randomPiece());
  drawNext();

  if (collides(currentPiece, board)) {
    gameOver = true;
    document.getElementById('final-score').textContent = score;
    document.getElementById('game-over').classList.add('active');
  }
}

// Hold piece
function holdCurrentPiece() {
  if (!canHold) return;

  canHold = false;
  const tempType = currentPiece.type;

  if (holdPiece) {
    currentPiece = createPiece(holdPiece);
  } else {
    spawnPiece();
  }

  holdPiece = tempType;
  drawHold();
}

// Draw functions
function drawBlock(ctx, x, y, color, size = BLOCK_SIZE) {
  const padding = 1;
  ctx.fillStyle = color;
  ctx.fillRect(x * size + padding, y * size + padding, size - padding * 2, size - padding * 2);

  // Inner highlight
  ctx.fillStyle = 'rgba(255, 255, 255, 0.1)';
  ctx.fillRect(x * size + padding + 2, y * size + padding + 2, size - padding * 2 - 4, 2);
  ctx.fillRect(x * size + padding + 2, y * size + padding + 2, 2, size - padding * 2 - 4);
}

function drawBoard() {
  // Background
  ctx.fillStyle = COLORS.grid;
  ctx.fillRect(0, 0, canvas.width, canvas.height);

  // Grid lines
  ctx.strokeStyle = COLORS.gridLine;
  ctx.lineWidth = 1;
  for (let x = 0; x <= COLS; x++) {
    ctx.beginPath();
    ctx.moveTo(x * BLOCK_SIZE, 0);
    ctx.lineTo(x * BLOCK_SIZE, canvas.height);
    ctx.stroke();
  }
  for (let y = 0; y <= ROWS; y++) {
    ctx.beginPath();
    ctx.moveTo(0, y * BLOCK_SIZE);
    ctx.lineTo(canvas.width, y * BLOCK_SIZE);
    ctx.stroke();
  }

  // Placed blocks
  board.forEach((row, y) => {
    row.forEach((color, x) => {
      if (color) {
        drawBlock(ctx, x, y, color);
      }
    });
  });
}

function drawPiece() {
  if (!currentPiece) return;

  // Draw ghost piece
  const ghostY = getGhostY();
  currentPiece.shape.forEach((row, y) => {
    row.forEach((value, x) => {
      if (value) {
        drawBlock(ctx, currentPiece.x + x, ghostY + y, COLORS.ghost);
      }
    });
  });

  // Draw current piece
  currentPiece.shape.forEach((row, y) => {
    row.forEach((value, x) => {
      if (value) {
        drawBlock(ctx, currentPiece.x + x, currentPiece.y + y, currentPiece.color);
      }
    });
  });
}

function drawNext() {
  nextCtx.fillStyle = '#0a0a0a';
  nextCtx.fillRect(0, 0, nextCanvas.width, nextCanvas.height);

  if (!nextPiece) return;

  const offsetX = (nextCanvas.width / PREVIEW_BLOCK - nextPiece.shape[0].length) / 2;
  const offsetY = (nextCanvas.height / PREVIEW_BLOCK - nextPiece.shape.length) / 2;

  nextPiece.shape.forEach((row, y) => {
    row.forEach((value, x) => {
      if (value) {
        nextCtx.fillStyle = nextPiece.color;
        nextCtx.fillRect(
          (offsetX + x) * PREVIEW_BLOCK + 1,
          (offsetY + y) * PREVIEW_BLOCK + 1,
          PREVIEW_BLOCK - 2,
          PREVIEW_BLOCK - 2
        );
      }
    });
  });
}

function drawHold() {
  holdCtx.fillStyle = '#0a0a0a';
  holdCtx.fillRect(0, 0, holdCanvas.width, holdCanvas.height);

  if (!holdPiece) return;

  const shape = SHAPES[holdPiece];
  const color = COLORS[holdPiece];
  const offsetX = (holdCanvas.width / PREVIEW_BLOCK - shape[0].length) / 2;
  const offsetY = (holdCanvas.height / PREVIEW_BLOCK - shape.length) / 2;

  shape.forEach((row, y) => {
    row.forEach((value, x) => {
      if (value) {
        holdCtx.fillStyle = canHold ? color : '#444444';
        holdCtx.fillRect(
          (offsetX + x) * PREVIEW_BLOCK + 1,
          (offsetY + y) * PREVIEW_BLOCK + 1,
          PREVIEW_BLOCK - 2,
          PREVIEW_BLOCK - 2
        );
      }
    });
  });
}

function updateDisplay() {
  document.getElementById('score').textContent = score;
  document.getElementById('level').textContent = level;
  document.getElementById('lines').textContent = lines;
}

// Game loop
function update(time = 0) {
  if (gameOver) return;

  const deltaTime = time - lastTime;
  lastTime = time;

  if (!paused) {
    dropCounter += deltaTime;
    const dropInterval = Math.max(100, 1000 - (level - 1) * 100);

    if (dropCounter > dropInterval) {
      dropPiece();
      dropCounter = 0;
    }

    drawBoard();
    drawPiece();
  }

  requestAnimationFrame(update);
}

// Controls
document.addEventListener('keydown', (e) => {
  if (gameOver) return;

  switch (e.key) {
    case 'ArrowLeft':
      if (!paused) movePiece(-1);
      break;
    case 'ArrowRight':
      if (!paused) movePiece(1);
      break;
    case 'ArrowDown':
      if (!paused) {
        dropPiece();
        score += 1;
        updateDisplay();
      }
      break;
    case 'ArrowUp':
      if (!paused) rotatePiece();
      break;
    case ' ':
      e.preventDefault();
      if (!paused) hardDrop();
      break;
    case 'c':
    case 'C':
      if (!paused) holdCurrentPiece();
      break;
    case 'p':
    case 'P':
      paused = !paused;
      document.getElementById('pause-overlay').classList.toggle('active', paused);
      break;
  }
});

// Restart button
document.getElementById('restart-btn').addEventListener('click', () => {
  board = createBoard();
  score = 0;
  level = 1;
  lines = 0;
  gameOver = false;
  holdPiece = null;
  canHold = true;
  dropCounter = 0;
  updateDisplay();
  drawHold();
  document.getElementById('game-over').classList.remove('active');
  spawnPiece();
  requestAnimationFrame(update);
});

// Initialize game
board = createBoard();
spawnPiece();
requestAnimationFrame(update);
</script>
