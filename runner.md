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
        <kbd>Space</kbd> / <kbd>↑</kbd> Jump &nbsp;|&nbsp;
        <kbd>Z</kbd> / <kbd>RShift</kbd> Run<br>
        <kbd>↓</kbd> Crouch / Enter pipe &nbsp;|&nbsp;
        <kbd>X</kbd> / <kbd>LShift</kbd> Shoot (with fire power)
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

// Player - Buttery smooth physics inspired by Super Mario Bros
const player = {
  x: 100,
  y: 300,
  // Sub-pixel position for smooth movement
  subX: 0,
  subY: 0,
  width: 24,
  height: 32,
  vx: 0,
  vy: 0,
  // Movement parameters tuned for smooth feel
  walkSpeed: 2.2,
  runSpeed: 3.8,
  accelGround: 0.18,     // Ground acceleration (smooth ramp up)
  decelGround: 0.25,     // Ground deceleration (responsive stop)
  accelAir: 0.08,        // Air acceleration (less control = momentum)
  decelAir: 0.02,        // Air decel (preserve momentum in air)
  turnBoost: 0.3,        // Extra decel when changing direction
  // Jump physics - Mario-style
  jumpForce: -11.5,
  jumpHoldGravity: 0.35, // Lower gravity while holding jump
  fallGravity: 0.55,     // Higher gravity when falling
  shortHopGravity: 0.8,  // Extra gravity for short hops
  // State
  grounded: false,
  wasGrounded: false,
  powered: false,
  powerTimer: 0,
  facing: 1,
  crouching: false,
  running: false,
  animFrame: 0,
  animTimer: 0,
  // Powerup states
  big: false,
  canShoot: false,
  fireballs: [],
  shootCooldown: 0,
  // Advanced platformer mechanics
  coyoteTime: 0,
  jumpBuffer: 0,
  jumpHeld: false,
  nearSecretPipe: false,
  invincible: 0,
  // Landing boost (small vertical when running fast)
  runningUpBoost: 0
};

// Physics constants - tuned for smooth Mario-like feel
const MAX_FALL_SPEED = 10;
const COYOTE_TIME_MAX = 6;   // ~100ms at 60fps
const JUMP_BUFFER_MAX = 8;   // ~133ms at 60fps
const RUN_THRESHOLD = 0.7;   // Speed to trigger running animation

// Delta time for smooth framerate
let lastTime = 0;
let deltaTime = 1;

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

  // Enemies with different types
  const enemyPositions = [
    { x: 300, y: GAME_HEIGHT - TILE_SIZE * 3, type: 'walker' },
    { x: 600, y: GAME_HEIGHT - TILE_SIZE * 3, type: 'jumper' },
    { x: 750, y: 248, type: 'walker' },
    { x: 1050, y: GAME_HEIGHT - TILE_SIZE * 3, type: 'chaser' },
    { x: 1150, y: 188, type: 'walker' },
    { x: 1350, y: GAME_HEIGHT - TILE_SIZE * 3, type: 'jumper' },
    { x: 1750, y: GAME_HEIGHT - TILE_SIZE * 3, type: 'chaser' },
    { x: 2050, y: GAME_HEIGHT - TILE_SIZE * 3, type: 'walker' },
    { x: 2450, y: 288, type: 'jumper' },
  ];
  enemyPositions.forEach(e => {
    level.enemies.push({
      x: e.x, y: e.y,
      width: 28, height: 28,
      vx: e.type === 'chaser' ? -0.6 : -0.8,
      vy: 0,
      type: e.type || 'walker',
      alive: true,
      grounded: true,
      jumpTimer: Math.random() * 60
    });
  });

  // Pipes (one leads to secret area)
  level.pipes = [
    { x: 650, y: GAME_HEIGHT - TILE_SIZE * 4, height: 2, secret: false, hasPiranha: true },
    { x: 1250, y: GAME_HEIGHT - TILE_SIZE * 5, height: 3, secret: true, hasPiranha: false }, // Secret pipe!
    { x: 1950, y: GAME_HEIGHT - TILE_SIZE * 4, height: 2, secret: false, hasPiranha: true },
    { x: 2300, y: GAME_HEIGHT - TILE_SIZE * 3, height: 1, secret: false, hasPiranha: false },
  ];

  // Initialize piranha plants
  level.piranhas = [];
  for (const pipe of level.pipes) {
    if (pipe.hasPiranha) {
      level.piranhas.push({
        x: pipe.x + TILE_SIZE / 2,
        y: pipe.y,
        baseY: pipe.y,
        height: 40,
        phase: Math.random() * Math.PI * 2, // Random starting phase
        speed: 0.02 + Math.random() * 0.01,
        extended: 0, // 0 = hidden, 1 = fully out
        waitTimer: 0,
        state: 'waiting' // waiting, rising, biting, falling
      });
    }
  }

  // Flag at end
  level.flag = { x: 2850, y: GAME_HEIGHT - TILE_SIZE * 8, height: 6 };

  // Secret area - Underground bonus room with proper level design
  level.secretArea = {
    x: 0, y: 0,
    width: 700, height: GAME_HEIGHT,
    coins: [
      // Row of coins on first platform
      { x: 100, y: 280, collected: false },
      { x: 140, y: 280, collected: false },
      { x: 180, y: 280, collected: false },
      { x: 220, y: 280, collected: false },
      // High coins requiring jump
      { x: 320, y: 200, collected: false },
      { x: 360, y: 200, collected: false },
      { x: 400, y: 200, collected: false },
      // Secret stash at the top
      { x: 500, y: 100, collected: false },
      { x: 540, y: 100, collected: false },
      { x: 580, y: 100, collected: false },
    ],
    platforms: [
      // Ground platform (spawn area)
      { x: 0, y: GAME_HEIGHT - TILE_SIZE * 2, w: TILE_SIZE * 8, h: TILE_SIZE * 2 },
      // Stepping stones up
      { x: 280, y: 320, w: TILE_SIZE * 4, h: TILE_SIZE },
      { x: 400, y: 260, w: TILE_SIZE * 3, h: TILE_SIZE },
      { x: 280, y: 200, w: TILE_SIZE * 5, h: TILE_SIZE },
      // Top platform with bonus coins
      { x: 480, y: 140, w: TILE_SIZE * 5, h: TILE_SIZE },
      // Exit platform
      { x: 550, y: GAME_HEIGHT - TILE_SIZE * 4, w: TILE_SIZE * 4, h: TILE_SIZE * 4 },
    ],
    exitPipe: { x: 580, y: GAME_HEIGHT - TILE_SIZE * 6 }
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

// Get all collidable platforms for current area
function getCollidablePlatforms() {
  let platforms = inSecretArea ?
    level.secretArea.platforms.map(p => ({ x: p.x, y: p.y, w: p.w, h: p.h, type: 'brick' })) :
    [...level.platforms];

  // Add pipes as solid platforms (only in main area)
  if (!inSecretArea) {
    for (const pipe of level.pipes) {
      platforms.push({
        x: pipe.x - 4,
        y: pipe.y,
        w: TILE_SIZE * 2 + 8,
        h: pipe.height * TILE_SIZE,
        type: 'pipe'
      });
    }
  }
  return platforms;
}

// Horizontal collision resolution
function resolveHorizontalCollisions() {
  const platforms = getCollidablePlatforms();

  for (const plat of platforms) {
    if (rectCollision(player, plat)) {
      if (player.vx > 0) {
        player.x = plat.x - player.width;
      } else if (player.vx < 0) {
        player.x = plat.x + plat.w;
      }
      player.vx = 0;
    }
  }
}

// Vertical collision resolution
function resolveVerticalCollisions() {
  player.grounded = false;
  const platforms = getCollidablePlatforms();

  for (const plat of platforms) {
    if (rectCollision(player, plat)) {
      if (player.vy > 0) {
        // Landing on platform
        player.y = plat.y - player.height;
        player.vy = 0;
        player.grounded = true;
      } else if (player.vy < 0) {
        // Hitting from below
        player.y = plat.y + plat.h;
        player.vy = 0;

        // Hit question block
        if (plat.type === 'question' && !plat.hit) {
          plat.hit = true;
          score += 100;
          screenShake = 5;
          spawnParticles(plat.x + TILE_SIZE/2, plat.y, 10, COLORS.coin);
          // Spawn powerup
          level.powerups.push({
            x: plat.x,
            y: plat.y - TILE_SIZE,
            targetY: plat.y - TILE_SIZE - 10,
            active: true,
            type: Math.random() > 0.5 ? 'grow' : 'fire'
          });
        }
      }
    }
  }

  // Ground collision (simple floor check)
  if (!inSecretArea && player.y > GAME_HEIGHT - TILE_SIZE * 2 - player.height) {
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

// Particle system
let particles = [];
let screenShake = 0;

function spawnParticles(x, y, count, color) {
  for (let i = 0; i < count; i++) {
    particles.push({
      x: x,
      y: y,
      vx: (Math.random() - 0.5) * 4,
      vy: (Math.random() - 1) * 3,
      life: 20 + Math.random() * 20,
      color: color,
      size: 2 + Math.random() * 3
    });
  }
}

function updateParticles() {
  for (let i = particles.length - 1; i >= 0; i--) {
    const p = particles[i];
    p.x += p.vx;
    p.y += p.vy;
    p.vy += 0.2;
    p.life--;
    if (p.life <= 0) {
      particles.splice(i, 1);
    }
  }
}

function drawParticles() {
  for (const p of particles) {
    ctx.globalAlpha = p.life / 40;
    ctx.fillStyle = p.color;
    ctx.fillRect(p.x - cameraX, p.y, p.size, p.size);
  }
  ctx.globalAlpha = 1;
}

// Fireball system
function shootFireball() {
  player.fireballs.push({
    x: player.x + (player.facing > 0 ? player.width : -8),
    y: player.y + player.height / 2,
    vx: player.facing * 6,
    vy: 0,
    bounces: 0
  });
  spawnParticles(player.x + player.width/2, player.y + player.height/2, 5, '#ff6600');
}

function updateFireballs() {
  for (let i = player.fireballs.length - 1; i >= 0; i--) {
    const fb = player.fireballs[i];
    fb.x += fb.vx;
    fb.vy += 0.3;
    fb.y += fb.vy;

    // Trail particles
    if (Math.random() > 0.5) {
      particles.push({
        x: fb.x,
        y: fb.y,
        vx: (Math.random() - 0.5) * 1,
        vy: (Math.random() - 0.5) * 1,
        life: 10,
        color: '#ff6600',
        size: 2
      });
    }

    // Bounce off ground
    if (fb.y > GAME_HEIGHT - TILE_SIZE * 2 - 8) {
      fb.y = GAME_HEIGHT - TILE_SIZE * 2 - 8;
      fb.vy = -5;
      fb.bounces++;
      spawnParticles(fb.x, fb.y, 3, '#ff9900');
    }

    // Bounce off platforms too
    const platforms = getCollidablePlatforms();
    for (const plat of platforms) {
      if (fb.x > plat.x && fb.x < plat.x + plat.w &&
          fb.y > plat.y - 5 && fb.y < plat.y + 5) {
        fb.vy = -5;
        fb.bounces++;
        break;
      }
    }

    // Remove if off screen or too many bounces
    if (fb.x < cameraX - 50 || fb.x > cameraX + GAME_WIDTH + 50 || fb.bounces > 4) {
      player.fireballs.splice(i, 1);
      continue;
    }

    // Hit enemies - more generous hitbox
    let hitEnemy = false;
    for (const enemy of level.enemies) {
      if (!enemy.alive) continue;
      // Generous collision (fireball radius + enemy box)
      const fbRadius = 10;
      if (fb.x + fbRadius > enemy.x && fb.x - fbRadius < enemy.x + enemy.width &&
          fb.y + fbRadius > enemy.y && fb.y - fbRadius < enemy.y + enemy.height) {
        enemy.alive = false;
        score += 100;
        screenShake = 4;
        spawnParticles(enemy.x + enemy.width/2, enemy.y + enemy.height/2, 20, COLORS.enemy);
        spawnParticles(fb.x, fb.y, 10, '#ff6600');
        player.fireballs.splice(i, 1);
        hitEnemy = true;
        break;
      }
    }
    if (hitEnemy) continue;
  }
}

function drawFireballs() {
  for (const fb of player.fireballs) {
    const screenX = fb.x - cameraX;
    // Glowing fireball
    ctx.fillStyle = '#ff4400';
    ctx.shadowColor = '#ff6600';
    ctx.shadowBlur = 10;
    ctx.beginPath();
    ctx.arc(screenX, fb.y, 6, 0, Math.PI * 2);
    ctx.fill();
    ctx.fillStyle = '#ffaa00';
    ctx.beginPath();
    ctx.arc(screenX, fb.y, 3, 0, Math.PI * 2);
    ctx.fill();
    ctx.shadowBlur = 0;
  }
}

// Update player with buttery smooth Mario-style physics
function updatePlayer() {
  // Reset per-frame state
  player.nearSecretPipe = false;
  player.wasGrounded = player.grounded;

  // Input
  const moveLeft = keys['ArrowLeft'] || keys['KeyA'];
  const moveRight = keys['ArrowRight'] || keys['KeyD'];
  const jumpPressed = keys['Space'] || keys['ArrowUp'] || keys['KeyW'];
  const runHeld = keys['ShiftRight'] || keys['KeyZ'];

  // Crouching (only when grounded)
  player.crouching = (keys['ArrowDown'] || keys['KeyS']) && player.grounded;

  // Determine max speed based on run button
  const maxSpeed = runHeld ? player.runSpeed : player.walkSpeed;
  player.running = Math.abs(player.vx) > RUN_THRESHOLD;

  // Horizontal movement with smooth acceleration curves
  const accel = player.grounded ? player.accelGround : player.accelAir;
  const decel = player.grounded ? player.decelGround : player.decelAir;

  if (moveLeft && !player.crouching) {
    // Turning around bonus (faster direction change)
    const turnBonus = (player.vx > 0) ? player.turnBoost : 0;
    player.vx -= (accel + turnBonus);
    if (player.vx < -maxSpeed) player.vx = -maxSpeed;
    player.facing = -1;
  } else if (moveRight && !player.crouching) {
    const turnBonus = (player.vx < 0) ? player.turnBoost : 0;
    player.vx += (accel + turnBonus);
    if (player.vx > maxSpeed) player.vx = maxSpeed;
    player.facing = 1;
  } else {
    // Smooth deceleration with exponential decay for silky feel
    if (Math.abs(player.vx) < 0.1) {
      player.vx = 0;
    } else {
      // Lerp toward zero for smooth stop
      player.vx *= (1 - decel);
    }
  }

  // Coyote time - allows jumping shortly after leaving platform
  if (player.grounded) {
    player.coyoteTime = COYOTE_TIME_MAX;
  } else if (player.coyoteTime > 0) {
    player.coyoteTime--;
  }

  // Jump buffering - pressing jump before landing registers
  if (jumpPressed && !player.jumpHeld) {
    player.jumpBuffer = JUMP_BUFFER_MAX;
  }
  if (player.jumpBuffer > 0) {
    player.jumpBuffer--;
  }

  // Execute jump if conditions met
  const canJump = player.grounded || player.coyoteTime > 0;
  if (player.jumpBuffer > 0 && canJump && !player.crouching) {
    // Jump force varies slightly with horizontal speed (like Mario)
    const speedBonus = Math.abs(player.vx) * 0.08;
    player.vy = player.jumpForce - speedBonus;
    player.grounded = false;
    player.coyoteTime = 0;
    player.jumpBuffer = 0;
    spawnParticles(player.x + player.width/2, player.y + player.height, 5, '#666');
  }
  player.jumpHeld = jumpPressed;

  // Variable gravity for smooth jump arc (key to Mario feel)
  let gravity;
  if (player.vy < 0) {
    // Rising
    if (jumpPressed) {
      // Hold jump for higher jump
      gravity = player.jumpHoldGravity;
    } else {
      // Released jump early - cut height
      gravity = player.shortHopGravity;
    }
  } else {
    // Falling - faster gravity for snappy feel
    gravity = player.fallGravity;
  }

  player.vy += gravity;

  // Smooth cap on fall speed
  if (player.vy > MAX_FALL_SPEED) {
    player.vy = MAX_FALL_SPEED;
  }

  // Running upward boost (subtle lift when running fast, like SMB1)
  if (player.grounded && Math.abs(player.vx) > player.walkSpeed * 0.9) {
    player.y -= 0.2;
  }

  // Move and resolve collisions separately for X and Y
  player.x += player.vx;
  resolveHorizontalCollisions();

  player.y += player.vy;
  resolveVerticalCollisions();

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
      player.canShoot = false;
    }
  }

  // Update fireballs
  updateFireballs();

  // Shoot fireball
  if (player.canShoot && (keys['KeyX'] || keys['ShiftLeft']) && !player.shootCooldown) {
    shootFireball();
    player.shootCooldown = 20;
  }
  if (player.shootCooldown > 0) player.shootCooldown--;

  // Check collisions
  checkCoinCollisions();
  checkEnemyCollisions();
  checkPowerupCollisions();
  checkPipeCollisions();
  checkFlagCollision();

  // Landing effects
  if (player.grounded && !player.wasGrounded && player.vy >= 0) {
    // Dust particles on landing
    const intensity = Math.min(8, Math.abs(player.vy));
    spawnParticles(player.x + player.width/2, player.y + player.height, intensity, '#888');
  }
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
        screenShake = 3;
        spawnParticles(enemy.x + enemy.width/2, enemy.y + enemy.height/2, 15, COLORS.enemy);
      } else if (player.invincible > 0) {
        // Invincible - ignore collision
        continue;
      } else if (player.powered || player.big) {
        // Powered/big - kill enemy
        enemy.alive = false;
        score += 100;
        screenShake = 3;
        spawnParticles(enemy.x + enemy.width/2, enemy.y + enemy.height/2, 15, COLORS.enemy);
      } else {
        die();
      }
    }
  }
}

// Powerup help tracking
let shownPowerupHelp = { grow: false, fire: false };
let powerupHelpMessage = '';
let powerupHelpTimer = 0;

// Powerup collision
function checkPowerupCollisions() {
  for (const powerup of level.powerups) {
    if (!powerup.active) continue;

    const rect = { x: powerup.x, y: powerup.y, w: 24, h: 24 };
    if (rectCollision(player, rect)) {
      powerup.active = false;
      score += 200;
      screenShake = 5;

      if (powerup.type === 'grow') {
        // Growth powerup - makes player bigger
        if (!player.big) {
          player.big = true;
          player.height = 48;
          player.y -= 16; // Adjust position so player doesn't clip into ground
          spawnParticles(player.x + player.width/2, player.y + player.height/2, 20, COLORS.powerup);

          // Show help first time
          if (!shownPowerupHelp.grow) {
            shownPowerupHelp.grow = true;
            powerupHelpMessage = 'POWER UP! You can now take one hit!';
            powerupHelpTimer = 180;
          }
        }
        player.powered = true;
        player.powerTimer = 900; // 15 seconds
      } else if (powerup.type === 'fire') {
        // Fire powerup - allows shooting fireballs
        player.canShoot = true;
        player.powered = true;
        player.powerTimer = 900;
        spawnParticles(player.x + player.width/2, player.y + player.height/2, 20, '#ff6600');

        // Show help first time
        if (!shownPowerupHelp.fire) {
          shownPowerupHelp.fire = true;
          powerupHelpMessage = 'FIRE POWER! Press X or SHIFT to shoot!';
          powerupHelpTimer = 180;
        }
      }
    }
  }
}

// Pipe collision (secret area)
function checkPipeCollisions() {
  if (inSecretArea) {
    // Check exit pipe in secret area
    const exitPipe = level.secretArea.exitPipe;
    const playerCenterX = player.x + player.width / 2;
    const playerBottom = player.y + player.height;

    if (player.crouching &&
        playerCenterX > exitPipe.x - 20 && playerCenterX < exitPipe.x + TILE_SIZE * 2 + 20 &&
        player.y > exitPipe.y - TILE_SIZE * 2 && player.y < exitPipe.y + TILE_SIZE * 2) {
      exitSecretArea();
    }
    return;
  }

  for (const pipe of level.pipes) {
    const playerCenterX = player.x + player.width / 2;
    const playerBottom = player.y + player.height;
    const pipeTop = pipe.y;

    // More lenient collision box for pipe entry
    const nearPipe = playerCenterX > pipe.x - 15 &&
                     playerCenterX < pipe.x + TILE_SIZE * 2 + 15 &&
                     player.y + player.height > pipeTop - 20 &&
                     player.y < pipeTop + TILE_SIZE * 2;

    // Track if near secret pipe for UI hint
    if (pipe.secret && nearPipe) {
      player.nearSecretPipe = true;
    }

    // Enter secret pipe when pressing down near it
    if (pipe.secret && player.crouching && nearPipe) {
      enterSecretArea();
    }
  }
}

// Secret area transitions
function enterSecretArea() {
  if (secretFound) return;
  secretFound = true;
  inSecretArea = true;
  // Spawn on the ground platform
  player.x = 100;
  player.y = GAME_HEIGHT - TILE_SIZE * 2 - player.height - 10;
  player.vx = 0;
  player.vy = 0;
  player.grounded = true;
  score += 500;

  // Show notification
  const notif = document.getElementById('secret-notification');
  notif.style.display = 'block';
  setTimeout(() => notif.style.display = 'none', 2000);
}

function exitSecretArea() {
  inSecretArea = false;
  // Return to main level near where you entered
  player.x = 1300;
  player.y = GAME_HEIGHT - TILE_SIZE * 3 - player.height;
  player.vx = 0;
  player.vy = 0;
  player.grounded = true;
}

// Flag collision (win)
function checkFlagCollision() {
  if (inSecretArea || !level.flag) return;

  if (player.x > level.flag.x - 20 && player.x < level.flag.x + 40) {
    winGame();
  }
}

// Update enemies with improved AI
function updateEnemies() {
  if (inSecretArea) return;

  for (const enemy of level.enemies) {
    if (!enemy.alive) continue;

    // Different AI behaviors based on enemy type
    if (enemy.type === 'chaser') {
      // Chaser enemies move toward player when nearby
      const dx = player.x - enemy.x;
      const dist = Math.abs(dx);
      if (dist < 200 && dist > 10) {
        enemy.vx = Math.sign(dx) * 1.2;
      }
    } else if (enemy.type === 'jumper') {
      // Jumping enemies hop periodically
      enemy.jumpTimer = (enemy.jumpTimer || 0) + 1;
      if (enemy.jumpTimer > 90 && enemy.grounded) {
        enemy.vy = -8;
        enemy.grounded = false;
        enemy.jumpTimer = 0;
      }
      enemy.vy = (enemy.vy || 0) + 0.4;
      enemy.y += enemy.vy;
      if (enemy.y > GAME_HEIGHT - TILE_SIZE * 3) {
        enemy.y = GAME_HEIGHT - TILE_SIZE * 3;
        enemy.vy = 0;
        enemy.grounded = true;
      }
    }

    enemy.x += enemy.vx;

    // Edge detection - reverse at gaps
    if (enemy.y >= GAME_HEIGHT - TILE_SIZE * 3 - enemy.height) {
      let overGround = false;
      const checkX = enemy.x + (enemy.vx > 0 ? enemy.width + 10 : -10);
      for (const plat of level.platforms) {
        if (plat.type === 'ground' && checkX > plat.x && checkX < plat.x + plat.w) {
          overGround = true;
          break;
        }
      }
      if (!overGround) {
        enemy.vx *= -1;
      }
    }

    // Wall collision - reverse at pipes
    for (const pipe of level.pipes) {
      if (enemy.x + enemy.width > pipe.x && enemy.x < pipe.x + TILE_SIZE * 2 &&
          enemy.y + enemy.height > pipe.y) {
        enemy.vx *= -1;
        enemy.x += enemy.vx * 2;
      }
    }
  }
}

// Update piranha plants
function updatePiranhas() {
  if (inSecretArea || !level.piranhas) return;

  for (const piranha of level.piranhas) {
    // State machine for piranha behavior
    switch (piranha.state) {
      case 'waiting':
        piranha.waitTimer++;
        // Don't emerge if player is too close to pipe
        const playerDist = Math.abs(player.x - piranha.x);
        if (piranha.waitTimer > 120 && playerDist > 40) {
          piranha.state = 'rising';
          piranha.waitTimer = 0;
        }
        break;

      case 'rising':
        piranha.extended = Math.min(1, piranha.extended + 0.03);
        if (piranha.extended >= 1) {
          piranha.state = 'biting';
          piranha.waitTimer = 0;
        }
        break;

      case 'biting':
        // Snap animation
        piranha.waitTimer++;
        piranha.bitePhase = Math.sin(piranha.waitTimer * 0.3) > 0;
        if (piranha.waitTimer > 90) {
          piranha.state = 'falling';
        }
        break;

      case 'falling':
        piranha.extended = Math.max(0, piranha.extended - 0.03);
        if (piranha.extended <= 0) {
          piranha.state = 'waiting';
          piranha.waitTimer = 0;
        }
        break;
    }

    // Update visual position
    piranha.y = piranha.baseY - (piranha.height * piranha.extended);
  }
}

// Check piranha collisions
function checkPiranhaCollisions() {
  if (inSecretArea || !level.piranhas) return;

  for (const piranha of level.piranhas) {
    if (piranha.extended < 0.3) continue; // Can't hit if mostly hidden

    const piranhaRect = {
      x: piranha.x - 12,
      y: piranha.y,
      w: 24,
      h: piranha.height * piranha.extended
    };

    if (rectCollision(player, piranhaRect)) {
      if (player.powered || player.big) {
        // Powered player destroys piranha
        piranha.extended = 0;
        piranha.state = 'waiting';
        piranha.waitTimer = 0;
        score += 200;
        screenShake = 5;
        spawnParticles(piranha.x, piranha.y, 15, '#00aa00');
      } else {
        die();
      }
    }

    // Fireballs can kill piranhas
    for (let i = player.fireballs.length - 1; i >= 0; i--) {
      const fb = player.fireballs[i];
      if (fb.x > piranhaRect.x && fb.x < piranhaRect.x + piranhaRect.w &&
          fb.y > piranhaRect.y && fb.y < piranhaRect.y + piranhaRect.h) {
        piranha.extended = 0;
        piranha.state = 'waiting';
        piranha.waitTimer = 200; // Longer wait after being killed
        score += 200;
        screenShake = 3;
        spawnParticles(piranha.x, piranha.y, 15, '#00aa00');
        player.fireballs.splice(i, 1);
      }
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

// Camera with smooth lerping
let targetCameraX = 0;
function updateCamera() {
  if (inSecretArea) {
    cameraX = 0;
    targetCameraX = 0;
    return;
  }

  // Calculate target camera position (player slightly left of center for forward visibility)
  const lookAhead = player.vx * 15; // Look ahead based on velocity
  targetCameraX = player.x - GAME_WIDTH / 3 + lookAhead;
  targetCameraX = Math.max(0, Math.min(targetCameraX, LEVEL_WIDTH * TILE_SIZE - GAME_WIDTH));

  // Smooth lerp camera toward target for buttery feel
  const lerpSpeed = 0.08;
  cameraX += (targetCameraX - cameraX) * lerpSpeed;
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

    // Update animation
    enemy.animTimer = (enemy.animTimer || 0) + 1;
    if (enemy.animTimer > 10) {
      enemy.animTimer = 0;
      enemy.animFrame = ((enemy.animFrame || 0) + 1) % 2;
    }

    const flip = enemy.vx > 0;
    drawEnemy(screenX, enemy.y, flip, enemy.animFrame || 0);
  }
}

// Pixel art enemy sprite drawing (virus/malware themed)
function drawEnemy(x, y, flip, frame) {
  const s = 4; // Pixel size
  const main = COLORS.enemy;
  const dark = '#aa2020';
  const light = '#ff6666';

  // Malware virus sprites - angry little bugs
  const sprites = {
    walk0: [
      '  ████  ',
      ' ██████ ',
      '█●▓▓▓▓●█',
      '██▓▓▓▓██',
      ' ██████ ',
      '█ ████ █',
      '█  ██  █'
    ],
    walk1: [
      '  ████  ',
      ' ██████ ',
      '█●▓▓▓▓●█',
      '██▓▓▓▓██',
      ' ██████ ',
      ' █ ██ █ ',
      '█      █'
    ]
  };

  const sprite = sprites['walk' + frame] || sprites.walk0;
  const charW = 8;

  for (let row = 0; row < sprite.length; row++) {
    const line = sprite[row];
    for (let col = 0; col < charW; col++) {
      const actualCol = flip ? (charW - 1 - col) : col;
      const char = line[actualCol] || ' ';

      let color = null;
      if (char === '█') color = main;
      else if (char === '▓') color = dark;
      else if (char === '●') color = '#fff';
      else if (char === ' ') continue;

      if (color) {
        ctx.fillStyle = color;
        ctx.fillRect(x + col * (s - 1), y + row * (s - 1), s - 1, s - 1);
      }
    }
  }
}

function drawPowerups() {
  for (const powerup of level.powerups) {
    if (!powerup.active) continue;

    const screenX = powerup.x - cameraX;
    if (screenX < -24 || screenX > GAME_WIDTH) continue;

    // Different powerup visuals
    if (powerup.type === 'grow') {
      // Mushroom-like grow powerup
      ctx.fillStyle = '#00ffaa';
      ctx.shadowColor = '#00ffaa';
      ctx.shadowBlur = 10;
      // Stem
      ctx.fillRect(screenX + 8, powerup.y + 12, 8, 12);
      // Cap
      ctx.beginPath();
      ctx.arc(screenX + 12, powerup.y + 10, 12, Math.PI, 0);
      ctx.fill();
      ctx.fillStyle = '#fff';
      ctx.beginPath();
      ctx.arc(screenX + 8, powerup.y + 6, 3, 0, Math.PI * 2);
      ctx.arc(screenX + 16, powerup.y + 8, 2, 0, Math.PI * 2);
      ctx.fill();
    } else if (powerup.type === 'fire') {
      // Fire flower powerup
      ctx.fillStyle = '#ff6600';
      ctx.shadowColor = '#ff4400';
      ctx.shadowBlur = 15;
      // Stem
      ctx.fillStyle = '#00aa00';
      ctx.fillRect(screenX + 10, powerup.y + 14, 4, 10);
      // Petals
      ctx.fillStyle = '#ff6600';
      for (let i = 0; i < 5; i++) {
        const angle = (i / 5) * Math.PI * 2 + Date.now() / 500;
        const px = screenX + 12 + Math.cos(angle) * 8;
        const py = powerup.y + 8 + Math.sin(angle) * 8;
        ctx.beginPath();
        ctx.arc(px, py, 5, 0, Math.PI * 2);
        ctx.fill();
      }
      // Center
      ctx.fillStyle = '#ffff00';
      ctx.beginPath();
      ctx.arc(screenX + 12, powerup.y + 8, 4, 0, Math.PI * 2);
      ctx.fill();
    } else {
      // Default powerup
      ctx.fillStyle = COLORS.powerup;
      ctx.shadowColor = COLORS.powerup;
      ctx.shadowBlur = 10;
      ctx.fillRect(screenX, powerup.y, 24, 24);
      ctx.fillStyle = '#000';
      ctx.font = 'bold 14px monospace';
      ctx.fillText('↑', screenX + 6, powerup.y + 18);
    }
    ctx.shadowBlur = 0;
  }
}

// Draw piranha plants
function drawPiranhas() {
  if (inSecretArea || !level.piranhas) return;

  for (const piranha of level.piranhas) {
    if (piranha.extended < 0.05) continue;

    const screenX = piranha.x - cameraX;
    if (screenX < -30 || screenX > GAME_WIDTH + 30) continue;

    const visibleHeight = piranha.height * piranha.extended;

    // Stem
    ctx.fillStyle = '#006600';
    ctx.fillRect(screenX - 6, piranha.y, 12, visibleHeight);

    // Head
    const headY = piranha.y;
    const mouthOpen = piranha.bitePhase ? 8 : 2;

    // Head body
    ctx.fillStyle = '#00aa00';
    ctx.beginPath();
    ctx.ellipse(screenX, headY + 10, 14, 12, 0, 0, Math.PI * 2);
    ctx.fill();

    // Spots
    ctx.fillStyle = '#008800';
    ctx.beginPath();
    ctx.arc(screenX - 5, headY + 8, 3, 0, Math.PI * 2);
    ctx.arc(screenX + 6, headY + 12, 2, 0, Math.PI * 2);
    ctx.fill();

    // Mouth
    ctx.fillStyle = '#220000';
    ctx.beginPath();
    ctx.ellipse(screenX, headY + 2, 10, mouthOpen, 0, 0, Math.PI * 2);
    ctx.fill();

    // Teeth
    ctx.fillStyle = '#fff';
    for (let i = -2; i <= 2; i++) {
      ctx.beginPath();
      ctx.moveTo(screenX + i * 4, headY + 2 - mouthOpen/2);
      ctx.lineTo(screenX + i * 4 - 2, headY + 2 + 3);
      ctx.lineTo(screenX + i * 4 + 2, headY + 2 + 3);
      ctx.fill();
    }

    // Eyes (menacing)
    ctx.fillStyle = '#ff0000';
    ctx.beginPath();
    ctx.arc(screenX - 6, headY + 6, 3, 0, Math.PI * 2);
    ctx.arc(screenX + 6, headY + 6, 3, 0, Math.PI * 2);
    ctx.fill();
    ctx.fillStyle = '#000';
    ctx.beginPath();
    ctx.arc(screenX - 6, headY + 6, 1.5, 0, Math.PI * 2);
    ctx.arc(screenX + 6, headY + 6, 1.5, 0, Math.PI * 2);
    ctx.fill();
  }
}

function drawPlayer() {
  // Invincibility flicker - skip drawing every other frame
  if (player.invincible > 0 && Math.floor(player.invincible / 3) % 2 === 0) {
    return;
  }

  const screenX = player.x - (inSecretArea ? 0 : cameraX);

  // Color based on power state
  let baseColor, darkColor, lightColor;
  if (player.canShoot) {
    baseColor = '#ff6600';
    darkColor = '#aa3300';
    lightColor = '#ffaa44';
  } else if (player.big || player.powered) {
    baseColor = COLORS.playerPowered;
    darkColor = '#008888';
    lightColor = '#88ffff';
  } else {
    baseColor = COLORS.player;
    darkColor = '#6a6b1a';
    lightColor = '#d4d76a';
  }

  // Animation frame
  player.animTimer++;
  if (player.animTimer > 8) {
    player.animTimer = 0;
    if (Math.abs(player.vx) > 0.5) {
      player.animFrame = (player.animFrame + 1) % 4;
    } else {
      player.animFrame = 0;
    }
  }

  // Calculate squash/stretch
  let scaleX = 1, scaleY = 1;
  if (!player.grounded) {
    if (player.vy < -2) {
      // Jumping up - stretch vertically
      scaleX = 0.85;
      scaleY = 1.15;
    } else if (player.vy > 2) {
      // Falling - squash
      scaleX = 1.1;
      scaleY = 0.9;
    }
  }

  // Power glow
  if (player.powered || player.big || player.canShoot) {
    ctx.shadowColor = baseColor;
    ctx.shadowBlur = 15;
  }

  ctx.save();

  // Apply squash/stretch
  const px = Math.floor(screenX);
  const py = Math.floor(player.crouching ? player.y + 12 : player.y);
  const centerX = px + player.width / 2;
  const centerY = py + player.height / 2;

  ctx.translate(centerX, centerY);
  ctx.scale(scaleX, scaleY);
  ctx.translate(-centerX, -centerY);

  const flip = player.facing < 0;

  // Draw different based on big state
  if (player.big) {
    // Big player - draw larger sprite
    if (player.crouching) {
      drawPixelBig(px - 4, py - 8, 32, 32, baseColor, darkColor, lightColor, flip, 'crouch');
    } else if (!player.grounded) {
      drawPixelBig(px - 4, py - 8, 32, 48, baseColor, darkColor, lightColor, flip, 'jump');
    } else if (Math.abs(player.vx) > 0.5) {
      drawPixelBig(px - 4, py - 8, 32, 48, baseColor, darkColor, lightColor, flip, 'walk' + (player.animFrame % 2));
    } else {
      drawPixelBig(px - 4, py - 8, 32, 48, baseColor, darkColor, lightColor, flip, 'idle');
    }
  } else {
    // Normal size player
    if (player.crouching) {
      drawPixel(px, py, 20, 20, baseColor, darkColor, lightColor, flip, 'crouch');
    } else if (!player.grounded) {
      drawPixel(px, py, 24, 32, baseColor, darkColor, lightColor, flip, 'jump');
    } else if (Math.abs(player.vx) > 0.5) {
      drawPixel(px, py, 24, 32, baseColor, darkColor, lightColor, flip, 'walk' + (player.animFrame % 2));
    } else {
      drawPixel(px, py, 24, 32, baseColor, darkColor, lightColor, flip, 'idle');
    }
  }

  ctx.restore();
  ctx.shadowBlur = 0;
}

// Bigger sprite for powered-up player
function drawPixelBig(x, y, w, h, main, dark, light, flip, pose) {
  const s = 5; // Larger pixel size

  const sprites = {
    idle: [
      '   ████   ',
      '  ██████  ',
      '  █▓▓▓▓█  ',
      '  █●██●█  ',
      '  ██▓▓██  ',
      '   ████   ',
      '  ██████  ',
      ' ████████ ',
      '██████████',
      '██ ████ ██',
      '█  ████  █',
      '   ████   ',
      '  █    █  '
    ],
    walk0: [
      '   ████   ',
      '  ██████  ',
      '  █▓▓▓▓█  ',
      '  █●██●█  ',
      '  ██▓▓██  ',
      '   ████   ',
      '  ██████  ',
      ' ████████ ',
      '██████████',
      '██ ████   ',
      '█  ████   ',
      '  ████    ',
      ' █    █   '
    ],
    walk1: [
      '   ████   ',
      '  ██████  ',
      '  █▓▓▓▓█  ',
      '  █●██●█  ',
      '  ██▓▓██  ',
      '   ████   ',
      '  ██████  ',
      ' ████████ ',
      '██████████',
      '   ████ ██',
      '   ████  █',
      '    ████  ',
      '   █    █ '
    ],
    jump: [
      '   ████   ',
      '  ██████  ',
      '  █▓▓▓▓█  ',
      '  █●██●█  ',
      '  ██▓▓██  ',
      '   ████   ',
      ' ████████ ',
      '█ ██████ █',
      '  ██████  ',
      '   █  █   ',
      '  █    █  ',
      ' █      █ '
    ],
    crouch: [
      '   ████   ',
      '  ██████  ',
      '  █●██●█  ',
      '  ██▓▓██  ',
      ' ████████ ',
      '██████████',
      '██ ████ ██'
    ]
  };

  const sprite = sprites[pose] || sprites.idle;
  const charW = 10;

  for (let row = 0; row < sprite.length; row++) {
    const line = sprite[row];
    for (let col = 0; col < charW; col++) {
      const actualCol = flip ? (charW - 1 - col) : col;
      const char = line[actualCol] || ' ';

      let color = null;
      if (char === '█') color = main;
      else if (char === '▓') color = light;
      else if (char === '●') color = '#000';
      else if (char === ' ') continue;

      if (color) {
        ctx.fillStyle = color;
        ctx.fillRect(x + col * (s - 1), y + row * (s - 1), s - 1, s - 1);
      }
    }
  }
}

// Pixel art sprite drawing
function drawPixel(x, y, w, h, main, dark, light, flip, pose) {
  const s = 4; // Pixel size for retro look

  // Simple pixel art character based on pose
  const sprites = {
    idle: [
      '  ████  ',
      ' ██████ ',
      ' █▓▓▓▓█ ',
      ' █●██●█ ',
      ' ██▓▓██ ',
      '  ████  ',
      ' ██████ ',
      '████████',
      '██ ██ ██',
      '█  ██  █',
      '   ██   ',
      '  █  █  '
    ],
    walk0: [
      '  ████  ',
      ' ██████ ',
      ' █▓▓▓▓█ ',
      ' █●██●█ ',
      ' ██▓▓██ ',
      '  ████  ',
      ' ██████ ',
      '████████',
      '██ ██ ██',
      '█  ██   ',
      '  ██    ',
      ' █   █  '
    ],
    walk1: [
      '  ████  ',
      ' ██████ ',
      ' █▓▓▓▓█ ',
      ' █●██●█ ',
      ' ██▓▓██ ',
      '  ████  ',
      ' ██████ ',
      '████████',
      '██ ██ ██',
      '   ██  █',
      '    ██  ',
      '  █   █ '
    ],
    jump: [
      '  ████  ',
      ' ██████ ',
      ' █▓▓▓▓█ ',
      ' █●██●█ ',
      ' ██▓▓██ ',
      '  ████  ',
      '████████',
      '█ ████ █',
      '  ████  ',
      '  █  █  ',
      ' █    █ ',
      '█      █'
    ],
    crouch: [
      '  ████  ',
      ' ██████ ',
      ' █●██●█ ',
      ' ██▓▓██ ',
      '████████',
      '██ ██ ██'
    ]
  };

  const sprite = sprites[pose] || sprites.idle;
  const charW = 8;

  for (let row = 0; row < sprite.length; row++) {
    const line = sprite[row];
    for (let col = 0; col < charW; col++) {
      const actualCol = flip ? (charW - 1 - col) : col;
      const char = line[actualCol] || ' ';

      let color = null;
      if (char === '█') color = main;
      else if (char === '▓') color = light;
      else if (char === '●') color = '#000';
      else if (char === ' ') continue;

      if (color) {
        ctx.fillStyle = color;
        ctx.fillRect(x + col * (s - 1), y + row * (s - 1), s - 1, s - 1);
      }
    }
  }
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
  // If big, shrink instead of dying
  if (player.big) {
    player.big = false;
    player.height = 32;
    player.powered = false;
    player.canShoot = false;
    screenShake = 10;
    spawnParticles(player.x + player.width/2, player.y + player.height/2, 20, '#ff0000');
    // Brief invincibility
    player.invincible = 60;
    return;
  }

  lives--;
  updateHUD();
  screenShake = 15;
  spawnParticles(player.x + player.width/2, player.y + player.height/2, 30, '#ff0000');

  if (lives <= 0) {
    gameOver();
  } else {
    // Respawn
    player.x = 100;
    player.y = 300;
    player.vx = 0;
    player.vy = 0;
    player.powered = false;
    player.canShoot = false;
    player.big = false;
    player.height = 32;
    player.fireballs = [];
    player.invincible = 120;
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
  particles = [];
  screenShake = 0;

  player.x = 100;
  player.y = 300;
  player.vx = 0;
  player.vy = 0;
  player.powered = false;
  player.powerTimer = 0;
  player.canShoot = false;
  player.big = false;
  player.height = 32;
  player.fireballs = [];
  player.invincible = 0;
  player.coyoteTime = 0;
  player.jumpBuffer = 0;

  initLevel();
  updateHUD();

  gameRunning = true;
  requestAnimationFrame(gameLoop);
}

// Main game loop
function gameLoop() {
  if (!gameRunning) return;

  // Update all systems
  updatePlayer();
  updateEnemies();
  updatePiranhas();
  updatePowerups();
  updateParticles();
  updateCamera();
  checkPiranhaCollisions();

  // Handle invincibility
  if (player.invincible > 0) {
    player.invincible--;
  }

  // Handle screen shake
  if (screenShake > 0) {
    screenShake *= 0.9;
    if (screenShake < 0.5) screenShake = 0;
  }

  // Apply screen shake to canvas
  ctx.save();
  if (screenShake > 0) {
    ctx.translate(
      (Math.random() - 0.5) * screenShake * 2,
      (Math.random() - 0.5) * screenShake * 2
    );
  }

  // Draw everything
  if (inSecretArea) {
    drawSecretAreaBG();
  } else {
    drawBackground();
  }
  drawPlatforms();
  drawPipes();
  drawPiranhas();
  drawCoins();
  drawEnemies();
  drawPowerups();
  drawFireballs();
  drawFlag();
  drawPlayer();
  drawParticles();

  // Draw power indicator
  if (player.canShoot) {
    ctx.fillStyle = '#ff6600';
    ctx.font = '10px monospace';
    ctx.fillText('FIRE: X/SHIFT', 10, GAME_HEIGHT - 10);
  }

  // Draw powerup help message
  if (powerupHelpTimer > 0) {
    powerupHelpTimer--;
    ctx.save();
    ctx.fillStyle = 'rgba(0, 0, 0, 0.8)';
    ctx.fillRect(GAME_WIDTH/2 - 180, 60, 360, 40);
    ctx.strokeStyle = COLORS.powerup;
    ctx.lineWidth = 2;
    ctx.strokeRect(GAME_WIDTH/2 - 180, 60, 360, 40);
    ctx.fillStyle = COLORS.powerup;
    ctx.font = 'bold 14px monospace';
    ctx.textAlign = 'center';
    ctx.fillText(powerupHelpMessage, GAME_WIDTH/2, 85);
    ctx.textAlign = 'left';
    ctx.restore();
  }

  // Draw hint near secret pipe
  if (player.nearSecretPipe && !secretFound) {
    ctx.fillStyle = COLORS.secret;
    ctx.font = '12px monospace';
    ctx.globalAlpha = 0.5 + Math.sin(Date.now() / 200) * 0.3;
    ctx.fillText('↓ PRESS DOWN', player.x - cameraX - 20, player.y - 20);
    ctx.globalAlpha = 1;
  }

  ctx.restore();

  requestAnimationFrame(gameLoop);
}

// Initialize
initLevel();
updateHUD();
</script>
