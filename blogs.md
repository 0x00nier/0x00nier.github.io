---
layout: default
title: writeups
---

<style>
.toc-container {
  max-width: 100%;
}

.toc-category {
  margin-bottom: 8px;
  border: 1px solid rgba(181, 232, 83, 0.2);
  border-radius: 6px;
  overflow: hidden;
}

.toc-category-header {
  display: flex;
  align-items: center;
  padding: 12px 16px;
  background: rgba(181, 232, 83, 0.05);
  cursor: pointer;
  transition: all 0.2s ease;
  user-select: none;
}

.toc-category-header:hover {
  background: rgba(181, 232, 83, 0.1);
}

.toc-category-header.active {
  background: rgba(181, 232, 83, 0.1);
  border-bottom: 1px solid rgba(181, 232, 83, 0.2);
}

.toc-toggle {
  font-family: Monaco, monospace;
  font-size: 14px;
  width: 20px;
  margin-right: 12px;
  color: #b5e853;
  user-select: none;
}

.toc-toggle::before {
  content: '+';
}

.toc-toggle.open::before {
  content: '−';
}

.toc-category-title {
  font-family: Monaco, "Bitstream Vera Sans Mono", "Lucida Console", Terminal, monospace;
  font-size: 16px;
  color: #b5e853;
  margin: 0;
  flex: 1;
}

.toc-category-count {
  font-size: 12px;
  color: #888;
  background: rgba(0,0,0,0.3);
  padding: 2px 8px;
  border-radius: 10px;
}

.toc-posts {
  display: none;
  padding: 0;
  background: rgba(0,0,0,0.2);
}

.toc-posts.open {
  display: block;
}

.toc-post {
  border-bottom: 1px solid rgba(181, 232, 83, 0.1);
}

.toc-post:last-child {
  border-bottom: none;
}

.toc-post-header {
  display: flex;
  align-items: center;
  padding: 10px 16px 10px 48px;
  cursor: pointer;
  transition: all 0.2s ease;
}

.toc-post-header:hover {
  background: rgba(181, 232, 83, 0.05);
}

.toc-post-toggle {
  font-family: Monaco, monospace;
  font-size: 12px;
  width: 16px;
  margin-right: 10px;
  color: #63c0f5;
  flex-shrink: 0;
  user-select: none;
}

.toc-post-toggle::before {
  content: '+';
}

.toc-post-toggle.open::before {
  content: '−';
}

.toc-post-toggle.hidden {
  visibility: hidden;
}

.toc-post-link {
  font-size: 14px;
  color: #63c0f5;
  text-decoration: none;
  transition: all 0.2s ease;
  flex: 1;
}

.toc-post-link:hover {
  color: #8dd3f9;
  text-shadow: 0 0 8px rgba(99, 192, 245, 0.4);
}

.toc-post-type {
  font-size: 11px;
  color: #666;
  background: rgba(255,255,255,0.05);
  padding: 2px 6px;
  border-radius: 3px;
  margin-left: 8px;
}

.toc-sections {
  display: none;
  padding: 4px 0 8px 74px;
  background: rgba(0,0,0,0.1);
}

.toc-sections.open {
  display: block;
}

.toc-section {
  padding: 6px 0;
}

.toc-section-link {
  font-size: 13px;
  color: #888;
  text-decoration: none;
  display: flex;
  align-items: center;
  transition: all 0.2s ease;
}

.toc-section-link:hover {
  color: #aaa;
}

.toc-section-link::before {
  content: "—";
  margin-right: 8px;
  color: #555;
}

.toc-external {
  display: inline-flex;
  align-items: center;
  gap: 6px;
}

.toc-external-icon {
  width: 12px;
  height: 12px;
  opacity: 0.6;
}

.toc-search {
  margin-bottom: 20px;
}

.toc-search-input {
  width: 100%;
  padding: 12px 16px;
  background: rgba(0,0,0,0.4);
  border: 1px solid rgba(181, 232, 83, 0.2);
  border-radius: 6px;
  color: #eaeaea;
  font-family: Monaco, monospace;
  font-size: 14px;
  outline: none;
  transition: all 0.2s ease;
}

.toc-search-input:focus {
  border-color: rgba(181, 232, 83, 0.5);
  box-shadow: 0 0 10px rgba(181, 232, 83, 0.1);
}

.toc-search-input::placeholder {
  color: #555;
}
</style>

<div class="toc-container">
  <div class="toc-search">
    <input type="text" class="toc-search-input" placeholder="Search writeups..." id="toc-search">
  </div>

  <!-- HackTheBox -->
  <div class="toc-category" data-category="htb">
    <div class="toc-category-header active">
      <span class="toc-toggle open"></span>
      <span class="toc-category-title">HackTheBox</span>
      <span class="toc-category-count">4</span>
    </div>
    <div class="toc-posts open">
      <div class="toc-post" data-post="bombslanded">
        <div class="toc-post-header">
          <span class="toc-post-toggle"></span>
          <a href="./blogs/htb/bombslanded/bombslanded.html" class="toc-post-link">Bombs Landed — Reversing Challenge</a>
          <span class="toc-post-type">Reversing</span>
        </div>
        <div class="toc-sections">
          <div class="toc-section"><a href="./blogs/htb/bombslanded/bombslanded.html#initial-analysis" class="toc-section-link">Initial Analysis</a></div>
          <div class="toc-section"><a href="./blogs/htb/bombslanded/bombslanded.html#decompilation-and-disassembly" class="toc-section-link">Decompilation And Disassembly</a></div>
        </div>
      </div>
      <div class="toc-post" data-post="spookylicense">
        <div class="toc-post-header">
          <span class="toc-post-toggle"></span>
          <a href="./blogs/htb/spookylicense/spookylicense.html" class="toc-post-link">Spooky License — Reversing Challenge</a>
          <span class="toc-post-type">Reversing</span>
        </div>
        <div class="toc-sections">
          <div class="toc-section"><a href="./blogs/htb/spookylicense/spookylicense.html#analysis" class="toc-section-link">Analysis</a></div>
          <div class="toc-section"><a href="./blogs/htb/spookylicense/spookylicense.html#approach" class="toc-section-link">Approach</a></div>
        </div>
      </div>
      <div class="toc-post" data-post="broscience">
        <div class="toc-post-header">
          <span class="toc-post-toggle"></span>
          <a href="./blogs/htb/broscience/broscience.html" class="toc-post-link">BroScience — HackTheBox (Medium)</a>
          <span class="toc-post-type">Medium Box</span>
        </div>
        <div class="toc-sections">
          <div class="toc-section"><a href="./blogs/htb/broscience/broscience.html#reconnaissance" class="toc-section-link">Reconnaissance</a></div>
          <div class="toc-section"><a href="./blogs/htb/broscience/broscience.html#exploiting-lfi" class="toc-section-link">Exploiting LFI</a></div>
          <div class="toc-section"><a href="./blogs/htb/broscience/broscience.html#deserialization-attack" class="toc-section-link">Deserialization Attack</a></div>
          <div class="toc-section"><a href="./blogs/htb/broscience/broscience.html#user-access" class="toc-section-link">User Access</a></div>
          <div class="toc-section"><a href="./blogs/htb/broscience/broscience.html#privilege-escalation" class="toc-section-link">Privilege Escalation</a></div>
        </div>
      </div>
      <div class="toc-post" data-post="persistenceisfutile">
        <div class="toc-post-header">
          <span class="toc-post-toggle"></span>
          <a href="./blogs/htb/persistenceisfutile/persistenceisfutile.html" class="toc-post-link">PersistenceisFutile — Forensic Challenge</a>
          <span class="toc-post-type">Forensics</span>
        </div>
        <div class="toc-sections">
          <div class="toc-section"><a href="./blogs/htb/persistenceisfutile/persistenceisfutile.html#lets-look-at-pyssh-first" class="toc-section-link">Let's look at pyssh first</a></div>
          <div class="toc-section"><a href="./blogs/htb/persistenceisfutile/persistenceisfutile.html#now-lets-look-at-access-up" class="toc-section-link">Now let's look at access-up</a></div>
        </div>
      </div>
    </div>
  </div>

  <!-- IrisCTF 2023 -->
  <div class="toc-category" data-category="irisctf">
    <div class="toc-category-header">
      <span class="toc-toggle"></span>
      <span class="toc-category-title">IrisCTF 2023</span>
      <span class="toc-category-count">3</span>
    </div>
    <div class="toc-posts">
      <div class="toc-post" data-post="babyseek">
        <div class="toc-post-header">
          <span class="toc-post-toggle"></span>
          <a href="./blogs/irisctf/babyseek/babyseek.html" class="toc-post-link">babyseek — IrisCTF 2023</a>
          <span class="toc-post-type">PWN</span>
        </div>
        <div class="toc-sections">
          <div class="toc-section"><a href="./blogs/irisctf/babyseek/babyseek.html#preliminary-analysis" class="toc-section-link">Preliminary Analysis</a></div>
          <div class="toc-section"><a href="./blogs/irisctf/babyseek/babyseek.html#my-approach" class="toc-section-link">My Approach</a></div>
          <div class="toc-section"><a href="./blogs/irisctf/babyseek/babyseek.html#step-by-step-construction" class="toc-section-link">Step-by-Step Construction</a></div>
        </div>
      </div>
      <div class="toc-post" data-post="ret2libm">
        <div class="toc-post-header">
          <span class="toc-post-toggle"></span>
          <a href="./blogs/irisctf/ret2libm/ret2libm.html" class="toc-post-link">ret2libm — IrisCTF 2023</a>
          <span class="toc-post-type">PWN</span>
        </div>
        <div class="toc-sections">
          <div class="toc-section"><a href="./blogs/irisctf/ret2libm/ret2libm.html#preliminary-analysis" class="toc-section-link">Preliminary Analysis</a></div>
          <div class="toc-section"><a href="./blogs/irisctf/ret2libm/ret2libm.html#approach" class="toc-section-link">Approach</a></div>
          <div class="toc-section"><a href="./blogs/irisctf/ret2libm/ret2libm.html#steps-to-exploit" class="toc-section-link">Steps to Exploit</a></div>
        </div>
      </div>
      <div class="toc-post" data-post="namethatsong">
        <div class="toc-post-header">
          <span class="toc-post-toggle"></span>
          <a href="./blogs/irisctf/namethatsong/namethatsong.html" class="toc-post-link">Name that song 1 & 2 — IrisCTF 2023</a>
          <span class="toc-post-type">OSINT</span>
        </div>
        <div class="toc-sections">
          <div class="toc-section"><a href="./blogs/irisctf/namethatsong/namethatsong.html#name-that-song" class="toc-section-link">Name that song</a></div>
          <div class="toc-section"><a href="./blogs/irisctf/namethatsong/namethatsong.html#name-that-song-2" class="toc-section-link">Name that song 2</a></div>
        </div>
      </div>
    </div>
  </div>

  <!-- Pragyan CTF 2023 -->
  <div class="toc-category" data-category="pragyan">
    <div class="toc-category-header">
      <span class="toc-toggle"></span>
      <span class="toc-category-title">Pragyan CTF 2023</span>
      <span class="toc-category-count">1</span>
    </div>
    <div class="toc-posts">
      <div class="toc-post" data-post="kingpin">
        <div class="toc-post-header">
          <span class="toc-post-toggle"></span>
          <a href="./blogs/pragyan/kingpin.html" class="toc-post-link">The Kingpin — Pragyan CTF 2023</a>
          <span class="toc-post-type">Forensics</span>
        </div>
        <div class="toc-sections">
          <div class="toc-section"><a href="./blogs/pragyan/kingpin.html#packet-analysis" class="toc-section-link">Packet Analysis</a></div>
          <div class="toc-section"><a href="./blogs/pragyan/kingpin.html#image-reconstruction" class="toc-section-link">Image Reconstruction</a></div>
        </div>
      </div>
    </div>
  </div>

  <!-- CCT 2019 -->
  <div class="toc-category" data-category="cct">
    <div class="toc-category-header">
      <span class="toc-toggle"></span>
      <span class="toc-category-title">CCT 2019</span>
      <span class="toc-category-count">1</span>
    </div>
    <div class="toc-posts">
      <div class="toc-post" data-post="re3">
        <div class="toc-post-header">
          <span class="toc-post-toggle"></span>
          <a href="./blogs/re3/re3.html" class="toc-post-link">re3 Challenge — CCT 2019</a>
          <span class="toc-post-type">Reversing</span>
        </div>
        <div class="toc-sections">
          <div class="toc-section"><a href="./blogs/re3/re3.html#static-analysis" class="toc-section-link">Static Analysis</a></div>
          <div class="toc-section"><a href="./blogs/re3/re3.html#solution" class="toc-section-link">Solution</a></div>
        </div>
      </div>
    </div>
  </div>

  <!-- External -->
  <div class="toc-category" data-category="external">
    <div class="toc-category-header">
      <span class="toc-toggle"></span>
      <span class="toc-category-title">External Articles</span>
      <span class="toc-category-count">1</span>
    </div>
    <div class="toc-posts">
      <div class="toc-post" data-post="oscp">
        <div class="toc-post-header">
          <span class="toc-post-toggle hidden"></span>
          <a href="https://nier0x00.medium.com/navigating-the-oscp-minefield-in-2023-a-guide-to-passing-the-exam-b4cce117c704" class="toc-post-link toc-external" target="_blank">
            Navigating the OSCP Minefield
            <svg class="toc-external-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6M15 3h6v6M10 14L21 3"/>
            </svg>
          </a>
          <span class="toc-post-type">Medium</span>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
// Toggle category
document.querySelectorAll('.toc-category-header').forEach(header => {
  header.addEventListener('click', () => {
    const category = header.parentElement;
    const posts = category.querySelector('.toc-posts');
    const toggle = header.querySelector('.toc-toggle');

    header.classList.toggle('active');
    posts.classList.toggle('open');
    toggle.classList.toggle('open');
  });
});

// Toggle post sections
document.querySelectorAll('.toc-post-header').forEach(header => {
  header.addEventListener('click', (e) => {
    if (e.target.closest('.toc-post-link')) return; // Don't toggle if clicking link

    const post = header.parentElement;
    const sections = post.querySelector('.toc-sections');
    const toggle = header.querySelector('.toc-post-toggle');

    if (sections && !toggle.classList.contains('hidden')) {
      sections.classList.toggle('open');
      toggle.classList.toggle('open');
    }
  });
});

// Search functionality
document.getElementById('toc-search').addEventListener('input', (e) => {
  const query = e.target.value.toLowerCase();

  document.querySelectorAll('.toc-post').forEach(post => {
    const text = post.textContent.toLowerCase();
    post.style.display = text.includes(query) ? '' : 'none';
  });

  document.querySelectorAll('.toc-category').forEach(category => {
    const visiblePosts = category.querySelectorAll('.toc-post[style=""], .toc-post:not([style])');
    const hasVisible = Array.from(category.querySelectorAll('.toc-post')).some(p => p.style.display !== 'none');
    category.style.display = hasVisible ? '' : 'none';

    // Auto-expand categories with matches
    if (query && hasVisible) {
      category.querySelector('.toc-posts').classList.add('open');
      category.querySelector('.toc-toggle').classList.add('open');
      category.querySelector('.toc-category-header').classList.add('active');
    }
  });
});
</script>
