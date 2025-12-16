---
layout: default
title: Matrix Terminal
permalink: /matrix-terminal.html
---

<style>
/* ============================================
   MATRIX TERMINAL SIMULATOR
   Inspired by Ly Display Manager animations
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
}

* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

#matrix-container {
  background: var(--bg-primary);
  min-height: 90vh;
  display: flex;
  flex-direction: column;
  position: relative;
  overflow: hidden;
  font-family: 'JetBrains Mono', 'Fira Code', 'Source Code Pro', Monaco, monospace;
}

/* Canvas */
#matrix-canvas {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 1;
}

#matrix-canvas.retro {
  image-rendering: pixelated;
  image-rendering: crisp-edges;
}

/* Control Panel */
#control-panel {
  position: absolute;
  top: 16px;
  right: 16px;
  z-index: 100;
  background: rgba(10, 10, 10, 0.95);
  border: 1px solid var(--border-color);
  padding: 20px;
  min-width: 300px;
  max-width: 340px;
  max-height: calc(100vh - 100px);
  overflow-y: auto;
  backdrop-filter: blur(10px);
  transition: transform 0.3s ease, opacity 0.3s ease;
}

#control-panel.collapsed {
  transform: translateX(calc(100% + 20px));
  opacity: 0;
  pointer-events: none;
}

/* Toggle Button */
#panel-toggle {
  position: absolute;
  top: 16px;
  right: 16px;
  z-index: 101;
  background: rgba(10, 10, 10, 0.9);
  border: 1px solid var(--border-color);
  color: var(--text-secondary);
  padding: 8px 12px;
  cursor: pointer;
  font-family: inherit;
  font-size: 12px;
  transition: all 0.2s ease;
}

#panel-toggle:hover {
  border-color: var(--accent-green);
  color: var(--accent-green);
}

#control-panel:not(.collapsed) ~ #panel-toggle {
  right: 372px;
}

/* Panel Header */
.panel-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 20px;
  padding-bottom: 12px;
  border-bottom: 1px solid var(--border-color);
}

.panel-title {
  font-size: 14px;
  color: var(--text-primary);
  text-transform: uppercase;
  letter-spacing: 2px;
}

.panel-close {
  background: none;
  border: none;
  color: var(--text-muted);
  cursor: pointer;
  font-size: 18px;
  padding: 4px;
  line-height: 1;
}

.panel-close:hover {
  color: var(--text-primary);
}

/* Section Headers */
.section-header {
  font-size: 10px;
  color: var(--text-muted);
  text-transform: uppercase;
  letter-spacing: 2px;
  margin-bottom: 12px;
  margin-top: 20px;
  padding-bottom: 6px;
  border-bottom: 1px solid var(--border-color);
}

.section-header:first-of-type {
  margin-top: 0;
}

/* Control Groups */
.control-group {
  margin-bottom: 16px;
}

.control-group:last-child {
  margin-bottom: 0;
}

.control-label {
  display: flex;
  align-items: center;
  justify-content: space-between;
  font-size: 11px;
  color: var(--text-secondary);
  text-transform: uppercase;
  letter-spacing: 1px;
  margin-bottom: 8px;
}

.control-value {
  color: var(--accent-green);
  font-weight: bold;
}

/* Sliders */
input[type="range"] {
  -webkit-appearance: none;
  width: 100%;
  height: 4px;
  background: var(--bg-tertiary);
  border-radius: 2px;
  outline: none;
  cursor: pointer;
}

input[type="range"]::-webkit-slider-thumb {
  -webkit-appearance: none;
  width: 14px;
  height: 14px;
  background: var(--accent-green);
  border-radius: 50%;
  cursor: pointer;
  transition: transform 0.1s ease;
}

input[type="range"]::-webkit-slider-thumb:hover {
  transform: scale(1.2);
}

input[type="range"]::-moz-range-thumb {
  width: 14px;
  height: 14px;
  background: var(--accent-green);
  border-radius: 50%;
  cursor: pointer;
  border: none;
}

/* Mode Selector (Matrix vs Fire) */
.mode-selector {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 8px;
  margin-bottom: 16px;
}

.mode-btn {
  background: var(--bg-tertiary);
  border: 1px solid var(--border-color);
  padding: 12px 8px;
  color: var(--text-secondary);
  cursor: pointer;
  font-family: inherit;
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 1px;
  transition: all 0.2s ease;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 6px;
}

.mode-btn:hover {
  border-color: var(--text-muted);
}

.mode-btn.active {
  border-color: var(--accent-green);
  color: var(--accent-green);
  background: rgba(184, 187, 38, 0.1);
}

.mode-icon {
  font-size: 20px;
}

/* Theme Grid */
.theme-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 8px;
}

.theme-btn {
  background: var(--bg-tertiary);
  border: 1px solid var(--border-color);
  padding: 10px 8px;
  color: var(--text-secondary);
  cursor: pointer;
  font-family: inherit;
  font-size: 10px;
  text-transform: uppercase;
  letter-spacing: 1px;
  transition: all 0.2s ease;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 6px;
}

.theme-btn:hover {
  border-color: var(--text-muted);
}

.theme-btn.active {
  border-color: var(--accent-green);
  color: var(--accent-green);
}

.theme-preview {
  width: 20px;
  height: 20px;
  border-radius: 50%;
  border: 2px solid currentColor;
}

.theme-btn[data-theme="matrix"] .theme-preview { background: linear-gradient(135deg, #00ff00, #003300); }
.theme-btn[data-theme="doom"] .theme-preview { background: linear-gradient(135deg, #ff4400, #660000); }
.theme-btn[data-theme="cyberpunk"] .theme-preview { background: linear-gradient(135deg, #ff00ff, #00ffff); }
.theme-btn[data-theme="void"] .theme-preview { background: linear-gradient(135deg, #ffffff, #888888); }
.theme-btn[data-theme="blood"] .theme-preview { background: linear-gradient(135deg, #ff0000, #330000); }
.theme-btn[data-theme="amber"] .theme-preview { background: linear-gradient(135deg, #ffaa00, #553300); }

/* Render Style Toggle */
.render-toggle {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 8px;
}

.render-btn {
  background: var(--bg-tertiary);
  border: 1px solid var(--border-color);
  padding: 8px;
  color: var(--text-secondary);
  cursor: pointer;
  font-family: inherit;
  font-size: 10px;
  text-transform: uppercase;
  letter-spacing: 1px;
  transition: all 0.2s ease;
}

.render-btn:hover {
  border-color: var(--text-muted);
}

.render-btn.active {
  border-color: var(--accent-green);
  color: var(--accent-green);
}

/* Character Set Toggle */
.charset-options {
  display: flex;
  flex-direction: column;
  gap: 6px;
}

.charset-option {
  display: flex;
  align-items: center;
  gap: 8px;
  cursor: pointer;
  font-size: 11px;
  color: var(--text-secondary);
}

.charset-option input {
  accent-color: var(--accent-green);
}

/* Back Button */
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

/* Action buttons */
.action-btn {
  width: 100%;
  background: var(--bg-tertiary);
  border: 1px solid var(--border-color);
  color: var(--text-secondary);
  padding: 10px;
  cursor: pointer;
  font-family: inherit;
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 1px;
  margin-top: 8px;
  transition: all 0.2s ease;
}

.action-btn:hover {
  border-color: var(--accent-green);
  color: var(--accent-green);
}

/* Stats Display */
.stats-display {
  display: flex;
  justify-content: space-between;
  font-size: 10px;
  color: var(--text-muted);
  margin-top: 16px;
  padding-top: 12px;
  border-top: 1px solid var(--border-color);
}

/* Keyboard hints */
.keyboard-hints {
  font-size: 9px;
  color: var(--text-muted);
  margin-top: 12px;
  padding-top: 12px;
  border-top: 1px solid var(--border-color);
  line-height: 1.6;
}

.keyboard-hints kbd {
  background: var(--bg-tertiary);
  padding: 2px 6px;
  border-radius: 3px;
  border: 1px solid var(--border-color);
  font-family: inherit;
}

/* Mini Music Player */
#music-player {
  position: absolute;
  bottom: 16px;
  left: 16px;
  z-index: 100;
}

#music-btn {
  background: rgba(10, 10, 10, 0.9);
  border: 1px solid var(--border-color);
  color: var(--text-secondary);
  width: 40px;
  height: 40px;
  cursor: pointer;
  font-size: 18px;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all 0.2s ease;
}

#music-btn:hover {
  border-color: var(--accent-green);
  color: var(--accent-green);
}

#music-btn.active {
  border-color: var(--accent-green);
  color: var(--accent-green);
  box-shadow: 0 0 10px rgba(184, 187, 38, 0.3);
}

#music-dropdown {
  position: absolute;
  bottom: 48px;
  left: 0;
  background: rgba(10, 10, 10, 0.95);
  border: 1px solid var(--border-color);
  padding: 8px;
  transition: all 0.2s ease;
}

#music-dropdown.hidden {
  opacity: 0;
  pointer-events: none;
  transform: translateY(10px);
}

/* Responsive */
@media (max-width: 768px) {
  #control-panel {
    top: auto;
    bottom: 0;
    right: 0;
    left: 0;
    max-width: none;
    border-left: none;
    border-right: none;
    border-bottom: none;
    max-height: 60vh;
  }

  #control-panel.collapsed {
    transform: translateY(100%);
  }

  #control-panel:not(.collapsed) ~ #panel-toggle {
    right: 16px;
    bottom: calc(60vh + 8px);
    top: auto;
  }

  #panel-toggle {
    bottom: 16px;
    top: auto;
  }
}
</style>

<div id="matrix-container">
  <canvas id="matrix-canvas"></canvas>

  <!-- Mini Music Player -->
  <div id="music-player">
    <button id="music-btn" onclick="toggleMusicPlayer()">🎵</button>
    <div id="music-dropdown" class="hidden">
      <iframe id="yt-player" width="200" height="40"
        src="https://www.youtube.com/embed/BSsfjHCFosw?enablejsapi=1&loop=1&playlist=BSsfjHCFosw"
        frameborder="0" allow="autoplay; encrypted-media" allowfullscreen>
      </iframe>
    </div>
  </div>

  <a href="/game.html" id="back-btn">
    <span>←</span> BACK
  </a>

  <button id="panel-toggle">☰ CONFIG</button>

  <div id="control-panel">
    <div class="panel-header">
      <span class="panel-title">Terminal FX</span>
      <button class="panel-close" onclick="togglePanel()">×</button>
    </div>

    <!-- Animation Mode -->
    <div class="section-header">Animation Mode</div>
    <div class="mode-selector">
      <button class="mode-btn active" data-mode="matrix" onclick="setMode('matrix')">
        <span class="mode-icon">▓</span>
        Matrix Rain
      </button>
      <button class="mode-btn" data-mode="fire" onclick="setMode('fire')">
        <span class="mode-icon">🔥</span>
        Doom Fire
      </button>
    </div>

    <!-- Render Style -->
    <div class="control-group">
      <div class="control-label">Render Style</div>
      <div class="render-toggle">
        <button class="render-btn" data-render="retro" onclick="setRenderStyle('retro')">
          ▦ Retro
        </button>
        <button class="render-btn active" data-render="smooth" onclick="setRenderStyle('smooth')">
          ◉ Smooth
        </button>
      </div>
    </div>

    <!-- Theme Selection -->
    <div class="section-header">Color Theme</div>
    <div class="control-group">
      <div class="theme-grid">
        <button class="theme-btn active" data-theme="matrix" onclick="setTheme('matrix')">
          <div class="theme-preview"></div>
          Matrix
        </button>
        <button class="theme-btn" data-theme="doom" onclick="setTheme('doom')">
          <div class="theme-preview"></div>
          Doom
        </button>
        <button class="theme-btn" data-theme="cyberpunk" onclick="setTheme('cyberpunk')">
          <div class="theme-preview"></div>
          Cyber
        </button>
        <button class="theme-btn" data-theme="void" onclick="setTheme('void')">
          <div class="theme-preview"></div>
          Void
        </button>
        <button class="theme-btn" data-theme="blood" onclick="setTheme('blood')">
          <div class="theme-preview"></div>
          Blood
        </button>
        <button class="theme-btn" data-theme="amber" onclick="setTheme('amber')">
          <div class="theme-preview"></div>
          Amber
        </button>
      </div>
    </div>

    <!-- Controls -->
    <div class="section-header">Parameters</div>

    <!-- Speed Control -->
    <div class="control-group">
      <div class="control-label">
        <span>Speed</span>
        <span class="control-value" id="speed-value">50</span>
      </div>
      <input type="range" id="speed-slider" min="10" max="100" value="50" oninput="updateSpeed(this.value)">
    </div>

    <!-- Scale/Size Control -->
    <div class="control-group">
      <div class="control-label">
        <span>Scale</span>
        <span class="control-value" id="scale-value">16</span>
      </div>
      <input type="range" id="scale-slider" min="4" max="32" value="16" oninput="updateScale(this.value)">
    </div>

    <!-- Intensity/Trail Control -->
    <div class="control-group">
      <div class="control-label">
        <span>Intensity</span>
        <span class="control-value" id="intensity-value">50</span>
      </div>
      <input type="range" id="intensity-slider" min="10" max="100" value="50" oninput="updateIntensity(this.value)">
    </div>

    <!-- Wind (for fire) / Density (for matrix) -->
    <div class="control-group" id="wind-control" style="display: none;">
      <div class="control-label">
        <span>Wind</span>
        <span class="control-value" id="wind-value">0</span>
      </div>
      <input type="range" id="wind-slider" min="-50" max="50" value="0" oninput="updateWind(this.value)">
    </div>

    <div class="control-group" id="density-control">
      <div class="control-label">
        <span>Density</span>
        <span class="control-value" id="density-value">98</span>
      </div>
      <input type="range" id="density-slider" min="90" max="100" value="98" oninput="updateDensity(this.value)">
    </div>

    <!-- Character Set (Matrix mode only) -->
    <div id="charset-section">
      <div class="section-header">Characters</div>
      <div class="control-group">
        <div class="charset-options">
          <label class="charset-option">
            <input type="checkbox" id="charset-katakana" checked onchange="updateCharset()">
            カタカナ Katakana
          </label>
          <label class="charset-option">
            <input type="checkbox" id="charset-latin" checked onchange="updateCharset()">
            ABC Latin
          </label>
          <label class="charset-option">
            <input type="checkbox" id="charset-numbers" checked onchange="updateCharset()">
            123 Numbers
          </label>
          <label class="charset-option">
            <input type="checkbox" id="charset-binary" onchange="updateCharset()">
            01 Binary Only
          </label>
        </div>
      </div>
    </div>

    <!-- Actions -->
    <button class="action-btn" onclick="toggleFullscreen()">⛶ Fullscreen</button>
    <button class="action-btn" onclick="randomize()">⚄ Randomize</button>

    <div class="stats-display">
      <span>FPS: <span id="fps-display">60</span></span>
      <span>Mode: <span id="mode-display">MATRIX</span></span>
    </div>

    <div class="keyboard-hints">
      <kbd>ESC</kbd> Toggle panel · <kbd>F</kbd> Fullscreen · <kbd>P</kbd> Music<br>
      <kbd>1-6</kbd> Themes · <kbd>M</kbd> Matrix · <kbd>D</kbd> Fire<br>
      <kbd>R</kbd> Retro · <kbd>S</kbd> Smooth
    </div>
  </div>
</div>

<script>
// ============================================
// MATRIX TERMINAL SIMULATOR
// Inspired by Ly Display Manager & PSX DOOM
// ============================================

const canvas = document.getElementById('matrix-canvas');
const ctx = canvas.getContext('2d');

// Character sets
const CHARSETS = {
  katakana: 'アァカサタナハマヤャラワガザダバパイィキシチニヒミリヰギジヂビピウゥクスツヌフムユュルグズブヅプエェケセテネヘメレヱゲゼデベペオォコソトノホモヨョロヲゴゾドボポヴッン',
  latin: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
  numbers: '0123456789',
  binary: '01'
};

// Theme configurations
const THEMES = {
  matrix: {
    name: 'Matrix',
    bg: [0, 0, 0],
    primary: '#00ff00',
    secondary: '#003300',
    glow: 'rgba(0, 255, 0, 0.8)',
    head: '#ffffff',
    fireColors: generateFirePalette([0, 80, 0], [0, 255, 0], [200, 255, 200])
  },
  doom: {
    name: 'Doom',
    bg: [7, 7, 7],
    primary: '#ff4400',
    secondary: '#440000',
    glow: 'rgba(255, 68, 0, 0.8)',
    head: '#ffaa00',
    fireColors: null // Use original DOOM palette
  },
  cyberpunk: {
    name: 'Cyberpunk',
    bg: [5, 0, 10],
    primary: '#ff00ff',
    secondary: '#00ffff',
    glow: 'rgba(255, 0, 255, 0.8)',
    head: '#00ffff',
    fireColors: generateFirePalette([20, 0, 40], [255, 0, 255], [0, 255, 255])
  },
  void: {
    name: 'Void',
    bg: [0, 0, 0],
    primary: '#ffffff',
    secondary: '#444444',
    glow: 'rgba(255, 255, 255, 0.9)',
    head: '#ffffff',
    fireColors: generateFirePalette([10, 10, 10], [150, 150, 150], [255, 255, 255])
  },
  blood: {
    name: 'Blood',
    bg: [5, 0, 0],
    primary: '#ff0000',
    secondary: '#330000',
    glow: 'rgba(255, 0, 0, 0.8)',
    head: '#ff6666',
    fireColors: generateFirePalette([20, 0, 0], [255, 0, 0], [255, 100, 100])
  },
  amber: {
    name: 'Amber',
    bg: [5, 3, 0],
    primary: '#ffaa00',
    secondary: '#553300',
    glow: 'rgba(255, 170, 0, 0.8)',
    head: '#ffdd88',
    fireColors: generateFirePalette([20, 10, 0], [255, 170, 0], [255, 240, 200])
  }
};

// Original DOOM fire palette (Fabien Sanglard)
const DOOM_FIRE_PALETTE = [
  [0x07,0x07,0x07], [0x1F,0x07,0x07], [0x2F,0x0F,0x07], [0x47,0x0F,0x07],
  [0x57,0x17,0x07], [0x67,0x1F,0x07], [0x77,0x1F,0x07], [0x8F,0x27,0x07],
  [0x9F,0x2F,0x07], [0xAF,0x3F,0x07], [0xBF,0x47,0x07], [0xC7,0x47,0x07],
  [0xDF,0x4F,0x07], [0xDF,0x57,0x07], [0xDF,0x57,0x07], [0xD7,0x5F,0x07],
  [0xD7,0x5F,0x07], [0xD7,0x67,0x0F], [0xCF,0x6F,0x0F], [0xCF,0x77,0x0F],
  [0xCF,0x7F,0x0F], [0xCF,0x87,0x17], [0xC7,0x87,0x17], [0xC7,0x8F,0x17],
  [0xC7,0x97,0x1F], [0xBF,0x9F,0x1F], [0xBF,0x9F,0x1F], [0xBF,0xA7,0x27],
  [0xBF,0xA7,0x27], [0xBF,0xAF,0x2F], [0xB7,0xAF,0x2F], [0xB7,0xB7,0x2F],
  [0xB7,0xB7,0x37], [0xCF,0xCF,0x6F], [0xDF,0xDF,0x9F], [0xEF,0xEF,0xC7],
  [0xFF,0xFF,0xFF]
];

// Generate custom fire palette
function generateFirePalette(dark, mid, light) {
  const palette = [];
  for (let i = 0; i < 37; i++) {
    const t = i / 36;
    let r, g, b;
    if (t < 0.5) {
      const t2 = t * 2;
      r = Math.round(dark[0] + (mid[0] - dark[0]) * t2);
      g = Math.round(dark[1] + (mid[1] - dark[1]) * t2);
      b = Math.round(dark[2] + (mid[2] - dark[2]) * t2);
    } else {
      const t2 = (t - 0.5) * 2;
      r = Math.round(mid[0] + (light[0] - mid[0]) * t2);
      g = Math.round(mid[1] + (light[1] - mid[1]) * t2);
      b = Math.round(mid[2] + (light[2] - mid[2]) * t2);
    }
    palette.push([r, g, b]);
  }
  return palette;
}

// Configuration
let config = {
  mode: 'matrix',
  theme: 'matrix',
  renderStyle: 'smooth',
  speed: 50,
  scale: 16,
  intensity: 50,
  density: 98,
  wind: 0,
  charset: CHARSETS.katakana + CHARSETS.latin + CHARSETS.numbers
};

// State
let rainDrops = [];
let firePixels = [];
let fireWidth = 0;
let fireHeight = 0;
let columns = 0;
let animationId = null;
let lastTime = 0;
let frameCount = 0;
let fps = 60;
let retroScale = 1;

// Initialize canvas
function initCanvas() {
  if (config.renderStyle === 'retro') {
    retroScale = Math.max(2, Math.floor(config.scale / 4));
    canvas.width = Math.floor(window.innerWidth / retroScale);
    canvas.height = Math.floor(window.innerHeight / retroScale);
    canvas.style.width = window.innerWidth + 'px';
    canvas.style.height = window.innerHeight + 'px';
    canvas.classList.add('retro');
  } else {
    retroScale = 1;
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
    canvas.style.width = '';
    canvas.style.height = '';
    canvas.classList.remove('retro');
  }

  if (config.mode === 'matrix') {
    initMatrix();
  } else {
    initFire();
  }
}

// Initialize Matrix Rain
function initMatrix() {
  const effectiveScale = config.renderStyle === 'retro' ? config.scale / retroScale : config.scale;
  columns = Math.floor(canvas.width / effectiveScale);
  rainDrops = [];
  for (let i = 0; i < columns; i++) {
    rainDrops[i] = Math.random() * -100;
  }
}

// Initialize Doom Fire
function initFire() {
  const pixelSize = config.renderStyle === 'retro' ? Math.max(1, Math.floor(config.scale / retroScale / 2)) : Math.max(1, Math.floor(config.scale / 4));
  fireWidth = Math.ceil(canvas.width / pixelSize);
  fireHeight = Math.ceil(canvas.height / pixelSize);
  firePixels = new Array(fireWidth * fireHeight).fill(0);

  // Set bottom row on fire
  for (let x = 0; x < fireWidth; x++) {
    firePixels[(fireHeight - 1) * fireWidth + x] = 36;
  }
}

// Get current theme
function getTheme() {
  return THEMES[config.theme];
}

// Get fire palette
function getFirePalette() {
  const theme = getTheme();
  return theme.fireColors || DOOM_FIRE_PALETTE;
}

// Draw Matrix Rain
function drawMatrix() {
  const theme = getTheme();
  const effectiveScale = config.renderStyle === 'retro' ? config.scale / retroScale : config.scale;

  // Trail effect
  const trailAlpha = (100 - config.intensity) / 100 * 0.12 + 0.02;
  ctx.fillStyle = `rgba(${theme.bg[0]}, ${theme.bg[1]}, ${theme.bg[2]}, ${trailAlpha})`;
  ctx.fillRect(0, 0, canvas.width, canvas.height);

  ctx.font = `${effectiveScale}px monospace`;

  for (let i = 0; i < rainDrops.length; i++) {
    const char = config.charset.charAt(Math.floor(Math.random() * config.charset.length));
    const x = i * effectiveScale;
    const y = rainDrops[i] * effectiveScale;

    // Main character with glow
    if (config.renderStyle === 'smooth') {
      ctx.shadowColor = theme.glow;
      ctx.shadowBlur = 8;
    }

    // Gradient for trail
    ctx.fillStyle = theme.primary;
    ctx.fillText(char, x, y);

    // Bright head
    ctx.fillStyle = theme.head;
    ctx.fillText(char, x, y);

    if (config.renderStyle === 'smooth') {
      ctx.shadowBlur = 0;
    }

    // Reset drop
    if (y > canvas.height && Math.random() > config.density / 100) {
      rainDrops[i] = 0;
    }
    rainDrops[i]++;
  }
}

// Spread fire (DOOM algorithm)
function spreadFire(src) {
  const pixel = firePixels[src];
  if (pixel === 0) {
    firePixels[src - fireWidth] = 0;
  } else {
    const windOffset = Math.floor(config.wind / 25);
    const rand = Math.round(Math.random() * 3.0);
    const dst = src - rand + 1 + windOffset;
    const newVal = pixel - (rand & 1);
    if (dst - fireWidth >= 0 && dst - fireWidth < firePixels.length) {
      firePixels[dst - fireWidth] = Math.max(0, newVal);
    }
  }
}

// Draw Doom Fire
function drawFire() {
  const palette = getFirePalette();
  const theme = getTheme();
  const pixelSize = config.renderStyle === 'retro' ? Math.max(1, Math.floor(config.scale / retroScale / 2)) : Math.max(1, Math.floor(config.scale / 4));

  // Spread fire
  const spreadIterations = Math.ceil(config.intensity / 20);
  for (let iter = 0; iter < spreadIterations; iter++) {
    for (let x = 0; x < fireWidth; x++) {
      for (let y = 1; y < fireHeight; y++) {
        spreadFire(y * fireWidth + x);
      }
    }
  }

  // Clear canvas
  ctx.fillStyle = `rgb(${theme.bg[0]}, ${theme.bg[1]}, ${theme.bg[2]})`;
  ctx.fillRect(0, 0, canvas.width, canvas.height);

  // Draw fire pixels
  const imageData = ctx.createImageData(canvas.width, canvas.height);
  const data = imageData.data;

  for (let y = 0; y < fireHeight; y++) {
    for (let x = 0; x < fireWidth; x++) {
      const fireIndex = y * fireWidth + x;
      const colorIndex = firePixels[fireIndex];
      const color = palette[colorIndex];

      // Fill pixel block
      for (let py = 0; py < pixelSize && y * pixelSize + py < canvas.height; py++) {
        for (let px = 0; px < pixelSize && x * pixelSize + px < canvas.width; px++) {
          const idx = ((y * pixelSize + py) * canvas.width + (x * pixelSize + px)) * 4;
          data[idx] = color[0];
          data[idx + 1] = color[1];
          data[idx + 2] = color[2];
          data[idx + 3] = 255;
        }
      }
    }
  }

  ctx.putImageData(imageData, 0, 0);

  // Add glow effect for smooth mode
  if (config.renderStyle === 'smooth') {
    ctx.globalCompositeOperation = 'lighter';
    ctx.filter = 'blur(4px)';
    ctx.globalAlpha = 0.3;
    ctx.drawImage(canvas, 0, 0);
    ctx.filter = 'none';
    ctx.globalAlpha = 1;
    ctx.globalCompositeOperation = 'source-over';
  }
}

// Animation loop
function animate(currentTime) {
  frameCount++;
  if (currentTime - lastTime >= 1000) {
    fps = frameCount;
    frameCount = 0;
    lastTime = currentTime;
    document.getElementById('fps-display').textContent = fps;
  }

  if (config.mode === 'matrix') {
    drawMatrix();
  } else {
    drawFire();
  }

  const delay = 1000 / (config.speed * 1.5);
  animationId = setTimeout(() => {
    requestAnimationFrame(animate);
  }, delay);
}

// Start animation
function startAnimation() {
  if (animationId) {
    clearTimeout(animationId);
  }
  requestAnimationFrame(animate);
}

// Mode change
function setMode(mode) {
  config.mode = mode;
  document.querySelectorAll('.mode-btn').forEach(btn => {
    btn.classList.toggle('active', btn.dataset.mode === mode);
  });
  document.getElementById('mode-display').textContent = mode.toUpperCase();

  // Show/hide mode-specific controls
  document.getElementById('charset-section').style.display = mode === 'matrix' ? 'block' : 'none';
  document.getElementById('wind-control').style.display = mode === 'fire' ? 'block' : 'none';
  document.getElementById('density-control').style.display = mode === 'matrix' ? 'block' : 'none';

  initCanvas();
}

// Render style change
function setRenderStyle(style) {
  config.renderStyle = style;
  document.querySelectorAll('.render-btn').forEach(btn => {
    btn.classList.toggle('active', btn.dataset.render === style);
  });
  initCanvas();
}

// Theme change
function setTheme(themeName) {
  config.theme = themeName;
  document.querySelectorAll('.theme-btn').forEach(btn => {
    btn.classList.toggle('active', btn.dataset.theme === themeName);
  });

  const theme = getTheme();
  document.documentElement.style.setProperty('--accent-green', theme.primary);

  // Clear canvas
  ctx.fillStyle = `rgb(${theme.bg[0]}, ${theme.bg[1]}, ${theme.bg[2]})`;
  ctx.fillRect(0, 0, canvas.width, canvas.height);

  // Reinit fire for new palette
  if (config.mode === 'fire') {
    initFire();
  }
}

// Update functions
function updateSpeed(value) {
  config.speed = parseInt(value);
  document.getElementById('speed-value').textContent = value;
}

function updateScale(value) {
  config.scale = parseInt(value);
  document.getElementById('scale-value').textContent = value;
  initCanvas();
}

function updateIntensity(value) {
  config.intensity = parseInt(value);
  document.getElementById('intensity-value').textContent = value;
}

function updateDensity(value) {
  config.density = parseInt(value);
  document.getElementById('density-value').textContent = value;
}

function updateWind(value) {
  config.wind = parseInt(value);
  document.getElementById('wind-value').textContent = value;
}

function updateCharset() {
  let charset = '';
  if (document.getElementById('charset-binary').checked) {
    charset = CHARSETS.binary;
  } else {
    if (document.getElementById('charset-katakana').checked) charset += CHARSETS.katakana;
    if (document.getElementById('charset-latin').checked) charset += CHARSETS.latin;
    if (document.getElementById('charset-numbers').checked) charset += CHARSETS.numbers;
  }
  if (charset.length === 0) {
    charset = CHARSETS.numbers;
    document.getElementById('charset-numbers').checked = true;
  }
  config.charset = charset;
}

// Panel toggle
function togglePanel() {
  document.getElementById('control-panel').classList.toggle('collapsed');
}

// Music player toggle
let musicPlayerOpen = false;

function toggleMusicPlayer() {
  const dropdown = document.getElementById('music-dropdown');
  const btn = document.getElementById('music-btn');
  musicPlayerOpen = !musicPlayerOpen;
  dropdown.classList.toggle('hidden', !musicPlayerOpen);
  btn.classList.toggle('active', musicPlayerOpen);
}

function toggleMusic() {
  toggleMusicPlayer();
}

// Fullscreen
function toggleFullscreen() {
  if (!document.fullscreenElement) {
    document.getElementById('matrix-container').requestFullscreen().catch(console.log);
  } else {
    document.exitFullscreen();
  }
}

// Randomize settings
function randomize() {
  const themes = Object.keys(THEMES);
  const randomTheme = themes[Math.floor(Math.random() * themes.length)];
  setTheme(randomTheme);

  document.getElementById('speed-slider').value = 20 + Math.random() * 60;
  document.getElementById('scale-slider').value = 8 + Math.random() * 20;
  document.getElementById('intensity-slider').value = 20 + Math.random() * 60;

  updateSpeed(document.getElementById('speed-slider').value);
  updateScale(document.getElementById('scale-slider').value);
  updateIntensity(document.getElementById('intensity-slider').value);
}

// Event listeners
window.addEventListener('resize', () => initCanvas());
document.getElementById('panel-toggle').addEventListener('click', togglePanel);

// Keyboard shortcuts
document.addEventListener('keydown', (e) => {
  if (e.target.tagName === 'INPUT') return;

  switch(e.key.toLowerCase()) {
    case 'escape': togglePanel(); break;
    case 'f': toggleFullscreen(); break;
    case 'm': setMode('matrix'); break;
    case 'd': setMode('fire'); break;
    case 'r': setRenderStyle('retro'); break;
    case 's': setRenderStyle('smooth'); break;
    case '1': setTheme('matrix'); break;
    case '2': setTheme('doom'); break;
    case '3': setTheme('cyberpunk'); break;
    case '4': setTheme('void'); break;
    case '5': setTheme('blood'); break;
    case '6': setTheme('amber'); break;
    case 'p': toggleMusic(); break;
  }
});

// Initialize
initCanvas();
startAnimation();
</script>
