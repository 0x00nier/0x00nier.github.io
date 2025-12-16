---
layout: default
title: 0x00Runner
permalink: /runner.html
---

<style>
/* ============================================
   0x00RUNNER - Terminal Style Platformer
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
  --accent-cyan: #00ffff;
  --accent-yellow: #fabd2f;
  --accent-red: #fb4934;
  --glow-green: rgba(184, 187, 38, 0.4);
}

* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

#game-container {
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

/* Canvas wrapper */
#canvas-wrapper {
  position: relative;
  border: 2px solid var(--border-color);
  background: #050505;
}

#game-canvas {
  display: block;
  image-rendering: pixelated;
  image-rendering: crisp-edges;
}

/* HUD */
#hud {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  padding: 12px 16px;
  display: flex;
  justify-content: space-between;
  background: linear-gradient(to bottom, rgba(0,0,0,0.8) 0%, transparent 100%);
  font-size: 14px;
  z-index: 10;
}

.hud-item {
  color: var(--text-secondary);
}

.hud-item span {
  color: var(--accent-green);
  text-shadow: 0 0 10px var(--glow-green);
}

/* Overlays */
.overlay {
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
  text-align: center;
  padding: 20px;
}

.overlay.active {
  display: flex;
}

.overlay h2 {
  color: var(--accent-green);
  font-size: 32px;
  text-shadow: 0 0 20px var(--glow-green);
  margin-bottom: 16px;
  text-transform: uppercase;
  letter-spacing: 4px;
}

.overlay p {
  color: var(--text-secondary);
  margin-bottom: 8px;
  font-size: 14px;
}

.overlay .score-display {
  color: var(--accent-yellow);
  font-size: 24px;
  margin: 16px 0;
}

.overlay button {
  background: var(--bg-tertiary);
  border: 1px solid var(--accent-green);
  color: var(--accent-green);
  padding: 12px 32px;
  cursor: pointer;
  font-family: inherit;
  font-size: 14px;
  text-transform: uppercase;
  letter-spacing: 2px;
  margin-top: 16px;
  transition: all 0.2s ease;
}

.overlay button:hover {
  background: var(--accent-green);
  color: var(--bg-primary);
  box-shadow: 0 0 20px var(--glow-green);
}

/* Controls display */
.controls-info {
  color: var(--text-muted);
  font-size: 11px;
  margin-top: 24px;
  line-height: 1.8;
}

.controls-info kbd {
  background: var(--bg-tertiary);
  padding: 2px 8px;
  border-radius: 3px;
  border: 1px solid var(--border-color);
  font-family: inherit;
  color: var(--text-secondary);
}

/* Back button */
#back-btn {
  position: absolute;
  top: 16px;
  left: 16px;
  z-index: 200;
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
  font-size: 12px;
  color: var(--accent-green);
  text-transform: uppercase;
  letter-spacing: 4px;
  margin-bottom: 12px;
  text-shadow: 0 0 10px var(--glow-green);
}

/* Secret found notification */
#secret-notification {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: rgba(0, 0, 0, 0.9);
  border: 2px solid var(--accent-yellow);
  padding: 16px 32px;
  color: var(--accent-yellow);
  font-size: 18px;
  text-transform: uppercase;
  letter-spacing: 2px;
  z-index: 50;
  display: none;
  animation: pulse 0.5s ease-in-out;
}

@keyframes pulse {
  0%, 100% { transform: translate(-50%, -50%) scale(1); }
  50% { transform: translate(-50%, -50%) scale(1.1); }
}
</style>

<div id="game-container">
  <a href="/game.html" id="back-btn">
    <span>←</span> BACK
  </a>

  <div id="game-title">0x00RUNNER // LEVEL 1</div>

  <div id="canvas-wrapper">
    <canvas id="game-canvas"></canvas>

    <div id="hud">
      <div class="hud-item">COINS: <span id="coin-count">0</span></div>
      <div class="hud-item">SCORE: <span id="score">0</span></div>
      <div class="hud-item">LIVES: <span id="lives">3</span></div>
    </div>

    <div id="start-overlay" class="overlay active">
      <h2>0x00Runner</h2>
      <p>Navigate the system. Collect data packets.</p>
      <p>Find the secret backdoor.</p>
      <div class="controls-info">
        <kbd>←</kbd> <kbd>→</kbd> Move &nbsp;|&nbsp;
        <kbd>Space</kbd> / <kbd>↑</kbd> Jump<br>
        <kbd>↓</kbd> Crouch / Enter pipe
      </div>
      <button onclick="startGame()">INITIALIZE</button>
    </div>

    <div id="game-over-overlay" class="overlay">
      <h2>SYSTEM CRASH</h2>
      <div class="score-display">Score: <span id="final-score">0</span></div>
      <button onclick="restartGame()">REBOOT</button>
    </div>

    <div id="win-overlay" class="overlay">
      <h2>ACCESS GRANTED</h2>
      <p>Level 1 Complete!</p>
      <div class="score-display">Score: <span id="win-score">0</span></div>
      <button onclick="restartGame()">REPLAY</button>
    </div>

    <div id="secret-notification">SECRET FOUND! +500</div>
  </div>
</div>

<script>
// ============================================
// 0x00RUNNER - Terminal Style Platformer
// Inspired by classic Mario mechanics
// ============================================

const canvas = document.getElementById('game-canvas');
const ctx = canvas.getContext('2d');

// Game dimensions
const GAME_WIDTH = 800;
const GAME_HEIGHT = 480;
const TILE_SIZE = 32;

canvas.width = GAME_WIDTH;
canvas.height = GAME_HEIGHT;

// Colors (terminal theme)
const COLORS = {
  bg: '#050508',
  player: '#b8bb26',
  playerPowered: '#00ffff',
  platform: '#1a1a1a',
  platformBorder: '#333333',
  coin: '#fabd2f',
  enemy: '#fb4934',
  powerup: '#00ffff',
  flag: '#b8bb26',
  pipe: '#2d5016',
  pipeHighlight: '#3d7020',
  secret: '#ff00ff',
  text: '#b8bb26'
};

// Game state
let gameRunning = false;
let score = 0;
let coins = 0;
let lives = 3;
let cameraX = 0;
let secretFound = false;
let inSecretArea = false;

// Player
const player = {
  x: 100,
  y: 300,
  width: 24,
  height: 32,
  vx: 0,
  vy: 0,
  speed: 5,
  jumpForce: -14,
  grounded: false,
  powered: false,
  powerTimer: 0,
  facing: 1,
  crouching: false
};

// Physics
const GRAVITY = 0.6;
const FRICTION = 0.85;

// Level data - tile-based (0=empty, 1=ground, 2=brick, 3=question, 4=pipe, 5=flag, 6=secret)
const LEVEL_WIDTH = 100;
const level = {
  platforms: [],
  coins: [],
  enemies: [],
  powerups: [],
  pipes: [],
  flag: null,
  secretArea: { x: 2800, y: 100, width: 400, height: 300 }
};

// Initialize level
function initLevel() {
  level.platforms = [];
  level.coins = [];
  level.enemies = [];
  level.powerups = [];
  level.pipes = [];

  // Ground
  for (let x = 0; x < LEVEL_WIDTH * TILE_SIZE; x += TILE_SIZE) {
    // Gaps
    if ((x >= 400 && x < 464) || (x >= 900 && x < 964) || (x >= 1500 && x < 1600)) continue;
    level.platforms.push({ x, y: GAME_HEIGHT - TILE_SIZE, w: TILE_SIZE, h: TILE_SIZE, type: 'ground' });
    level.platforms.push({ x, y: GAME_HEIGHT - TILE_SIZE * 2, w: TILE_SIZE, h: TILE_SIZE, type: 'ground' });
  }

  // Floating platforms
  const floatingPlatforms = [
    // Start area
    { x: 200, y: 320, w: 3 },
    { x: 350, y: 250, w: 4, hasCoins: true },
    { x: 500, y: 300, w: 2 },

    // After first gap
    { x: 550, y: 200, w: 5, hasCoins: true },
    { x: 700, y: 280, w: 3 },
    { x: 800, y: 180, w: 4, hasQuestion: true },

    // Middle section
    { x: 1000, y: 300, w: 2 },
    { x: 1100, y: 220, w: 6, hasCoins: true },
    { x: 1300, y: 150, w: 3, hasQuestion: true },
    { x: 1400, y: 280, w: 4 },

    // After second gap
    { x: 1650, y: 320, w: 3 },
    { x: 1800, y: 250, w: 5, hasCoins: true },
    { x: 2000, y: 180, w: 4 },
    { x: 2150, y: 280, w: 3, hasQuestion: true },

    // Pre-flag area
    { x: 2400, y: 320, w: 6, hasCoins: true },
    { x: 2600, y: 220, w: 4 },

    // Secret area platforms (high up, hard to reach)
    { x: 2700, y: 100, w: 3, secret: true },
  ];

  floatingPlatforms.forEach(p => {
    for (let i = 0; i < p.w; i++) {
      level.platforms.push({
        x: p.x + i * TILE_SIZE,
        y: p.y,
        w: TILE_SIZE,
        h: TILE_SIZE,
        type: p.secret ? 'secret' : 'brick'
      });
    }

    // Add coins above platform
    if (p.hasCoins) {
      for (let i = 0; i < p.w; i++) {
        level.coins.push({ x: p.x + i * TILE_SIZE + 8, y: p.y - 40, collected: false });
      }
    }

    // Add question block with powerup
    if (p.hasQuestion) {
      level.platforms.push({
        x: p.x + TILE_SIZE,
        y: p.y - TILE_SIZE * 2,
        w: TILE_SIZE,
        h: TILE_SIZE,
        type: 'question',
        hit: false
      });
    }
  });

  // Extra coins scattered
  const extraCoins = [
    { x: 150, y: 360 }, { x: 250, y: 280 },
    { x: 600, y: 150 }, { x: 750, y: 240 },
    { x: 1050, y: 260 }, { x: 1200, y: 180 },
    { x: 1700, y: 280 }, { x: 1900, y: 210 },
    { x: 2500, y: 280 }, { x: 2550, y: 280 },
    // Secret area coins
    { x: 2720, y: 60 }, { x: 2760, y: 60 }, { x: 2800, y: 60 },
  ];
  extraCoins.forEach(c => level.coins.push({ ...c, collected: false }));

  // Enemies
  const enemyPositions = [
    { x: 300, y: GAME_HEIGHT - TILE_SIZE * 3 },
    { x: 600, y: GAME_HEIGHT - TILE_SIZE * 3 },
    { x: 750, y: 248 },
    { x: 1050, y: GAME_HEIGHT - TILE_SIZE * 3 },
    { x: 1150, y: 188 },
    { x: 1350, y: GAME_HEIGHT - TILE_SIZE * 3 },
    { x: 1750, y: GAME_HEIGHT - TILE_SIZE * 3 },
    { x: 2050, y: GAME_HEIGHT - TILE_SIZE * 3 },
    { x: 2450, y: 288 },
  ];
  enemyPositions.forEach(e => {
    level.enemies.push({
      x: e.x, y: e.y,
      width: 28, height: 28,
      vx: -1.5,
      alive: true
    });
  });

  // Pipes (one leads to secret area)
  level.pipes = [
    { x: 650, y: GAME_HEIGHT - TILE_SIZE * 4, height: 2, secret: false },
    { x: 1250, y: GAME_HEIGHT - TILE_SIZE * 5, height: 3, secret: true }, // Secret pipe!
    { x: 1950, y: GAME_HEIGHT - TILE_SIZE * 4, height: 2, secret: false },
    { x: 2300, y: GAME_HEIGHT - TILE_SIZE * 3, height: 1, secret: false },
  ];

  // Flag at end
  level.flag = { x: 2850, y: GAME_HEIGHT - TILE_SIZE * 8, height: 6 };

  // Secret area
  level.secretArea = {
    x: 0, y: -300,
    width: 500, height: 250,
    coins: [
      { x: 100, y: -250, collected: false },
      { x: 150, y: -250, collected: false },
      { x: 200, y: -250, collected: false },
      { x: 250, y: -250, collected: false },
      { x: 300, y: -250, collected: false },
    ],
    platforms: [
      { x: 50, y: -200, w: TILE_SIZE * 15, h: TILE_SIZE },
      { x: 50, y: -100, w: TILE_SIZE * 15, h: TILE_SIZE },
    ],
    exitPipe: { x: 400, y: -100 - TILE_SIZE * 2 }
  };
}

// Input handling
const keys = {};
document.addEventListener('keydown', e => {
  keys[e.code] = true;
  if (['Space', 'ArrowUp', 'ArrowDown', 'ArrowLeft', 'ArrowRight'].includes(e.code)) {
    e.preventDefault();
  }
});
document.addEventListener('keyup', e => keys[e.code] = false);

// Collision detection
function rectCollision(a, b) {
  return a.x < b.x + b.w &&
         a.x + a.width > b.x &&
         a.y < b.y + b.h &&
         a.y + a.height > b.y;
}

function checkPlatformCollisions() {
  player.grounded = false;

  const platforms = inSecretArea ?
    level.secretArea.platforms.map(p => ({ x: p.x, y: p.y, w: p.w, h: p.h, type: 'brick' })) :
    level.platforms;

  for (const plat of platforms) {
    if (rectCollision(player, plat)) {
      // Collision from above
      if (player.vy > 0 && player.y + player.height - player.vy <= plat.y) {
        player.y = plat.y - player.height;
        player.vy = 0;
        player.grounded = true;
      }
      // Collision from below
      else if (player.vy < 0 && player.y - player.vy >= plat.y + plat.h) {
        player.y = plat.y + plat.h;
        player.vy = 0;

        // Hit question block
        if (plat.type === 'question' && !plat.hit) {
          plat.hit = true;
          score += 100;
          // Spawn powerup
          level.powerups.push({
            x: plat.x,
            y: plat.y - TILE_SIZE,
            active: true
          });
        }
      }
      // Horizontal collision
      else {
        if (player.vx > 0) player.x = plat.x - player.width;
        else if (player.vx < 0) player.x = plat.x + plat.w;
        player.vx = 0;
      }
    }
  }

  // Ground collision (simple floor)
  if (!inSecretArea && player.y > GAME_HEIGHT - TILE_SIZE * 2 - player.height) {
    // Check if over a gap
    let overGround = false;
    for (const plat of level.platforms) {
      if (plat.type === 'ground' &&
          player.x + player.width > plat.x &&
          player.x < plat.x + plat.w) {
        overGround = true;
        break;
      }
    }

    if (overGround) {
      player.y = GAME_HEIGHT - TILE_SIZE * 2 - player.height;
      player.vy = 0;
      player.grounded = true;
    }
  }
}

// Update player
function updatePlayer() {
  // Horizontal movement
  if (keys['ArrowLeft'] || keys['KeyA']) {
    player.vx = -player.speed;
    player.facing = -1;
  } else if (keys['ArrowRight'] || keys['KeyD']) {
    player.vx = player.speed;
    player.facing = 1;
  } else {
    player.vx *= FRICTION;
  }

  // Crouching
  player.crouching = keys['ArrowDown'] || keys['KeyS'];

  // Jumping
  if ((keys['Space'] || keys['ArrowUp'] || keys['KeyW']) && player.grounded) {
    player.vy = player.jumpForce;
    player.grounded = false;
  }

  // Apply gravity
  player.vy += GRAVITY;
  if (player.vy > 15) player.vy = 15;

  // Update position
  player.x += player.vx;
  player.y += player.vy;

  // Boundaries
  if (player.x < 0) player.x = 0;
  if (!inSecretArea && player.x > LEVEL_WIDTH * TILE_SIZE - player.width) {
    player.x = LEVEL_WIDTH * TILE_SIZE - player.width;
  }

  // Fall death
  if (player.y > GAME_HEIGHT + 100) {
    die();
  }

  // Power timer
  if (player.powered) {
    player.powerTimer--;
    if (player.powerTimer <= 0) {
      player.powered = false;
    }
  }

  // Check collisions
  checkPlatformCollisions();
  checkCoinCollisions();
  checkEnemyCollisions();
  checkPowerupCollisions();
  checkPipeCollisions();
  checkFlagCollision();
}

// Coin collection
function checkCoinCollisions() {
  const coinList = inSecretArea ? level.secretArea.coins : level.coins;

  for (const coin of coinList) {
    if (!coin.collected) {
      const coinRect = { x: coin.x, y: coin.y, w: 20, h: 20 };
      if (rectCollision(player, coinRect)) {
        coin.collected = true;
        coins++;
        score += 50;
        updateHUD();
      }
    }
  }
}

// Enemy collision
function checkEnemyCollisions() {
  if (inSecretArea) return;

  for (const enemy of level.enemies) {
    if (!enemy.alive) continue;

    const enemyRect = { x: enemy.x, y: enemy.y, w: enemy.width, h: enemy.height };

    if (rectCollision(player, enemyRect)) {
      // Stomp from above
      if (player.vy > 0 && player.y + player.height - player.vy < enemy.y + 10) {
        enemy.alive = false;
        player.vy = -8;
        score += 100;
      } else if (!player.powered) {
        die();
      } else {
        // Powered - kill enemy
        enemy.alive = false;
        score += 100;
      }
    }
  }
}

// Powerup collision
function checkPowerupCollisions() {
  for (const powerup of level.powerups) {
    if (!powerup.active) continue;

    const rect = { x: powerup.x, y: powerup.y, w: 24, h: 24 };
    if (rectCollision(player, rect)) {
      powerup.active = false;
      player.powered = true;
      player.powerTimer = 600; // 10 seconds at 60fps
      score += 200;
    }
  }
}

// Pipe collision (secret area)
function checkPipeCollisions() {
  if (inSecretArea) {
    // Check exit pipe in secret area
    const exitPipe = level.secretArea.exitPipe;
    if (player.crouching &&
        player.x > exitPipe.x && player.x < exitPipe.x + TILE_SIZE * 2 &&
        player.y > exitPipe.y - TILE_SIZE && player.y < exitPipe.y + TILE_SIZE) {
      exitSecretArea();
    }
    return;
  }

  for (const pipe of level.pipes) {
    if (pipe.secret && player.crouching) {
      if (player.x > pipe.x && player.x < pipe.x + TILE_SIZE * 2 &&
          player.y > pipe.y - TILE_SIZE && player.y < pipe.y + TILE_SIZE * 2) {
        enterSecretArea();
      }
    }
  }
}

// Secret area transitions
function enterSecretArea() {
  if (secretFound) return;
  secretFound = true;
  inSecretArea = true;
  player.x = 100;
  player.y = -150;
  player.vx = 0;
  player.vy = 0;
  score += 500;

  // Show notification
  const notif = document.getElementById('secret-notification');
  notif.style.display = 'block';
  setTimeout(() => notif.style.display = 'none', 2000);
}

function exitSecretArea() {
  inSecretArea = false;
  player.x = 1300;
  player.y = 200;
  player.vx = 0;
  player.vy = 0;
}

// Flag collision (win)
function checkFlagCollision() {
  if (inSecretArea || !level.flag) return;

  if (player.x > level.flag.x - 20 && player.x < level.flag.x + 40) {
    winGame();
  }
}

// Update enemies
function updateEnemies() {
  if (inSecretArea) return;

  for (const enemy of level.enemies) {
    if (!enemy.alive) continue;

    enemy.x += enemy.vx;

    // Simple AI - reverse at edges or walls
    let onPlatform = false;
    for (const plat of level.platforms) {
      if (enemy.x + enemy.width > plat.x && enemy.x < plat.x + plat.w &&
          enemy.y + enemy.height >= plat.y && enemy.y + enemy.height <= plat.y + 10) {
        onPlatform = true;
      }
    }

    // Check ground
    if (enemy.y >= GAME_HEIGHT - TILE_SIZE * 3) {
      let overGround = false;
      const nextX = enemy.x + enemy.vx * 20;
      for (const plat of level.platforms) {
        if (plat.type === 'ground' && nextX + enemy.width > plat.x && nextX < plat.x + plat.w) {
          overGround = true;
          break;
        }
      }
      if (!overGround) enemy.vx *= -1;
    }
  }
}

// Update powerups (float up from blocks)
function updatePowerups() {
  for (const powerup of level.powerups) {
    if (powerup.active && powerup.y > powerup.targetY) {
      powerup.y -= 1;
    }
  }
}

// Camera
function updateCamera() {
  if (inSecretArea) {
    cameraX = 0;
    return;
  }

  const targetX = player.x - GAME_WIDTH / 3;
  cameraX = Math.max(0, Math.min(targetX, LEVEL_WIDTH * TILE_SIZE - GAME_WIDTH));
}

// Draw functions
function drawBackground() {
  ctx.fillStyle = COLORS.bg;
  ctx.fillRect(0, 0, GAME_WIDTH, GAME_HEIGHT);

  // Grid effect
  ctx.strokeStyle = '#0a0a0a';
  ctx.lineWidth = 1;
  for (let x = -cameraX % 64; x < GAME_WIDTH; x += 64) {
    ctx.beginPath();
    ctx.moveTo(x, 0);
    ctx.lineTo(x, GAME_HEIGHT);
    ctx.stroke();
  }
  for (let y = 0; y < GAME_HEIGHT; y += 64) {
    ctx.beginPath();
    ctx.moveTo(0, y);
    ctx.lineTo(GAME_WIDTH, y);
    ctx.stroke();
  }

  // Distant buildings silhouette
  ctx.fillStyle = '#080808';
  for (let i = 0; i < 20; i++) {
    const x = (i * 200 - cameraX * 0.3) % (GAME_WIDTH + 400) - 200;
    const h = 80 + Math.sin(i * 1.5) * 40;
    ctx.fillRect(x, GAME_HEIGHT - h - TILE_SIZE * 2, 60 + i % 3 * 20, h);
  }
}

function drawPlatforms() {
  const platforms = inSecretArea ?
    level.secretArea.platforms.map(p => ({ x: p.x, y: p.y, w: p.w, h: p.h, type: 'brick' })) :
    level.platforms;

  for (const plat of platforms) {
    const screenX = plat.x - (inSecretArea ? 0 : cameraX);
    if (screenX < -TILE_SIZE || screenX > GAME_WIDTH) continue;

    let color = COLORS.platform;
    let borderColor = COLORS.platformBorder;

    if (plat.type === 'question') {
      color = plat.hit ? '#2a2a00' : '#4a4a00';
      borderColor = plat.hit ? '#3a3a00' : COLORS.coin;
    } else if (plat.type === 'secret') {
      color = '#1a0020';
      borderColor = '#3a0040';
    }

    ctx.fillStyle = color;
    ctx.fillRect(screenX, plat.y, plat.w, plat.h);
    ctx.strokeStyle = borderColor;
    ctx.lineWidth = 2;
    ctx.strokeRect(screenX, plat.y, plat.w, plat.h);

    // Question mark
    if (plat.type === 'question' && !plat.hit) {
      ctx.fillStyle = COLORS.coin;
      ctx.font = 'bold 20px monospace';
      ctx.fillText('?', screenX + 10, plat.y + 24);
    }
  }
}

function drawPipes() {
  if (inSecretArea) {
    // Draw exit pipe
    const pipe = level.secretArea.exitPipe;
    ctx.fillStyle = COLORS.pipe;
    ctx.fillRect(pipe.x, pipe.y, TILE_SIZE * 2, TILE_SIZE * 2);
    ctx.fillStyle = COLORS.pipeHighlight;
    ctx.fillRect(pipe.x - 4, pipe.y, TILE_SIZE * 2 + 8, TILE_SIZE / 2);
    ctx.fillStyle = '#fff';
    ctx.font = '10px monospace';
    ctx.fillText('EXIT', pipe.x + 12, pipe.y + 40);
    return;
  }

  for (const pipe of level.pipes) {
    const screenX = pipe.x - cameraX;
    if (screenX < -TILE_SIZE * 2 || screenX > GAME_WIDTH) continue;

    ctx.fillStyle = pipe.secret ? '#162050' : COLORS.pipe;
    ctx.fillRect(screenX, pipe.y, TILE_SIZE * 2, pipe.height * TILE_SIZE);

    // Pipe top
    ctx.fillStyle = pipe.secret ? '#203080' : COLORS.pipeHighlight;
    ctx.fillRect(screenX - 4, pipe.y, TILE_SIZE * 2 + 8, TILE_SIZE / 2);

    // Secret indicator
    if (pipe.secret && !secretFound) {
      ctx.fillStyle = COLORS.secret;
      ctx.globalAlpha = 0.3 + Math.sin(Date.now() / 200) * 0.2;
      ctx.fillRect(screenX, pipe.y, TILE_SIZE * 2, TILE_SIZE / 2);
      ctx.globalAlpha = 1;
    }
  }
}

function drawCoins() {
  const coinList = inSecretArea ? level.secretArea.coins : level.coins;

  for (const coin of coinList) {
    if (coin.collected) continue;

    const screenX = coin.x - (inSecretArea ? 0 : cameraX);
    if (screenX < -20 || screenX > GAME_WIDTH) continue;

    // Animated coin
    const wobble = Math.sin(Date.now() / 150 + coin.x) * 2;

    ctx.fillStyle = COLORS.coin;
    ctx.beginPath();
    ctx.ellipse(screenX + 10, coin.y + 10 + wobble, 8, 10, 0, 0, Math.PI * 2);
    ctx.fill();

    // Shine
    ctx.fillStyle = '#fff';
    ctx.globalAlpha = 0.5;
    ctx.beginPath();
    ctx.ellipse(screenX + 7, coin.y + 7 + wobble, 2, 3, 0, 0, Math.PI * 2);
    ctx.fill();
    ctx.globalAlpha = 1;
  }
}

function drawEnemies() {
  if (inSecretArea) return;

  for (const enemy of level.enemies) {
    if (!enemy.alive) continue;

    const screenX = enemy.x - cameraX;
    if (screenX < -enemy.width || screenX > GAME_WIDTH) continue;

    // Enemy body
    ctx.fillStyle = COLORS.enemy;
    ctx.fillRect(screenX, enemy.y, enemy.width, enemy.height);

    // Eyes
    ctx.fillStyle = '#fff';
    ctx.fillRect(screenX + 6, enemy.y + 6, 6, 6);
    ctx.fillRect(screenX + 16, enemy.y + 6, 6, 6);

    // Pupils
    ctx.fillStyle = '#000';
    const pupilOffset = enemy.vx > 0 ? 2 : 0;
    ctx.fillRect(screenX + 8 + pupilOffset, enemy.y + 8, 3, 3);
    ctx.fillRect(screenX + 18 + pupilOffset, enemy.y + 8, 3, 3);
  }
}

function drawPowerups() {
  for (const powerup of level.powerups) {
    if (!powerup.active) continue;

    const screenX = powerup.x - cameraX;
    if (screenX < -24 || screenX > GAME_WIDTH) continue;

    // Glowing powerup
    ctx.fillStyle = COLORS.powerup;
    ctx.shadowColor = COLORS.powerup;
    ctx.shadowBlur = 10;
    ctx.fillRect(screenX, powerup.y, 24, 24);

    // Icon
    ctx.fillStyle = '#000';
    ctx.font = 'bold 14px monospace';
    ctx.fillText('↑', screenX + 6, powerup.y + 18);
    ctx.shadowBlur = 0;
  }
}

function drawPlayer() {
  const screenX = player.x - (inSecretArea ? 0 : cameraX);

  // Power glow
  if (player.powered) {
    ctx.shadowColor = COLORS.playerPowered;
    ctx.shadowBlur = 15;
  }

  // Body
  ctx.fillStyle = player.powered ? COLORS.playerPowered : COLORS.player;
  const height = player.crouching ? player.height * 0.6 : player.height;
  const y = player.crouching ? player.y + player.height * 0.4 : player.y;
  ctx.fillRect(screenX, y, player.width, height);

  // Face
  ctx.fillStyle = '#000';
  const eyeY = y + 8;
  const eyeOffset = player.facing > 0 ? 4 : 0;
  ctx.fillRect(screenX + 6 + eyeOffset, eyeY, 4, 4);
  ctx.fillRect(screenX + 14 + eyeOffset, eyeY, 4, 4);

  ctx.shadowBlur = 0;
}

function drawFlag() {
  if (inSecretArea || !level.flag) return;

  const screenX = level.flag.x - cameraX;
  if (screenX < -40 || screenX > GAME_WIDTH) return;

  // Pole
  ctx.fillStyle = '#444';
  ctx.fillRect(screenX + 14, level.flag.y, 4, level.flag.height * TILE_SIZE);

  // Flag
  ctx.fillStyle = COLORS.flag;
  ctx.beginPath();
  ctx.moveTo(screenX + 18, level.flag.y);
  ctx.lineTo(screenX + 50, level.flag.y + 20);
  ctx.lineTo(screenX + 18, level.flag.y + 40);
  ctx.closePath();
  ctx.fill();

  // Top
  ctx.fillStyle = COLORS.coin;
  ctx.beginPath();
  ctx.arc(screenX + 16, level.flag.y - 5, 6, 0, Math.PI * 2);
  ctx.fill();
}

function drawSecretAreaBG() {
  if (!inSecretArea) return;

  ctx.fillStyle = '#0a0015';
  ctx.fillRect(0, 0, GAME_WIDTH, GAME_HEIGHT);

  // Trippy background
  for (let i = 0; i < 20; i++) {
    ctx.strokeStyle = `rgba(255, 0, 255, ${0.1 - i * 0.005})`;
    ctx.lineWidth = 2;
    ctx.strokeRect(
      GAME_WIDTH / 2 - 50 - i * 30 + Math.sin(Date.now() / 500 + i) * 10,
      GAME_HEIGHT / 2 - 50 - i * 20,
      100 + i * 60,
      100 + i * 40
    );
  }

  ctx.fillStyle = COLORS.secret;
  ctx.font = '16px monospace';
  ctx.fillText('// SECRET BACKDOOR //', 150, 50);
}

// HUD update
function updateHUD() {
  document.getElementById('coin-count').textContent = coins;
  document.getElementById('score').textContent = score;
  document.getElementById('lives').textContent = lives;
}

// Game states
function die() {
  lives--;
  updateHUD();

  if (lives <= 0) {
    gameOver();
  } else {
    // Respawn
    player.x = 100;
    player.y = 300;
    player.vx = 0;
    player.vy = 0;
    player.powered = false;
    inSecretArea = false;
    cameraX = 0;
  }
}

function gameOver() {
  gameRunning = false;
  document.getElementById('final-score').textContent = score;
  document.getElementById('game-over-overlay').classList.add('active');
}

function winGame() {
  gameRunning = false;
  score += 1000; // Completion bonus
  document.getElementById('win-score').textContent = score;
  document.getElementById('win-overlay').classList.add('active');
}

function startGame() {
  document.getElementById('start-overlay').classList.remove('active');
  gameRunning = true;
  requestAnimationFrame(gameLoop);
}

function restartGame() {
  document.querySelectorAll('.overlay').forEach(o => o.classList.remove('active'));

  // Reset all state
  score = 0;
  coins = 0;
  lives = 3;
  cameraX = 0;
  secretFound = false;
  inSecretArea = false;

  player.x = 100;
  player.y = 300;
  player.vx = 0;
  player.vy = 0;
  player.powered = false;
  player.powerTimer = 0;

  initLevel();
  updateHUD();

  gameRunning = true;
  requestAnimationFrame(gameLoop);
}

// Main game loop
function gameLoop() {
  if (!gameRunning) return;

  // Update
  updatePlayer();
  updateEnemies();
  updatePowerups();
  updateCamera();

  // Draw
  if (inSecretArea) {
    drawSecretAreaBG();
  } else {
    drawBackground();
  }
  drawPlatforms();
  drawPipes();
  drawCoins();
  drawEnemies();
  drawPowerups();
  drawFlag();
  drawPlayer();

  requestAnimationFrame(gameLoop);
}

// Initialize
initLevel();
updateHUD();
</script>
