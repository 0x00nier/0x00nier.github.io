---
layout: default
title: whoami
---

<style>
.terminal-window {
  background: #0a0a0a;
  border: 1px solid #b5e853;
  border-radius: 6px;
  font-family: Monaco, "Bitstream Vera Sans Mono", "Lucida Console", Terminal, monospace;
  overflow: hidden;
}

.terminal-header {
  background: #1a1a1a;
  padding: 8px 12px;
  border-bottom: 1px solid #333;
  display: flex;
  align-items: center;
  gap: 8px;
}

.terminal-btn {
  width: 12px;
  height: 12px;
  border-radius: 50%;
}
.terminal-btn.red { background: #ff5f56; }
.terminal-btn.yellow { background: #ffbd2e; }
.terminal-btn.green { background: #27ca40; }

.terminal-title {
  color: #888;
  font-size: 12px;
  margin-left: 8px;
}

.terminal-body {
  padding: 16px;
  min-height: 400px;
  color: #b5e853;
  font-size: 14px;
  line-height: 1.6;
}

.terminal-line {
  margin-bottom: 8px;
}

.prompt {
  color: #b5e853;
}

.prompt-user {
  color: #63c0f5;
}

.prompt-path {
  color: #aa759f;
}

.command {
  color: #fff;
}

.output {
  color: #35fc03;
  margin-left: 0;
  margin-bottom: 16px;
}

.output-muted {
  color: #888;
}

.cursor {
  display: inline-block;
  width: 8px;
  height: 14px;
  background: #b5e853;
  animation: blink 1s step-end infinite;
  vertical-align: middle;
  margin-left: 4px;
}

@keyframes blink {
  0%, 100% { opacity: 1; }
  50% { opacity: 0; }
}

.terminal-input-line {
  display: flex;
  align-items: center;
}

#terminal-input {
  background: transparent;
  border: none;
  color: #fff;
  font-family: inherit;
  font-size: 14px;
  outline: none;
  flex: 1;
  caret-color: #b5e853;
}
</style>

<div class="terminal-window">
  <div class="terminal-header">
    <span class="terminal-btn red"></span>
    <span class="terminal-btn yellow"></span>
    <span class="terminal-btn green"></span>
    <span class="terminal-title">0x00nier@localhost: ~</span>
  </div>
  <div class="terminal-body" id="terminal">
    <div class="terminal-line output-muted">Linux 0x00nier 6.6.9-amd64 #1 SMP PREEMPT_DYNAMIC Rokosreplicant x86_64 GNU/Linux</div>
    <div class="terminal-line output-muted">Type 'help' for available commands.</div>
    <div class="terminal-line" style="margin-top: 16px;"></div>
    <div id="terminal-output"></div>
    <div class="terminal-input-line">
      <span class="prompt"><span class="prompt-user">guest</span>@<span class="prompt-path">0x00nier</span>:~$&nbsp;</span>
      <input type="text" id="terminal-input" autofocus autocomplete="off" spellcheck="false">
    </div>
  </div>
</div>

<script>
const commands = {
  help: `Available commands:
  whoami      - Who am I?
  skills      - Technical skills
  certs       - Certifications
  contact     - How to reach me
  writeups    - CTF writeups
  secret      - ???
  clear       - Clear terminal`,

  whoami: `Hi, I'm <span style="color:#63c0f5">0x00nier</span>.

I'm a Security Engineer @ Google focused on:
  > Offensive Security as a discipline
  > Binary Exploitation as a skill
  > Reverse Engineering as a technique
  > Breaking things to understand them as a mindset`,

  skills: `Technical Skills:
  > Penetration Testing & Red Teaming
  > Binary Exploitation & Reverse Engineering
  > Web Application Security
  > Malware Analysis
  > CTF Competitions`,

  certs: `Certifications:
  > <span style="color:#63c0f5">OSCP</span> - Offensive Security Certified Professional
  > eJPT - eLearnSecurity Junior Penetration Tester
  > CAP - Certified AppSec Practitioner
  > CNSP - Certified Network Security Practitioner
  > CEH - Certified Ethical Hacker (and many others equally useless)`,

  contact: `Find me at:
  > GitHub: <span style="color:#63c0f5">github.com/0x00nier</span>
  > Check the 'xp/' section for more details on my experience`,

  writeups: `I create writeups on stuff I find interesting.
Check out the <span style="color:#63c0f5">writeups/</span> section in the nav bar.

Topics include:
  > HackTheBox challenges
  > CTF competitions (IrisCTF, Pragyan, etc.)
  > Reverse engineering challenges`,

  secret: `<span style="color:#aa759f">717764707a65377852563663586b655a53695141437a53337448654a7955684155723539754e334d65546266773939424c6b4c6a645979335a45445438395337696837635974766d476b4e5a3965624a4c43453153476f364c7766436e5a506d746b</span>

<span style="color:#888">Hint: What encoding starts with hex?</span>`,

  clear: 'CLEAR'
};

const terminalOutput = document.getElementById('terminal-output');
const terminalInput = document.getElementById('terminal-input');
const terminal = document.getElementById('terminal');

function addOutput(cmd, output) {
  const cmdLine = document.createElement('div');
  cmdLine.className = 'terminal-line';
  cmdLine.innerHTML = `<span class="prompt"><span class="prompt-user">guest</span>@<span class="prompt-path">0x00nier</span>:~$&nbsp;</span><span class="command">${cmd}</span>`;
  terminalOutput.appendChild(cmdLine);

  if (output !== 'CLEAR') {
    const outputDiv = document.createElement('div');
    outputDiv.className = 'terminal-line output';
    outputDiv.innerHTML = output.replace(/\n/g, '<br>');
    terminalOutput.appendChild(outputDiv);
  }
}

function processCommand(cmd) {
  const trimmed = cmd.trim().toLowerCase();

  if (trimmed === '') return;

  if (trimmed === 'clear') {
    terminalOutput.innerHTML = '';
    return;
  }

  const output = commands[trimmed] || `Command not found: ${cmd}. Type 'help' for available commands.`;
  addOutput(cmd, output);
  terminal.scrollTop = terminal.scrollHeight;
}

terminalInput.addEventListener('keydown', (e) => {
  if (e.key === 'Enter') {
    processCommand(terminalInput.value);
    terminalInput.value = '';
  }
});

// Focus input when clicking anywhere in terminal
terminal.addEventListener('click', () => terminalInput.focus());
</script>
