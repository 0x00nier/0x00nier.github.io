---
layout: default
title: ???
permalink: /game.html
---

<style>
/* ============================================
   PROJECT SELECTION TERMINAL
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
  --accent-red: #fb4934;
  --accent-yellow: #fabd2f;
  --accent-blue: #83a598;
  --accent-purple: #d3869b;
  --accent-aqua: #8ec07c;
  --accent-orange: #fe8019;
  --glow-green: rgba(184, 187, 38, 0.4);
  --glow-blue: rgba(131, 165, 152, 0.4);
  --glow-purple: rgba(211, 134, 155, 0.4);
}

* {
  box-sizing: border-box;
}

#projects-container {
  background: var(--bg-primary);
  border: 2px solid var(--border-color);
  min-height: 80vh;
  display: flex;
  flex-direction: column;
  position: relative;
  overflow: hidden;
  font-family: 'JetBrains Mono', 'Fira Code', 'Source Code Pro', Monaco, monospace;
}

/* Terminal Header */
#terminal-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 8px 12px;
  background: var(--bg-secondary);
  border-bottom: 1px solid var(--border-color);
  font-size: 12px;
}

.terminal-title {
  color: var(--text-secondary);
  display: flex;
  align-items: center;
  gap: 8px;
}

.terminal-title::before {
  content: '';
  width: 12px;
  height: 12px;
  background: var(--accent-green);
  border-radius: 50%;
  box-shadow: 0 0 8px var(--glow-green);
  animation: pulse 2s ease-in-out infinite;
}

@keyframes pulse {
  0%, 100% { opacity: 1; }
  50% { opacity: 0.5; }
}

.terminal-path {
  color: var(--text-muted);
  font-size: 11px;
}

/* Main Content Area */
#projects-content {
  flex: 1;
  padding: 24px;
  display: flex;
  flex-direction: column;
  gap: 24px;
  overflow-y: auto;
}

/* ASCII Banner */
.ascii-banner {
  color: var(--accent-green);
  font-size: 10px;
  line-height: 1.2;
  text-align: center;
  white-space: pre;
  text-shadow: 0 0 10px var(--glow-green);
  margin-bottom: 8px;
}

/* Terminal Output */
.terminal-output {
  color: var(--text-secondary);
  font-size: 13px;
  line-height: 1.6;
}

.terminal-output .prompt {
  color: var(--accent-green);
}

.terminal-output .command {
  color: var(--text-primary);
}

.terminal-output .comment {
  color: var(--text-muted);
  font-style: italic;
}

/* Projects Grid */
#projects-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
  gap: 20px;
  margin-top: 16px;
}

/* Project Card */
.project-card {
  background: var(--bg-secondary);
  border: 1px solid var(--border-color);
  padding: 20px;
  position: relative;
  transition: all 0.3s ease;
  cursor: pointer;
  overflow: hidden;
}

.project-card::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 3px;
  background: var(--accent-green);
  transform: scaleX(0);
  transform-origin: left;
  transition: transform 0.3s ease;
}

.project-card:hover::before {
  transform: scaleX(1);
}

.project-card:hover {
  border-color: var(--accent-green);
  box-shadow: 0 0 20px rgba(184, 187, 38, 0.1);
  transform: translateY(-2px);
}

.project-card.locked {
  opacity: 0.6;
  cursor: not-allowed;
}

.project-card.locked:hover {
  transform: none;
  border-color: var(--border-color);
  box-shadow: none;
}

.project-card.locked::before {
  background: var(--text-muted);
}

/* Project Header */
.project-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 12px;
}

.project-id {
  font-size: 11px;
  color: var(--text-muted);
  font-family: monospace;
}

.project-status {
  font-size: 10px;
  padding: 2px 8px;
  border-radius: 2px;
  text-transform: uppercase;
  letter-spacing: 1px;
}

.project-status.active {
  background: rgba(184, 187, 38, 0.2);
  color: var(--accent-green);
  border: 1px solid var(--accent-green);
}

.project-status.coming-soon {
  background: rgba(102, 102, 102, 0.2);
  color: var(--text-muted);
  border: 1px solid var(--text-muted);
}

/* Project Title */
.project-title {
  font-size: 18px;
  color: var(--text-primary);
  margin-bottom: 8px;
  display: flex;
  align-items: center;
  gap: 10px;
}

.project-title .icon {
  font-size: 20px;
}

/* Project Description */
.project-description {
  font-size: 13px;
  color: var(--text-secondary);
  line-height: 1.5;
  margin-bottom: 16px;
}

/* Project Tags */
.project-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin-bottom: 16px;
}

.project-tag {
  font-size: 10px;
  padding: 3px 8px;
  background: var(--bg-tertiary);
  color: var(--text-muted);
  border: 1px solid var(--border-color);
}

/* Project Action */
.project-action {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 12px;
  color: var(--accent-green);
}

.project-action::before {
  content: '>';
  animation: blink 1s step-end infinite;
}

@keyframes blink {
  0%, 100% { opacity: 1; }
  50% { opacity: 0; }
}

.project-card.locked .project-action {
  color: var(--text-muted);
}

/* Scanline Effect */
#projects-container::after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: repeating-linear-gradient(
    0deg,
    rgba(0, 0, 0, 0.1) 0px,
    rgba(0, 0, 0, 0.1) 1px,
    transparent 1px,
    transparent 2px
  );
  pointer-events: none;
  opacity: 0.3;
}

/* Footer Stats */
#terminal-footer {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 8px 12px;
  background: var(--bg-secondary);
  border-top: 1px solid var(--border-color);
  font-size: 11px;
  color: var(--text-muted);
}

.footer-stat {
  display: flex;
  align-items: center;
  gap: 6px;
}

.footer-stat .value {
  color: var(--accent-green);
}

/* Responsive */
@media (max-width: 768px) {
  .ascii-banner {
    font-size: 6px;
  }

  #projects-grid {
    grid-template-columns: 1fr;
  }

  #projects-content {
    padding: 16px;
  }
}
</style>

<div id="projects-container">
  <div id="terminal-header">
    <span class="terminal-title">projects@0x00nier</span>
    <span class="terminal-path">~/misc/projects</span>
  </div>

  <div id="projects-content">
    <div class="ascii-banner">
 ██████╗ ██████╗  ██████╗      ██╗███████╗ ██████╗████████╗███████╗
 ██╔══██╗██╔══██╗██╔═══██╗     ██║██╔════╝██╔════╝╚══██╔══╝██╔════╝
 ██████╔╝██████╔╝██║   ██║     ██║█████╗  ██║        ██║   ███████╗
 ██╔═══╝ ██╔══██╗██║   ██║██   ██║██╔══╝  ██║        ██║   ╚════██║
 ██║     ██║  ██║╚██████╔╝╚█████╔╝███████╗╚██████╗   ██║   ███████║
 ╚═╝     ╚═╝  ╚═╝ ╚═════╝  ╚════╝ ╚══════╝ ╚═════╝   ╚═╝   ╚══════╝
    </div>

    <div class="terminal-output">
      <span class="prompt">root@0x00nier</span>:<span class="command">~</span>$ ls -la ./projects/<br>
      <span class="comment"># experimental builds & misc hacking tools</span>
    </div>

    <div id="projects-grid">
      <!-- 0x00Pwnathon -->
      <div class="project-card" onclick="window.location.href='/0x00pwnathon.html'">
        <div class="project-header">
          <span class="project-id">PRJ-001</span>
          <span class="project-status active">ACTIVE</span>
        </div>
        <div class="project-title">
          <span class="icon">⚡</span>
          0x00Pwnathon
        </div>
        <div class="project-description">
          An interactive terminal hacking simulation. Navigate through i3-style workspaces, solve CTF-like challenges, and pwn your way through multiple levels.
        </div>
        <div class="project-tags">
          <span class="project-tag">terminal</span>
          <span class="project-tag">ctf</span>
          <span class="project-tag">simulation</span>
          <span class="project-tag">javascript</span>
        </div>
        <div class="project-action">
          LAUNCH SIMULATION
        </div>
      </div>

      <!-- Matrix Terminal Simulator -->
      <div class="project-card" onclick="window.location.href='/matrix-terminal.html'">
        <div class="project-header">
          <span class="project-id">PRJ-002</span>
          <span class="project-status active">ACTIVE</span>
        </div>
        <div class="project-title">
          <span class="icon">🔮</span>
          Matrix Terminal
        </div>
        <div class="project-description">
          A mesmerizing matrix rain & doom fire simulator with multiple themes. Features retro pixel and smooth rendering modes with full customization.
        </div>
        <div class="project-tags">
          <span class="project-tag">visual</span>
          <span class="project-tag">matrix</span>
          <span class="project-tag">doom-fire</span>
          <span class="project-tag">canvas</span>
        </div>
        <div class="project-action">
          ENTER THE VOID
        </div>
      </div>

      <!-- 0x00Tetris -->
      <div class="project-card" onclick="window.location.href='/tetris.html'">
        <div class="project-header">
          <span class="project-id">PRJ-003</span>
          <span class="project-status active">ACTIVE</span>
        </div>
        <div class="project-title">
          <span class="icon">🎮</span>
          0x00Tetris
        </div>
        <div class="project-description">
          Classic block-stacking arcade game with terminal aesthetics. Features ghost pieces, hold system, and increasing difficulty. How long can you survive?
        </div>
        <div class="project-tags">
          <span class="project-tag">arcade</span>
          <span class="project-tag">tetris</span>
          <span class="project-tag">game</span>
          <span class="project-tag">canvas</span>
        </div>
        <div class="project-action">
          START GAME
        </div>
      </div>

      <!-- 0x00Runner -->
      <div class="project-card" onclick="window.location.href='/runner.html'">
        <div class="project-header">
          <span class="project-id">PRJ-004</span>
          <span class="project-status active">ACTIVE</span>
        </div>
        <div class="project-title">
          <span class="icon">🏃</span>
          0x00Runner
        </div>
        <div class="project-description">
          2D side-scrolling platformer with terminal aesthetics. Collect data packets, avoid malware, find the secret backdoor. Can you reach the flag?
        </div>
        <div class="project-tags">
          <span class="project-tag">platformer</span>
          <span class="project-tag">arcade</span>
          <span class="project-tag">mario-style</span>
          <span class="project-tag">canvas</span>
        </div>
        <div class="project-action">
          RUN EXPLOIT
        </div>
      </div>

      <!-- Placeholder for future projects -->
      <div class="project-card locked">
        <div class="project-header">
          <span class="project-id">PRJ-???</span>
          <span class="project-status coming-soon">ENCRYPTED</span>
        </div>
        <div class="project-title">
          <span class="icon">🔒</span>
          [REDACTED]
        </div>
        <div class="project-description">
          ████████ ██████ ████ ███████ ██████████ ███ ████████ ██████████ ████ ███████████ ██████ ████
        </div>
        <div class="project-tags">
          <span class="project-tag">???</span>
          <span class="project-tag">???</span>
          <span class="project-tag">???</span>
        </div>
        <div class="project-action">
          ACCESS DENIED
        </div>
      </div>
    </div>
  </div>

  <div id="terminal-footer">
    <div class="footer-stat">
      PROJECTS: <span class="value">4</span>/5 AVAILABLE
    </div>
    <div class="footer-stat">
      STATUS: <span class="value">ONLINE</span>
    </div>
  </div>
</div>

<script>
// Add hover sound effect (optional)
document.querySelectorAll('.project-card:not(.locked)').forEach(card => {
  card.addEventListener('mouseenter', () => {
    card.style.transition = 'all 0.3s ease';
  });
});

// Glitch effect on locked cards
document.querySelectorAll('.project-card.locked').forEach(card => {
  card.addEventListener('click', (e) => {
    e.preventDefault();
    card.style.animation = 'none';
    card.offsetHeight; // Trigger reflow
    card.style.animation = 'shake 0.3s ease';
  });
});

// Add shake animation
const style = document.createElement('style');
style.textContent = `
  @keyframes shake {
    0%, 100% { transform: translateX(0); }
    25% { transform: translateX(-5px); }
    75% { transform: translateX(5px); }
  }
`;
document.head.appendChild(style);

// Typing effect for terminal output
document.addEventListener('DOMContentLoaded', () => {
  const banner = document.querySelector('.ascii-banner');
  if (banner) {
    banner.style.opacity = '0';
    setTimeout(() => {
      banner.style.transition = 'opacity 0.5s ease';
      banner.style.opacity = '1';
    }, 200);
  }
});
</script>
