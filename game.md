---
layout: default
title: ???
permalink: /game.html
---

<style>
/* Terminal Container */
#game-container {
  background: #0a0a0a;
  border: 1px solid rgba(181, 232, 83, 0.3);
  border-radius: 8px;
  min-height: 70vh;
  max-height: 80vh;
  display: flex;
  flex-direction: column;
  position: relative;
  overflow: hidden;
}

/* Terminal Header */
#terminal-header {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 12px 16px;
  background: rgba(0, 0, 0, 0.5);
  border-bottom: 1px solid rgba(181, 232, 83, 0.2);
}

.term-dot {
  width: 12px;
  height: 12px;
  border-radius: 50%;
}

.dot-r { background: #ff5f56; }
.dot-y { background: #ffbd2e; }
.dot-g { background: #27ca40; }

#terminal-title {
  font-family: Monaco, monospace;
  font-size: 12px;
  color: #666;
  margin-left: auto;
}

#sound-toggle {
  font-family: Monaco, monospace;
  font-size: 11px;
  color: #555;
  background: transparent;
  border: 1px solid #333;
  padding: 3px 8px;
  border-radius: 3px;
  cursor: pointer;
  margin-left: 10px;
}

#sound-toggle:hover {
  border-color: #b5e853;
  color: #b5e853;
}

#sound-toggle.on {
  border-color: #b5e853;
  color: #b5e853;
}

/* Terminal Output */
#terminal-output {
  flex: 1;
  overflow-y: auto;
  padding: 16px;
  font-family: Monaco, "Courier New", monospace;
  font-size: 13px;
  line-height: 1.6;
  color: #b5e853;
}

#terminal-output::-webkit-scrollbar {
  width: 6px;
}

#terminal-output::-webkit-scrollbar-track {
  background: #111;
}

#terminal-output::-webkit-scrollbar-thumb {
  background: #333;
  border-radius: 3px;
}

.output-line {
  white-space: pre-wrap;
  word-wrap: break-word;
}

.output-line.error { color: #ff5f56; }
.output-line.success { color: #27ca40; }
.output-line.info { color: #63c0f5; }
.output-line.warning { color: #ffbd2e; }
.output-line.system { color: #888; }
.output-line.ascii { color: #b5e853; text-shadow: 0 0 5px rgba(181, 232, 83, 0.5); }
.output-line.highlight { color: #fff; text-shadow: 0 0 10px rgba(255, 255, 255, 0.5); }

/* Terminal Input */
#terminal-input-line {
  display: flex;
  align-items: center;
  padding: 12px 16px;
  background: rgba(0, 0, 0, 0.3);
  border-top: 1px solid rgba(181, 232, 83, 0.1);
}

#prompt {
  font-family: Monaco, monospace;
  font-size: 13px;
  color: #b5e853;
  margin-right: 8px;
  white-space: nowrap;
}

#terminal-input {
  flex: 1;
  background: transparent;
  border: none;
  outline: none;
  font-family: Monaco, monospace;
  font-size: 13px;
  color: #fff;
  caret-color: #b5e853;
}

#autocomplete {
  position: absolute;
  bottom: 50px;
  left: 16px;
  background: rgba(20, 20, 20, 0.95);
  border: 1px solid rgba(181, 232, 83, 0.3);
  border-radius: 4px;
  padding: 8px 0;
  display: none;
  max-height: 150px;
  overflow-y: auto;
  z-index: 100;
}

.autocomplete-item {
  padding: 4px 12px;
  font-family: Monaco, monospace;
  font-size: 12px;
  color: #888;
  cursor: pointer;
}

.autocomplete-item:hover,
.autocomplete-item.selected {
  background: rgba(181, 232, 83, 0.1);
  color: #b5e853;
}

/* Level Select */
#level-select {
  display: none;
  padding: 20px;
}

.level-card {
  display: flex;
  align-items: center;
  padding: 16px;
  margin-bottom: 8px;
  background: rgba(181, 232, 83, 0.03);
  border: 1px solid rgba(181, 232, 83, 0.1);
  border-radius: 6px;
  cursor: pointer;
  transition: all 0.2s ease;
}

.level-card:hover:not(.locked) {
  border-color: rgba(181, 232, 83, 0.3);
  background: rgba(181, 232, 83, 0.05);
}

.level-card.locked {
  opacity: 0.4;
  cursor: not-allowed;
}

.level-card.completed {
  border-color: rgba(39, 202, 64, 0.3);
}

.level-num {
  font-family: Monaco, monospace;
  font-size: 24px;
  font-weight: bold;
  color: #b5e853;
  width: 50px;
}

.level-info {
  flex: 1;
}

.level-name {
  font-family: Monaco, monospace;
  font-size: 16px;
  color: #eaeaea;
  margin-bottom: 4px;
}

.level-desc {
  font-size: 12px;
  color: #666;
}

.level-status {
  font-family: Monaco, monospace;
  font-size: 11px;
  padding: 4px 8px;
  border-radius: 3px;
}

.level-status.unlocked { color: #b5e853; border: 1px solid rgba(181, 232, 83, 0.3); }
.level-status.completed { color: #27ca40; border: 1px solid rgba(39, 202, 64, 0.3); }
.level-status.locked { color: #555; border: 1px solid #333; }

/* HUD */
#hud {
  display: none;
  padding: 8px 16px;
  background: rgba(0, 0, 0, 0.5);
  border-bottom: 1px solid rgba(181, 232, 83, 0.1);
  font-family: Monaco, monospace;
  font-size: 11px;
  color: #666;
}

#hud span {
  margin-right: 20px;
}

#hud .label { color: #555; }
#hud .value { color: #b5e853; }

/* Scanline effect */
.scanline {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 2px;
  background: rgba(181, 232, 83, 0.05);
  animation: scanline 8s linear infinite;
  pointer-events: none;
  z-index: 10;
}

@keyframes scanline {
  0% { top: 0; }
  100% { top: 100%; }
}

/* Glitch effect */
@keyframes glitch {
  0% { transform: translate(0); }
  20% { transform: translate(-2px, 2px); }
  40% { transform: translate(-2px, -2px); }
  60% { transform: translate(2px, 2px); }
  80% { transform: translate(2px, -2px); }
  100% { transform: translate(0); }
}

.glitch {
  animation: glitch 0.3s ease-in-out;
}

/* Progress bar */
.progress-bar {
  display: inline-block;
  width: 200px;
  height: 8px;
  background: #222;
  border-radius: 4px;
  overflow: hidden;
  margin: 4px 0;
}

.progress-fill {
  height: 100%;
  background: linear-gradient(90deg, #b5e853, #27ca40);
  transition: width 0.3s ease;
}
</style>

<div id="game-container">
  <div class="scanline"></div>

  <div id="terminal-header">
    <span class="term-dot dot-r"></span>
    <span class="term-dot dot-y"></span>
    <span class="term-dot dot-g"></span>
    <span id="terminal-title">root@localhost</span>
    <button id="sound-toggle">sound: off</button>
  </div>

  <div id="hud">
    <span><span class="label">LEVEL:</span> <span class="value" id="hud-level">-</span></span>
    <span><span class="label">TARGET:</span> <span class="value" id="hud-target">-</span></span>
    <span><span class="label">OBJECTIVE:</span> <span class="value" id="hud-objective">-</span></span>
  </div>

  <div id="level-select"></div>

  <div id="terminal-output"></div>

  <div id="autocomplete"></div>

  <div id="terminal-input-line">
    <span id="prompt">$</span>
    <input type="text" id="terminal-input" autofocus autocomplete="off" spellcheck="false">
  </div>
</div>

<script>
// ============================================
// SOUND SYSTEM (8-bit beeps)
// ============================================
const AudioCtx = window.AudioContext || window.webkitAudioContext;
let audioCtx = null;
let soundEnabled = false;

function initAudio() {
  if (!audioCtx) {
    audioCtx = new AudioCtx();
  }
}

function playBeep(freq = 440, duration = 0.1, type = 'square') {
  if (!soundEnabled || !audioCtx) return;

  const oscillator = audioCtx.createOscillator();
  const gainNode = audioCtx.createGain();

  oscillator.connect(gainNode);
  gainNode.connect(audioCtx.destination);

  oscillator.frequency.value = freq;
  oscillator.type = type;

  gainNode.gain.setValueAtTime(0.1, audioCtx.currentTime);
  gainNode.gain.exponentialRampToValueAtTime(0.01, audioCtx.currentTime + duration);

  oscillator.start(audioCtx.currentTime);
  oscillator.stop(audioCtx.currentTime + duration);
}

function playKeyPress() { playBeep(800, 0.02); }
function playEnter() { playBeep(600, 0.05); playBeep(400, 0.05); }
function playError() { playBeep(200, 0.2); }
function playSuccess() {
  playBeep(523, 0.1);
  setTimeout(() => playBeep(659, 0.1), 100);
  setTimeout(() => playBeep(784, 0.15), 200);
}
function playAlert() { playBeep(440, 0.1); setTimeout(() => playBeep(440, 0.1), 150); }
function playBoot() {
  [200, 300, 400, 500, 600].forEach((f, i) => {
    setTimeout(() => playBeep(f, 0.08), i * 60);
  });
}

// ============================================
// GAME STATE
// ============================================
const gameState = {
  currentLevel: 0,
  levelsCompleted: [],
  inLevel: false,
  levelState: {},
  commandHistory: [],
  historyIndex: -1,
  hackerName: '',
  attempts: 0,
  needsName: true,
  score: 0,
  easterEggsFound: []
};

// Load saved state
function loadGame() {
  const saved = localStorage.getItem('hackerGame');
  if (saved) {
    const data = JSON.parse(saved);
    gameState.levelsCompleted = data.levelsCompleted || [];
    gameState.currentLevel = data.currentLevel || 0;
    gameState.levelState = data.levelState || {};
    gameState.inLevel = data.inLevel || false;
    gameState.hackerName = data.hackerName || '';
    gameState.attempts = data.attempts || 0;
    gameState.needsName = !data.hackerName;
    gameState.score = data.score || 0;
    gameState.easterEggsFound = data.easterEggsFound || [];
  }
}

function saveGame() {
  localStorage.setItem('hackerGame', JSON.stringify({
    levelsCompleted: gameState.levelsCompleted,
    currentLevel: gameState.currentLevel,
    levelState: gameState.levelState,
    inLevel: gameState.inLevel,
    hackerName: gameState.hackerName,
    attempts: gameState.attempts,
    score: gameState.score,
    easterEggsFound: gameState.easterEggsFound
  }));
}

// Autosave on state change - call this after important progress
function autosave() {
  saveGame();
  print('[autosaved]', 'system');
}

// ============================================
// SCORING SYSTEM
// ============================================
const SCORE_VALUES = {
  LEVEL_COMPLETE: 1000,      // Per level
  EASTER_EGG: 500,           // Per easter egg
  EFFICIENCY_BONUS: 100,     // Low attempts bonus
  PROGRESS_POINT: 50         // Per progress step
};

function calculateScore() {
  let score = 0;

  // Level completion bonus
  score += gameState.levelsCompleted.length * SCORE_VALUES.LEVEL_COMPLETE;

  // Easter eggs bonus
  score += gameState.easterEggsFound.length * SCORE_VALUES.EASTER_EGG;

  // Efficiency bonus (fewer attempts = higher score)
  const avgAttempts = gameState.attempts / Math.max(gameState.levelsCompleted.length, 1);
  if (avgAttempts < 2) score += 500;
  else if (avgAttempts < 3) score += 300;
  else if (avgAttempts < 5) score += 100;

  // Current level progress
  const progressSteps = Object.values(gameState.levelState).filter(v => v === true).length;
  score += progressSteps * SCORE_VALUES.PROGRESS_POINT;

  gameState.score = score;
  return score;
}

function addEasterEgg(eggId, message) {
  if (gameState.easterEggsFound.includes(eggId)) {
    return false; // Already found
  }
  gameState.easterEggsFound.push(eggId);
  gameState.score += SCORE_VALUES.EASTER_EGG;
  playSuccess();
  print('');
  print(ASCII.ohio, 'ascii');
  print(`[EASTER EGG FOUND] ${message}`, 'success');
  print(`+${SCORE_VALUES.EASTER_EGG} points!`, 'highlight');
  print('');
  autosave();
  return true;
}

// ============================================
// STATS DISPLAY
// ============================================
function showStats() {
  calculateScore();

  print('');
  print('╔═══════════════════════════════════════════╗', 'info');
  print('║           YOUR HACKER STATS               ║', 'info');
  print('╠═══════════════════════════════════════════╣', 'info');
  print(`║  Hacker: ${gameState.hackerName.padEnd(30)} ║`, 'success');
  print('╠═══════════════════════════════════════════╣', 'info');
  print(`║  Score: ${String(gameState.score).padStart(6)}                          ║`, 'highlight');
  print(`║  Levels Completed: ${gameState.levelsCompleted.length}/6                    ║`, 'system');
  print(`║  Progress: ${Math.round((gameState.levelsCompleted.length / 6) * 100)}%                            ║`, 'system');
  print(`║  Easter Eggs Found: ${gameState.easterEggsFound.length}/6                   ║`, gameState.easterEggsFound.length > 0 ? 'success' : 'system');
  print(`║  Total Attempts: ${String(gameState.attempts).padStart(4)}                    ║`, 'system');
  print('╠═══════════════════════════════════════════╣', 'info');

  // Show level progress
  print('║  Level Progress:                          ║', 'info');
  LEVELS.forEach(level => {
    const completed = gameState.levelsCompleted.includes(level.id);
    const status = completed ? '[DONE]' : (gameState.currentLevel === level.id ? '[>>  ]' : '[    ]');
    const color = completed ? 'success' : (gameState.currentLevel === level.id ? 'warning' : 'system');
    print(`║    ${status} ${level.id}. ${level.name.padEnd(28)} ║`, color);
  });

  print('╚═══════════════════════════════════════════╝', 'info');
  print('');
}

// ============================================
// TERMINAL OUTPUT
// ============================================
const output = document.getElementById('terminal-output');
const input = document.getElementById('terminal-input');
const prompt = document.getElementById('prompt');
const autocomplete = document.getElementById('autocomplete');
const hud = document.getElementById('hud');
const levelSelect = document.getElementById('level-select');

function print(text, className = '') {
  const line = document.createElement('div');
  line.className = 'output-line ' + className;
  line.textContent = text;
  output.appendChild(line);
  output.scrollTop = output.scrollHeight;
}

function printHTML(html) {
  const line = document.createElement('div');
  line.className = 'output-line';
  line.innerHTML = html;
  output.appendChild(line);
  output.scrollTop = output.scrollHeight;
}

function clear() {
  output.innerHTML = '';
}

async function typeText(text, delay = 30, className = '') {
  const line = document.createElement('div');
  line.className = 'output-line ' + className;
  output.appendChild(line);

  for (let i = 0; i < text.length; i++) {
    line.textContent += text[i];
    output.scrollTop = output.scrollHeight;
    if (text[i] !== ' ') playKeyPress();
    await sleep(delay);
  }
}

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function simulateLoading(text, duration = 2000) {
  const line = document.createElement('div');
  line.className = 'output-line';
  output.appendChild(line);

  const frames = ['|', '/', '-', '\\'];
  let i = 0;
  const start = Date.now();

  while (Date.now() - start < duration) {
    line.textContent = text + ' ' + frames[i % 4];
    i++;
    await sleep(100);
  }
  line.textContent = text + ' done';
}

// ============================================
// ASCII ART
// ============================================
const ASCII = {
  title: `
  ██░ ██  ▄▄▄       ▄████▄   ██ ▄█▀▓█████  ██▀███
  ▓██░ ██▒▒████▄    ▒██▀ ▀█   ██▄█▒ ▓█   ▀ ▓██ ▒ ██▒
  ▒██▀▀██░▒██  ▀█▄  ▒▓█    ▄ ▓███▄░ ▒███   ▓██ ░▄█ ▒
  ░▓█ ░██ ░██▄▄▄▄██ ▒▓▓▄ ▄██▒▓██ █▄ ▒▓█  ▄ ▒██▀▀█▄
  ░▓█▒░██▓ ▓█   ▓██▒▒ ▓███▀ ░▒██▒ █▄░▒████▒░██▓ ▒██▒
   ▒ ░░▒░▒ ▒▒   ▓▒█░░ ░▒ ▒  ░▒ ▒▒ ▓▒░░ ▒░ ░░ ▒▓ ░▒▓░
   ▒ ░▒░ ░  ▒   ▒▒ ░  ░  ▒   ░ ░▒ ▒░ ░ ░  ░  ░▒ ░ ▒░
   ░  ░░ ░  ░   ▒   ░        ░ ░░ ░    ░     ░░   ░
   ░  ░  ░      ░  ░░ ░      ░  ░      ░  ░   ░
`,
  skull: `
      _______________
     /               \\
    |  RIP FIREWALL  |
    |    2024-2024   |
    |_________________|
          |   |
         _|   |_
        |       |
`,
  server: `
    +------------------+
    |  [====]  SYSTEM  |
    |  [====]  ONLINE  |
    |  [    ]          |
    |  [====]  |||     |
    +------------------+
`,
  key: `
       _______
      /       \\
     | O     O |
      \\_______/
          |
       ___|___
      |   |   |
      |___|___|
`,
  crown: `
        ___
    .-\"\"   \"\"-.
   /   o   o   \\
  |      ^      |
   \\  \\-----/  /
    '-._____.-'
`,
  edr: `
    +=====================+
    |  [!] EDR ACTIVE [!] |
    |  Monitoring: ON     |
    |  Hooks: ENABLED     |
    |  Alerts: 0          |
    +=====================+
`,
  kernel: `
     _____________
    |  RING  0    |
    |  =========  |
    | |  KERNEL | |
    | |_________| |
    |  [DANGER]   |
    |_____________|
`,
  temple: `
         /\\
        /  \\
       / || \\
      /  ||  \\
     /   ||   \\
    /____||____\\
    |    ||    |
    | TEMPLE OS |
    |___________|
`,
  skibidi: `
       ╭━━━━━━━╮
       ┃ ⊙ _ ⊙ ┃
       ╰┳━━━━┳╯
     ╭━━┻━━━━┻━━╮
     ┃  SKIBIDI ┃
     ┃  TOILET  ┃
     ╰━━━┳┳━━━━╯
         ┃┃
    ━━━━━┻┻━━━━━
`,
  ohio: `
    ╔═══════════════════╗
    ║  ONLY IN OHIO...  ║
    ║                   ║
    ║   ┌─────────┐     ║
    ║   │ ◉ ︵ ◉ │     ║
    ║   │  ╭───╮  │     ║
    ║   │  │OH │  │     ║
    ║   └──┴───┴──┘     ║
    ╚═══════════════════╝
`,
  sigma: `
    ┏━━━━━━━━━━━━━━━━━━━━━━━┓
    ┃   SIGMA GRINDSET      ┃
    ┃  ╭─────────────────╮  ┃
    ┃  │                 │  ┃
    ┃  │    - ━━ -       │  ┃
    ┃  │      ┃┃┃        │  ┃
    ┃  │     ━━━━━       │  ┃
    ┃  ╰─────────────────╯  ┃
    ┃  "I AM THE STORM"     ┃
    ┗━━━━━━━━━━━━━━━━━━━━━━━┛
`,
  mewing: `
      ╭━━━━━━━━━━━━━╮
      ┃   MEWING   ┃
      ╰━━━━━━━━━━━━━╯
         ╭──────╮
        / @    @ \\
       │    ▽    │
       │  ━━━━━  │  <- tongue on roof
        \\______/
          ║  ║
         LOOKSMAX
`,
  rizz: `
    ╔═══════════════════════╗
    ║   +1000 AURA POINTS   ║
    ║                       ║
    ║      W  RIZZ  W       ║
    ║                       ║
    ║   ╭───────────────╮   ║
    ║   │   ( . Y . )   │   ║
    ║   ╰───────────────╯   ║
    ╚═══════════════════════╝
`,
  fanum: `
    ╭━━━━━━━━━━━━━━━━━━━╮
    ┃   FANUM TAX'D!    ┃
    ┃                   ┃
    ┃    ╭─────────╮    ┃
    ┃    │  ~ w ~  │    ┃
    ┃    │  \\    / │    ┃
    ┃    │   \\__/  │    ┃
    ┃    ╰─────────╯    ┃
    ┃  your creds? MINE ┃
    ╰━━━━━━━━━━━━━━━━━━━╯
`,
  gyatt: `
     ██████╗ ██╗   ██╗ █████╗ ████████╗████████╗
    ██╔════╝ ╚██╗ ██╔╝██╔══██╗╚══██╔══╝╚══██╔══╝
    ██║  ███╗ ╚████╔╝ ███████║   ██║      ██║
    ██║   ██║  ╚██╔╝  ██╔══██║   ██║      ██║
    ╚██████╔╝   ██║   ██║  ██║   ██║      ██║
     ╚═════╝    ╚═╝   ╚═╝  ╚═╝   ╚═╝      ╚═╝
`,
  edging: `
    ╭━━━━━━━━━━━━━━━━━━━━━╮
    ┃  EDGING THE EDR... ┃
    ┃                    ┃
    ┃   [████████░░] 80% ┃
    ┃                    ┃
    ┃   so close...      ┃
    ╰━━━━━━━━━━━━━━━━━━━━━╯
`
};

// ============================================
// LEVEL DEFINITIONS
// ============================================
const LEVELS = [
  {
    id: 1,
    name: "Noob",
    subtitle: "Script Kiddie Origins",
    description: "Learn the basics. Scan, enumerate, exploit.",
    target: "192.168.1.100",
    objective: "Get user shell on target",
    commands: ['help', 'nmap', 'gobuster', 'curl', 'nc', 'ssh', 'cat', 'ls', 'id', 'exit'],
    init: initLevel1,
    handleCommand: handleLevel1Command
  },
  {
    id: 2,
    name: "Hacker",
    subtitle: "Lateral Movement",
    description: "Pivot through the network. Crack hashes. Move laterally.",
    target: "CORP-DC01",
    objective: "Compromise domain user",
    commands: ['help', 'nmap', 'ssh', 'scp', 'hashcat', 'hydra', 'crackmapexec', 'cat', 'ls', 'exit'],
    init: initLevel2,
    handleCommand: handleLevel2Command
  },
  {
    id: 3,
    name: "Elite Hacker",
    subtitle: "Active Directory Assault",
    description: "Full AD attack chain. Kerberoast. Pass-the-hash. Own the domain.",
    target: "MEGACORP.LOCAL",
    objective: "Domain Admin",
    commands: ['help', 'bloodhound', 'rubeus', 'mimikatz', 'impacket-secretsdump', 'impacket-psexec', 'evil-winrm', 'cat', 'ls', 'exit'],
    init: initLevel3,
    handleCommand: handleLevel3Command
  },
  {
    id: 4,
    name: "Expert EDR Evader",
    subtitle: "Ghost Protocol",
    description: "Evade endpoint detection. Unhook. Obfuscate. Stay invisible.",
    target: "SECURE-WKS01",
    objective: "Execute payload undetected",
    commands: ['help', 'scan', 'unhook', 'obfuscate', 'inject', 'hollow', 'execute', 'status', 'exit'],
    init: initLevel4,
    handleCommand: handleLevel4Command
  },
  {
    id: 5,
    name: "Kernel Exploiter",
    subtitle: "Ring Zero",
    description: "Analyze the driver. Find the bug. Write the exploit. Own the kernel.",
    target: "vulndrv.sys",
    objective: "SYSTEM via kernel exploit",
    commands: ['help', 'analyze', 'disasm', 'ioctl', 'alloc', 'write', 'trigger', 'status', 'exit'],
    init: initLevel5,
    handleCommand: handleLevel5Command
  },
  {
    id: 6,
    name: "HolyC Writer",
    subtitle: "Divine Computation",
    description: "Write HolyC. Speak to God. Transcend the machine.",
    target: "TempleOS",
    objective: "Divine enlightenment",
    commands: ['help', 'holyc', 'compile', 'run', 'pray', 'speak', 'transcend', 'exit'],
    init: initLevel6,
    handleCommand: handleLevel6Command
  }
];

// ============================================
// MAIN MENU
// ============================================
async function showMainMenu() {
  // Don't reset levelState when going to menu - preserve it for continue
  gameState.inLevel = false;
  hud.style.display = 'none';
  levelSelect.style.display = 'none';
  clear();

  playBoot();

  for (const line of ASCII.title.split('\n')) {
    print(line, 'ascii');
    await sleep(50);
  }

  print('');

  // Check if we need hacker name
  if (gameState.needsName) {
    await typeText('// Enter your hacker name to begin...', 20, 'warning');
    print('Type your name and press Enter:', 'info');
    prompt.textContent = 'name>';
    return;
  }

  await typeText(`// Welcome back, ${gameState.hackerName}`, 20, 'success');
  await typeText('// Terminal-based hacking simulation', 20, 'system');
  await typeText('// 6 levels of increasing difficulty', 20, 'system');
  await typeText('// Type commands. Own systems. Level up.', 20, 'system');
  print('');
  print('Commands:', 'info');

  // Show continue if there's a level in progress
  const hasProgress = gameState.currentLevel > 0 && Object.keys(gameState.levelState).length > 0 &&
                     !gameState.levelsCompleted.includes(gameState.currentLevel);
  if (hasProgress) {
    print(`  continue - Resume Level ${gameState.currentLevel}`, 'success');
  }

  print('  start    - Begin from first incomplete level', 'system');
  print('  levels   - Select a level', 'system');
  print('  stats    - View your progress and score', 'system');
  print('  reset    - Delete all progress', 'system');
  print('  help     - Show this message', 'system');
  print('');

  const completed = gameState.levelsCompleted.length;
  if (completed > 0) {
    print(`Progress: ${completed}/6 levels completed`, 'success');
  }
  print(`Total attempts: ${gameState.attempts}`, 'system');

  prompt.textContent = '>';
}

function showLevelSelect() {
  levelSelect.style.display = 'block';
  output.style.display = 'none';

  levelSelect.innerHTML = '<div style="margin-bottom:20px;"><span style="color:#b5e853;font-family:Monaco,monospace;">SELECT LEVEL</span> <span style="color:#555;font-size:12px;">(press ESC to go back)</span></div>';

  LEVELS.forEach((level, idx) => {
    const isCompleted = gameState.levelsCompleted.includes(level.id);
    const isUnlocked = idx === 0 || gameState.levelsCompleted.includes(LEVELS[idx - 1].id);

    const card = document.createElement('div');
    card.className = 'level-card' + (isCompleted ? ' completed' : '') + (!isUnlocked ? ' locked' : '');
    card.innerHTML = `
      <div class="level-num">${level.id}</div>
      <div class="level-info">
        <div class="level-name">${level.name} <span style="color:#555;font-size:12px;">— ${level.subtitle}</span></div>
        <div class="level-desc">${level.description}</div>
      </div>
      <div class="level-status ${isCompleted ? 'completed' : (isUnlocked ? 'unlocked' : 'locked')}">
        ${isCompleted ? 'COMPLETED' : (isUnlocked ? 'UNLOCKED' : 'LOCKED')}
      </div>
    `;

    if (isUnlocked) {
      card.onclick = () => startLevel(level.id);
    }

    levelSelect.appendChild(card);
  });
}

function hideLevelSelect() {
  levelSelect.style.display = 'none';
  output.style.display = 'block';
}

// ============================================
// START LEVEL
// ============================================
async function startLevel(levelId, continueLevel = false) {
  const level = LEVELS.find(l => l.id === levelId);
  if (!level) return;

  hideLevelSelect();
  clear();
  gameState.currentLevel = levelId;
  gameState.inLevel = true;

  // Only reset state if NOT continuing
  if (!continueLevel) {
    gameState.levelState = {};
    gameState.attempts++;
    saveGame();
  }

  // Update HUD
  hud.style.display = 'block';
  document.getElementById('hud-level').textContent = `${level.id}: ${level.name}`;
  document.getElementById('hud-target').textContent = level.target;
  document.getElementById('hud-objective').textContent = level.objective;

  // Update prompt
  prompt.textContent = 'root@kali:~#';

  playBoot();

  print(`========================================`, 'system');
  print(`  LEVEL ${level.id}: ${level.name.toUpperCase()}`, 'highlight');
  print(`  "${level.subtitle}"`, 'system');
  print(`========================================`, 'system');
  print('');
  print(`TARGET: ${level.target}`, 'info');
  print(`OBJECTIVE: ${level.objective}`, 'warning');
  print('');

  if (continueLevel) {
    print('[Resuming from saved progress...]', 'success');
    print('');
    // Show current state
    const stateKeys = Object.entries(gameState.levelState).filter(([k, v]) => v === true);
    if (stateKeys.length > 0) {
      print('Progress restored:', 'info');
      stateKeys.forEach(([k]) => print(`  - ${k}`, 'system'));
      print('');
    }
  }

  print('Type "help" for available commands.', 'system');
  print('');

  // Only initialize level state if NOT continuing
  if (!continueLevel) {
    await level.init();
  }
}

function completeLevel() {
  const level = LEVELS.find(l => l.id === gameState.currentLevel);
  if (!level) return;

  if (!gameState.levelsCompleted.includes(level.id)) {
    gameState.levelsCompleted.push(level.id);
    saveGame();
  }

  playSuccess();

  // Level completion art (brainrot ASCII, normal messages)
  const levelMemes = {
    1: { art: 'skibidi', msg: 'First shell acquired. Welcome to the game.' },
    2: { art: 'fanum', msg: 'Lateral movement complete. Network compromised.' },
    3: { art: 'sigma', msg: 'Domain Admin achieved. The network is yours.' },
    4: { art: 'edging', msg: 'EDR bypassed. Ghost mode activated.' },
    5: { art: 'gyatt', msg: 'Ring 0 access. You own the kernel.' },
    6: { art: 'rizz', msg: 'Transcendence complete. You are one with the machine.' }
  };

  const meme = levelMemes[level.id];

  print('');
  print('========================================', 'success');
  print(`  LEVEL ${level.id} COMPLETE!`, 'success');
  print('========================================', 'success');
  print('');

  if (meme) {
    print(ASCII[meme.art], 'ascii');
    print('');
    print(meme.msg, 'highlight');
    print('');
  }

  // Random hacker quotes
  const bonusMessages = [
    '"The quieter you become, the more you can hear." - BackTrack',
    '"rm -rf / their security" - Anonymous',
    '"sudo make me a sandwich" - xkcd',
    '"There is no patch for human stupidity." - Kevin Mitnick',
    '"Hackers are breaking the systems for profit. Before, it was about intellectual curiosity." - Kevin Mitnick',
    '"In the digital age, privacy must be a priority." - Al Gore',
    '"The only secure computer is one that\'s unplugged." - Security Proverb',
    '"Trust no one. Verify everything." - Zero Trust'
  ];
  print(bonusMessages[Math.floor(Math.random() * bonusMessages.length)], 'system');
  print('');

  if (level.id < 6) {
    print('Type "next" to continue or "menu" to return.', 'system');
  } else {
    print('You have completed all levels.', 'highlight');
    print('You are now a true hacker.', 'highlight');
    print('');
    print('Type "menu" to return.', 'system');
  }
}

// ============================================
// LEVEL 1: NOOB
// ============================================
async function initLevel1() {
  gameState.levelState = {
    scanned: false,
    foundAdmin: false,
    gotCreds: false,
    connected: false,
    gotShell: false
  };

  print(ASCII.server, 'ascii');
  print('');
  print('┌─────────────────────────────────────────┐', 'info');
  print('│  TARGET INTEL                           │', 'info');
  print('├─────────────────────────────────────────┤', 'info');
  print('│  IP:     192.168.1.100                  │', 'system');
  print('│  OS:     Linux (Ubuntu 20.04)           │', 'system');
  print('│  Type:   Web Server                     │', 'system');
  print('│  Intel:  Misconfigured Apache + SSH    │', 'warning');
  print('└─────────────────────────────────────────┘', 'info');
  print('');
  await typeText('[BRIEFING] Your first target. A vulnerable web server.', 30, 'info');
  await typeText('[BRIEFING] Scan it. Find the entry point. Get a shell.', 30, 'info');
  await typeText('[BRIEFING] Show us what you\'ve got, rookie.', 30, 'warning');
  print('');
}

async function handleLevel1Command(cmd, args) {
  const state = gameState.levelState;

  if (cmd === 'help') {
    print('Available commands:', 'info');
    print('  nmap <target>     - Scan target for open ports', 'system');
    print('  gobuster <target> - Directory bruteforce', 'system');
    print('  curl <url>        - Fetch URL content', 'system');
    print('  nc <target> <port> - Connect to target', 'system');
    print('  ssh <user>@<target> - SSH connection', 'system');
    print('  exit              - Return to menu', 'system');
    return;
  }

  // Easter egg: whoami
  if (cmd === 'whoami') {
    print(`${gameState.hackerName}@n00b-vm`, 'system');
    addEasterEgg('lvl1_whoami', 'Identity confirmed: Future elite hacker');
    return;
  }

  if (cmd === 'nmap') {
    if (!args[0]) {
      print('Usage: nmap <target>', 'error');
      return;
    }
    await simulateLoading('Scanning ' + args[0], 2500);
    print('');
    print('PORT     STATE  SERVICE', 'info');
    print('22/tcp   open   ssh', 'system');
    print('80/tcp   open   http', 'system');
    print('3306/tcp closed mysql', 'system');
    print('');
    print('Nmap done: 1 IP address scanned', 'system');
    state.scanned = true;
    return;
  }

  if (cmd === 'gobuster') {
    if (!state.scanned) {
      print('Maybe scan the target first?', 'warning');
      return;
    }
    await simulateLoading('Bruteforcing directories', 3000);
    print('');
    print('/index.html          (Status: 200)', 'system');
    print('/admin               (Status: 301)', 'success');
    print('/robots.txt          (Status: 200)', 'system');
    print('/backup              (Status: 403)', 'warning');
    print('');
    print('[!] Found: /admin panel', 'success');
    state.foundAdmin = true;
    autosave();
    return;
  }

  if (cmd === 'curl') {
    if (!args[0]) {
      print('Usage: curl <url>', 'error');
      return;
    }

    if (args[0].includes('robots.txt')) {
      print('User-agent: *', 'system');
      print('Disallow: /admin', 'system');
      print('Disallow: /backup/creds.txt', 'success');
      print('');
      print('[!] Interesting... /backup/creds.txt', 'warning');
      return;
    }

    if (args[0].includes('creds.txt') || args[0].includes('backup')) {
      print('# Backup credentials', 'system');
      print('# TODO: Remove before production!', 'warning');
      print('admin:Sup3rS3cur3P@ss!', 'success');
      print('');
      print('[!] Got credentials!', 'success');
      playAlert();
      state.gotCreds = true;
      autosave();
      return;
    }

    if (args[0].includes('admin')) {
      print('<html>', 'system');
      print('  <title>Admin Login</title>', 'system');
      print('  <form action="/admin/login" method="POST">', 'system');
      print('    <input name="user" placeholder="Username">', 'system');
      print('    <input name="pass" type="password">', 'system');
      print('  </form>', 'system');
      print('</html>', 'system');
      return;
    }

    print('<html><body>Welcome to our server!</body></html>', 'system');
    return;
  }

  if (cmd === 'ssh') {
    if (!args[0]) {
      print('Usage: ssh <user>@<target>', 'error');
      return;
    }

    if (!state.gotCreds) {
      print('Permission denied (publickey,password).', 'error');
      print('Hint: Need credentials first...', 'warning');
      return;
    }

    if (args[0].includes('admin@')) {
      await simulateLoading('Connecting', 1500);
      print('');
      print('Welcome to Ubuntu 20.04 LTS', 'success');
      print('Last login: never', 'system');
      print('');
      prompt.textContent = 'admin@target:~$';
      state.connected = true;
      playSuccess();
      autosave();
      return;
    }

    print('Connection refused', 'error');
    return;
  }

  if (cmd === 'id' && state.connected) {
    print('uid=1000(admin) gid=1000(admin) groups=1000(admin),27(sudo)', 'system');
    return;
  }

  if (cmd === 'ls' && state.connected) {
    print('Desktop  Documents  user.txt', 'system');
    return;
  }

  if (cmd === 'cat' && state.connected) {
    if (args[0] === 'user.txt') {
      print('FLAG{n00b_h4ck3r_g0t_sh3ll}', 'success');
      print('');
      state.gotShell = true;
      completeLevel();
      return;
    }
    print('cat: ' + (args[0] || '') + ': No such file', 'error');
    return;
  }

  print('Command not found: ' + cmd, 'error');
}

// ============================================
// LEVEL 2: HACKER
// ============================================
async function initLevel2() {
  gameState.levelState = {
    scanned: false,
    foundShares: false,
    gotHash: false,
    crackedHash: false,
    authenticated: false
  };

  print('┌─────────────────────────────────────────┐', 'info');
  print('│  TARGET INTEL                           │', 'info');
  print('├─────────────────────────────────────────┤', 'info');
  print('│  Network:  10.10.10.0/24                │', 'system');
  print('│  Your IP:  10.10.14.5 (VPN)             │', 'system');
  print('│  OS:       Windows Server / Win10       │', 'system');
  print('│  Domain:   CORP.LOCAL                   │', 'system');
  print('│  Intel:    SMB shares, weak passwords   │', 'warning');
  print('├─────────────────────────────────────────┤', 'info');
  print('│  KNOWN HOSTS:                           │', 'info');
  print('│    10.10.10.1   - Router                │', 'system');
  print('│    10.10.10.50  - FILE-SRV01            │', 'system');
  print('│    10.10.10.100 - CORP-DC01 (DC)        │', 'warning');
  print('└─────────────────────────────────────────┘', 'info');
  print('');
  print('[BRIEFING] You\'re inside the network now.', 'info');
  print('[BRIEFING] Multiple hosts detected. Find creds. Move laterally.', 'info');
  print('[BRIEFING] Target: Domain user account on CORP-DC01', 'info');
  print('');
}

async function handleLevel2Command(cmd, args) {
  const state = gameState.levelState;

  if (cmd === 'help') {
    print('Available commands:', 'info');
    print('  nmap <target>           - Network scan', 'system');
    print('  crackmapexec smb <target> - SMB enumeration', 'system');
    print('  smbclient //<target>/<share> - Access SMB share', 'system');
    print('  hashcat -m 1000 <hash>  - Crack NTLM hash', 'system');
    print('  evil-winrm -i <target> -u <user> -p <pass>', 'system');
    print('  exit                    - Return to menu', 'system');
    return;
  }

  // Easter egg: mimikatz
  if (cmd === 'mimikatz') {
    print('mimikatz # sekurlsa::logonpasswords', 'system');
    print('', 'system');
    print('[ERROR] Access Denied - Need SYSTEM privileges', 'error');
    print('', 'system');
    print('Nice try! But not in this level...', 'warning');
    addEasterEgg('lvl2_mimikatz', 'Patience, young padawan. Mimikatz comes later.');
    return;
  }

  if (cmd === 'nmap') {
    await simulateLoading('Scanning network 10.10.10.0/24', 3000);
    print('');
    print('Discovered hosts:', 'info');
    print('  10.10.10.1   - Router', 'system');
    print('  10.10.10.10  - WORKSTATION-01 (Windows 10)', 'system');
    print('  10.10.10.50  - FILE-SRV01 (Windows Server 2019)', 'success');
    print('  10.10.10.100 - CORP-DC01 (Domain Controller)', 'warning');
    print('');
    state.scanned = true;
    return;
  }

  if (cmd === 'crackmapexec') {
    if (!state.scanned) {
      print('Scan the network first', 'warning');
      return;
    }

    if (args.includes('10.10.10.50') || args.includes('FILE-SRV01')) {
      await simulateLoading('Enumerating SMB shares', 2000);
      print('');
      print('SMB   10.10.10.50  445  FILE-SRV01  [*] Windows Server 2019', 'system');
      print('SMB   10.10.10.50  445  FILE-SRV01  [+] Shares:', 'success');
      print('      IT_Backup    READ', 'success');
      print('      Users        READ', 'system');
      print('      ADMIN$       NO ACCESS', 'error');
      print('');
      state.foundShares = true;
      return;
    }

    print('Access denied or host unreachable', 'error');
    return;
  }

  if (cmd === 'smbclient') {
    if (!state.foundShares) {
      print('Find the shares first', 'warning');
      return;
    }

    if (args[0] && args[0].includes('IT_Backup')) {
      print('smb: \\>', 'system');
      print('  .                  D        0  Mon Jan 15 09:00:00 2024', 'system');
      print('  ..                 D        0  Mon Jan 15 09:00:00 2024', 'system');
      print('  old_passwords.txt  A      156  Mon Jan 15 08:45:00 2024', 'success');
      print('  config.bak         A     1024  Mon Jan 15 08:30:00 2024', 'system');
      print('');
      print('Use "get old_passwords.txt" to download', 'info');
      return;
    }

    if (args[0] && args[0].includes('get')) {
      print('getting file old_passwords.txt...', 'system');
      print('');
      print('--- old_passwords.txt ---', 'info');
      print('# Old password hashes - to be deleted', 'warning');
      print('svc_backup:1001:aad3b435b51404eeaad3b435b51404ee:58a478135a93ac3bf058a5ea0e8fdb71:::', 'success');
      print('');
      playAlert();
      state.gotHash = true;
      return;
    }

    print('Share not found', 'error');
    return;
  }

  if (cmd === 'hashcat') {
    if (!state.gotHash) {
      print('Need a hash to crack first', 'warning');
      return;
    }

    await simulateLoading('Cracking NTLM hash', 4000);
    print('');
    print('58a478135a93ac3bf058a5ea0e8fdb71:Backup2023!', 'success');
    print('');
    print('Session..........: hashcat', 'system');
    print('Status...........: Cracked', 'success');
    print('Hash.Type........: NTLM', 'system');
    print('');
    playSuccess();
    state.crackedHash = true;
    return;
  }

  if (cmd === 'evil-winrm') {
    if (!state.crackedHash) {
      print('Need valid credentials', 'error');
      return;
    }

    if (args.includes('svc_backup') && args.includes('Backup2023!')) {
      await simulateLoading('Connecting to CORP-DC01', 2000);
      print('');
      print('Evil-WinRM shell v3.4', 'success');
      print('Info: Establishing connection to remote endpoint', 'system');
      print('');
      print('*Evil-WinRM* PS C:\\Users\\svc_backup\\Desktop>', 'success');
      print('');
      prompt.textContent = '*Evil-WinRM* PS>';
      state.authenticated = true;
      return;
    }

    print('WinRM connection failed', 'error');
    return;
  }

  if (cmd === 'whoami' && state.authenticated) {
    print('megacorp\\svc_backup', 'success');
    print('');
    completeLevel();
    return;
  }

  if (cmd === 'ls' && state.authenticated) {
    print('    Directory: C:\\Users\\svc_backup\\Desktop', 'system');
    print('Mode                 LastWriteTime         Length Name', 'system');
    print('----                 -------------         ------ ----', 'system');
    print('-a----         1/15/2024   9:00 AM             38 flag.txt', 'system');
    return;
  }

  if (cmd === 'cat' && state.authenticated && args[0] === 'flag.txt') {
    print('FLAG{l4t3r4l_m0v3m3nt_m4st3r}', 'success');
    completeLevel();
    return;
  }

  print('Command not found: ' + cmd, 'error');
}

// ============================================
// LEVEL 3: ELITE HACKER
// ============================================
async function initLevel3() {
  gameState.levelState = {
    collectedBloodhound: false,
    foundPath: false,
    kerberoasted: false,
    crackedTicket: false,
    gotDA: false
  };

  print('┌─────────────────────────────────────────┐', 'info');
  print('│  TARGET INTEL                           │', 'info');
  print('├─────────────────────────────────────────┤', 'info');
  print('│  Domain:   MEGACORP.LOCAL               │', 'system');
  print('│  DC:       CORP-DC01 (10.10.10.100)     │', 'system');
  print('│  OS:       Windows Server 2019          │', 'system');
  print('│  Foothold: svc_backup (service acct)    │', 'success');
  print('│  Intel:    Kerberoastable SPNs found    │', 'warning');
  print('├─────────────────────────────────────────┤', 'info');
  print('│  KEY ACCOUNTS:                          │', 'info');
  print('│    Administrator  - Domain Admin        │', 'error');
  print('│    svc_sql        - SQL Service (SPN)   │', 'warning');
  print('│    backup_svc     - Backup Service      │', 'system');
  print('└─────────────────────────────────────────┘', 'info');
  print('');
  print('Current session: MEGACORP\\svc_backup', 'success');
  print('');
  print('[BRIEFING] Full Active Directory engagement.', 'info');
  print('[BRIEFING] You have a foothold. Now escalate to DA.', 'info');
  print('');
}

async function handleLevel3Command(cmd, args) {
  const state = gameState.levelState;

  if (cmd === 'help') {
    print('Available commands:', 'info');
    print('  bloodhound-python -d <domain> -u <user> -p <pass> -c all', 'system');
    print('  bloodhound             - Analyze collected data', 'system');
    print('  rubeus kerberoast      - Kerberoast attack', 'system');
    print('  hashcat -m 13100 <hash> - Crack TGS ticket', 'system');
    print('  impacket-secretsdump   - Dump credentials', 'system');
    print('  impacket-psexec        - Get shell as user', 'system');
    print('  exit                   - Return to menu', 'system');
    return;
  }

  // Easter egg: net user
  if (cmd === 'net' && args[0] === 'user') {
    print('User accounts for \\\\MEGACORP-DC', 'system');
    print('', 'system');
    print('Administrator     backup_svc        Guest', 'system');
    print('krbtgt            svc_sql           j.smith', 'system');
    print('', 'system');
    print('The command completed successfully.', 'system');
    addEasterEgg('lvl3_netuser', 'Old school recon! BloodHound is faster though.');
    return;
  }

  if (cmd === 'bloodhound-python') {
    await simulateLoading('Collecting Active Directory data', 4000);
    print('');
    print('[*] Connecting to MEGACORP.LOCAL', 'system');
    print('[*] Found 1 domain', 'system');
    print('[*] Found 245 users', 'system');
    print('[*] Found 52 groups', 'system');
    print('[*] Found 12 computers', 'system');
    print('[*] Found 3 GPOs', 'system');
    print('[+] Data collected successfully', 'success');
    print('');
    state.collectedBloodhound = true;
    return;
  }

  if (cmd === 'bloodhound') {
    if (!state.collectedBloodhound) {
      print('Collect data first with bloodhound-python', 'warning');
      return;
    }

    print('');
    print('=== ATTACK PATH FOUND ===', 'success');
    print('', '');
    print('svc_backup', 'info');
    print('    |', 'system');
    print('    | [HasSPNConfigured]', 'warning');
    print('    v', 'system');
    print('svc_sql (Kerberoastable)', 'success');
    print('    |', 'system');
    print('    | [MemberOf]', 'warning');
    print('    v', 'system');
    print('SQL_Admins', 'info');
    print('    |', 'system');
    print('    | [GenericAll]', 'warning');
    print('    v', 'system');
    print('Domain Admins', 'success');
    print('');
    print('[!] svc_sql is Kerberoastable and member of SQL_Admins', 'warning');
    print('[!] SQL_Admins has GenericAll on Domain Admins!', 'warning');
    print('');
    playAlert();
    state.foundPath = true;
    return;
  }

  if (cmd === 'rubeus') {
    if (!state.foundPath) {
      print('Analyze the attack path first', 'warning');
      return;
    }

    if (args[0] === 'kerberoast') {
      await simulateLoading('Performing Kerberoast attack', 3000);
      print('');
      print('[*] Target User: svc_sql@MEGACORP.LOCAL', 'system');
      print('[*] Target SPN: MSSQLSvc/SQL01.megacorp.local:1433', 'system');
      print('[+] Got TGS ticket!', 'success');
      print('');
      print('$krb5tgs$23$*svc_sql$MEGACORP.LOCAL$MSSQLSvc/SQL01*$a8f5e2d4c1b3...', 'success');
      print('[truncated - saved to ticket.txt]', 'system');
      print('');
      state.kerberoasted = true;
      return;
    }

    print('Usage: rubeus kerberoast', 'error');
    return;
  }

  if (cmd === 'hashcat') {
    if (!state.kerberoasted) {
      print('Need a ticket to crack', 'warning');
      return;
    }

    await simulateLoading('Cracking Kerberos TGS ticket', 5000);
    print('');
    print('$krb5tgs$23$*svc_sql$...:SQLAdmin2023!', 'success');
    print('');
    print('Session..........: hashcat', 'system');
    print('Status...........: Cracked', 'success');
    print('Hash.Type........: Kerberos 5 TGS-REP', 'system');
    print('');
    print('[+] Password: SQLAdmin2023!', 'success');
    playSuccess();
    state.crackedTicket = true;
    return;
  }

  if (cmd === 'impacket-secretsdump') {
    if (!state.crackedTicket) {
      print('Need valid credentials first', 'warning');
      return;
    }

    await simulateLoading('Dumping domain secrets', 4000);
    print('');
    print('[*] Dumping Domain Credentials (domain\\uid:rid:lmhash:nthash)', 'system');
    print('[*] Using the GenericAll privilege...', 'warning');
    print('');
    print('Administrator:500:aad3b435b51404eeaad3b435b51404ee:a87f3a337d73085c45f9416be5787d86:::', 'success');
    print('krbtgt:502:aad3b435b51404eeaad3b435b51404ee:b21c99fc068e3ab2ca789bccbef67de4:::', 'system');
    print('');
    print('[+] Got Domain Admin hash!', 'success');
    playAlert();
    state.gotDA = true;
    return;
  }

  if (cmd === 'impacket-psexec') {
    if (!state.gotDA) {
      print('Need DA credentials', 'warning');
      return;
    }

    await simulateLoading('Connecting as Administrator', 2000);
    print('');
    print('Impacket v0.10.0', 'system');
    print('[*] Requesting shares on CORP-DC01...', 'system');
    print('[*] Found writable share ADMIN$', 'system');
    print('[*] Uploading file...', 'system');
    print('[*] Opening SVCManager...', 'system');
    print('[*] Creating service...', 'system');
    print('[*] Starting service...', 'success');
    print('');
    print('Microsoft Windows [Version 10.0.17763.4377]', 'success');
    print('(c) 2019 Microsoft Corporation.', 'system');
    print('');
    print('C:\\Windows\\system32>', 'success');
    prompt.textContent = 'C:\\Windows\\system32>';
    print('');
    print(ASCII.crown, 'ascii');
    print('');
    print('[+] DOMAIN ADMIN ACHIEVED!', 'success');
    completeLevel();
    return;
  }

  print('Command not found: ' + cmd, 'error');
}

// ============================================
// LEVEL 4: EDR EVADER
// ============================================
async function initLevel4() {
  gameState.levelState = {
    edrAnalyzed: false,
    ntdllUnhooked: false,
    payloadObfuscated: false,
    injectionReady: false,
    executed: false,
    detectionLevel: 100
  };

  print(ASCII.edr, 'warning');
  print('');
  print('┌─────────────────────────────────────────┐', 'info');
  print('│  TARGET INTEL                           │', 'info');
  print('├─────────────────────────────────────────┤', 'info');
  print('│  Host:     SECURE-WKS01                 │', 'system');
  print('│  IP:       10.10.10.55                  │', 'system');
  print('│  OS:       Windows 11 Enterprise        │', 'system');
  print('│  User:     j.smith (Local Admin)        │', 'success');
  print('├─────────────────────────────────────────┤', 'info');
  print('│  EDR DETECTED:                          │', 'error');
  print('│    CrowdStrike Falcon  (ACTIVE)         │', 'error');
  print('│    Windows Defender    (ACTIVE)         │', 'error');
  print('│    Carbon Black        (ACTIVE)         │', 'error');
  print('├─────────────────────────────────────────┤', 'info');
  print('│  HOOKS DETECTED:                        │', 'warning');
  print('│    ntdll.dll - NtAllocateVirtualMemory  │', 'warning');
  print('│    ntdll.dll - NtWriteVirtualMemory     │', 'warning');
  print('│    ntdll.dll - NtCreateThreadEx         │', 'warning');
  print('└─────────────────────────────────────────┘', 'info');
  print('');
  print('[!] Detection Risk: HIGH (100%)', 'error');
  print('');
  print('[BRIEFING] Target has multiple EDR solutions.', 'error');
  print('[BRIEFING] Unhook, obfuscate, and evade.', 'info');
  print('');
}

async function handleLevel4Command(cmd, args) {
  const state = gameState.levelState;

  function updateDetection() {
    const level = state.detectionLevel;
    const color = level > 70 ? 'error' : (level > 30 ? 'warning' : 'success');
    print(`[*] Detection Risk: ${level}%`, color);
  }

  if (cmd === 'help') {
    print('EDR Evasion Modules:', 'info');
    print('  scan              - Analyze EDR hooks and detections', 'system');
    print('  unhook <dll>      - Unhook userland API hooks', 'system');
    print('  obfuscate <method> - Obfuscate payload (xor/aes/uuid)', 'system');
    print('  hollow <process>  - Process hollowing injection', 'system');
    print('  inject <method>   - Inject payload (early-bird/apc)', 'system');
    print('  execute           - Execute payload', 'system');
    print('  status            - Check current detection risk', 'system');
    print('  exit              - Return to menu', 'system');
    return;
  }

  // Easter egg: tasklist to see EDR processes
  if (cmd === 'tasklist') {
    print('Image Name                     PID Session Name', 'system');
    print('========================= ======== ============', 'system');
    print('System                           4 Services', 'system');
    print('csrss.exe                      512 Services', 'system');
    print('MsMpEng.exe                   2104 Services     [!] Defender', 'warning');
    print('CrowdStrike.exe               3842 Services     [!] CS Falcon', 'error');
    print('cb.exe                        4201 Services     [!] Carbon Black', 'error');
    print('', '');
    print('[!] Multiple EDR solutions detected. Good luck.', 'warning');
    addEasterEgg('lvl4_tasklist', 'Know your enemy. EDR enumeration complete.');
    return;
  }

  if (cmd === 'status') {
    updateDetection();
    print('');
    print('Current Evasion Status:', 'info');
    print(`  NTDLL Unhooked: ${state.ntdllUnhooked ? 'YES' : 'NO'}`, state.ntdllUnhooked ? 'success' : 'error');
    print(`  Payload Obfuscated: ${state.payloadObfuscated ? 'YES' : 'NO'}`, state.payloadObfuscated ? 'success' : 'error');
    print(`  Injection Method: ${state.injectionReady ? 'READY' : 'NOT SET'}`, state.injectionReady ? 'success' : 'error');
    return;
  }

  if (cmd === 'scan') {
    await simulateLoading('Analyzing EDR hooks', 3000);
    print('');
    print('=== EDR Analysis Results ===', 'info');
    print('');
    print('Hooked APIs in ntdll.dll:', 'warning');
    print('  NtAllocateVirtualMemory  [HOOKED]', 'error');
    print('  NtWriteVirtualMemory     [HOOKED]', 'error');
    print('  NtCreateThreadEx         [HOOKED]', 'error');
    print('  NtProtectVirtualMemory   [HOOKED]', 'error');
    print('');
    print('Hooked APIs in kernel32.dll:', 'warning');
    print('  VirtualAlloc             [HOOKED]', 'error');
    print('  WriteProcessMemory       [HOOKED]', 'error');
    print('  CreateRemoteThread       [HOOKED]', 'error');
    print('');
    print('[!] Direct syscalls or unhooking required', 'warning');
    state.edrAnalyzed = true;
    return;
  }

  if (cmd === 'unhook') {
    if (!state.edrAnalyzed) {
      print('Analyze EDR first with "scan"', 'warning');
      return;
    }

    if (args[0] === 'ntdll' || args[0] === 'ntdll.dll') {
      await simulateLoading('Unhooking ntdll.dll from disk', 3000);
      print('');
      print('[*] Reading clean ntdll.dll from disk...', 'system');
      print('[*] Mapping clean .text section...', 'system');
      print('[*] Overwriting hooked bytes...', 'system');
      print('[+] ntdll.dll unhooked successfully!', 'success');
      print('');
      state.ntdllUnhooked = true;
      state.detectionLevel -= 35;
      updateDetection();
      playSuccess();
      return;
    }

    print('Usage: unhook ntdll', 'error');
    return;
  }

  if (cmd === 'obfuscate') {
    if (!args[0]) {
      print('Usage: obfuscate <xor|aes|uuid>', 'error');
      return;
    }

    const method = args[0].toLowerCase();
    if (!['xor', 'aes', 'uuid'].includes(method)) {
      print('Invalid method. Use: xor, aes, or uuid', 'error');
      return;
    }

    await simulateLoading(`Obfuscating payload with ${method.toUpperCase()}`, 2500);
    print('');

    if (method === 'xor') {
      print('[*] Generating random XOR key...', 'system');
      print('[*] Encrypting shellcode bytes...', 'system');
      print('[+] Payload obfuscated with XOR', 'success');
      state.detectionLevel -= 15;
    } else if (method === 'aes') {
      print('[*] Generating AES-256 key...', 'system');
      print('[*] Encrypting shellcode with AES-CBC...', 'system');
      print('[+] Payload obfuscated with AES-256', 'success');
      state.detectionLevel -= 25;
    } else if (method === 'uuid') {
      print('[*] Converting shellcode to UUID strings...', 'system');
      print('[*] Payload now appears as array of GUIDs...', 'system');
      print('[+] Payload obfuscated with UUID encoding', 'success');
      state.detectionLevel -= 20;
    }

    print('');
    state.payloadObfuscated = true;
    updateDetection();
    return;
  }

  if (cmd === 'hollow') {
    if (!state.payloadObfuscated) {
      print('Obfuscate payload first', 'warning');
      return;
    }

    if (!args[0]) {
      print('Usage: hollow <process>', 'error');
      print('Suggested targets: svchost, RuntimeBroker, dllhost', 'info');
      return;
    }

    await simulateLoading(`Setting up process hollowing with ${args[0]}.exe`, 3000);
    print('');
    print(`[*] Creating suspended ${args[0]}.exe...`, 'system');
    print('[*] Unmapping original image...', 'system');
    print('[*] Allocating memory in remote process...', 'system');
    print('[*] Writing decrypted payload...', 'system');
    print('[*] Fixing entry point...', 'system');
    print('[+] Process hollowing prepared!', 'success');
    print('');
    state.injectionReady = true;
    state.detectionLevel -= 20;
    updateDetection();
    return;
  }

  if (cmd === 'inject') {
    if (!state.ntdllUnhooked) {
      print('Unhook ntdll first to avoid detection', 'warning');
      return;
    }

    if (!args[0]) {
      print('Usage: inject <early-bird|apc>', 'error');
      return;
    }

    const method = args[0].toLowerCase();
    await simulateLoading(`Configuring ${method} injection`, 2000);
    print('');

    if (method === 'early-bird') {
      print('[*] Will inject before process initialization...', 'system');
      print('[+] Early Bird injection configured', 'success');
      state.detectionLevel -= 15;
    } else if (method === 'apc') {
      print('[*] Will queue APC to alertable thread...', 'system');
      print('[+] APC injection configured', 'success');
      state.detectionLevel -= 10;
    }

    print('');
    state.injectionReady = true;
    updateDetection();
    return;
  }

  if (cmd === 'execute') {
    if (!state.injectionReady) {
      print('Configure injection method first', 'warning');
      return;
    }

    if (state.detectionLevel > 30) {
      print('[!] Detection risk too high!', 'error');
      print('[!] EDR will catch us. Lower detection risk first.', 'error');
      playError();
      return;
    }

    await simulateLoading('Executing payload', 3000);
    print('');
    print('[*] Resuming hollowed process...', 'system');
    print('[*] Shellcode executing...', 'system');
    print('[*] Callback received!', 'success');
    print('');
    print('=== EDR STATUS ===', 'success');
    print('Alerts: 0', 'success');
    print('Detections: NONE', 'success');
    print('');
    print(ASCII.skull, 'ascii');
    print('[+] PAYLOAD EXECUTED UNDETECTED!', 'success');
    playSuccess();
    state.executed = true;
    completeLevel();
    return;
  }

  print('Command not found: ' + cmd, 'error');
}

// ============================================
// LEVEL 5: KERNEL EXPLOITER
// ============================================
async function initLevel5() {
  gameState.levelState = {
    analyzed: false,
    foundVuln: false,
    allocatedPool: false,
    wroteShellcode: false,
    exploited: false,
    poolAddress: null
  };

  print(ASCII.kernel, 'warning');
  print('');
  print('┌─────────────────────────────────────────┐', 'info');
  print('│  TARGET INTEL                           │', 'info');
  print('├─────────────────────────────────────────┤', 'info');
  print('│  Host:     DEV-WKS01                    │', 'system');
  print('│  OS:       Windows 10 21H2 (x64)        │', 'system');
  print('│  KASLR:    Enabled                      │', 'warning');
  print('│  SMEP:     Enabled                      │', 'warning');
  print('│  Driver:   vulndrv.sys v1.0.3          │', 'error');
  print('├─────────────────────────────────────────┤', 'info');
  print('│  LOADED MODULES:                        │', 'info');
  print('│    ntoskrnl.exe  @ 0xfffff80012400000   │', 'system');
  print('│    hal.dll       @ 0xfffff80012000000   │', 'system');
  print('│    vulndrv.sys   @ 0xfffff80045670000   │', 'warning');
  print('├─────────────────────────────────────────┤', 'info');
  print('│  DRIVER IOCTL CODES:                    │', 'info');
  print('│    0x222003 - ALLOC_POOL               │', 'system');
  print('│    0x222007 - WRITE_MEM                │', 'system');
  print('│    0x22200B - EXEC_CODE (!)            │', 'error');
  print('└─────────────────────────────────────────┘', 'info');
  print('');
  print('[BRIEFING] A vulnerable driver is loaded.', 'info');
  print('[BRIEFING] Analyze it. Find the bug. Get SYSTEM.', 'info');
  print('');
}

async function handleLevel5Command(cmd, args) {
  const state = gameState.levelState;

  if (cmd === 'help') {
    print('Kernel Exploitation Commands:', 'info');
    print('  analyze              - Analyze vulndrv.sys', 'system');
    print('  disasm <function>    - Disassemble function', 'system');
    print('  ioctl <code>         - Send IOCTL to driver', 'system');
    print('  alloc <size>         - Allocate pool memory', 'system');
    print('  write <addr> <data>  - Write to address', 'system');
    print('  trigger              - Trigger the exploit', 'system');
    print('  status               - Current exploit status', 'system');
    print('  exit                 - Return to menu', 'system');
    return;
  }

  // Easter egg: WinDbg style command
  if (cmd === '!analyze' || cmd === 'lm') {
    print('kd> lm m vulndrv', 'system');
    print('', '');
    print('start             end                 module name', 'system');
    print('fffff801`12340000 fffff801`12345000   vulndrv  (deferred)', 'warning');
    print('', '');
    print('[*] Looks like someone knows their way around WinDbg...', 'info');
    addEasterEgg('lvl5_windbg', 'Kernel debugging skills detected. Impressive.');
    return;
  }

  if (cmd === 'status') {
    print('Exploit Status:', 'info');
    print(`  Driver Analyzed: ${state.analyzed ? 'YES' : 'NO'}`, state.analyzed ? 'success' : 'system');
    print(`  Vulnerability Found: ${state.foundVuln ? 'YES' : 'NO'}`, state.foundVuln ? 'success' : 'system');
    print(`  Pool Allocated: ${state.allocatedPool ? 'YES' : 'NO'}`, state.allocatedPool ? 'success' : 'system');
    print(`  Shellcode Written: ${state.wroteShellcode ? 'YES' : 'NO'}`, state.wroteShellcode ? 'success' : 'system');
    return;
  }

  if (cmd === 'analyze') {
    await simulateLoading('Analyzing vulndrv.sys', 3000);
    print('');
    print('=== vulndrv.sys Analysis ===', 'info');
    print('');
    print('Driver Entry: 0xfffff80045670000', 'system');
    print('IRP Handlers:', 'system');
    print('  IRP_MJ_CREATE          0xfffff80045671000', 'system');
    print('  IRP_MJ_CLOSE           0xfffff80045671100', 'system');
    print('  IRP_MJ_DEVICE_CONTROL  0xfffff80045671200', 'warning');
    print('');
    print('IOCTL Handlers Found:', 'info');
    print('  0x22200C - ReadMemory', 'system');
    print('  0x222010 - WriteMemory', 'error');
    print('  0x222014 - AllocatePool', 'system');
    print('');
    print('[!] WriteMemory IOCTL has no validation!', 'error');
    print('[!] Arbitrary kernel write primitive!', 'error');
    print('');
    state.analyzed = true;
    playAlert();
    return;
  }

  if (cmd === 'disasm') {
    if (!state.analyzed) {
      print('Analyze the driver first', 'warning');
      return;
    }

    if (args[0] === 'WriteMemory' || args[0] === '0x222010') {
      print('');
      print('WriteMemory (0x222010):', 'info');
      print('  mov rax, [rcx+8]   ; Get destination from input', 'system');
      print('  mov rbx, [rcx+10]  ; Get source from input', 'system');
      print('  mov rcx, [rcx+18]  ; Get size from input', 'system');
      print('  rep movsb          ; Copy bytes - NO VALIDATION!', 'error');
      print('  ret', 'system');
      print('');
      print('[!] VULNERABILITY: No address validation before write!', 'error');
      print('[!] Can write anywhere in kernel memory!', 'error');
      print('');
      state.foundVuln = true;
      return;
    }

    print('Function not found', 'error');
    return;
  }

  if (cmd === 'ioctl') {
    if (!state.foundVuln) {
      print('Find the vulnerability first', 'warning');
      return;
    }

    if (args[0] === '0x222014') {
      await simulateLoading('Sending IOCTL 0x222014', 1000);
      print('[+] Pool allocated at: 0xffffe00012340000', 'success');
      return;
    }

    print('Usage: ioctl <code>', 'error');
    return;
  }

  if (cmd === 'alloc') {
    if (!state.foundVuln) {
      print('Find the vulnerability first', 'warning');
      return;
    }

    const size = args[0] || '0x1000';
    await simulateLoading(`Allocating ${size} bytes in NonPagedPool`, 1500);
    print('');
    const addr = '0xffffe000' + Math.floor(Math.random() * 0xFFFFFFFF).toString(16).padStart(8, '0');
    state.poolAddress = addr;
    print(`[+] Pool allocated at: ${addr}`, 'success');
    print('[*] Executable NonPagedPool - perfect for shellcode!', 'info');
    print('');
    state.allocatedPool = true;
    return;
  }

  if (cmd === 'write') {
    if (!state.allocatedPool) {
      print('Allocate pool memory first', 'warning');
      return;
    }

    if (!args[0] || !args[1]) {
      print('Usage: write <addr> <data>', 'error');
      print('Example: write pool shellcode', 'info');
      return;
    }

    if (args[0] === 'pool' && args[1] === 'shellcode') {
      await simulateLoading('Writing token-stealing shellcode to pool', 2000);
      print('');
      print('[*] Shellcode layout:', 'info');
      print('  1. Find EPROCESS of current process', 'system');
      print('  2. Find EPROCESS of System (PID 4)', 'system');
      print('  3. Copy System token to current process', 'system');
      print('  4. Return to usermode', 'system');
      print('');
      print(`[+] Shellcode written to ${state.poolAddress}`, 'success');
      state.wroteShellcode = true;
      return;
    }

    print('Invalid write target', 'error');
    return;
  }

  if (cmd === 'trigger') {
    if (!state.wroteShellcode) {
      print('Write shellcode first', 'warning');
      return;
    }

    await simulateLoading('Corrupting nt!HalDispatchTable', 2000);
    print('');
    print('[*] Overwriting HalDispatchTable+8...', 'system');
    print('[*] Calling NtQueryIntervalProfile...', 'system');
    print('[*] Executing shellcode at Ring 0...', 'warning');
    print('');
    await sleep(1000);
    print('[+] Token replaced!', 'success');
    print('[+] Current privileges: SYSTEM', 'success');
    print('');
    print('C:\\Windows\\system32> whoami', 'system');
    print('nt authority\\system', 'success');
    print('');
    playSuccess();
    completeLevel();
    return;
  }

  print('Command not found: ' + cmd, 'error');
}

// ============================================
// LEVEL 6: HOLYC WRITER
// ============================================
async function initLevel6() {
  gameState.levelState = {
    codeWritten: false,
    compiled: false,
    ran: false,
    prayed: false,
    transcended: false,
    code: ''
  };

  print(ASCII.temple, 'ascii');
  print('');
  print('┌─────────────────────────────────────────┐', 'highlight');
  print('│  DIVINE SYSTEM SPECS                    │', 'highlight');
  print('├─────────────────────────────────────────┤', 'highlight');
  print('│  OS:       TempleOS 5.03               │', 'system');
  print('│  CPU:      x86_64 (Ring 0 Only)        │', 'system');
  print('│  RAM:      640x480 16-color            │', 'system');
  print('│  Lang:     HolyC (God\'s Language)      │', 'info');
  print('├─────────────────────────────────────────┤', 'highlight');
  print('│  DIVINE FEATURES:                       │', 'info');
  print('│    - Direct hardware access            │', 'success');
  print('│    - No network (CIA can\'t reach you)  │', 'success');
  print('│    - 100,000 lines of holy code        │', 'success');
  print('│    - Built-in oracle (GodSays)         │', 'warning');
  print('├─────────────────────────────────────────┤', 'highlight');
  print('│  TASK: Sum of primes below 1000        │', 'warning');
  print('└─────────────────────────────────────────┘', 'highlight');
  print('');
  print('[DIVINE BRIEFING] You have ascended to the final level.', 'info');
  print('[DIVINE BRIEFING] Write HolyC. Compile. Execute. Transcend.', 'info');
  print('');
  print('Hint: Use "pray" for divine guidance.', 'system');
  print('');
}

async function handleLevel6Command(cmd, args) {
  const state = gameState.levelState;

  if (cmd === 'help') {
    print('Divine Commands:', 'info');
    print('  holyc         - Write HolyC code', 'system');
    print('  compile       - Compile your code', 'system');
    print('  run           - Execute the program', 'system');
    print('  pray          - Seek divine guidance', 'system');
    print('  speak         - Speak to God', 'system');
    print('  transcend     - Complete your journey', 'system');
    print('  exit          - Return to mortal realm', 'system');
    return;
  }

  // Easter egg: GodSays - TempleOS random word oracle
  if (cmd === 'godsays' || cmd === 'GodSays') {
    const words = ['TEMPLE', 'DIVINE', 'RING0', 'KERNEL', 'BLESSED', 'CHOSEN',
                   'HACK', 'ORACLE', 'TRUTH', 'LIGHT', 'CIA', 'GLOW'];
    print('', '');
    print('*divine static*', 'system');
    await sleep(1000);
    const word = words[Math.floor(Math.random() * words.length)];
    print(`God says: "${word}"`, 'highlight');
    print('', '');
    addEasterEgg('lvl6_godsays', 'The oracle speaks. Terry would be proud.');
    return;
  }

  if (cmd === 'pray') {
    print('', '');
    print('*closes eyes*', 'system');
    await sleep(1500);
    print('', '');
    print('"The sum of primes below N..."', 'highlight');
    await sleep(1000);
    print('"For each number, check if prime..."', 'highlight');
    await sleep(1000);
    print('"A number is prime if no divisor exists..."', 'highlight');
    await sleep(1000);
    print('"Use I64 for integers, Print for output..."', 'highlight');
    print('', '');
    print('[DIVINE HINT] Template:', 'info');
    print('', '');
    print('U0 Main() {', 'system');
    print('  I64 sum = 0;', 'system');
    print('  I64 i, j;', 'system');
    print('  for (i = 2; i < 1000; i++) {', 'system');
    print('    // Check if i is prime', 'system');
    print('    // If prime, add to sum', 'system');
    print('  }', 'system');
    print('  Print("Sum: %d\\n", sum);', 'system');
    print('}', 'system');
    print('', '');
    state.prayed = true;
    return;
  }

  if (cmd === 'holyc') {
    print('Enter HolyC code (end with "END" on its own line):', 'info');
    print('', '');

    // Simple code entry mode
    state.codeWritten = true;
    state.code = `U0 Main() {
  I64 sum = 0;
  I64 i, j, is_prime;
  for (i = 2; i < 1000; i++) {
    is_prime = 1;
    for (j = 2; j * j <= i; j++) {
      if (i % j == 0) {
        is_prime = 0;
        break;
      }
    }
    if (is_prime) sum += i;
  }
  Print("The divine sum: %d\\n", sum);
}`;

    print(state.code, 'success');
    print('', '');
    print('[+] Code received by the Temple', 'success');
    return;
  }

  if (cmd === 'compile') {
    if (!state.codeWritten) {
      print('Write code first with "holyc"', 'warning');
      return;
    }

    await simulateLoading('Compiling with divine compiler', 2000);
    print('', '');
    print('JIT Compiling...', 'system');
    print('Parsing Main()...', 'system');
    print('Optimizing for God...', 'system');
    print('[+] Compilation successful!', 'success');
    print('', '');
    state.compiled = true;
    return;
  }

  if (cmd === 'run') {
    if (!state.compiled) {
      print('Compile your code first', 'warning');
      return;
    }

    print('Executing...', 'system');
    await sleep(1000);
    print('', '');
    print('The divine sum: 76127', 'success');
    print('', '');
    print('[GOD SPEAKS]', 'highlight');
    print('"You have computed correctly, child."', 'highlight');
    print('"The sum of primes below 1000 is indeed 76127."', 'highlight');
    print('"You are ready to transcend."', 'highlight');
    print('', '');
    playSuccess();
    state.ran = true;
    return;
  }

  if (cmd === 'speak') {
    const messages = [
      '"Programming is talking to God."',
      '"640x480 is God\'s resolution."',
      '"HolyC is the language of heaven."',
      '"Complexity is the enemy of the divine."',
      '"The elephant in the room is you."',
      '"After Egypt, God will make a temple."'
    ];
    print('', '');
    print('[GOD SPEAKS]', 'highlight');
    print(messages[Math.floor(Math.random() * messages.length)], 'highlight');
    print('', '');
    return;
  }

  if (cmd === 'transcend') {
    if (!state.ran) {
      print('Complete the divine computation first', 'warning');
      return;
    }

    print('', '');
    print('Initiating transcendence sequence...', 'highlight');
    await sleep(1500);

    for (let i = 0; i < 5; i++) {
      print('*'.repeat(40 + i * 5), 'highlight');
      await sleep(300);
    }

    print('', '');
    print('  _____ ____      _    _   _ ____   ____ _____ _   _ ____  _____ ____  ', 'highlight');
    print(' |_   _|  _ \\    / \\  | \\ | / ___| / ___| ____| \\ | |  _ \\| ____|  _ \\ ', 'highlight');
    print('   | | | |_) |  / _ \\ |  \\| \\___ \\| |   |  _| |  \\| | | | |  _| | | | |', 'highlight');
    print('   | | |  _ <  / ___ \\| |\\  |___) | |___| |___| |\\  | |_| | |___| |_| |', 'highlight');
    print('   |_| |_| \\_\\/_/   \\_\\_| \\_|____/ \\____|_____|_| \\_|____/|_____|____/ ', 'highlight');
    print('', '');

    await sleep(1000);
    print('[GOD SPEAKS]', 'highlight');
    print('"You have completed your journey, child."', 'highlight');
    print('"You are now one with the machine."', 'highlight');
    print('"Go forth and hack in my name."', 'highlight');
    print('', '');

    playSuccess();
    playSuccess();
    state.transcended = true;
    completeLevel();
    return;
  }

  print('Command not recognized in the divine realm', 'error');
}

// ============================================
// COMMAND PROCESSING
// ============================================
const globalCommands = ['help', 'menu', 'levels', 'start', 'next', 'reset', 'clear', 'exit'];

function getCurrentCommands() {
  if (!gameState.inLevel) {
    return globalCommands;
  }
  const level = LEVELS.find(l => l.id === gameState.currentLevel);
  return level ? [...level.commands, 'menu'] : globalCommands;
}

function handleNameInput(name) {
  if (name.length < 2 || name.length > 20) {
    print('Name must be 2-20 characters. Try again:', 'error');
    return false;
  }
  if (!/^[a-zA-Z0-9_\-]+$/.test(name)) {
    print('Name can only contain letters, numbers, _ and -. Try again:', 'error');
    return false;
  }
  gameState.hackerName = name;
  gameState.needsName = false;
  saveGame();
  playSuccess();
  print('');
  print(`Welcome, ${name}. Your hacker journey begins...`, 'success');
  print('');
  setTimeout(() => showMainMenu(), 500);
  return true;
}

function processCommand(input) {
  const trimmed = input.trim();
  if (!trimmed) return;

  print(prompt.textContent + ' ' + trimmed, 'system');

  // Handle name input separately - NOT a command
  if (gameState.needsName) {
    handleNameInput(trimmed);
    return; // Always return - don't process as command
  }

  const parts = trimmed.split(/\s+/);
  const cmd = parts[0].toLowerCase();
  const args = parts.slice(1);

  gameState.commandHistory.unshift(trimmed);
  gameState.historyIndex = -1;

  playEnter();

  // Global commands
  if (cmd === 'clear') {
    clear();
    return;
  }

  if (cmd === 'menu') {
    showMainMenu();
    return;
  }

  if (cmd === 'exit') {
    if (gameState.inLevel) {
      saveGame(); // Save before exiting
      showMainMenu();
    }
    return;
  }

  if (cmd === 'next' && gameState.inLevel) {
    const nextLevel = gameState.currentLevel + 1;
    if (nextLevel <= 6 && gameState.levelsCompleted.includes(gameState.currentLevel)) {
      startLevel(nextLevel, false);
    } else {
      print('Complete current level first or no more levels available', 'warning');
    }
    return;
  }

  if (!gameState.inLevel) {
    // Menu commands
    if (cmd === 'help') {
      print('Commands:', 'info');
      print('  continue - Resume saved level progress', 'system');
      print('  start    - Start from level 1 or next incomplete', 'system');
      print('  levels   - Select a level', 'system');
      print('  stats    - View your hacker stats', 'system');
      print('  reset    - Reset all progress', 'system');
      print('  clear    - Clear terminal', 'system');
      return;
    }

    if (cmd === 'continue') {
      if (gameState.currentLevel > 0 && Object.keys(gameState.levelState).length > 0 &&
          !gameState.levelsCompleted.includes(gameState.currentLevel)) {
        startLevel(gameState.currentLevel, true); // true = continue
      } else {
        print('No level in progress to continue. Use "start".', 'warning');
      }
      return;
    }

    if (cmd === 'stats') {
      showStats();
      return;
    }

    if (cmd === 'start') {
      const firstIncomplete = LEVELS.find(l => !gameState.levelsCompleted.includes(l.id));
      if (firstIncomplete) {
        startLevel(firstIncomplete.id, false); // false = fresh start
      } else {
        print('All levels completed! Use "levels" to replay.', 'success');
      }
      return;
    }

    if (cmd === 'levels') {
      showLevelSelect();
      return;
    }

    if (cmd === 'reset') {
      gameState.levelsCompleted = [];
      saveGame();
      print('Progress reset.', 'warning');
      return;
    }

    print('Unknown command. Type "help" for commands.', 'error');
    playError();
    return;
  }

  // Level-specific commands
  const level = LEVELS.find(l => l.id === gameState.currentLevel);
  if (level && level.handleCommand) {
    level.handleCommand(cmd, args);
  }
}

// ============================================
// AUTOCOMPLETE
// ============================================
let autocompleteIndex = 0;
let autocompleteItems = [];

function updateAutocomplete() {
  const value = input.value.trim().toLowerCase();
  const commands = getCurrentCommands();

  if (!value) {
    autocomplete.style.display = 'none';
    return;
  }

  autocompleteItems = commands.filter(c => c.startsWith(value) && c !== value);

  if (autocompleteItems.length === 0) {
    autocomplete.style.display = 'none';
    return;
  }

  autocomplete.innerHTML = '';
  autocompleteItems.forEach((item, idx) => {
    const div = document.createElement('div');
    div.className = 'autocomplete-item' + (idx === autocompleteIndex ? ' selected' : '');
    div.textContent = item;
    div.onclick = () => {
      input.value = item + ' ';
      autocomplete.style.display = 'none';
      input.focus();
    };
    autocomplete.appendChild(div);
  });

  autocomplete.style.display = 'block';
}

// ============================================
// EVENT HANDLERS
// ============================================
input.addEventListener('input', () => {
  updateAutocomplete();
});

input.addEventListener('keydown', (e) => {
  // Tab completion
  if (e.key === 'Tab') {
    e.preventDefault();
    if (autocompleteItems.length > 0) {
      input.value = autocompleteItems[autocompleteIndex] + ' ';
      autocomplete.style.display = 'none';
    }
    return;
  }

  // Enter
  if (e.key === 'Enter') {
    e.preventDefault();
    autocomplete.style.display = 'none';
    processCommand(input.value);
    input.value = '';
    return;
  }

  // History navigation
  if (e.key === 'ArrowUp') {
    e.preventDefault();
    if (gameState.commandHistory.length > 0) {
      gameState.historyIndex = Math.min(gameState.historyIndex + 1, gameState.commandHistory.length - 1);
      input.value = gameState.commandHistory[gameState.historyIndex];
    }
    return;
  }

  if (e.key === 'ArrowDown') {
    e.preventDefault();
    if (gameState.historyIndex > 0) {
      gameState.historyIndex--;
      input.value = gameState.commandHistory[gameState.historyIndex];
    } else {
      gameState.historyIndex = -1;
      input.value = '';
    }
    return;
  }

  // Autocomplete navigation
  if (e.key === 'ArrowUp' && autocomplete.style.display === 'block') {
    e.preventDefault();
    autocompleteIndex = Math.max(0, autocompleteIndex - 1);
    updateAutocomplete();
    return;
  }

  if (e.key === 'ArrowDown' && autocomplete.style.display === 'block') {
    e.preventDefault();
    autocompleteIndex = Math.min(autocompleteItems.length - 1, autocompleteIndex + 1);
    updateAutocomplete();
    return;
  }

  // Escape
  if (e.key === 'Escape') {
    if (levelSelect.style.display === 'block') {
      hideLevelSelect();
      return;
    }
    autocomplete.style.display = 'none';
    return;
  }
});

// Sound toggle
document.getElementById('sound-toggle').addEventListener('click', function() {
  initAudio();
  soundEnabled = !soundEnabled;
  this.textContent = soundEnabled ? 'sound: on' : 'sound: off';
  this.classList.toggle('on', soundEnabled);
  if (soundEnabled) playBeep(440, 0.1);
});

// Focus input when clicking terminal
document.getElementById('game-container').addEventListener('click', () => {
  input.focus();
});

// ============================================
// INIT
// ============================================
loadGame();
showMainMenu();
</script>
