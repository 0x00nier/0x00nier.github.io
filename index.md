---
layout: default
---

<style>
#matrix-bg {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  z-index: -1;
  opacity: 0;
  transition: opacity 1.5s ease-in;
  cursor: pointer;
}

#matrix-bg.active {
  opacity: 1;
}

/* When matrix is active, let clicks pass through content to canvas */
body.matrix-active #main_content,
body.matrix-active header,
body.matrix-active footer {
  pointer-events: none;
}

#matrix-hint {
  position: fixed;
  bottom: 30px;
  left: 50%;
  transform: translateX(-50%);
  font-family: Monaco, monospace;
  font-size: 14px;
  color: #b5e853;
  text-shadow: 0 0 10px #b5e853;
  z-index: 10000;
  opacity: 0;
  transition: opacity 0.5s ease;
  pointer-events: none;
}

#matrix-hint.visible {
  opacity: 0.7;
}

#vid {
  display: block;
  width: 100%;
  border-radius: 6px;
  position: relative;
  z-index: 1;
}
</style>

<canvas id="matrix-bg"></canvas>

<video id="vid" controls autoplay loop muted>
  <source src="./assets/images/53N1oR_3Ng1N33R.mp4" type="video/mp4">
</video>

<div id="matrix-hint">click the background to enter the void</div>

<h1 id="unmute" align="center" style="font-size:18px;margin-top:20px"> Sorry it doesn't automatically unmute.</h1>

<script>
var a = setTimeout(function() {
  var unmuted = document.getElementById('unmute');
  unmuted.innerHTML="Welcome to my page :)";
}, 3000);

var b = setTimeout(function() {
  var unmuted = document.getElementById('unmute');
  unmuted.innerHTML="I see myself as the engineer above in 5 years.";
}, 8000);

var d = setTimeout(function() {
  var unmuted = document.getElementById('unmute');
  unmuted.innerHTML="";
}, 14000);

// Matrix rain animation (background effect)
var e = setTimeout(function() {
  const canvas = document.getElementById('matrix-bg');
  const ctx = canvas.getContext('2d');
  const hint = document.getElementById('matrix-hint');

  // Size canvas to full window
  function resizeCanvas() {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
  }
  resizeCanvas();

  // Characters for the rain
  const chars = 'd34lL0c4710N!@#$%^&*()_+-=[]{}|;:,.<>?0123456789ABCDEFabcdef';
  const fontSize = 16;
  let columns = Math.floor(canvas.width / fontSize);

  // Array to track y position of each column
  let drops = [];
  for (let i = 0; i < columns; i++) {
    drops[i] = Math.random() * -100;
  }

  function draw() {
    // Semi-transparent black to create trail effect
    ctx.fillStyle = 'rgba(10, 10, 10, 0.05)';
    ctx.fillRect(0, 0, canvas.width, canvas.height);

    ctx.font = fontSize + 'px Monaco, monospace';

    for (let i = 0; i < drops.length; i++) {
      const char = chars[Math.floor(Math.random() * chars.length)];
      const x = i * fontSize;
      const y = drops[i] * fontSize;

      // Brighter color for the leading character
      if (Math.random() > 0.95) {
        ctx.fillStyle = '#ffffff';
      } else {
        ctx.fillStyle = '#b5e853';
      }

      ctx.fillText(char, x, y);

      // Reset drop to top with random delay
      if (y > canvas.height && Math.random() > 0.975) {
        drops[i] = 0;
      }
      drops[i]++;
    }
  }

  // Start animation
  canvas.classList.add('active');
  const matrixInterval = setInterval(draw, 50);

  // Show hint after a moment
  setTimeout(() => {
    hint.classList.add('visible');
  }, 2000);

  // Click background to navigate
  canvas.addEventListener('click', function() {
    clearInterval(matrixInterval);
    window.location.href = './dealloc.html';
  });

  // Handle resize
  window.addEventListener('resize', function() {
    resizeCanvas();
    columns = Math.floor(canvas.width / fontSize);
    drops = [];
    for (let i = 0; i < columns; i++) {
      drops[i] = Math.random() * -100;
    }
  });

}, 14000);
</script>

